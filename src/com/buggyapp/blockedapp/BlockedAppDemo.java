package com.buggyapp.blockedapp;

public class BlockedAppDemo {

	//private static final Logger s_logger = LogManager.getLogger(BlockedAppDemo.class);
	
	public static void start() {
		
		System.out.println("App started");
		for (int counter = 0; counter < 10; ++counter) {

			// Launch 10 threads.
			new AppThread().start();
		}
		
		System.out.println("App became unresponsive");
	}
	
	public static void stop() {
		
		System.out.println("Blocked App problem terminated!");
	}
}
