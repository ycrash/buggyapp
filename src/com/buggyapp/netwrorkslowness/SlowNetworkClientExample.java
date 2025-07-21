package com.buggyapp.netwrorkslowness;

import java.io.*;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class SlowNetworkClientExample {
	
	public static void main(String[] args) {

		start();
	}
	
	public static void start()  {
		 ExecutorService pool = Executors.newFixedThreadPool(200); // Parallel threads

	        for (int i = 0; i < 500; i++) {
	            pool.submit(() -> {
	                try (Socket socket = new Socket("httpbin.org", 80)) {
	                    PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
	                    out.println("GET /bytes/500000 HTTP/1.1"); // 500KB random data
	                    out.println("Host: httpbin.org");
	                    out.println("Connection: close");
	                    out.println();

	                    InputStream rawIn = socket.getInputStream();
	                    ThrottledInputStream slowIn = new ThrottledInputStream(rawIn, 4096); // 4 KB/s

	                    ByteArrayOutputStream responseBuffer = new ByteArrayOutputStream();
	                    byte[] buffer = new byte[1024];

	                    int bytesRead;
	                    while ((bytesRead = slowIn.read(buffer)) != -1) {
	                        responseBuffer.write(buffer, 0, bytesRead);

	                        // Simulate CPU work per chunk
	                        for (int j = 0; j < 10000; j++) {
	                            Math.sin(j);
	                        }
	                    }

	                    // Hold response temporarily to simulate memory hog
	                    byte[] payload = responseBuffer.toByteArray();
	                    System.out.println("Read payload: " + payload.length);

	                    // Simulate GC pressure
	                    List<byte[]> junk = new ArrayList<>();
	                    for (int k = 0; k < 5000; k++) {
	                        junk.add(Arrays.copyOf(payload, payload.length)); // clone data
	                    }

	                    junk.clear(); // make GC eligible

	                } catch (IOException e) {
	                    e.printStackTrace();
	                }
	            });
	        }

	        pool.shutdown();
	        
	        try {
				pool.awaitTermination(10, TimeUnit.MINUTES);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}
}
