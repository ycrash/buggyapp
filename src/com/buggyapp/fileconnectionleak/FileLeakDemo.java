package com.buggyapp.fileconnectionleak;

public class FileLeakDemo {
	
	private static FileConnectionLeak fileConnectionLeak = null;
	
	public static void start() {
		fileConnectionLeak =  new FileConnectionLeak();
		fileConnectionLeak.setLeakFiles(true);	
		fileConnectionLeak.startFileLeaks();
	}
	
	public static void stop() {
		if(fileConnectionLeak != null ) {
			fileConnectionLeak.setLeakFiles(false);	
		}
	}
	
}
