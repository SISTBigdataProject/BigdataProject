package com.sist.movie;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;


import java.util.*;

@Repository
public class MovieDAO {
	@Autowired
	private MongoTemplate mt;
	

	public void MovieInsert(MovieVO vo)
	{
		if(!(vo.getGenre().contains("에로")))
		mt.insert(vo,"movie_2018");
	  
	}
	
	
}
