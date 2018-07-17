package com.sist.hadoop;

import java.io.IOException;
import java.util.StringTokenizer;

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

	@Override
	protected void map(LongWritable key, Text value, Mapper<LongWritable, Text, Text, IntWritable>.Context context)
			throws IOException, InterruptedException {
		StringTokenizer str = new StringTokenizer(value.toString());
		while (str.hasMoreElements()) {
			word.set(str.nextToken());
			context.write(word, one);
		}
	}

}