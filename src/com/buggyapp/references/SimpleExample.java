package com.buggyapp.references;


public class SimpleExample {

	//private static final Logger s_logger = LogManager.getLogger(SimpleExample.class);
	public static void main (String argsp[]) throws Exception {
	
		A a = new A();
		B b = new B();
		
		System.out.println("Objects created!");
		//s_logger.info("Objects created!");
		Thread.sleep(1 * 60 * 1000);
	}
}
