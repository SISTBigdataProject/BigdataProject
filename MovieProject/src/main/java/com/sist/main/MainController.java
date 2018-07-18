package com.sist.main;

import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.hadoop.mapreduce.JobRunner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sist.hadoop.ResultVO;
import com.sist.manager.GradeMovieVO;
import com.sist.manager.MovieDAO;
import com.sist.manager.MovieVO;
import com.sist.news.MovieNews;
import com.sist.news.MovieNewsVO;
import com.sist.news.MovieRank;
import com.sist.news.MovieRankVO;

@Controller
public class MainController {

	@Autowired
	private MovieDAO dao;
	@Autowired
	private Configuration conf;
	@Autowired
	private JobRunner jr;

	@RequestMapping("main/main.do")
	public String main(Model model) {
		List<MovieNewsVO> clist = MovieNews.coldata();
		List<MovieNewsVO> nlist = MovieNews.newsdata();
		List<MovieVO> flist = dao.mainMovieList();
		List<MovieRankVO> rlist = dao.movieRankList();
		model.addAttribute("clist", clist);
		model.addAttribute("nlist", nlist);
		model.addAttribute("flist", flist);
		model.addAttribute("rlist", rlist);
		model.addAttribute("movie_jsp", "main_default.jsp");
		return "main/main";
	}

	@RequestMapping("main/movie_find.do")
	public String movieFind(String search, String page, Model model) {
		System.out.println(search);
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		List<MovieVO> list = dao.movieFind(search, curpage);
		int total = dao.movieFindTotal(search);
		int totalpage = (int) Math.ceil(total / 10.0);
		if (totalpage == 0)
			totalpage = 1;
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		model.addAttribute("movie_jsp", "movie_find.jsp");
		model.addAttribute("curpage", curpage);
		model.addAttribute("total", total);
		model.addAttribute("totalpage", totalpage);
		return "main/main";
	}

	@RequestMapping("main/movie_detail.do")
	public String movieDetail(String code, Model model) {
		System.out.println(code);
		MovieVO vo = dao.getMovieDetailData(code);
		System.out.println(vo.getTitle());

		model.addAttribute("vo", vo);
		model.addAttribute("movie_jsp", "movie_detail.jsp");

		///////////////////////////////////////////////////////////////////////// 그래프
		double[] grscore = new double[11];// 11
		String[] strscore = new String[11];// 11
		String[] count = new String[11];// 11
		String graph = "";
		int check = 0;

		for (int i = 0; i < 11; i++) // 11
		{
			if (i == 0)
				grscore[i] = 0;
			else
				grscore[i] = grscore[i - 1] + 0.5;// 0.5
			strscore[i] = String.valueOf(grscore[i]);
			count[i] = String.valueOf(dao.gradeCount(code, grscore[i]));
			if (i == 11)// 11
				graph = graph + "{ y: \'" + strscore[i] + "\', x: " + count[i] + " }";
			else
				graph = graph + "{ y: \'" + strscore[i] + "\', x: " + count[i] + " },\n";

			check += Integer.parseInt(count[i]);
		}

		System.out.println(check + "<<<<<<<<<<<<<그래프 숫자");
		System.out.println(graph);
		// { y: '2006', a: 100 }

		model.addAttribute("countstars", check);
		model.addAttribute("graph", graph);
		model.addAttribute("movie_graph", "movie_graph.jsp");
		///////////////////////////////////////////////////////////////////////// 그래프
		dao.reviewFile(code);
		rWordCloud();//rwordcloud
		return "main/main";
	}

	@RequestMapping("main/movie_rank.do")
	public String movieRankDetail(String code, Model model) {
		System.out.println(code);
		MovieRankVO vo = dao.getMovieRankDetailData(code);
		System.out.println(vo.getTitle());

		model.addAttribute("vo", vo);
		model.addAttribute("movie_jsp", "movie_rank.jsp");

		return "main/main";
	}
	
	@RequestMapping("main/movie_analysis")
	public String movieAnalysis(String code, Model model) {

		// 하둡에 분석 대상 파일 올리기
		dao.gradeFile(code);
		
		copyFromLocal();
		// 하둡에서 분석 실행
		jobRunner();
		// 하둡에서 분석결과 읽어 온다 ===> R
		copyToLocal();
		List<ResultVO> rlist = resultData();
		model.addAttribute("rlist", rlist);
		model.addAttribute("movie_jsp", "movie_analysis.jsp");
		return "main/main";
	}

	public List<ResultVO> resultData() {
		List<ResultVO> list = new ArrayList<ResultVO>();
		try {
			RConnection rc = new RConnection();
			rc.setStringEncoding("utf8");
			rc.voidEval("data<-read.table(\"/home/sist/MovieData/result\")");
			REXP p = rc.eval("data$V1");
			String[] word = p.asStrings();
			p = rc.eval("data$V2");
			int[] count = p.asIntegers();
			for (int i = 0; i < word.length; i++) {
				ResultVO vo = new ResultVO();
				vo.setWord(word[i]);
				vo.setCount(count[i]);
				list.add(vo);
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return list;
	}

	public void copyFromLocal() {
		try {
			FileSystem fs = FileSystem.get(conf);
			// hadoop fs -ls...
			if (fs.exists(new Path("/movie_ns3/movie.txt"))) {
				fs.delete(new Path("/movie_ns3/movie.txt"), true);// hadoop fs
																	// -rmr 파일
			}
			if (fs.exists(new Path("/movie_output_ns3"))) {
				fs.delete(new Path("/movie_output_ns3"), true);// hadoop fs -rmr
																// 파일
			}
			fs.copyFromLocalFile(new Path("/home/sist/MovieData/grade.txt"), new Path("/movie_ns3/movie.txt"));
			fs.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	// MapReduce 실행
	public void jobRunner() {
		try {
			jr.call();
		} catch (Exception ex) {
		}
	}

	public void copyToLocal() {
		try {
			FileSystem fs = FileSystem.get(conf);// Hadoop 연결
			fs.copyToLocalFile(new Path("/movie_output_ns3/part-r-00000"), new Path("/home/sist/MovieData/result"));
			fs.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
	public void rWordCloud()
    {
  	  try
  	  {
  		  RConnection rc=new RConnection();
  		  rc.voidEval("library(KoNLP)");
  		  rc.voidEval("library(wordcloud2)");
  		  rc.voidEval("library(webshot)");
  		  rc.voidEval("library(htmlwidgets)");
  		  rc.voidEval("data<-readLines(\"/home/sist/MovieData/review.txt\")");
  		  rc.voidEval("data2<-sapply(data, extractNoun,USE.NAMES = F)");
  		  rc.voidEval("data3<-unlist(data2)");
  		  rc.voidEval("data4<-Filter(function(x){nchar(x)>=2},data3)");
  		  rc.voidEval("data4<-gsub(\"영화\",\"\",data4) ");
  		  rc.voidEval("data4<-gsub(\"감독\",\"\",data4) ");
  		  rc.voidEval("data4<-gsub(\"[ㄱ-ㅎ]\",\"\",data4) ");
  		  rc.voidEval("data4<-gsub(\"[0-9]\",\"\",data4) ");
  		  rc.voidEval("data4<-gsub(\"(ㅜ|ㅠ)\",\"\",data4) ");
  		  rc.voidEval("data4<-gsub(\"[!@#$%^&*()_+=?<>]\",\"\",data4) ");
  		  rc.voidEval("data5<-table(data4)");
  		  rc.voidEval("data6<-head(sort(data5,decreasing = T),80)");
  		  rc.voidEval("my_graph<-wordcloud2(data6, size=1.5, color='random-dark')");
  		  rc.voidEval("saveWidget(my_graph,\"/home/sist/springDev/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/MovieProject/main/star.html\",selfcontained = F)");
  		  //rc.voidEval("dev.off()");
  		  rc.close();
  		  
  	  }catch(Exception ex)
  	  {
  		  System.out.println(ex.getMessage());
  	  }
    }

}
