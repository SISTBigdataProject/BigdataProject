package com.sist.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MovieDAO {
	@Autowired
	private MongoTemplate mt;
	public void GradeMovieInsert(GradeMovieVO vo)
	{
		mt.insert(vo,"moviegrade");//테이블 이름
	}
	public void ReviewMovieInsert(ReviewMovieVO vo)
	{
		mt.insert(vo,"moviereview");//테이블 이름
	}
	public void MovieInsert(MovieVO vo)
	{
		if(!(vo.getGenre().contains("에로")))
		mt.insert(vo,"moviedetail");	  
	}
}
