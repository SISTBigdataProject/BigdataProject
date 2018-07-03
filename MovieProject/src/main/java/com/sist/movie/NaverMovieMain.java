package com.sist.movie;
import java.util.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import java.io.*;
public class NaverMovieMain {
	
	/*public List<MovieVO> getMovieYear()
	{
		List<MovieVO> list=new ArrayList<MovieVO>();
	      try{
	         int k=0;
	         for(int i=1990;i<=2019;i++){
	            Document doc=Jsoup.connect("https://movie.naver.com/movie/sdb/browsing/bmovie_open.nhn").get();
	            Elements year=doc.select("table.directory_item_other td a");
	             
	                Element elem=year.get(k);
	                MovieVO vo=new MovieVO();
	              
	                vo.setLink("https://movie.naver.com/movie/sdb/browsing/"+elem.attr("href"));
	                list.add(vo);
	                System.out.println("https://movie.naver.com/movie/sdb/browsing/"+elem.attr("href"));
	                k++;
	         }
	      }catch(Exception ex){
	         ex.printStackTrace();
	      }
	      return list;
	}*/
	
  public List<String> naverMovieLinkData()
   {
      /*String[] Ldata=new String[2000];*/
	  List<String> Ldata = new ArrayList<String>();
      try
       {
    	  int k=1;
			for(int i=1;i<=2;i++){ //16
				Document doc=Jsoup.connect("https://movie.naver.com/movie/sdb/browsing/bmovie.nhn?open=1991&page="+i).get();
				Elements elem=doc.select("ul.directory_list a[href*=movie]");
					
				for(int j=0;j<elem.size();j++){
					MovieVO vo=new MovieVO();
	    			vo.setLink("https://movie.naver.com"+elem.get(j).attr("href"));
	    			
	    			System.out.println(k+"."+"https://movie.naver.com"+elem.get(j).attr("href"));
	    			k++;
					}
          }
       }catch(Exception ex)
       {
          System.out.println(ex.getMessage());
       } 
      return Ldata;
   }
   
	
	
   
   public static void main(String[] args) {
      // TODO Auto-generated method stub
        NaverMovieMain n=new NaverMovieMain();
    
       // n.naverMovieLinkData();
        //n.getMovieYear();
   }

}