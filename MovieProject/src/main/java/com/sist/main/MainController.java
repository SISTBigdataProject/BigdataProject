package com.sist.main;

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


	
}
