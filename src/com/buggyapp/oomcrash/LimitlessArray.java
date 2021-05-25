package com.buggyapp.oomcrash;

import java.util.UUID;

/**
 * 
 * @author Ram Lakshmanan
 */
public class LimitlessArray {

	public static void main(String[] args) {
		  
	   System.out.println("The begining");
	    String[] bla = new String[800000000]; //crashes-right away
	    //String[] bla = new String[400000000];
	    
	    for (int i=0; i<400000000; i++) {
	    
	    	bla[i] = UUID.randomUUID().toString();
	    }
	    
	   System.out.println("The end");
	 
	}	
}
