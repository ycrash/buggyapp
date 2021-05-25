package com.buggyapp.memoryleakthread;

/**
 * 
 * @author Ram Lakshmanan
 */
public class ThreadMemoryLeakDemo {

	public static void start() {
	
		Object1 object1 = new Object1();
		object1.grow();
	}
}
