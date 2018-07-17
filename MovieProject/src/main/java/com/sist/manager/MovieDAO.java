package com.sist.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.io.FileReader;
import java.io.FileWriter;
import java.util.*;

@Repository
public class MovieDAO {
	
	@Autowired
	private MongoTemplate mt;

	public void GradeMovieInsert(GradeMovieVO vo) {
		mt.insert(vo, "moviegrade");
	}

	public void ReviewMovieInsert(ReviewMovieVO vo) {
		mt.insert(vo, "moviereview");
	}

	public void MovieInsert(MovieVO vo) {
		mt.insert(vo, "moviedetail");
	}

	/*
	 * public void MovieRankInsert(MovieVO vo){ mt.insert(vo, "moviedetail"); }
	 */

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
	public List<MovieVO> movieFind(String search, int page) {
		List<MovieVO> list = new ArrayList<MovieVO>();
		int rowSize = 10;
		int skip = (rowSize * page) - rowSize;
		String qr = "{title:{$regex:'.*" + search + "'}}";
		BasicQuery query = new BasicQuery(qr);
		query.skip(skip).limit(rowSize);
		list = mt.find(query, MovieVO.class, "moviedetail");
		return list;
	}

	public int movieFindTotal(String search) {
		List<MovieVO> list = new ArrayList<MovieVO>();
		BasicQuery query = new BasicQuery("{title:{$regex:'.*" + search + "'}}");
		list = mt.find(query, MovieVO.class, "moviedetail");
		return list.size();
	}

	// 평점 파일 생성
	public void gradeFile(String code) {
		try {
			// System.out.println(code);
			List<GradeMovieVO> list = new ArrayList<GradeMovieVO>();
			BasicQuery query = new BasicQuery("{code:'" + code + "'}");
			list = mt.find(query, GradeMovieVO.class, "moviegrade");
			String data = "";
			for (GradeMovieVO vo : list) {
				data += vo.getGrcontent() + "\n";
			}
			// System.out.println(data);
			FileWriter fw = new FileWriter("/home/sist/MovieData/grade.txt");
			fw.write(data);
			fw.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// 리뷰 파일 생성
	public void reviewFile(String code) {
		try {
			// System.out.println(code);
			List<ReviewMovieVO> list = new ArrayList<ReviewMovieVO>();
			BasicQuery query = new BasicQuery("{code:'" + code + "'}");
			list = mt.find(query, ReviewMovieVO.class, "moviereview");
			String data = "";
			for (ReviewMovieVO vo : list) {
				data += vo.getRvcontent() + "\n";
			}
			// System.out.println(data);
			FileWriter fw = new FileWriter("/home/sist/MovieData/review.txt");
			fw.write(data);
			fw.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// 평점 개수
	public int gradeCount(String code, double grscore) {
		List<GradeMovieVO> list = new ArrayList<GradeMovieVO>();
		BasicQuery query = new BasicQuery("{$and:[{code:'" + code + "'},{grscore:" + grscore + "}]}");
		// find({$and:[{"code":"19469"},{"grscore":5.0}]}).count()
		list = mt.find(query, GradeMovieVO.class, "moviegrade");
		int count = list.size();
		return count;
	}

	// 영화 디테일 데이터
	public MovieVO getMovieDetailData(String code) {
		MovieVO vo = new MovieVO();
		BasicQuery query = new BasicQuery("{code:'" + code + "'}");
		vo = mt.findOne(query, MovieVO.class, "moviedetail");

		return vo;
	}

	public long totalCount(String tablename) {
		long count = 0;
		BasicQuery query = new BasicQuery("{}");
		count = mt.count(query, tablename);
		return count;
	}
	/*
	 * public List<GradeMovieVO> gradeCount(String code){ List<GradeMovieVO>
	 * list=new ArrayList<GradeMovieVO>(); double[] grscore=new double[11];
	 * for(int i=0; i<11;i++) { GradeMovieVO vo=new GradeMovieVO(); if(i==0)
	 * grscore[i]=0; else grscore[i]=grscore[i-1]+0.5;
	 * 
	 * BasicQuery query=new
	 * BasicQuery("{$and:[{code:'"+code+"'},{grscore:"+grscore[i]+"}]}");
	 * //find({$and:[{"code":"19469"},{"grscore":5.0}]}).count()
	 * list=mt.find(query, GradeMovieVO.class,"moviegrade"); int
	 * count=list.size(); vo.setScore(String.valueOf(grscore[i]));
	 * vo.setCount(count); list.add(vo); } return list; }
	 */
}
