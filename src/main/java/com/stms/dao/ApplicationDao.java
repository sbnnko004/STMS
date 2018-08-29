package com.stms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

//import com.stma.beans.Order;
import com.stms.util.Event;
import com.stms.util.User;

public class ApplicationDao {

	// TODO find events
	public List<Event> getEvents(String username) {
		Event event = null;
		List<Event> events = new ArrayList<>();
		try {
			int userID=0;
			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();
			String IDsql = "SELECT userID FROM users where username = '"+username+"'";
			Statement mystatement = connection.prepareStatement(IDsql);
			ResultSet myset = mystatement.executeQuery(IDsql);
			while(myset.next()) {
				userID = myset.getInt("userID");
			}
			String sql = "SELECT * FROM "+DBConnection.table_events+" WHERE userID='"+ userID +"'";

			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);
			while (set.next()) {
				event = new Event(set.getInt("eventID"),set.getString("EventDescription"),set.getString("EventName"),set.getString("StartDate"),set.getString("EndDate"),set.getString("StartTime"),set.getString("EndTime"));
				events.add(event);
			}

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return events;
	}

	public int addEvent(Event event, String username) {
		int rowsAffected = 0;
		if(event instanceof Event) {
			

			try {
				int userID=0;
				// get the connection for the database
				Connection connection = DBConnection.getConnectionToDatabase();
				String sql = "SELECT userID FROM users where username = '"+username+"'";
				Statement mystatement = connection.prepareStatement(sql);
				ResultSet set = mystatement.executeQuery(sql);
				while(set.next()) {
					userID = set.getInt("userID");
				}
				// write the insert query
				String insertQuery = "INSERT INTO `events` (`eventID`, `userID`, `EventDescription`, `EventName`, `StartDate`, `EndDate`, `StartTime`, `EndTime`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?);";

				// set parameters with PreparedStatement
				java.sql.PreparedStatement statement = connection.prepareStatement(insertQuery);
				statement.setInt(1, userID);
				statement.setString(2, event.getEventDescription());
				statement.setString(3, event.getEventName());
				statement.setString(4, event.getStartDate());
				statement.setString(5, event.getEndDate());
				statement.setString(6, event.getStartTime());
				statement.setString(7, event.getEndTime());

				// execute the statement
				rowsAffected = statement.executeUpdate();

			} catch (SQLException exception) {
				exception.printStackTrace();
			}
		}
		return rowsAffected;
	}
	public int registerUser(User user) {
		int rowsAffected = 0;

		try {
			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();

			// write the insert query
			String insertQuery = "INSERT INTO `users` (`userID`, `username`, `firstname`, `lastname`, `emailaddress`, `password`) VALUES (NULL, ?, ?, ?, ?, aes_encrypt(?,?));";

			// set parameters with PreparedStatement
			java.sql.PreparedStatement statement = connection.prepareStatement(insertQuery);
			statement.setString(1, user.getUserName());
			statement.setString(2, user.getFirstName());
			statement.setString(3, user.getLastName());
			statement.setString(4, user.getEmailAddress());
			statement.setString(5, user.getPassWord());
			statement.setString(6, "aikebiev");
			

			// execute the statement
			rowsAffected = statement.executeUpdate();

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return rowsAffected;
	}

	public boolean checkIfUserExists(String username, String email) {
		boolean exists=false;
		
		try {

			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();

			// write the select query
			
			String sql = "select * from users where username=?";

			// set parameters with PreparedStatement
			java.sql.PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, username);

			// execute the statement and check whether user exists

			ResultSet set = statement.executeQuery();
			if (set.next()) {
				exists= true;
			}
			if(!exists) {
				sql = "select * from users where emailaddress=?";
				statement = connection.prepareStatement(sql);
				statement.setString(1, email);
				set = statement.executeQuery();
				if (set.next()) {
					exists= true;
				}
			}
		} catch (SQLException exception) {
			exception.printStackTrace();
		}

		
		return exists;
	}
	public boolean validateUser(String username, String password) {
		boolean isValidUser = false;
		try {

			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();

			// write the select query
			
			String sql = "select * from users where username=? and password=aes_encrypt(?,?)";

			// set parameters with PreparedStatement
			java.sql.PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, username);
			statement.setString(2, password);
			statement.setString(3, "aikebiev");

			// execute the statement and check whether user exists

			ResultSet set = statement.executeQuery();
			if(set.next()) {
				isValidUser = true;
			}
		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return isValidUser;
	}

	public User getProfileDetails(String username) {
		User user = null;
		try {
			// get connection to database
			Connection connection = DBConnection.getConnectionToDatabase();

			// write select query to get profile details
			String sql = "select * from users where username=?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, username);

			// execute query, get resultset and return User info
			ResultSet set = statement.executeQuery();
			if(set!=null) 
				if(set.next())
					user = new User(set.getString("username"),set.getString("firstname"),set.getString("surname"),set.getString("emailaddress"));
			

		}

		catch (SQLException exception) {
			exception.printStackTrace();
		}
		return user;
	}
}
