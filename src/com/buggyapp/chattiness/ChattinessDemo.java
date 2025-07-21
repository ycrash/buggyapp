package com.buggyapp.chattiness;

import java.sql.*;
import java.util.*;

public class ChattinessDemo {
    private static final String JDBC_URL = "jdbc:h2:mem:testdb;DB_CLOSE_DELAY=-1";
    private static final String USER = "sa";
    private static final String PASSWORD = "";

    private static final int TOTAL_RECORDS = 1000000;

    public static void main(String[] args) throws Exception {
    	start();
    }

    public static void start() throws Exception {
        Runnable r = new Runnable() {
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
		
				try (Connection conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD)) {
		            setupDatabase(conn);

		            //// inserted test users
		            System.out.println("inserting " + TOTAL_RECORDS + " users");
		            insertSampleUsers(conn);
		            System.out.println("inserted " + TOTAL_RECORDS + " users");

		            List<Integer> userIds = new ArrayList<>();
		            for(int i = 1; i<TOTAL_RECORDS; i++) {
		                userIds.add(i);
		            }
		            System.out.println("fetching users, chatty way ->");
		            while(true) { // simulates a chatty fetching the users from the database
		                List<User> users = getUsersByIds(conn, userIds);
		                users.forEach(System.out::println);
		                try {
		                    Thread.sleep(new Random().nextInt(200));
		                } catch (InterruptedException e) {
		                    throw new RuntimeException(e);
		                }
		            }
		        } catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		};
		
    	for(int i = 0; i<100; i++) {
    		Thread t = new Thread(r);
			t.start();
    	}
    }
    
    private static void setupDatabase(Connection conn) throws SQLException {
    	String createTableSQL = 
    		    "CREATE TABLE users (\n" +
    		    "    id INT PRIMARY KEY,\n" +
    		    "    name VARCHAR(255),\n" +
    		    "    email VARCHAR(255),\n" +
    		    "    address VARCHAR(255)\n" +
    		    ");";
        try (Statement stmt = conn.createStatement()) {
            stmt.execute(createTableSQL);
        }
    }

    private static void insertSampleUsers(Connection conn) throws SQLException {
        String insertSQL = "INSERT INTO users (id, name, email, address) VALUES (?, ?, ?, ?)";

        try (PreparedStatement stmt = conn.prepareStatement(insertSQL)) {
            for (int i = 1; i <= TOTAL_RECORDS; i++) {
                stmt.setInt(1, i);
                stmt.setString(2, "User" + i);
                stmt.setString(3, "fake" + i + "@gmail.com");
                stmt.setString(4, "fake address " + i);
                stmt.addBatch();
            }
            stmt.executeBatch();
        }
    }

    // chatty database access
    // This is a chatty way for how users details are fetched.
    // For each user, it will make a DB call to get the details
    //
    private static List<User> getUsersByIds(Connection conn, List<Integer> userIds) throws SQLException {
        List<User> users = new ArrayList<>();
        for (Integer id : userIds) {
            String sql = "SELECT count(*) as cnt FROM users WHERE id = ?";
            try (
                 PreparedStatement stmt = conn.prepareStatement(sql)) {
                 stmt.setInt(1, id);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    User user = new User(rs.getInt("cnt"),"");
                    users.add(user);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return users;
    }

    // Simple POJO class
    static class User {
        int id;
        String name;

        User(int id, String name) {
            this.id = id;
            this.name = name;
        }

        public String toString() {
            return "User{id=" + id + ", name='" + name + "'}";
        }
    }
}