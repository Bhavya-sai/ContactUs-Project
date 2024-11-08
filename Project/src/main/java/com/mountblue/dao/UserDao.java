package com.mountblue.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao 
{
	private static String db_url = "jdbc:postgresql://localhost:5432/ContactUs_Forn_Details";
	private static String db_username = "postgres";
	private static String db_password = "postgres";
	private static final String QUERY = "select * from admin_details where email=? and password=?";
	
	
	public static boolean validateAdmin(String email,String password) throws ClassNotFoundException
	{
		Class.forName("org.postgresql.Driver");
		try (Connection con = DriverManager.getConnection(db_url, db_username, db_password);
		         PreparedStatement stmt = con.prepareStatement(QUERY)) {

		        stmt.setString(1, email);
		        stmt.setString(2, password);
		        
		        try (ResultSet rs = stmt.executeQuery()) {
		            if (rs.next()) {
		                return true;
		            }
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return false;
	}
}
