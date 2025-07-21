package com.buggyapp.fileleak;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class FileLeakDemo {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("starting the file handler leak scenario...");
		start();	
//		while (true) {
//			File f = new File("test.txt");
//			boolean status = f.exists();
//			
//		    FileReader fr = new FileReader("test.txt");
//		    BufferedReader br = new BufferedReader(fr);
//		    String line = br.readLine();
//		    br.close();
//		}
		
		
	}

	public static void start( ) {
		System.out.println("starting the file handler leak scenario...");
		ExecutorService pool = Executors.newFixedThreadPool(200);
		for (int t = 0; t < 200; t++) {
		    pool.submit(() -> {
		        for (int i = 0; i < 100000; i++) {
		            try (FileWriter fw = new FileWriter("file_" + Thread.currentThread().getId() + "_" + i + ".txt")) {
		                for (int j = 0; j < 10000; j++) {
		                    fw.write("Testing\n");
		                }
		            } catch (IOException e) {
		                e.printStackTrace();
		            }
		        }
		    });
		}
	}
}
