package com.buggyapp.deadlock;

public class HotObject {

	public static synchronized void method2() {
		
		try {
			// Sleep for 10 seconds
			Thread.sleep(10 * 1000);
		} catch (Exception e) {
			
		}
		
		CoolObject.method1();
	}	
}
