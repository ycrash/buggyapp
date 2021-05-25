package com.buggyapp.memoryleak;

import java.util.HashMap;


/**
 * 
 * @author Ram Lakshmanan
 */
public class MapManager {
	

	HashMap<Object, Object> myMap = new HashMap<>();
	
	public void grow() {

		try {
			
			// createAndDestroyObjects();
			
			createObjects();			
		} catch (Exception e) {
			
		}
	}
		
	public static final long TWELVE_MINUTES = 12 * 60 * 1000;	
	
	/**
	 * This method creates and destroys objects for 5 minutes. This method will not cause
	 * memory leak.
	 * 
	 * @throws Exception
	 */
	public void createAndDestroyObjects() throws Exception {
		
		long counter = 0;
		long startTime = System.currentTimeMillis();
		
		while (true) {
		
			if (counter % 1000 == 0) {
				
				System.out.println("Inserted 1000 Records to map!");
				Thread.sleep(100);
				myMap.clear();	
				System.out.println("Deleted 1000 Records to map!");	
				
				long currentTime = System.currentTimeMillis();				
				if ((currentTime - startTime) > TWELVE_MINUTES) {
					
					// Exit the loop.
					break;
				}
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
		}
	}

	private static boolean flag = true;
	
	public static void setFlag(boolean newValue) {
		flag = newValue;
	}
	
	public void createObjects() throws Exception {
		
		long counter = 0;
		
		while (flag) {
		
			if (counter % 1000 == 0) {
				
				System.out.println("Inserted 1000 Records to map!");
				Thread.sleep(1);
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
		}
	}
}
