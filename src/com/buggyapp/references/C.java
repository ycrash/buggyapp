package com.buggyapp.references;

public class C {

	private D d1 = new D();
	
	private E e1 = new E();
	
	private static C myC = new C();
	public static C getInstance() {
		return myC;
	}
}
