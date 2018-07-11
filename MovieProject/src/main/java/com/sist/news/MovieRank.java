package com.sist.news;

import java.io.IOException;
import java.util.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class MovieRank {

	
	public static List<MovieRankVO> MovieRank()
	{
		List<MovieRankVO> list=new ArrayList<MovieRankVO>();
		
		String url="https://movie.naver.com/movie/running/current.nhn";

		try {
			Document doc=Jsoup.connect(url).get();
			Elements title=doc.select("div.lst_wrap dt.tit a");
			Elements poster=doc.select("div.lst_wrap ul li div.thumb img"); // src
			Elements netizen_star=doc.select("dl.info_star span.num");
			Elements rsvRate=doc.select("dl.info_exp span.num");
			Elements summary=doc.select("dl.info_txt1 dd");

			
			for(int i=0; i<12; i++)
			{
				MovieRankVO vo=new MovieRankVO();
				vo.setTitle(title.get(i).text());
				vo.setPoster(poster.get(i).attr("src"));
				vo.setSummary(summary.get(i*3).text());
				vo.setDirector(summary.get(i*3+1).text());
				vo.setActors(summary.get(i*3+2).text());
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
}
