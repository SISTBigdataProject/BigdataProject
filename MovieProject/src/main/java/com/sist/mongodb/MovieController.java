package com.sist.mongodb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.movie.MovieDAO;
import com.sist.movie.MovieVO;

import java.util.*;
@Controller
public class MovieController {
  @Autowired
  private MovieDAO dao;
  @RequestMapping("main/MainPage.do")
  public String MainPage()
  {
	  return "main/MainPage";
  }
  
  
  @RequestMapping("main/movie_list.do")
  public String Movie_list(String page,Model model)
  {
	  if(page==null)
		  page="1";
		  int curpage= Integer.parseInt(page);
	  List<MovieVO> list = dao.movieListData(curpage);
	  	int totalpage=dao.getMovieTotalPage();
	  	model.addAttribute("list", list);
	  	model.addAttribute("curpage", curpage);
	  	model.addAttribute("totalpage", totalpage);
	  return "main/movie_list";
	  
  }
}