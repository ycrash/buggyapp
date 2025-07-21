package com.buggyapp.httpconnectionleak;


import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;


public class HttpConnectionLeakSimulator {

	public static void main(String[] arg) {
		start1();
	}
	
	
	
	public static void start() {
	
		for (int i = 0; i < 1000; i++) {
            try {
                URL url = new URL("https://httpbin.org/get");
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("GET");

                // Open connection (this sends the request)
                InputStream inputStream = connection.getInputStream();

                System.out.println("Leaked connection " + i);

                Thread.sleep(500); // Slow down to observe leak buildup
            } catch (Exception e) {
                System.err.println("Connection failed: " + e.getMessage());
            }
        }
	}
	
	public static void start1() {
		ExecutorService pool = Executors.newFixedThreadPool(200);
		for (int i = 0; i < 10000; i++) {
		    pool.submit(() -> {
		        for (int j = 0; j < 10000; j++) {
		            try {
		                HttpURLConnection conn = (HttpURLConnection) new URL("https://httpbin.org/get").openConnection();
		                conn.setRequestMethod("GET");
		                conn.getResponseCode();
		                //conn.disconnect();
		                Thread.sleep(500);
		            } catch (Exception e) {
		                e.printStackTrace();
		            }
		        }
		    });
		}
	}
	
}

