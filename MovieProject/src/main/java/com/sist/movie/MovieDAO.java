package com.sist.movie;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Repository;
import java.util.*;




@Repository
public class MovieDAO {
	@Autowired
	private MongoTemplate mt;
	
	public void MovieInsert(MovieVO vo)
	{
		//mt.insert(vo,"movie_2018");
	}
	
	
}
