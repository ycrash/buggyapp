package com.buggyapp.memoryleakthread;

import java.util.HashMap;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * 
 * @author Ram Lakshmanan
 */
public class MapManager {
	
	//private static final Logger s_logger = LogManager.getLogger(MapManager.class);

	HashMap<Object, Object> myMap = new HashMap<>();
	
	public void grow() {
		
		long counter = 0;
		while (true) {
		
			if (counter % 1000 == 0) {
				
				System.out.println("Inserted 1000 Records to map!");
				//s_logger.info("Inserted 1000 Records to map!");
			}
			
			try {
				//Thread.sleep(1);
			} catch (Exception e) {
				
			}
			myMap.put("key" + counter, "Large stringgggggggggggggggggggggggggggg"
					+ "ggggggggggggggggggggggggggggggggggggggggggggggggggggg" + counter);			
			++counter;
		}
	}
}
