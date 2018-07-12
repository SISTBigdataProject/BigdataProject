package com.sist.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public class MovieDAO {
	@Autowired
	private MongoTemplate mt;

	public void GradeMovieInsert(GradeMovieVO vo) {
		mt.insert(vo, "moviegrade");// 테이블 이름
	}

	public void ReviewMovieInsert(ReviewMovieVO vo) {
		mt.insert(vo, "moviereview");// 테이블 이름
	}

	public void MovieInsert(MovieVO vo) {
		if (!(vo.getGenre().contains("에로")))
			mt.insert(vo, "moviedetail");
	}

	public List<MovieVO> mainMovieList() {
		List<MovieVO> list = new ArrayList<MovieVO>();
		Query query = new Query();
		list = mt.find(query, MovieVO.class, "moviedetail");

		for (int j = 0; j < list.size(); j++) {
			String s = list.get(j).getPoster();
			int i = s.indexOf("?");
			if (i > 0) {
				s = s.substring(0, i);
				list.get(i).setPoster(s);
			}
		}

		return list;
	}

	public List<String> movieGetGenre() {
		List<String> list = new ArrayList<String>();
		List<String> list1 = mt.getCollection("moviedetail").distinct("genre");
		for (int j = 0; j < list1.size(); j++) {
			String s = list1.get(j);
			int i = s.indexOf(" ");
			if (i > 0) {
				s = s.substring(0, s.indexOf(" "));
			}
			if (!list.contains(s))
				list.add(s);
		}
		return list;
	}

	// 검색
	public List<MovieVO> movieFind(String search, int page)
	{
		List<MovieVO>list=new ArrayList<MovieVO>();
		int rowSize = 10;
		int skip = (rowSize * page) - rowSize;
		String qr="{title:{$regex:'.*"+search+"'}}";
		BasicQuery query=new BasicQuery(qr);
		query.skip(skip).limit(rowSize);
		list=mt.find(query, MovieVO.class,"moviedetail");
		return list;
	}
}
