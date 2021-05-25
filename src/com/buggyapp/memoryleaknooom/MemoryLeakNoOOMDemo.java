package com.buggyapp.memoryleaknooom;

import java.util.HashMap;

import com.buggyapp.cpuspike.CPUSpikerThread;

public class MemoryLeakNoOOMDemo {
	

	private static HashMap<Object, Object> myMap = new HashMap<>();
	
	public static void start() throws Exception {
		
		createObjects();
	}
	
	public static void stop() {
		
		System.out.println("Memory leak problem terminated!");
	}
	
	private static boolean flag = true;
	
	public static void setFlag(boolean newValue) {
		flag = newValue;
	}
	
	public static void createObjects() throws Exception {
		
		long counter = 0;
		
		
		while (flag) {
		
			// If free memory is less than 100 mb, then keep sleeping;
			//long freeMem = Runtime.getRuntime().maxMemory();
			/**if (counter % 1000 == 0) {
				System.out.println("max: " + Runtime.getRuntime().maxMemory() / (1024 * 1024) 
						+ " (mb), total: " 
						+ Runtime.getRuntime().totalMemory() / (1024 * 1024)								
						+ " (mb), free: " 
						+ Runtime.getRuntime().freeMemory() / (1024 * 1024) );								
			}*/
			
			if ( ((Runtime.getRuntime().maxMemory() - Runtime.getRuntime().totalMemory()) < 100 * 1024 * 1024) 
					&& 
				  Runtime.getRuntime().freeMemory() < 50 * 1024 * 1024) {
				Thread.sleep(1000);
				System.out.println("sleeping!");								
				System.out.println("max: " + Runtime.getRuntime().maxMemory() / (1024 * 1024) 
						+ " (mb), total: " 
						+ Runtime.getRuntime().totalMemory() / (1024 * 1024)								
						+ " (mb), free: " 
						+ Runtime.getRuntime().freeMemory() / (1024 * 1024) );
				
				continue;
			}
						
			myMap.put("key" + counter, "Large stringgggggggggggggggggggggggggggg"
					+ "ggggggggggggggggggggggggggggggggggggggggggggggggggggg" 
					+ "ggggggggggggggggggggggggggggggggggggggggggggggggggggg" 
					+ "ggggggggggggggggggggggggggggggggggggggggggggggggggggg" 
					+ "ggggggggggggggggggggggggggggggggggggggggggggggggggggg" 
					+ "ggggggggggggggggggggggggggggggggggggggggggggggggggggg" 
					+ "ggggggggggggggggggggggggggggggggggggggggggggggggggggg" 
					+ "ggggggggggggggggggggggggggggggggggggggggggggggggggggg" 
					+ "ggggggggggggggggggggggggggggggggggggggggggggggggggggg" 
					+ "ggggggggggggggggggggggggggggggggggggggggggggggggggggg" 
					+ "ggggggggggggggggggggggggggggggggggggggggggggggggggggg" 
					+ "ggggggggggggggggggggggggggggggggggggggggggggggggggggg" 
					+ counter);			
			++counter;
			
			if (counter % 1000 == 0) {
				
				System.out.println("Inserted 1000 Records to map!");
			}			
		}
	}	
}
