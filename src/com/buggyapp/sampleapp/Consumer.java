package com.buggyapp.sampleapp;

import static com.buggyapp.sampleapp.SampleAppDemo.THRESHOLD;
import static com.buggyapp.sampleapp.SampleAppDemo.s_map;


import com.buggyapp.references.SimpleExample;

public class Consumer extends Thread {
	
	//private static final Logger s_logger = LogManager.getLogger(Consumer.class);

	@Override
	public void run() {
		
		String data = null;
		long counter = 0;
		while (true) {
			
			try {
			
				// 1 minute
				Thread.currentThread().sleep(1 * 60 * 1000);				
			} catch (Exception e) { e.printStackTrace();}
			
			s_map.clear();
			//if ((counter % THRESHOLD) == 0) {
			System.out.println("Consumer thread consumed all Objects");
			// s_logger.info("Consumer thread consumed all Objects");
				//s_map.clear();
			//}
		}		
	}
	
}
