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

@Controller
public class MainController {

	@Autowired
	private MovieDAO dao;
	
	@RequestMapping("main/main.do")
	public String main(Model model) {
		List<MovieNewsVO> clist = MovieNews.coldata();
		List<MovieNewsVO> nlist = MovieNews.newsdata();
		List<MovieVO> flist = dao.mainMovieList();
		model.addAttribute("clist", clist);
		model.addAttribute("nlist", nlist);
		model.addAttribute("flist",flist);
		model.addAttribute("movie_jsp", "main_default.jsp");
		return "main/main";
	}
	@RequestMapping("main/movie_list.do")
	public String movieFind(String search,Model model)
	{
		System.out.println(search);
		List<MovieVO> list=dao.movieFind(search);
		model.addAttribute("list",list);
		model.addAttribute("search", search);
		model.addAttribute("movie_jsp", "movie_find.jsp");
		return "main/main";
	}
/*	@RequestMapping("main/movie_list.do")
	public String Movie_list(String page,String searh, Model model) {
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		List<MovieVO> list = dao.movieListData(curpage);
		int totalpage = dao.getMovieTotalPage();
		model.addAttribute("list", list);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		return "main/movie_list";

	}*/
	
}
