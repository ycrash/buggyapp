package com.buggyapp.cpuspike;

/**
 * 
 * @author Ram Lakshmanan
 */
public class CPUSpikerThread extends Thread {
	
	private static boolean flag = true;
	
	public static void setFlag(boolean newValue) {
		flag = newValue;
	}

	@Override
	public void run() {
		
		while (flag) {
			
			doSomething();
		}
	}
	
	public static void doSomething() {
		// Does nothing
	}	
}
