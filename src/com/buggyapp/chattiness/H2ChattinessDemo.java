package com.buggyapp.chattiness;

import java.sql.*;

public class H2ChattinessDemo {

    public static void main(String[] args) throws Exception {
    	start();
    }

    public static void start() throws Exception {
        // H2 in-memory connection
        Connection conn = DriverManager.getConnection("jdbc:h2:mem:testdb", "sa", "");

        setupDatabase(conn);

        // Chatty access: thousands of small, repeated queries
        for (int i = 1; i <= 50000000; i++) {
            try (PreparedStatement ps = conn.prepareStatement("SELECT name FROM test_data WHERE id = ?")) {
                ps.setInt(1, i % 10000);  // IDs loop from 0 to 9999
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    // Simulate CPU-heavy processing
                    String name = rs.getString(1);
                    for (int j = 0; j < 100; j++) {
                        name.hashCode(); // Waste CPU cycles
                        Math.sqrt(j * 123.456); // More CPU burn
                    }
                }
            }
        }

        System.out.println("Done.");
        conn.close();

    }
    
    private static void setupDatabase(Connection conn) throws SQLException {
        Statement stmt = conn.createStatement();
        stmt.execute("CREATE TABLE test_data (id INT PRIMARY KEY, name VARCHAR(255))");

        // Fill table with 10,000 rows
        conn.setAutoCommit(false);
        try (PreparedStatement ps = conn.prepareStatement("INSERT INTO test_data (id, name) VALUES (?, ?)")) {
            for (int i = 0; i < 50000000; i++) {
                ps.setInt(1, i);
                ps.setString(2, "Name_" + i);
                ps.addBatch();
            }
            ps.executeBatch();
        }
        conn.commit();
        conn.setAutoCommit(true);
    }
}
