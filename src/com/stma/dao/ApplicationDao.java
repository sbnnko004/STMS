package com.stma.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

//import com.stma.beans.Order;
import com.stma.util.Event;
import com.stma.util.User;

public class ApplicationDao {

	/**
	 * Method retrieves users scheduled events from database.
	 *
	 * @param username
	 * @return Array of events
	 */
	public List<Event> getEvents(String username) {
		Event event = null;
		List<Event> events = new ArrayList<>();
		try {

			//Get connection to database
			Connection connection = DBConnection.getConnectionToDatabase();

			//Select user events from database.
			String sql = "SELECT EventDescription, EventName, StartDate, EndDate, StartTime, EndTime FROM "+DBConnection.table_events + " WHERE userID = " +
					"(SELECT userID FROM users WHERE username = '"+username+"')";

			Statement statement = connection.createStatement();

			//execute sql statement
			ResultSet set = statement.executeQuery(sql);

			while (set.next()) {
				event = new Event(set.getString("EventDescription"),set.getString("EventName"),set.getString("StartDate"),set.getString("EndDate"),set.getString("EndTime"),set.getString("EndTime"));
				events.add(event);
			}

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return events;
	}

	/**
	 * Method adds users scheduled events to the database.
	 *
	 * @param event
	 * @param username
	 */
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
				String insertQuery = "INSERT INTO `events` (`eventID`, `userID`, `EventDescription`, `EventName`, `StartDate`, `EndDate`, `StartTime`, `EndTime`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?)";

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

	/**
	 * Method deletes a users scheduled event from the database.
	 *
	 * @param username
	 */
	public void deleteEvent(String username, int eventID) throws SQLException {

		// Establish connection to database
		Connection connection = DBConnection.getConnectionToDatabase();

		//Delete sql statement
		String deleteQuery = "DELETE FROM events WHERE (eventID = '"+eventID+"') AND " +
				"(SELECT userID FROM users WHERE username = '"+username+"')";
		PreparedStatement statement = connection.prepareStatement(deleteQuery);

		//Execute query
		statement.executeQuery();
	}

	/**
	 * Method updates users scheduled events in the database.
	 * @param username
	 * @param event
	 * @return rowsEffected
	 */
	public int updateEvent (String username, Event event) throws SQLException {

		int eventID = 0;
		int rowsEffected = 0;

		// Establish connection to database.
		Connection connection = DBConnection.getConnectionToDatabase();

		//Select a specific user
		String sql = "SELECT userID FROM users where username = '"+username+"'";
		Statement selectStatement = connection.prepareStatement(sql);
		ResultSet set = selectStatement.executeQuery(sql);

		while(set.next()) {
			eventID = set.getInt("eventID");
		}

		// write the insert query
		String updateQuery = "UPDATE events  SET (EventDescripton = ?, EventName = ?, StartDate = ?, EndDate = ?, StartTime = ?, EndTime = ?) WHERE eventID = '"+eventID+"'";

		//Prepare update statements to be updated
		PreparedStatement updateStatement = connection.prepareStatement(updateQuery);
		updateStatement.setString(2, event.getEventDescription());
		updateStatement.setString(3, event.getEventName());
		updateStatement.setString(4, event.getStartDate());
		updateStatement.setString(5, event.getEndDate());
		updateStatement.setString(6, event.getStartTime());
		updateStatement.setString(7, event.getEndTime());

		//exeute updates
		rowsEffected = updateStatement.executeUpdate();

		return rowsEffected;

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
