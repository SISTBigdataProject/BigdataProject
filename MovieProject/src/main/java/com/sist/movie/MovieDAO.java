package com.sist.movie;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.sist.*;

import java.util.*;

@Repository
public class MovieDAO {
	@Autowired
	private MongoTemplate mt;
	

	/*public void MovieInsert(MovieVO vo)
	{
		if(!(vo.getGenre().contains("에로")))
		mt.insert(vo,"movie_2018");
		mt.insert(vo,"movie_2017");
	  
	}*/
	
	//영화 리스트 
	public List<MovieVO> movieListData(int page)
	{
		List<MovieVO> list = new ArrayList<MovieVO>();
		Query query = new Query();
		int rowSize=0;
		int skip=(rowSize*page)-rowSize;
		query.skip(skip).limit(rowSize);
		list=mt.find(query, MovieVO.class,"movie_2005");
		return list;
		
	}
	public int getMovieTotalPage()
	{
		int total=0;
		Query query = new Query();
		int count =(int)mt.count(query, "movie_2005");
		
		total=(int)(Math.ceil(count/20.0));
		return total;
	}
   
	 
    
	
	
	
}