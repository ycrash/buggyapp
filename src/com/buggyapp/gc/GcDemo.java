package com.buggyapp.gc;

import java.util.ArrayList;
import java.util.List;

public class GcDemo {

	public static void main(String[] args) {
		start();
	}
	/**
	 * Call System.gc inside a loop so that it will cause frequent
	 * garbage collection and it will cause a huge GC pause time
	 * 
	 */
	public static void start() {
		// we will simulate garbage collection inside a for loop
		System.out.println("Going to invoke GC programmatically...");
		List<byte[]> memoryHog = new ArrayList<>();

        while (true) {
            
        	for (int i = 0; i < 100; i++) {
                memoryHog.add(new byte[1024]); // Allocate 10MB
            }

            System.out.println("Allocated ~10MB of data");
           // memoryHog.clear(); // Make everything eligible for GC

            System.gc(); // Force GC (may or may not be honored)
//            try {
//                Thread.sleep(1000);
//            } catch (InterruptedException e) {
//                Thread.currentThread().interrupt();
//            }
        }
	}
}
