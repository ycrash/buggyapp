package com.buggyapp.inefficientlist;

public class ArraysDemo {

	public static final String DEMO_STRING = "I am a demo string";
	private static int MAX_ELEMENTS = 100000;
	
	private static String[][] parentArray = new String[MAX_ELEMENTS][1];
	
	
	public static void main(String args[]) {
		
		int counter = 0;
		while (counter < MAX_ELEMENTS) {
		
			String[] childArray = new String[1];			
			childArray[0] = DEMO_STRING;
			
			parentArray[counter] = childArray;
		}		
	}
}
