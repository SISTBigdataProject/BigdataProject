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
	
	public List<MovieNewsVO> coldata(){
		List<MovieNewsVO> list=new ArrayList<MovieNewsVO>();
		try
		{
			String url="http://www.cine21.com/news/list/?idx=5";
			
			Document doc=Jsoup.connect(url).get();
			Elements title=doc.select("span.tit");
			Elements image=doc.select("span.thumb img");
			Elements link=doc.select("ul.news li a");
			for(int i=0;i<5;i++)
			{
				MovieNewsVO vo=new MovieNewsVO();
				String newstit=title.get(i).text();
				String newsimg=image.get(i).attr("src");
				String newslink=link.get(i).attr("href");
				newslink="http://www.cine21.com"+newslink;
				vo.setNewstit(newstit);
				vo.setNewsimg(newsimg);
				vo.setNewslink(newslink);
				list.add(vo);
				System.out.println(i+". "+newstit+":"+newsimg+"\n"+newslink);
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	public List<MovieNewsVO> newsdata(){
		List<MovieNewsVO> list=new ArrayList<MovieNewsVO>();
		try
		{
			String url="http://news.maxmovie.com/";
			
			Document doc=Jsoup.connect(url).get();
			Elements title=doc.select("h2.entry-title");
			Elements image=doc.select("div.post-image img");
			Elements link=doc.select("h2.entry-title a");
			for(int i=0;i<5;i++)
			{
				MovieNewsVO vo=new MovieNewsVO();
				String newstit=title.get(i).text();
				String newsimg=image.get(i).attr("src");
				String newslink=link.get(i).attr("href");
				vo.setNewstit(newstit);
				vo.setNewsimg(newsimg);
				vo.setNewslink(newslink);
				list.add(vo);
				System.out.println(i+". "+newstit+":"+newsimg+"\n"+newslink);
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

}
