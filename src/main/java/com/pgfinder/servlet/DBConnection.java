package com.pgfinder.servlet;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null || con.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");

                // ✅ CHANGE THESE VALUES AS PER YOUR MySQL SETUP
                String url = "jdbc:mysql://localhost:3306/pgfinder?useSSL=false&allowPublicKeyRetrieval=true";
                String user = "root";
                String pass = "root"; // If you have a password, put it here

                con = DriverManager.getConnection(url, user, pass);
                System.out.println(" Database Connected Successfully!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" Database Connection Failed!");
        }
        return con;
    }
}
