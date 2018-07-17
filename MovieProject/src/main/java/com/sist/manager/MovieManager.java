package com.sist.manager;

import java.util.*;

import org.apache.spark.sql.catalyst.expressions.Length;
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
		ApplicationContext app = new ClassPathXmlApplicationContext("application-*.xml");
		MovieManager mm = (MovieManager) app.getBean("movieManager");

		Map map = mm.link();
		Set<String> set = map.keySet();
		Iterator<String> iterator = set.iterator();

		String[] clist = new String[map.size()];
		String[] tlist = new String[map.size()];
		String code;
		String title;
		int i = 0;
		while (iterator.hasNext()) {
			Object key = iterator.next();
			code = (String) key;
			title = (String) map.get(key);
			clist[i] = code;
			tlist[i] = title;
			i++;
		}

		/*
		 * for(int a=0;a<map.size();a++) {
		 * System.out.println(clist[a]+":"+tlist[a]); }
		 */

		/*
		 * GradeMovie[] glist=new GradeMovie[map.size()]; for (int k = 0; k <
		 * map.size(); k++) { glist[k] = new GradeMovie(clist[k],tlist[k]);
		 * glist[k].start(); if (k % 300 == 0 && k != 0) { for (int j = 0; j <
		 * k; j++) { while (glist[j].isAlive()); } }
		 * 
		 * System.out.println(k+" 쓰레드 종료"); for(GradeMovieVO
		 * gvo:glist[k].grlist) { mm.dao.GradeMovieInsert(gvo); } }catch
		 * (Exception e) { System.out.println(e.getMessage()); } }
		 * 
		 * System.out.
		 * println("==========================GradeMovie end=========================="
		 * );
		 */
		ReviewMovie[] rlist = new ReviewMovie[map.size()];
		for (int k = 0; k < map.size(); k++) {
			rlist[k] = new ReviewMovie(clist[k], tlist[k]);
			rlist[k].start();
			if (k % 3000 == 0 && k != 0) {
				for (int j  = 0; j < k; j++) {
					while (rlist[j].isAlive())
						;
				}
			}
			/*
			 * try { rlist[k].join(); System.out.println(k+" 쓰레드 종료");
			 * for(ReviewMovieVO rvo:rlist[k].rvlist){
			 * mm.dao.ReviewMovieInsert(rvo); } }catch (Exception e) {
			 * System.out.println(e.getMessage()); }
			 */
		}

		System.out.println("==========================ReviewMovie end==========================");

		/*
		 * ArrayList<MovieVO> links=mm.naverYearLinkData(); int k=links.size();
		 * for(int i=0;i<k;i++){ MovieDetail[] dlist=new MovieDetail[k];
		 * dlist[i]=new MovieDetail(links.get(i).getLink()); dlist[i].start();
		 * if (i % 10000 == 0 && i != 0) { for (int j = 0; j < i; j++) { while
		 * (dlist[j].isAlive()); } } try { dlist[i].join();
		 * System.out.println(i+" 쓰레드 종료"); for(MovieVO dvo: dlist[i].dlist){
		 * mm.dao.MovieInsert(dvo); } }catch (Exception e) {
		 * System.out.println(e.getMessage()); }
		 * 
		 * }
		 */
	}

	// 링크(코드, 영화 제목)
	public Map<String, String> link() {
		Map<String, String> map = new HashMap<String, String>();
		String code = "";
		String title = "";
		try {
			String url = "https://movie.naver.com/movie/sdb/rank/rmovie.nhn?sel=cur&date=20180619";
			int k = 1;
			for (int i = 1; i <= 41; i++) { // 41
				Document doc = Jsoup.connect(url).get();
				Elements etitle = doc.select("div.tit5 a");
				String ecode = "";
				url = "https://movie.naver.com/movie/sdb/rank/rmovie.nhn?sel=pnt&date=20180619&page=" + i;
				for (int j = 0; j < etitle.size(); j++) {
					title = etitle.get(j).text();
					ecode = etitle.get(j).attr("href");
					code = ecode.substring(ecode.indexOf("code=") + 5, ecode.length());
					map.put(code, title);
					k++;
				}
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			System.out.println(ex.getStackTrace());
		}
		return map;
	}

	public ArrayList<MovieVO> naverYearLinkData() {
		ArrayList<MovieVO> list = new ArrayList<MovieVO>();
		try {
			Document doc1 = Jsoup.connect("https://movie.naver.com/movie/sdb/browsing/bmovie_open.nhn").get();
			Elements ecount = doc1.select("td");
			String[] pcount = new String[35];
			String[] pyear = new String[35];
			int[] page = new int[35];
			for (int i = 0; i < 35; i++) {
				pcount[i] = ecount.get(i).text();
				pyear[i] = pcount[i].substring(0, 4);
				page[i] = (int) (Integer.parseInt(
						pcount[i].substring(pcount[i].lastIndexOf("(") + 1, pcount[i].lastIndexOf(")"))) / 20.0) + 1;
				// System.out.println(pyear[i]+":"+page[i]);
			}
			for (int i = 1; i <= 29; i++) {

				for (int j = 1; j <= page[i]; j++) {
					Document doc = Jsoup.connect(
							"https://movie.naver.com/movie/sdb/browsing/bmovie.nhn?open=" + pyear[i] + "&page=" + j)
							.get();
					Elements elem = doc.select("ul.directory_list a[href*=movie]");
					for (int k = 0; k < elem.size(); k++) {
						MovieVO vo = new MovieVO();
						vo.setLink("https://movie.naver.com" + elem.get(k).attr("href"));
						list.add(vo);
						// System.out.println(k+"."+"https://movie.naver.com"+elem.get(j).attr("href"));
					}
				}
				System.out.println(pyear[i]);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return list;

	}

}