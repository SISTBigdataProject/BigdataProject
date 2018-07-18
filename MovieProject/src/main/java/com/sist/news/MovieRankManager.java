package com.sist.news;

/*public class MovieRankManager */
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import com.sist.manager.MovieDAO;

@Component
public class MovieRankManager {
	@Autowired
	private MovieDAO dao;

	public static void main(String[] args) {

		@SuppressWarnings("resource")
		ApplicationContext app = new ClassPathXmlApplicationContext("application-context.xml");
		MovieRankManager mm = (MovieRankManager) app.getBean("movieRankManager");
		MovieRank mr = new MovieRank();
		List<MovieRankVO> ranklist = new ArrayList<MovieRankVO>();
		ranklist = mr.movieRankData();

		for (MovieRankVO vo : ranklist) {
			mm.dao.MovieRankInsert(vo);
		}
		System.out.println("끝");
	}

}