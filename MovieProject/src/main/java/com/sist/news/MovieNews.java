package com.sist.news;

import java.util.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
public class MovieNews {

	public static void main(String[] args) {
		MovieNews mn=new MovieNews();
		mn.newsdata();
		System.out.println("=================================================");
		mn.coldata();
	}
	
	public static List<MovieNewsVO> coldata(){
		List<MovieNewsVO> list=new ArrayList<MovieNewsVO>();
		try
		{
			String url="http://www.cine21.com/news/list/?idx=5";
			
			Document doc=Jsoup.connect(url).get();
			Elements title=doc.select("span.tit");
			Elements image=doc.select("span.thumb img");
			Elements cont=doc.select("span.nothumb");
			Elements link=doc.select("ul.news li a");
			for(int i=0;i<8;i++)
			{
				MovieNewsVO vo=new MovieNewsVO();
				String cineCont=cont.get(i).text().substring(0,60)+"...";
						
				vo.setNewstit(title.get(i).text());
				vo.setNewsimg(image.get(i).attr("src"));
				vo.setCont(cineCont);
				vo.setNewslink("http://www.cine21.com"+link.get(i).attr("href"));
				
				list.add(vo);
			/*	System.out.println(i+". "+title.get(i).text()+"\n"+image.get(i).attr("src")
						+"\n"+"http://www.cine21.com"+link.get(i).attr("href")
						+"\n"+cineCont
						);*/
				System.out.println();
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	public static List<MovieNewsVO> newsdata(){
		List<MovieNewsVO> list=new ArrayList<MovieNewsVO>();
		try
		{
			String url="http://news.maxmovie.com/";
			
			Document doc=Jsoup.connect(url).get();
			Elements title=doc.select("h2.entry-title");
			Elements image=doc.select("div.post-image img");
			Elements cont=doc.select("div.entry-summary p");
			Elements link=doc.select("h2.entry-title a");
			for(int i=0;i<8;i++)
			{
				MovieNewsVO vo=new MovieNewsVO();
			
				vo.setNewstit(title.get(i).text());
				vo.setNewsimg(image.get(i).attr("src"));
				vo.setCont(cont.get(i).text());
				vo.setNewslink(link.get(i).attr("href"));
				
				list.add(vo);
				System.out.println(i+". "+title.get(i).text()+"\n"+image.get(i).attr("src")
						+"\n"+link.get(i).attr("href")
						+"\n"+cont.get(i).text());
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

}
