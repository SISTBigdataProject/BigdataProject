package com.sist.manager;
import java.util.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.batch.core.scope.context.SynchronizationManagerSupport;

public class GradeMovie extends Thread{
	//Map map;
	String code;
	String title;
	GradeMovieVO vo;
	List<GradeMovieVO> grlist;
	public  GradeMovie(String code, String title) {		
			//this.map = map;
		this.code=code;
		this.title=title;
		
		//this.map=map;		
	}
	@Override
	public void run() {
		
		grlist = new ArrayList<GradeMovieVO>(); 
		   try{
			int i = 1; 
			String grlink = ""; 
		   // 최신순 
		   grlink = "https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=" + code + "&type=after&onlyActualPointYn=N&order=newest&page=1"; 
		   // 호감순 
		   // https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code="+code+"&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false 
		   // 최신순 
		   // https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=29657&type=after&onlyActualPointYn=N&order=newest 
		   // 평점높은순 
		   // https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=29657&type=after&onlyActualPointYn=N&order=highest 
		   // 평점낮은순 
		   // https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=29657&type=after&onlyActualPointYn=N&order=lowest 
/*		   System.out.println("==============================================================");
		   System.out.println(i + ". title : " + title); 
		   System.out.println("code :" + code); 
		   System.out.println("grlink :" + grlink); */
		   try { 
		    Document doc2 = Jsoup.connect(grlink).get(); 
		    Element count = doc2.select("strong.total em").get(1);

		    // 평점 개수 
		    String count1 = count.text(); 
		    if (count1.length() > 3) { 
		     count1 = count1.substring(0, count1.length() - 4) 
		       + count1.substring(count1.length() - 3, count1.length()); 
		     //System.out.println("확인:" + count1); 
		    } 
		    int grcount = Integer.parseInt(count1); 
		    //System.out.println("평점 개수:" + grcount); 

		    // 페이지 구하기 
		    int p = (int) Math.ceil(grcount / 10); 
		    if(p>150)
		    	p=150;
		    //System.out.println("페이지:" + p); 
		    

		    try { 
		     for (int k1 = 0; k1 < p; k1++) // p 
		     { 
			   int grno=0; 
			   String grcontent = ""; 
			   double grscore; 
			   String grmon = ""; 
		      grlink = "https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=" + code+ "&type=after&onlyActualPointYn=N&order=newest&page=" + (k1 + 1); 
		      Document doc3 = Jsoup.connect(grlink).get(); 
		      Elements content = doc3.select("div.score_reple p:not(span)"); 
		      Elements score = doc3.select("div.star_score em"); 
		      Elements mon = doc3.select("dt em"); 

		      for (int j = 0; j < 10; j++) { 	
		    	vo=new GradeMovieVO();
		       grno = (j + 1) + k1 * 10; 
		       grcontent = content.get(j).text();
		       if(grcontent.length()>3 && grcontent.substring(0,3).equals("관람객")){			   
			    	   grcontent=grcontent.substring(3,grcontent.length());
		       }
		       grscore = Double.parseDouble(score.get(j + 2).text()) / 2; // double형변환 
		       grmon = mon.get(2 * j + 1).text().substring(5, 7); 
		        
		 /*      System.out.println(code + ":" + title); 
		       System.out.println(grno + ":" + grcontent); 
		       System.out.println("평점 :" + grscore);       
		       System.out.println("작성 달 :" + grmon); */
		      
		       vo.setCode(code); 
		       vo.setTitle(title); 
		       vo.setGrno(grno); 
		       vo.setGrcontent(grcontent); 
		       vo.setGrscore(grscore); 
		       vo.setGrmon(grmon); 	
		       grlist.add(vo);
		      } 		     
		      //System.out.println("입력결과"+grno);
		     } 
		     System.out.println(title+"GradeMovie end...");
		    } catch (Exception ex) { 
			     System.out.println(ex.getMessage()); 
			     ex.printStackTrace();
			     
			   } 
		    } catch (Exception ex) { 
		     System.out.println(ex.getMessage()); 
		     System.out.println(ex.getStackTrace());
		    } 
		    }catch (Exception ex) { 
		    System.out.println(ex.getMessage()); 
		    System.out.println(ex.getStackTrace());
		   } 
		  } 
	}	

