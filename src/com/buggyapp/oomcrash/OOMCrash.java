package com.buggyapp.oomcrash;

import java.util.HashMap;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * 
 * @author Ram Lakshmanan
 */
public class OOMCrash {

	//private static final Logger s_logger = LogManager.getLogger(OOMCrash.class);
	public static void main(String args[]) {
		
		Map<String, String> map = new HashMap<>();
			
		long counter = 0;
		while (true) {
		
			counter++;
			map.put("key-" + counter, "value-" + counter);
			
			if (counter % 1000 == 0) {
				System.out.println("Added " + counter + " elements");
				// s_logger.info("Added " + counter + " elements");
			}
		}
		
	}
}
