package com.buggyapp.memoryleakthread;

public class Object1 {

	
	public void grow() {
	
		Object2 object2 = new Object2();
		object2.grow();
	}
}
