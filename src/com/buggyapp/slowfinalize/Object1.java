package com.buggyapp.slowfinalize;

public class Object1 {

	public String data;
	
	public Object1(String data) {
		
		this.data = data;
	}
		
	@Override
	public void finalize() {
	
		try {
			// Sleep for 3 minute.
			Thread.currentThread().sleep(3 * 60 * 1000);
		} catch (Exception e) {}
	}		
}
