package com.sist.hadoop;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;


public class MovieReducer extends Reducer<Text, IntWritable, Text, IntWritable>{
	private IntWritable result=new IntWritable();
	
	@Override
	protected void reduce(Text key, Iterable<IntWritable> values,
			Reducer<Text, IntWritable, Text, IntWritable>.Context context) throws IOException, InterruptedException {
		int sum=0;
		for(IntWritable i : values)
		{
			sum+=i.get(); // IntWritable => int
			
		}
		result.set(sum); // int => IntWritable
		context.write(key, result);
	}
	
	
	
}
