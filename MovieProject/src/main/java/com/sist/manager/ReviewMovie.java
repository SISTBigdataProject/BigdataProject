package com.sist.manager;

import java.util.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class ReviewMovie extends Thread{
	String code;
	String title;
	ReviewMovieVO vo;
	List<ReviewMovieVO> rvlist;
	public  ReviewMovie(String code, String title) {		
		this.code=code;
		this.title=title;
	}
	@Override
	public  void run() {
		rvlist=new ArrayList<ReviewMovieVO>();
		   try{
		   String rvlink = "https://movie.naver.com/movie/bi/mi/review.nhn?code=" + code; 
/*		   
  			int i = 1; 
  			System.out.println(i + ". title : " + title); 
		   System.out.println("code : " + code); 
		   System.out.println("rvlink : " + rvlink); 
		   i++; 	
		   */	 
		   	System.out.println(code+" : "+title+"===========================");
		    Document doc = Jsoup.connect(rvlink).get(); 
		    Element count = doc.select("div.review span.cnt em").get(0); 
		    // 리뷰 개수 
		    String count1 = count.text(); 
		    if (count1.length() > 3) { 
		     count1 = count1.substring(0, count1.length() - 4) 
		       + count1.substring(count1.length() - 3, count1.length()); 
		     //System.out.println("확인:" + count1); 
		    } 
		    int rvcount = Integer.parseInt(count1); 
		    //System.out.println("리뷰 개수:" + rvcount); 

		    // 페이지 구하기 
		    int p = (int) Math.ceil(rvcount / 10); 
		    if(p>50)
		    	p=50;
		    //System.out.println("페이지:" + p); 

		      String linkcode = ""; 
		      
		    for (int k = 0; k < p; k++)// p 
		    { 		  		 		
		      rvlink = "https://movie.naver.com/movie/bi/mi/review.nhn?code=" + code + "&page=" + (k + 1); 
		      Document doc1 = Jsoup.connect(rvlink).get(); 
		      Elements ervtitle = doc1.select("div.review ul.rvw_list_area a strong"); 
		      Elements elink = doc1.select("div.review ul.rvw_list_area p a"); 
		      try{
		      for (int j = 0; j < ervtitle.size(); j++) { 
		    	  vo=new ReviewMovieVO(); 
		       linkcode = elink.get(j).attr("onclick"); 
		       linkcode = linkcode.substring(linkcode.lastIndexOf("(") + 1, linkcode.lastIndexOf(")")); 
/*		       System.out.println(code + ":" + title); 
		       System.out.println(rvno + ". 리뷰 제목:" + rvtitle); 
		       System.out.println("리뷰 링크:" + linkcode); */
		       String link = "https://movie.naver.com/movie/bi/mi/reviewread.nhn?nid=" + linkcode 
		    		   + "&code=" + code + "&order=#tab"; 
		       //System.out.println("리뷰 디테일 링크:" + link); 
		       Document doc2 = Jsoup.connect(link).get(); 
		       Elements ervcontent = doc2.select("div.user_tx_area"); 
		       //System.out.println("리뷰 내용:" + rvcontent); 
		       vo.setCode(code); 
		       vo.setTitle(title); 
		       vo.setRvno((j + 1) + k * 10); 
		       vo.setRvtitle(ervtitle.get(j).text()); 
		       vo.setRvcontent(ervcontent.get(0).text()); 
		       rvlist.add(vo);
		      } 
		      }catch (Exception e) {
		    	 System.out.println(e.getMessage()); 
			}
		      
		    }
		    System.out.println(title+"ReviewMovie end...");
		     }catch (Exception ex) { 
				     System.out.println(ex.getMessage()); 
				   } 
		   }   
}

	


