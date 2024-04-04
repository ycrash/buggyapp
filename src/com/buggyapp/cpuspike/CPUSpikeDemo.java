package com.buggyapp.cpuspike;

import com.buggyapp.util.StringUtil;

/**
 * 
 * @author Ram Lakshmanan
 */
public class CPUSpikeDemo {

	public static final String NUMBER_OF_CPU_CYCLES = "buggyApp.CPUCycles";
	
	public static void start() throws InterruptedException {
		
		int noOfCycles = 6;
		
		if (StringUtil.isValid(System.getProperty(NUMBER_OF_CPU_CYCLES))) {
			try {
				noOfCycles = Integer.parseInt(System.getProperty(NUMBER_OF_CPU_CYCLES));
			} catch (NumberFormatException e) {
				System.out.println("Failed to parse buggyApp.CPUCycles");
			}
		}
		
		int counter = 0;
		
		while (counter < noOfCycles) {
			
			new CPUSpikerThread().start();
			Thread.sleep((2 * 60 * 1000));
			counter++;
		}
		/*
		 * new CPUSpikerThread().start(); new CPUSpikerThread().start(); new
		 * CPUSpikerThread().start(); new CPUSpikerThread().start(); new
		 * CPUSpikerThread().start(); new CPUSpikerThread().start();
		 */
		System.out.println(noOfCycles + " threads launched!");
	}
	
	public static void stop() {
		
		new CPUSpikerThread().stop();
		System.out.println("CPU spike terminated!");
	}
}
