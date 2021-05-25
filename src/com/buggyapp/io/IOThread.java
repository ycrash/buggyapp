package com.buggyapp.io;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.buggyapp.cpuspike.CPUSpikerThread;
import com.buggyapp.util.FileUtil;

/**
 * 
 * @author Ram Lakshmanan
 */
public class IOThread extends Thread {
	
	//private static final Logger s_logger = LogManager.getLogger(IOThread.class);
	
	public String fileName;

	public static final String CONTENT = 
									  "Hello World! We are building a simple chaos engineering product here. \n"
									+ "Hello World! We are building a simple chaos engineering product here. \n"
									+ "Hello World! We are building a simple chaos engineering product here. \n"
									+ "Hello World! We are building a simple chaos engineering product here. \n"
									+ "Hello World! We are building a simple chaos engineering product here. \n"
									+ "Hello World! We are building a simple chaos engineering product here. \n"
									+ "Hello World! We are building a simple chaos engineering product here. \n"
									+ "Hello World! We are building a simple chaos engineering product here. \n"
									+ "Hello World! We are building a simple chaos engineering product here. \n"
									+ "Hello World! We are building a simple chaos engineering product here. \n"
									+ "Hello World! We are building a simple chaos engineering product here. \n"
									+ "Hello World! We are building a simple chaos engineering product here. \n"
									+ "Hello World! We are building a simple chaos engineering product here. \n"
									+ "Hello World! We are building a simple chaos engineering product here. \n"
									+ "Hello World! We are building a simple chaos engineering product here. \n"
									+ "Hello World! We are building a simple chaos engineering product here. \n"
									+ "Hello World! We are building a simple chaos engineering product here. \n";

	public IOThread(String fileName) {
		this.fileName = fileName;
	}
	
	private static boolean flag = true;
	
	public static void setFlag(boolean newValue) {
		flag = newValue;
	}
	
	public void run() {
	
		int counter = 0;
		// Loop infinitely trying to read and close the file.
		while (flag) {

			// Write the contents to the file.
			FileUtil.write(fileName, CONTENT);
			
			// Read the contents from the file.
			FileUtil.read(fileName);
			
			if (++counter == 1000) {
				
				System.out.println("Read & write 1000 times to " + fileName);
				//s_logger.info("Read & write 1000 times to " + fileName);
				counter = 0;
			}
		}
	}
}