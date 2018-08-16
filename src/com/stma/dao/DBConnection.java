package com.stma.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Arrays;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnection {

	protected static final String dbName = "sbnnko004";
	protected static final String hostURL = "nightmare.cs.uct.ac.za:3306/";
	protected static final String table_users = "users";
	//protected static final String table_student = "student";
	//protected static final String table_admin = "admin";
	protected static final String table_events = "events";
	protected static final String table_tests = "tests";
	protected static final String table_projects = "projects";
	//protected static final String table_toDoList = "toDoList";
	
	public static Connection getConnectionToDatabase() {
		Connection connection = null;

		try {

			// load the driver class
			Class.forName("com.mysql.jdbc.Driver");
			//System.out.println("MySQL JDBC Driver Registered!");

			// get hold of the DriverManager
			connection = DriverManager.getConnection("jdbc:mysql://nightmare.cs.uct.ac.za:3306/sbnnko004?useSSL=true", "sbnnko004", "aikebiev");
			System.out.println("Connection to sql successful");
		} catch (ClassNotFoundException e) {
			//System.out.println("Where is your MySQL JDBC Driver?");
			e.printStackTrace();

		}

		catch (SQLException e) {
			//System.out.println("Error here");
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();

		}

		if (connection != null) {
			System.out.println("Connection made to DB! v");
			// create tables if they don't already exist
			System.out.println("creating tables if they don't exits!");
			try {
				// "  `phonenumber` varchar(50)," +
				//
				// TODO create all table if they don't exist
				String createQuery = "CREATE TABLE IF NOT EXISTS `users` (" + 
						" 0 `userID` int(7) NOT NULL AUTO_INCREMENT," + 
						"  `username` varchar(50) NOT NULL," + 
						"  `firstname` varchar(50) NOT NULL," + 
						"  `lastname` varchar(50) NOT NULL," +  
						"  `emailaddress` varchar(50) NOT NULL," + 
						"  `password` varchar(50) DEFAULT NULL," + 
						"  PRIMARY KEY (`userID`)," + 
						"  UNIQUE (`emailaddress`)"+
						") ENGINE=InnoDB DEFAULT CHARSET=latin1;";
				PreparedStatement statement = connection.prepareStatement(createQuery);
				statement.executeUpdate();


				//Creates the Test table, if it doesn't exists.
				String createTestQuery = "CREATE TABLE IF NOT EXISTS `Tests` (" + 
						" 0 `userID` int(7) NOT NULL AUTO_INCREMENT," + 
						"  `CourseCode` varchar(8) NOT NULL," + 
						"  `StartDate` Date NOT NULL," + 
						"  `EndDate` Date NOT NULL," +  
						"  `StateTime` Time NOT NULL," + 
						"  `EndTime` Time NOT NULL," + 
						"  PRIMARY KEY (`userID`)," + 
						"  UNIQUE (`emailaddress`)"+
						") ENGINE=InnoDB DEFAULT CHARSET=latin1;";
				
				PreparedStatement statementTest = connection.prepareStatement(createTestQuery);
				statementTest.executeUpdate();
				
				//Creates the Test table, if it doesn't exists.
				String createProjectQuery = "CREATE TABLE IF NOT EXISTS `Projects` (" + 
						" 0 `userID` int(7) NOT NULL AUTO_INCREMENT," + 
						"  `CourseCode` varchar(8) NOT NULL," + 
						"  `StartDate` Date NOT NULL," + 
						"  `EndDate` Date NOT NULL," +  
						"  `StateTime` Time NOT NULL," + 
						"  `EndTime` Time NOT NULL," + 
						"  PRIMARY KEY (`userID`)," + 
						") ENGINE=InnoDB DEFAULT CHARSET=latin1;";
				
				PreparedStatement statementProject = connection.prepareStatement(createProjectQuery);
				statementProject.executeUpdate();
				
				//Creates the Events table, if it doesn't exists.
				String createEventQuery = "CREATE TABLE IF NOT EXISTS `Events` (" + 
						" 0 `userID` int(7) NOT NULL AUTO_INCREMENT," + 
						"  `EventDescription` varchar(50) NOT NULL," + 
						"  `StartDate` Date NOT NULL," + 
						"  `EndDate` Date NOT NULL," +  
						"  `StateTime` Time NOT NULL," + 
						"  `EndTime` Time NOT NULL," + 
						"  PRIMARY KEY (`userID`)," + 
						") ENGINE=InnoDB DEFAULT CHARSET=latin1;";
				
				PreparedStatement statementEvent = connection.prepareStatement(createEventQuery);
				statementEvent.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return connection;
	}

}
