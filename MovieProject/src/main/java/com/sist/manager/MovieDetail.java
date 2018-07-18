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
			Elements grade1 = doc.select("p.info_spec span:contains(관람)"); // 도움말
																			// 제외
			Elements eval1 = doc.select("div.star_score em");

			Element director = doc.select("a.tx_people").get(0);
			Element directorImage = doc.select("a.thumb_people img").get(0);

			Elements actor1 = doc.select("a.tx_people");
			Elements actorImage1 = doc.select("a.thumb_people img");
			Element poster = doc.select("div.poster a img").get(0);
			Element photo = doc.select("img._Img").get(0);

			Elements story = doc.select("div.story_area p");
			String actor = "";
			String actorImage = "";
			for (int k = 1; k < actor1.size(); k++) {
				if (k != actor1.size() - 1) {
					actor = actor + actor1.get(k).text() + ",";
					actorImage = actorImage + actorImage1.get(k).attr("src") + ",";
				} else {
					actor = actor + actor1.get(k).text();
					actorImage = actorImage + actorImage1.get(k).attr("src");
				}
			}

			String pst_sm = poster.attr("src"); // 포스터 스몰 사이즈 링크
			int idx = pst_sm.indexOf("?");
			String pst_bg = pst_sm.substring(0, idx); // 포스터 빅 사이즈 링크

			String pst_sm1 = photo.attr("src"); // 포토 스몰 사이즈 링크
			int idx1 = pst_sm1.indexOf("?");
			String pst_bg1 = pst_sm1.substring(0, idx); // 포토 빅 사이즈 링크

			MovieVO vo = new MovieVO();
			String eval = "";
			for (int k = 0; k < 4; k++) {
				eval = eval + eval1.get(k).text();
			}
			double e = Double.parseDouble(eval);
			System.out.println(e);
			String grade = grade1.text();
			if (grade.substring(grade.length() - 3, grade.length()).equals("도움말"))
				grade = grade.substring(0, grade.length() - 3);
			// System.out.println(grade);
			if (!(grade.equals("[국내] 청소년 관람불가") & e == 0.00)) {
				vo.setCode(link.substring(link.lastIndexOf("=") + 1));
				vo.setTitle(title.text());
				vo.setPoster(pst_bg);
				vo.setPhoto(pst_bg1);
				vo.setDirector(director.text());
				vo.setDirectorImage(directorImage.attr("src"));
				vo.setActor(actor);
				vo.setActorImage(actorImage);
				vo.setGenre(genre.text());
				vo.setCountry(country.text());
				vo.setGrade(grade);
				vo.setEval(e);
				vo.setRegdate(regdate.text());
				vo.setStory(story.text());

				dlist.add(vo);
				System.out.println("제목:" + title.text());

				i++;
			}

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
}