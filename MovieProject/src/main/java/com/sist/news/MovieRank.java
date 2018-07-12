package com.sist.news;

import java.util.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class MovieRank {

	public static List<MovieRankVO> movieRankData()
	{
		List<MovieRankVO> list=new ArrayList<MovieRankVO>();
		
		String url="https://movie.naver.com/movie/running/current.nhn";
		String pst_sm="";
		String pst_bg="";
		int idx=0;
		
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
				
				pst_sm=poster.get(i).attr("src"); //포스터 스몰 사이즈 링크 
				idx=pst_sm.indexOf("?"); 
				pst_bg=pst_sm.substring(0,idx); //포스터 빅 사이즈 링크
				
				System.out.println(i+")");
				System.out.println(title.get(i).text());
				System.out.println(pst_bg);
				System.out.println(netizen_star.get(i).text());
				System.out.println(rsvRate.get(i).text());
				System.out.println(summary.get(i*3).text());
				System.out.println(summary.get(i*3+1).text());
				System.out.println(summary.get(i*3+2).text());
				System.out.println("==========================================");
				
				vo.setTitle(title.get(i).text());
				vo.setPoster(pst_bg);
				vo.setNetizen_star(netizen_star.get(i).text());
				vo.setRsvRate(rsvRate.get(i).text());
				vo.setSummary(summary.get(i*3).text()); // 장르, 시간, 개봉일
				vo.setDirector(summary.get(i*3+1).text()); // 감독
				
				String actors=summary.get(i*3+2).text();
				if(actors.length()>38)
					actors=actors.substring(0,38)+"...";
				vo.setActors(actors); // 출연배우				
				list.add(vo);
			}
			
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return list;
	}
}
