package com.buggyapp.memoryleakthread;

public class Object2 {
	

	public void grow() {

		Object3 object3 = new Object3();
		object3.grow();
	}	
}
