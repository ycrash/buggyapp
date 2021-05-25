package com.buggyapp.inefficientlist;

import java.util.ArrayList;
import java.util.List;

public class ListWithOutCapacityDemo {

	public static final String DEMO_STRING = "I am a demo string";
	private static int MAX_ELEMENTS = 100000;

	private static List<List<String>> parentList = new ArrayList<>();
	
	public static void main(String args[]) {
		
		int counter = 0;		
		while (counter++ < MAX_ELEMENTS) {
		
			List<String> childList = new ArrayList<>();
			childList.add(DEMO_STRING);
			
			parentList.add(childList);
		}		
	}
}
