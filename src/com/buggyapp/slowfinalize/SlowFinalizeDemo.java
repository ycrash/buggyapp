package com.buggyapp.slowfinalize;


public class SlowFinalizeDemo {

	//private static final Logger s_logger = LogManager.getLogger(SlowFinalizeDemo.class);
	public static void start() {
		
		long counter = 0;
		
		while (true) {
		
			new Object1("my-fun-data-" + counter);
			System.out.println("created: " + counter++);
		}
	}	
}
