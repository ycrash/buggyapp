package com.buggyapp.dbconnectionleak;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 *  DB Connection Leak Demo - with DB connection details (Which requires externalisation)
 *
 */
public class DBConnectionLeak {



	private Boolean leakConnections = true;
	
	private String jdbcUrl;
	private String username;
	private String password;
	private String tableName;
	
	public DBConnectionLeak(String jdbcUrl,String username,String password, String tableName) {
		this.jdbcUrl = jdbcUrl;
		this.username = username;
		this.password = password;
		this.tableName = tableName;
	}

	

	public Connection getConnection() throws SQLException {
		return DriverManager.getConnection(jdbcUrl, username, password);
	}

	public void closeConnection(Connection connection) throws SQLException {
		if (connection != null) {
			connection.close();
		}
	}

	/**
	 * Opens a SQL connection and never closes it 

	 */
	public void leakConnection() {
		Connection connection = null;
		try {
			connection = getConnection();
			System.out.println("Leaking DB connection");
			// Perform database operations using the connection
			PreparedStatement statement = connection.prepareStatement("SELECT * FROM "+tableName);
			ResultSet resultSet = statement.executeQuery();
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				//Connection  not closed
				// closeConnection(connection);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}
	
	/**
	 * Introduces a contineous connection leak sql connection leak problem
	 */
	public void leakConnections() {
		while(true && leakConnections ) {
			leakConnection();
		}
	}
	
	public Boolean getLeakConnections() {
		return leakConnections;
	}



	public void setLeakConnections(Boolean leakConnections) {
		this.leakConnections = leakConnections;
	}
	
}
	
	

