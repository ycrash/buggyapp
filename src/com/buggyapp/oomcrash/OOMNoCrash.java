package com.buggyapp.oomcrash;

import java.util.HashMap;
import java.util.Map;


/**
 * 
 * @author Ram Lakshmanan
 */
public class OOMNoCrash {

	//private static final Logger s_logger = LogManager.getLogger(OOMNoCrash.class);
	
	public static void main(String args[]) throws Exception {
		
		try {
			
			Map<String, String> map = new HashMap<>();
			
			long counter = 0;
			while (true) {
			
				map.put("key-" + counter, "value-" + counter);
				
				counter++;				
				if (counter % 1000 == 0) {
					System.out.println("Added " + counter + " elements");
					//s_logger.info("Added " + counter + " elements");
				}
			}
		} catch (Throwable e) {

			System.out.println(e.getClass() + " caught! Application will not crash.");
			//s_logger.info(e.getClass() + " caught! Application will not crash.");
			doSomework();
		}		
	}
	
	public static void doSomework() {
		
		System.out.println("2 + 2 = " + (2 + 2));
	}
}
