package com.stms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnection {

	protected static final String dbName = "sbnnko004";
	protected static final String hostURL = "nightmare.cs.uct.ac.za:3306/";
	protected static final String table_users = "users";
	//protected static final String table_student = "student";
	protected static final String table_courses = "courses";
	protected static final String table_events = "events";
	protected static final String table_tests = "tests";
	protected static final String table_projects = "projects";
	protected static final String table_assignments = "assignments";
	protected static final String table_toDoList = "toDoList";
	protected static final String table_toDoListEntry = "toDoListEntry";
	
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
			try {
				// "  `phonenumber` varchar(50)," +
				//
				// TODO create all table if they don't exist
				System.out.println("Creates the Users table, if it doesn't exists");
				String createQuery = "CREATE TABLE IF NOT EXISTS `"+table_users+"` (" + 
						"  `userID` int(11) NOT NULL AUTO_INCREMENT," + 
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
				
				System.out.println("Creates the Events table, if it doesn't exists.");
				createQuery = "CREATE TABLE IF NOT EXISTS `"+table_events+"` (" + 
						"  `eventID` int(11) NOT NULL AUTO_INCREMENT," +
						"  `userID` int(11) NOT NULL," +
						"  `EventDescription` varchar(256) NOT NULL," + 
						"  `EventName` varchar(50) NOT NULL," + 
						"  `StartDate` Date NOT NULL," + 
						"  `EndDate` Date NOT NULL," +  
						"  `StartTime` Time NOT NULL," + 
						"  `EndTime` Time NOT NULL," +
						"  PRIMARY KEY (`eventID`)," +
						"  FOREIGN KEY (`userID`) REFERENCES `"+table_users+"`(`userID`)" +
						") ENGINE=InnoDB DEFAULT CHARSET=latin1;";
				
				statement = connection.prepareStatement(createQuery);
				statement.executeUpdate();
				
				System.out.println("Creates the Courses table, if it doesn't exists.");
				createQuery = "CREATE TABLE IF NOT EXISTS `"+table_courses+"` (" + 
						" `courseID` int(11) NOT NULL AUTO_INCREMENT,"+
						" `courseCode` varchar(8) NOT NULL,"+
						" PRIMARY KEY (`courseID`)"+
						") ENGINE=InnoDB DEFAULT CHARSET=latin1;"
						;
				
				statement = connection.prepareStatement(createQuery);
				statement.executeUpdate();
				
				System.out.println("Creates the Test table, if it doesn't exists");
				createQuery = "CREATE TABLE IF NOT EXISTS `"+table_tests+"` (" + 
						"  `eventID` int(11) NOT NULL," + 
						"  `courseID` int(11) NOT NULL," + 
						"  `minutesNeeded` int(4) NULL,"+
						"  `minutesRemaining` int(4) NULL,"+
						"  FOREIGN KEY (`eventID`) REFERENCES `"+table_events+"`(`eventID`)," +
						"  FOREIGN KEY (`courseID`) REFERENCES `"+table_courses+"`(`courseID`)"+
						") ENGINE=InnoDB DEFAULT CHARSET=latin1;";
				
				statement = connection.prepareStatement(createQuery);
				statement.executeUpdate();
				
				
				System.out.println("Creates the Projects table, if it doesn't exists.");
				createQuery = "CREATE TABLE IF NOT EXISTS `"+table_projects+"` (" + 
						"  `eventID` int(11) NOT NULL," + 
						"  `courseID` int(11) NOT NULL," + 
						"  `minutesNeeded` int(4) NULL,"+
						"  `minutesRemaining` int(4) NULL,"+
						"  FOREIGN KEY (`eventID`) REFERENCES `"+table_events+"`(`eventID`)," +
						"  FOREIGN KEY (`courseID`) REFERENCES `"+table_courses+"`(`courseID`)"+
						") ENGINE=InnoDB DEFAULT CHARSET=latin1;";
				
				statement = connection.prepareStatement(createQuery);
				statement.executeUpdate();
				
				System.out.println("Creates the Assignments table, if it doesn't exists.");
				createQuery = "CREATE TABLE IF NOT EXISTS `"+table_assignments+"` (" + 
						"  `eventID` int(11) NOT NULL," + 
						"  `courseID` int(11) NOT NULL," + 
						"  FOREIGN KEY (`eventID`) REFERENCES `"+table_events+"`(`eventID`)," +
						"  FOREIGN KEY (`courseID`) REFERENCES `"+table_courses+"`(`courseID`)"+
						") ENGINE=InnoDB DEFAULT CHARSET=latin1;";
				
				statement = connection.prepareStatement(createQuery);
				statement.executeUpdate();
				
				System.out.println("Creates the toDoListEntry table, if it doesn't exists.");
				createQuery = "CREATE TABLE IF NOT EXISTS `"+table_toDoListEntry+"` (" + 
						"  `entryID` int(11) NOT NULL AUTO_INCREMENT," +
						"  `userID` int(11) NOT NULL,"+
						"  `entryDate`  DATE NOT NULL," + // this will be curdate() on entry
						"  `date` Date NOT NULL,"+
						"  FOREIGN KEY (`userID`) REFERENCES `"+table_users+"`(`userID`)," +
						"  PRIMARY KEY (`entryID`)" +
						") ENGINE=InnoDB DEFAULT CHARSET=latin1;";
				statement = connection.prepareStatement(createQuery);
				statement.executeUpdate();
				
				System.out.println("Creates the toDoList table, if it doesn't exists.");
				createQuery = "CREATE TABLE IF NOT EXISTS `"+table_toDoList+"` (" + 
						"  `taskID` int(11) NOT NULL AUTO_INCREMENT," + 
						"  `eventID` int(11) NOT NULL," +
						"  `entryID` int(11) NOT NULL," +
						"  `taskName` varchar(50) NOT NULL," +
						"  `taskDuration` int(11) NOT NULL," +
						"  FOREIGN KEY (`eventID`) REFERENCES `"+table_events+"`(`eventID`)," +
						"  FOREIGN KEY (`entryID`) REFERENCES `"+table_toDoListEntry+"`(`entryID`),"+
						"  PRIMARY KEY (`taskID`)" +
						") ENGINE=InnoDB DEFAULT CHARSET=latin1;";
				
				statement = connection.prepareStatement(createQuery);
				statement.executeUpdate();
				
				

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return connection;
	}

}
