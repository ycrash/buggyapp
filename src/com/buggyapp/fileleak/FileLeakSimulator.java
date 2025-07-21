package com.buggyapp.fileleak;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileLeakSimulator {
    
	public static void main(String[] args) throws Exception {
		FileLeakSimulator fileLeakDemo = new FileLeakSimulator();
		fileLeakDemo.start();
    }

	/**
	 * simulates by creating file object references without closing
	 * This process will throw too many files open exception in Linux environment
	 * if ulimit is set. It is better to run this code in Linux environment after setting
	 * ulimit value.
	 * 
	 * However, you can monitor this too many files open using lsof command.
	 */
    public void start() {
        List<FileInputStream> openFiles = new ArrayList<>();
        int count = 0;

        try {
            while (true) {
                FileInputStream fis = new FileInputStream("test.txt");
                openFiles.add(fis);  // Keep reference to prevent garbage collection
                count++;
                System.out.println("Opened file handle #" + count);
            }
        } catch (IOException e) {
            System.err.println("Exception occurred after opening " + count + " files");
            e.printStackTrace();
        }

    }
}
