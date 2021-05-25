package com.buggyapp.deadlock;

public class ThreadA extends Thread {

	@Override	
	public void run() {
		CoolObject.method1();
	}
}
