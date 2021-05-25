package com.buggyapp;

/**
 * 
 * @author Ram Lakshmanan
 */
public class BaseTest {

	public static final String BASE_FOLDER_PATH = "D:\\Git_repo\\buggy-app";
	
	static {
		initLogger();
	}
	
	public static void initLogger() {
			
		System.setProperty("logDir", "c:\\workspace\\uploads2");
	}
}
