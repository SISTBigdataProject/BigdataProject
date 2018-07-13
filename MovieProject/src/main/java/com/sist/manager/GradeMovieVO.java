package com.sist.manager;

public class GradeMovieVO {
	private String code;// 영화코드
	private String title;// 영화제목
	private int grno;// 평점 번호
	private String grcontent;// 평점 내용
	private double grscore;// 평점 평점
	private String grmon;// 평점 작성 달
	private int count;
	private String score;
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getGrno() {
		return grno;
	}

	public void setGrno(int grno) {
		this.grno = grno;
	}

	public String getGrcontent() {
		return grcontent;
	}

	public void setGrcontent(String grcontent) {
		this.grcontent = grcontent;
	}

	public double getGrscore() {
		return grscore;
	}

	public void setGrscore(double grscore) {
		this.grscore = grscore;
	}

	public String getGrmon() {
		return grmon;
	}

	public void setGrmon(String grmon) {
		this.grmon = grmon;
	}

}