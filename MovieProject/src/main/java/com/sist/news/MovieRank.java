package com.sist.news;

import java.util.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class MovieRank{
	
	public List<MovieRankVO> movieRankData()
	{
	List<MovieRankVO> list=new ArrayList<MovieRankVO>();
		
		String url="https://movie.naver.com/movie/running/current.nhn";
		String pst_sm=""; String pst_bg=""; String pt_sm=""; String pt_bg=""; int idx=0;
		
		try {
		
			Document doc=Jsoup.connect(url).get();
			
			Elements link=doc.select("dt.tit a");
			Elements rsvRate=doc.select("dl.info_exp span.num");

			for(int i=0; i<12; i++)
			{
				url="https://movie.naver.com"+link.get(i).attr("href");
				doc=Jsoup.connect(url).get();
				
				Element title = doc.select("div.mv_info h3.h_movie a").get(0);
				Elements genre = doc.select("p.info_spec span a[href*=genre]");
				Element country = doc.select("p.info_spec span").get(1);
				Elements regdate = doc.select("p.info_spec span:contains(개봉)");
				Element grade = doc.select("p.info_spec span:contains(관람)").get(0);
				Elements eval1 = doc.select("a#actualPointPersentBasic em");
				Element director = doc.select("a.tx_people").get(0);
				Element directorImage = doc.select("a.thumb_people img").get(0);
				Elements actor1 = doc.select("a.tx_people");
				Elements actorImage1 = doc.select("a.thumb_people img");
				Element poster = doc.select("div.poster a img").get(0);
				Element photo = doc.select("img._Img").get(0);
				Elements story = doc.select("div.story_area p");
				Element rsvLink = doc.select("div.end_btn_area a").get(0);
				
				/******************** 데이터 전처리 과정 ********************/
				//배우 이름, 이미지
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
				
				//포스터 사이즈 조절
				pst_sm = poster.attr("src");
				idx = pst_sm.indexOf("?");
				pst_bg = pst_sm.substring(0, idx);

				//포토 사이즈 조절
				pt_sm = photo.attr("src");
				idx = pt_sm.indexOf("?");
				pt_bg = pt_sm.substring(0, idx);
				
				//평점
				String evalstr = eval1.text().replaceAll(" ", "");
				/******************** 데이터 전처리 과정 끝 ********************/
				
				/******************** VO setting ********************/
				MovieRankVO vo=new MovieRankVO();
				
				vo.setTitle(title.text());
				vo.setGenre(genre.text());
				vo.setDirector(director.text());
				vo.setDirectorImage(directorImage.attr("src"));
				vo.setActor(actor);
				vo.setActorImage(actorImage);
				vo.setGrade(grade.text());
				vo.setRegdate(regdate.text());
				vo.setPoster(pst_bg);
				vo.setStory(story.text());
				vo.setCountry(country.text());
				
				String code=link.get(i).attr("href");
				vo.setCode(code.substring(code.lastIndexOf("=") + 1));
				
				vo.setEval(Double.parseDouble(evalstr));
				vo.setPhoto(pt_bg);
				vo.setRsvRate(rsvRate.get(i).text());
				vo.setRsvLink("https://movie.naver.com"+rsvLink.attr("href"));
				
				list.add(vo);
				/******************** VO setting 끝 ********************/
				
				/******************** Print to check ********************/
				System.out.println(i+")");
				System.out.println(title.text());
				System.out.println(evalstr);
				System.out.println(genre.text());
				System.out.println(director.text());
				System.out.println(directorImage.attr("src"));
				System.out.println(actor);
				System.out.println(actorImage);
				System.out.println(grade.text());
				System.out.println(pst_bg);
				System.out.println(pt_bg);
				System.out.println(rsvRate.get(i).text());
				System.out.println("https://movie.naver.com"+rsvLink.attr("href"));
				System.out.println("코드"+code.substring(code.lastIndexOf("=") + 1));
				System.out.println("==========================================");
				/******************** Print to check ********************/	
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return list;
	}
}