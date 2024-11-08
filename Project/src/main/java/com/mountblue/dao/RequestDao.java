package com.mountblue.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.mountblue.model.Request;

public class RequestDao 
{
	private static String db_url = "jdbc:postgresql://localhost:5432/ContactUs_Forn_Details";
	private static String db_username = "postgres";
	private static String db_password = "postgres";
	
	private static final String INSERT_QUERY = "INSERT INTO form_details (name, email, message) VALUES (?, ?, ?)";
	private static final String REQUEST_QUERY = "SELECT * FROM form_details";
	private static final String UPDATE_ARCHIVE_QUERY = "UPDATE form_details SET status = false WHERE id=?";
	private static final String UPDATE_ACTIVE_QUERY = "UPDATE form_details SET status = true WHERE id=?";
	
	public static boolean insertContactData(String name,String email,String message)
	{
		try {
			Class.forName("org.postgresql.Driver");
			try(Connection con= DriverManager.getConnection(db_url, db_username, db_password);
				PreparedStatement preparedStatement= con.prepareStatement(INSERT_QUERY)) {
				
				preparedStatement.setString(1, name);
				preparedStatement.setString(2, email);
				preparedStatement.setString(3, message);
	
				preparedStatement.executeUpdate();
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public static void updateStatus(int id, boolean isActive) {
		String query = isActive ? UPDATE_ACTIVE_QUERY : UPDATE_ARCHIVE_QUERY;
		try (Connection con = DriverManager.getConnection(db_url, db_username, db_password);
			PreparedStatement st = con.prepareStatement(query)) {
			st.setInt(1, id);
			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static ArrayList<Request> getRequestsData() {
		ArrayList<Request> requests = new ArrayList<>();
		try (Connection con = DriverManager.getConnection(db_url, db_username, db_password);
			Statement statement = con.createStatement()) {
			ResultSet rs = statement.executeQuery(REQUEST_QUERY);
			
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String message = rs.getString("message");
				boolean status = rs.getBoolean("status");
				Timestamp submittedAt = rs.getTimestamp("submitted_at");
				
				Request req = new Request();
				req.setId(id);
				req.setName(name);
				req.setEmail(email);
				req.setMessage(message);
				req.setStatus(status);
				req.setSubmittedAt(submittedAt);
				requests.add(req);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return requests;
	}


}
