package com.buggyapp.threadleak;

import com.buggyapp.cpuspike.CPUSpikerThread;

/**
 * Created infinite number of threads
 * 
 * @author Ram Lakshmanan
 */
public class ThreadLeakDemo {

	private static boolean flag = true;
	
	public static void setFlag(boolean newValue) {
		flag = newValue;
	}
	
	public static void start() {
		
		System.out.println("Thread App started");
		while (flag) {
			
			try {
			
				// Failed to put thread to sleep.
				Thread.sleep(100);
			} catch (Exception e) {				
			}
			
			new ForeverThread().start();
		}
	}
	
	public static void stop() {
		
		System.out.println("Thread leak problem terminated!");
	}
}
