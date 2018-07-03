package com.sist.movie;
import java.util.*;



import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

@Component
public class MovieManager {
    @Autowired
    private MovieDAO dao;
    
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext app = new ClassPathXmlApplicationContext("application-*.xml");
		
		MovieManager m=(MovieManager)app.getBean("movieManager");
		
		List<MovieVO> list= m.naverMovieAllData();
	   int i=0;
	     for(MovieVO vo:list)
	     {
	    	  m.dao.MovieInsert(vo);
	    	  System.out.println("i="+i);
	    	  i++;
	     }
	     System.out.println("end...");		
	  //   MovieManager m = new MovieManager();	
	 // 	m.naverYearLinkData();
	  //   m.naverMovieAllData();
		
	}
	

	public ArrayList<MovieVO> naverYearLinkData(){
		ArrayList<MovieVO> list=new ArrayList<MovieVO>();
		try{
		int k=1;
			for(int i=1;i<=35;i++){
				Document doc=Jsoup.connect("https://movie.naver.com/movie/sdb/browsing/bmovie.nhn?open=2018&page="+i).get();
				Elements elem=doc.select("ul.directory_list a[href*=movie]");
					
				for(int j=0;j<elem.size();j++){
					MovieVO vo=new MovieVO();
	    			vo.setLink("https://movie.naver.com"+elem.get(j).attr("href"));
	    			list.add(vo);
	    			System.out.println(k+"."+"https://movie.naver.com"+elem.get(j).attr("href"));
	    			k++;
					}
			}
	
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return list;
		
		
	}
	
	public ArrayList<MovieVO> naverMovieAllData()
	{
	    ArrayList<MovieVO> list = new ArrayList<MovieVO>();
	    ArrayList<MovieVO> links= naverYearLinkData();
	     int i=0;
	       for(int j=0; j<links.size();j++)
	       {
	           try
	           {
	               Document doc=Jsoup.connect(links.get(j).getLink()).get();
	               Element title=doc.select("div.mv_info h3.h_movie a").get(0);	             	           
	               Elements genre=doc.select("p.info_spec span a[href*=genre]");
	               Element country=doc.select("p.info_spec span").get(1);
	               Elements regdate=doc.select("p.info_spec span:contains(개봉)");
	               Elements grade = doc.select("p.info_spec span:contains(관람)");
	               Element director=doc.select("div.info_spec2 dl.step1 dd").get(0);
	               Elements actor=doc.select("div.info_spec2 dl.step2 dd");
	               Element poster=doc.select("div.poster img").get(0);
	               Elements story1=doc.select("div.story_area h5");
	               Elements story2=doc.select("div.story_area p");
	               Elements actorImage=doc.select("div.obj_section li a img[src*=search.pstatic.net]");
	              
	             /*
	              *  private int rank;
					   private String title;
					   private String link;
					   private String genre;
					   private String director;
					   private String actor;
					   private String grade;
					   private String regdate;
					   private String poster;
					   private String story;
					   private String actorImage;
					   private String country;
	              * 
	              */
	               MovieVO vo=new MovieVO();
	    			 vo.setMno(i);
	    			 vo.setTitle(title.text());
	    			 vo.setPoster(poster.attr("src"));
	    			 vo.setDirector(director.text());
	    			 vo.setActor(actor.text());
	    			 vo.setGenre(genre.text());
	    			 vo.setGrade(grade.text());
	    			 vo.setRegdate(regdate.text());
	    			 vo.setStory(story1.text());
	    			 vo.setStory(story2.text());
	    			 vo.setActorImage(actorImage.attr("src"));
	    			 vo.setLink(links.get(j).getLink().substring(links.get(j).getLink().lastIndexOf("=")+1));
	    			 
	    			// vo.setCode(Integer.parseInt(str));
	    			 list.add(vo);
	    		
	                 System.out.println("링크"+links.get(j).getLink().substring(links.get(j).getLink().lastIndexOf("=")+1));  
	               System.out.println("===========================");
	               System.out.println("No)"+(i+1));
	               System.out.println("제목:"+title.text());
	              
	               System.out.println("제작국가:"+country.text());
	               System.out.println("감독:"+director.text());
	               System.out.println("배우:"+actor.text());
	         
	               System.out.println("개봉일:"+regdate.text());
	               System.out.println("장르:"+genre.text()); //공연실황, 에로말
	               System.out.println("등급:"+grade.text()); //[국내] [해외] 도움말
	               System.out.println("포스터:"+poster.attr("src"));
	               System.out.println("줄거리:"+story1.text()+" "+story2.text());
	               System.out.println("배우이미지:"+actorImage.attr("src"));
	              // System.out.println("코드"+Integer.parseInt(str));
	               System.out.println("===========================");
	               i++;
	               
	                 

		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
	   
	}
	return list;
	}
	  
}
	  
  

