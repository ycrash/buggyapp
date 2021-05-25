package com.buggyapp.exceptions;



public class ExceptionsDemo {
	

	public static long exceptionCounter = 0;
	
	public void start() {
		
		for (int i=0; i<Integer.MAX_VALUE; ++i) {
			
			try { 
				
				// Since dividing by zero it will result in Exception.
				int result = i / 0;
			} catch (Exception e) {	
				++exceptionCounter;
			}
		}
		
		System.out.println("Total Exceptions: " + exceptionCounter);
	}
}
