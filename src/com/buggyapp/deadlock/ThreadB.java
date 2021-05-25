package com.buggyapp.deadlock;

public class ThreadB extends Thread {

	@Override	
	public void run() {
		HotObject.method2();
	}	
}
