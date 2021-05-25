package com.buggyapp.blockedapp;

public class AppObject {

	private static boolean flag = true;
	
	public static void setFlag(boolean newValue) {
		flag = newValue;
	}
	
	public static synchronized void getSomething() {

		// Put the thread to sleep forever. Basically first
		// thread would have acquired the lock and go to sleep
		// No other thread would be able to enter this method.
		while (flag) {
			
			try {
				
				Thread.sleep(10 * 60 * 1000);
			} catch (Exception e) {}
		}
	
	}
}
