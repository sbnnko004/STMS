package com.stms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.stms.util.Assignment;
//import com.stma.beans.Order;
import com.stms.util.Event;
import com.stms.util.Project;
import com.stms.util.Test;
import com.stms.util.User;

public class ApplicationDao {

	// TODO find events
	public List<Event> getEvents(String username) {
		List<Event> events = new ArrayList<>();
		try {
			int userID=0;
			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();
			{
				String IDsql = "SELECT userID FROM users where username = '"+username+"'";
				Statement mystatement = connection.prepareStatement(IDsql);
				ResultSet myset = mystatement.executeQuery(IDsql);
				if(myset.next()) {
					userID = myset.getInt("userID");
				}
			}
			String sql = "SELECT * FROM "+DBConnection.table_events+" WHERE userID='"+ userID +"'";

			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);
			
			while (set.next()) {
				Event event = null;
				int eventID= set.getInt("eventID");
				String EventDescription = set.getString("EventDescription");
				String EventName = set.getString("EventName");
				String StartDate = set.getString("StartDate");
				String EndDate = set.getString("EndDate");
				String StartTime = set.getString("StartTime");
				String EndTime = set.getString("EndTime");
				
				{
					sql = "SELECT COUNT(*) AS num FROM assignments WHERE eventID='"+eventID+"'";
					Statement mystatement = connection.prepareStatement(sql);
					ResultSet myset = mystatement.executeQuery(sql);
					if(myset.next()) {
						if(myset.getInt("num")==1) {
							sql = "SELECT * FROM assignments WHERE eventID='"+eventID+"'";
							mystatement = connection.prepareStatement(sql);
							myset = mystatement.executeQuery(sql);
							if(myset.next()) {
								event = new Assignment(eventID,EventName,EventDescription,StartDate,EndDate,StartTime,EndTime, myset.getString("courseCode"));
								System.out.println("assignment");
							}
						}
					}
				}
				if(event==null) {
					sql = "SELECT COUNT(*) AS num FROM "+DBConnection.table_projects+" WHERE eventID='"+eventID+"'";
					Statement mystatement = connection.prepareStatement(sql);
					ResultSet myset = mystatement.executeQuery(sql);
					if(myset.next()) {
						if(myset.getInt("num")==1) {
							sql = "SELECT * FROM "+DBConnection.table_projects+" WHERE eventID="+eventID;
							mystatement = connection.prepareStatement(sql);
							myset = mystatement.executeQuery(sql);
							if(myset.next()) {
								int timeneeded =myset.getInt("minutesNeeded"); int timeremaining=myset.getInt("minutesRemaining");
								sql = "SELECT courseCode FROM "+DBConnection.table_courses+" WHERE courseID='"+myset.getInt("courseID")+"'";
								String courseCode ="";
								mystatement = connection.prepareStatement(sql);
								myset = mystatement.executeQuery(sql);
								if(myset.next()) {
									courseCode=myset.getString("courseCode");
								}
								event = new Project(eventID,EventName,EventDescription,StartDate,EndDate,StartTime,EndTime, courseCode, timeneeded, timeremaining);
								System.out.println("project");
							}
						}
					}
				}
				if(event==null) {
					sql = "SELECT COUNT(*) AS num FROM "+DBConnection.table_tests+" WHERE eventID='"+eventID+"'";
					Statement mystatement = connection.prepareStatement(sql);
					ResultSet myset = mystatement.executeQuery(sql);
					if(myset.next()) {
						if(myset.getInt("num")==1) {
							sql = "SELECT * FROM "+DBConnection.table_tests+" WHERE eventID="+eventID;
							mystatement = connection.prepareStatement(sql);
							myset = mystatement.executeQuery(sql);
							if(myset.next()) {
								int timeneeded =myset.getInt("minutesNeeded"); int timeremaining=myset.getInt("minutesRemaining");
								sql = "SELECT courseCode FROM "+DBConnection.table_courses+" WHERE courseID='"+myset.getInt("courseID")+"'";
								String courseCode ="";
								mystatement = connection.prepareStatement(sql);
								myset = mystatement.executeQuery(sql);
								if(myset.next()) {
									courseCode=myset.getString("courseCode");
								}
								event = new Test(eventID,EventName,EventDescription,StartDate,EndDate,StartTime,EndTime, courseCode, timeneeded, timeremaining);
								System.out.println("tests");
							}
						}
					}

				}
				if(event==null) {
					event = new Event(eventID,EventName,EventDescription,StartDate,EndDate,StartTime,EndTime);
					System.out.println("event");
				}
				events.add(event);
			}
		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return events;
	}

	public int addEvent(Event event, String username) {
		int rowsAffected = 0;
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
			{
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
				
			}
			
			sql = "SELECT max(eventID) as justAdded FROM events  where userID='"+userID+"'";
			mystatement = connection.prepareStatement(sql);
			set = mystatement.executeQuery(sql);
			int justAdded = 0;
			while(set.next()) {
				justAdded = set.getInt("justAdded");
			}
			int courseID = -1;
				
			if(event instanceof Assignment) {
				Assignment assignment = (Assignment) event;
				
				sql = "SELECT courseID FROM "+DBConnection.table_courses+"  where courseCode='"+assignment.getCourseCode()+"'";
				mystatement = connection.prepareStatement(sql);
				set = mystatement.executeQuery(sql);
				while(set.next()) {
					courseID = set.getInt("courseID");
				}
				if(courseID==-1) {
					insertQuery = "INSERT INTO `"+DBConnection.table_courses+"` (`courseID`,  `courseCode`) VALUES (NULL, ?);";

					// set parameters with PreparedStatement
					java.sql.PreparedStatement statement = connection.prepareStatement(insertQuery);
					statement.setString(1, assignment.getCourseCode());
					rowsAffected += statement.executeUpdate();
					
					sql = "SELECT courseID FROM "+DBConnection.table_courses+"  where courseCode='"+assignment.getCourseCode()+"'";
					mystatement = connection.prepareStatement(sql);
					set = mystatement.executeQuery(sql);
					while(set.next()) {
						courseID = set.getInt("courseID");
					}
				}
				insertQuery = "INSERT INTO `"+DBConnection.table_assignments+"` (`eventID`,  `courseID`) VALUES (?, ?);";

				// set parameters with PreparedStatement
				java.sql.PreparedStatement statement = connection.prepareStatement(insertQuery);
				statement.setInt(1, justAdded);
				statement.setInt(2, courseID);
				rowsAffected += statement.executeUpdate();
			}
			else if(event instanceof Project) {
				Project project = (Project) event;
				
				sql = "SELECT courseID FROM "+DBConnection.table_courses+"  where courseCode='"+project.getCourseCode()+"'";
				mystatement = connection.prepareStatement(sql);
				set = mystatement.executeQuery(sql);
				while(set.next()) {
					courseID = set.getInt("courseID");
				}
				if(courseID==-1) {
					insertQuery = "INSERT INTO `"+DBConnection.table_courses+"` (`courseID`,  `courseCode`) VALUES (NULL, ?);";

					// set parameters with PreparedStatement
					java.sql.PreparedStatement statement = connection.prepareStatement(insertQuery);
					statement.setString(1, project.getCourseCode());
					rowsAffected += statement.executeUpdate();
					
					sql = "SELECT courseID FROM "+DBConnection.table_courses+"  where courseCode='"+project.getCourseCode()+"'";
					mystatement = connection.prepareStatement(sql);
					set = mystatement.executeQuery(sql);
					while(set.next()) {
						courseID = set.getInt("courseID");
					}
				}
				insertQuery = "INSERT INTO `"+DBConnection.table_projects+"` (`eventID`,  `courseID`, `minutesNeeded`, `minutesRemaining`) VALUES (?, ?, ?, ?);";

				// set parameters with PreparedStatement
				java.sql.PreparedStatement statement = connection.prepareStatement(insertQuery);
				statement.setInt(1, justAdded);
				statement.setInt(2, courseID);
				statement.setInt(3, project.getTimeNeededInMinutes());
				statement.setInt(4, project.getTimeRemaining());
				rowsAffected += statement.executeUpdate();

			}
			else if(event instanceof Test) {
				Test test = (Test) event;
				
				sql = "SELECT courseID FROM "+DBConnection.table_courses+"  where courseCode='"+test.getCourseCode()+"'";
				mystatement = connection.prepareStatement(sql);
				set = mystatement.executeQuery(sql);
				while(set.next()) {
					courseID = set.getInt("courseID");
				}
				if(courseID==-1) {
					insertQuery = "INSERT INTO `"+DBConnection.table_courses+"` (`courseID`,  `courseCode`) VALUES (NULL, ?);";

					// set parameters with PreparedStatement
					java.sql.PreparedStatement statement = connection.prepareStatement(insertQuery);
					statement.setString(1, test.getCourseCode());
					rowsAffected += statement.executeUpdate();
					
					sql = "SELECT courseID FROM "+DBConnection.table_courses+"  where courseCode='"+test.getCourseCode()+"'";
					mystatement = connection.prepareStatement(sql);
					set = mystatement.executeQuery(sql);
					while(set.next()) {
						courseID = set.getInt("courseID");
					}
				}
				insertQuery = "INSERT INTO `"+DBConnection.table_tests+"` (`eventID`,  `courseID`, `minutesNeeded`, `minutesRemaining`) VALUES (?, ?, ?, ?);";

				// set parameters with PreparedStatement
				java.sql.PreparedStatement statement = connection.prepareStatement(insertQuery);
				statement.setInt(1, justAdded);
				statement.setInt(2, courseID);
				statement.setInt(3, test.getTimeNeededInMinutes());
				statement.setInt(4, test.getTimeRemaining());
				rowsAffected += statement.executeUpdate();

			}
			//System.out.println(userID);
		} catch (SQLException exception) {
			exception.printStackTrace();
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
	public boolean validateUser(String usernameOrEmail, String password) {
		boolean isValidUser = false;
		try {

			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();

			// write the select query
			
			String sql = "SELECT * FROM users WHERE (username=? OR emailaddress=?) AND password=aes_encrypt(?,?)";

			// set parameters with PreparedStatement
			java.sql.PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, usernameOrEmail);
			statement.setString(2, usernameOrEmail);
			statement.setString(3, password);
			statement.setString(4, "aikebiev");

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