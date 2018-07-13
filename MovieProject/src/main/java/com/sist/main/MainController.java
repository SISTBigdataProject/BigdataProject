package com.sist.main;

import java.io.FileReader;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	/*@Autowired
	private MakeFile mk;*/
	@RequestMapping("main/main.do")
	public String main(Model model) {
		List<MovieNewsVO> clist = MovieNews.coldata();
		List<MovieNewsVO> nlist = MovieNews.newsdata();
		List<MovieVO> flist = dao.mainMovieList();
		List<MovieRankVO> rlist = MovieRank.movieRankData();
		model.addAttribute("clist", clist);
		model.addAttribute("nlist", nlist);
		model.addAttribute("flist",flist);
		model.addAttribute("rlist",rlist);
		model.addAttribute("movie_jsp", "main_default.jsp");
		return "main/main";
	}
	@RequestMapping("main/movie_find.do")
	public String movieFind(String search,String page,Model model) 
	{
		System.out.println(search);
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		List<MovieVO> list=dao.movieFind(search,curpage);
		int total=dao.movieFindTotal(search);
		int totalpage=(int)Math.ceil(total/10.0);
		if(totalpage==0)totalpage=1;
		model.addAttribute("list",list);
		model.addAttribute("search", search);
		model.addAttribute("movie_jsp", "movie_find.jsp");
		model.addAttribute("curpage", curpage);
		model.addAttribute("total", total);
		model.addAttribute("totalpage", totalpage);
		return "main/main";
	}
	
	/*dao.gradeFile(code);
	dao.reviewFile(code);*/
	
	@RequestMapping("main/movie_graph.do")
	public String movieFile(String code, Model model) 
	{
		double[] grscore=new double[6];//11
		String[] strscore=new String[6];//11
		String[] count=new String[6];//11
		String graph="";
		
		for(int i=0; i<6;i++) //11
		{
			if(i==0)
				grscore[i]=0;
			else
				grscore[i]=grscore[i-1]+1;//0.5
			strscore[i]=String.valueOf(grscore[i]);
			count[i]=String.valueOf(dao.gradeCount(code, grscore[i]));
			if(i==6)//11
				graph=graph+"{ y: \'"+strscore[i]+"\', x: "+count[i]+" }";
			else
				graph=graph+"{ y: \'"+strscore[i]+"\', x: "+count[i]+" },\n";
		}
		System.out.println(graph);
		//{ y: '2006', a: 100 }
		model.addAttribute("graph", graph);
		model.addAttribute("movie_jsp", "movie_graph.jsp");
		return "main/main";
	}
	
/*	@RequestMapping("main/movie_graph.do")
	public String movieFile(String code, Model model) 
	{
		List<GradeMovieVO> list=new ArrayList<GradeMovieVO>();
		JSONArray arr=new JSONArray();
		for(GradeMovieVO vo:list)
		{
		JSONObject obj=new JSONObject();
			obj.put("y",vo.getScore());
			obj.put("a",vo.getCount());
			arr.add(obj);
		}
		
		//System.out.println(graph);
		//{ y: '2006', a: 100 }
	model.addAttribute("graph",arr.toJSONString());
	model.addAttribute("movie_jsp", "movie_graph.jsp");
	return "main/main";
	}*/
	
}
