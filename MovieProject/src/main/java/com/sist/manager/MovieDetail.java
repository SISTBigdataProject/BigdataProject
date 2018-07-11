package com.sist.manager;

import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class MovieDetail extends Thread {
	String link;
	ArrayList<MovieVO> dlist;

	public MovieDetail(String link) {
		this.link = link;
	}

	@Override
	public void run() {
		dlist = new ArrayList<MovieVO>();
		int i = 0;
		try {
			Document doc = Jsoup.connect(link).get();
			Element title = doc.select("div.mv_info h3.h_movie a").get(0);
			Elements genre = doc.select("p.info_spec span a[href*=genre]");
			Element country = doc.select("p.info_spec span").get(1);
			Elements regdate = doc.select("p.info_spec span:contains(개봉)");
			Elements grade = doc.select("p.info_spec span:contains(관람)");
			Element director = doc.select("div.info_spec2 dl.step1 dd").get(0);
			Elements actor = doc.select("div.info_spec2 dl.step2 dd");
			Element poster = doc.select("div.poster img").get(0);
			Elements story1 = doc.select("div.story_area h5");
			Elements story2 = doc.select("div.story_area p");
			Elements actorImage = doc.select("div.obj_section li a img[src*=search.pstatic.net]");

			MovieVO vo = new MovieVO();
			
			vo.setTitle(title.text());
			vo.setPoster(poster.attr("src"));
			vo.setDirector(director.text());
			vo.setActor(actor.text());
			vo.setGenre(genre.text());
			vo.setCountry(country.text());
			vo.setGrade(grade.text());
			vo.setRegdate(regdate.text());
			vo.setStory(story1.text());
			vo.setStory(story2.text());
			vo.setActorImage(actorImage.attr("src"));
			vo.setCode(link.substring(link.lastIndexOf("=") + 1));
			dlist.add(vo);

			/*
			 * System.out.println("링크"+links.get(j).getLink().substring(links.
			 * get(j).getLink().lastIndexOf("=")+1));
			 * System.out.println("===========================");
			 * System.out.println("No)"+(i+1));
			 * System.out.println("제목:"+title.text());
			 * 
			 * System.out.println("제작국가:"+country.text());
			 * System.out.println("감독:"+director.text());
			 * System.out.println("배우:"+actor.text());
			 * 
			 * System.out.println("개봉일:"+regdate.text());
			 * System.out.println("장르:"+genre.text()); //공연실황, 에로말
			 * System.out.println("등급:"+grade.text()); //[국내] [해외] 도움말
			 * System.out.println("포스터:"+poster.attr("src"));
			 * System.out.println("줄거리:"+story1.text()+" "+story2.text());
			 * System.out.println("배우이미지:"+actorImage.attr("src")); //
			 * System.out.println("코드"+Integer.parseInt(str));
			 * System.out.println("===========================");
			 */
			i++;

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
}
