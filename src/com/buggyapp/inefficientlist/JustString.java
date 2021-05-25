package com.buggyapp.inefficientlist;

public class JustString {

	public static final String DEMO_STRING = "I am a demo string";
	private static int MAX_ELEMENTS = 100000;
	
	private static String myString;
			
	public static void main(String args[]) {
		
		StringBuilder stringBuilder = new StringBuilder();		

		int counter = 0;
		while (counter++ < MAX_ELEMENTS) {
		
			
			stringBuilder.append(DEMO_STRING);
		}
		
		myString = stringBuilder.toString();
		
		try {
			Thread.sleep(5 * 60 * 1000);
		} catch (Exception e) {}
	}
	
}
