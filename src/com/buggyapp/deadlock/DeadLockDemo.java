package com.buggyapp.deadlock;

public class DeadLockDemo {
	
	public static void start() {
		
		System.out.println("App started");
		new ThreadA().start();
		new ThreadB().start();
	}
	
	public static void stop() {
		
		System.out.println("Unsupported!");
	}
}
