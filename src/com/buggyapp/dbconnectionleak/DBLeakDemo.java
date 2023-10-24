package com.buggyapp.dbconnectionleak;

public class DBLeakDemo {
	
	private static DBConnectionLeak dbConnectionLeak = null;
	
	public static void start(String jdbcUrl,String username, String password, String tableName ) {
		dbConnectionLeak =  new DBConnectionLeak( jdbcUrl, username, password,  tableName);
		dbConnectionLeak.leakConnections();
	}
	
	public static void stop() {
		if(dbConnectionLeak != null ) {
			dbConnectionLeak.setLeakConnections(false);	
		}
		System.out.println("DB Connection problem leak terminated!");
	}
	
}
