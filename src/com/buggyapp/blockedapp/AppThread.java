package com.buggyapp.blockedapp;

public class AppThread extends Thread {

	@Override
	public void run() {
		
		AppObject.getSomething();
	}
}
