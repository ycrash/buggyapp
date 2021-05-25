package com.buggyapp.stackoverflow;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.buggyapp.slowfinalize.SlowFinalizeDemo;

public class StackOverflowDemo {

	private static boolean flag = true;
	
	public static void setFlag(boolean newValue) {
		flag = newValue;
	}
	
	public int counter = 0;
	
	public void start() throws InterruptedException {
		
		++counter;

		//SimpleObject so0 = new SimpleObject("Simple Object created");

		if (counter % 1000 == 0) {
			
			System.out.println("Looped " + counter + " times");
		}
		
		if(flag) {
			Thread.sleep(20);
			start();
		}
	}
	
	public static void stop() {
		
		System.out.println("Stack overflow problem terminated!");
	}
	
}
