package com.sist.news;

public class MovieRankVO {
	// 제목
	// 네티즌 별점
	// 예매율
	// 개요
	// 감독
	// 출연

	private String title;
	private String poster;
	private String netizen_star;
	private String rsvRate;
	private String summary;
	private String director;
	private String actors;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getNetizen_star() {
		return netizen_star;
	}

	public void setNetizen_star(String netizen_star) {
		this.netizen_star = netizen_star;
	}

	public String getRsvRate() {
		return rsvRate;
	}

	public void setRsvRate(String rsvRate) {
		this.rsvRate = rsvRate;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActors() {
		return actors;
	}

	public void setActors(String actors) {
		this.actors = actors;
	}

}
