package com.sist.hadoop;

import java.io.IOException;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

/*
  	KEYIN: 파일의 줄번호 ==> Long(클래스 변경:LongWritable)
	VALUEIN: 한 줄 문자열 ==> String(Text)
	===================== 입력값
	KEYOUT: 찾은 단어 ==> String(Text)
	VALUEOUT: 1부여 ==> int(Intwritable)
	===================== 출력값
	MapReduce ==> 파일 읽기, 파일 쓰기, 데이터형 다르다 단점
	=================================================
		메모리 읽기, 메모리 쓰기, 자바 데이터형과 같다: Spark
						Mapper				 셔플/쇼트    => Reduce
	1. aaa bbb ccc => aaa 1 bbb 1 ccc 1 aaa[1,1]     aaa 2
	2. ddd aaa bbb => ddd 1 aaa 1 bbb 1 bbb[1,1]     bbb 2
	3. kkk jjj aaa => kkk 1 jjj 1 aaa 1 ccc[1]       ccc 1
											 ddd[1]       ddd 1
											 kkk[1]       kkk 1
											 jjj[1]       jjj 1
*/
public class MovieMapper extends Mapper<LongWritable, Text, Text, IntWritable> {
	// 1씩 부여 ==> 단어별 1씩 부여
	private final IntWritable one = new IntWritable(1);
	// 단어 가져오기
	private Text word = new Text();
	private String[] data = {"사랑","로맨스","매력","즐거움","스릴",
			"소름","긴장","공포","유머","웃음","개그",
			"행복","전율","경이","우울","절망","신비",
			"여운","희망","긴박","감동","감성","휴머니즘",
			"자극","재미","액션","반전","비극","미스테리",
			"판타지","꿈","설레임","흥미","풍경","일상",
			"순수","힐링","눈물","그리움","호러","충격","잔혹",
			"드라마","판타지","공포","멜로","애정",
			"로맨스","모험","스릴러","느와르","다큐멘터리",
			"코미디","미스터리","범죄","SF","액션","애니메이션"	
	};
	@Override
	protected void map(LongWritable key, Text value, Mapper<LongWritable, Text, Text, IntWritable>.Context context)
			throws IOException, InterruptedException {
		Pattern[] p = new Pattern[data.length]; // 포함문자 찾을 때 Pattern 씀
		for(int i=0; i<p.length; i++){
			p[i]=Pattern.compile(data[i]);
		}
		Matcher[] m = new Matcher[data.length];
		for(int i=0; i<m.length; i++)
		{
			m[i]=p[i].matcher(value.toString());
			if(m[i].find())
			{
				word.set(m[i].group());
				context.write(word, one);
			}
		}
	}

}
