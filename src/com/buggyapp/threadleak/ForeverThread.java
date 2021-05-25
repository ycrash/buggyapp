package com.buggyapp.threadleak;

public class ForeverThread extends Thread {

	private static boolean flag = true;
	
	public static void setFlag(boolean newValue) {
		flag = newValue;
	}
	
	@Override
	public void run() {
	
		while (flag) {
		
			try {
				
				Thread.sleep(10 * 60 * 1000);
			} catch (Exception e) {}
		}
	}
}
