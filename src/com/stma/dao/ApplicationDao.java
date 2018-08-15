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

	public List<Event> searchProducts(String date, Connection connection) {
		Event event = null;
		List<Event> events = new ArrayList<>();
		try {

			String sql = "SELECT * FROM Events WHERE date =" + date ;

			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);

			while (set.next()) {
//				event = new Event();
			}

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return events;
	}

	public int registerUser(User user) {
		int rowsAffected = 0;

		try {
			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();

			// write the insert query
			String insertQuery = "insert into users values(?,?,?,?,?,?)";

			// set parameters with PreparedStatement
			java.sql.PreparedStatement statement = connection.prepareStatement(insertQuery);
			statement.setString(1, user.getFirstName());
			statement.setString(2, user.getLastName());
			statement.setInt(3, user.getUserID());
			statement.setString(4, user.getEmailAddress());
			statement.setString(5, user.getPassWord());

			// execute the statement
			rowsAffected = statement.executeUpdate();

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return rowsAffected;
	}

	public boolean validateUser(String username, String password) {
		boolean isValidUser = false;
		try {

			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();

			// write the select query
			String sql = "select * from users where username=? and password=?";

			// set parameters with PreparedStatement
			java.sql.PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, username);
			statement.setString(2, password);

			// execute the statement and check whether user exists

			ResultSet set = statement.executeQuery();
			while (set.next()) {
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
			while (set.next()) {
				user = new User(set.getString("username"),set.getString("first_name"),set.getString("activity"),set.getString("emailAddress"));
				//user.setUsername();
				//user.setFirstName(set.getString("first_name"));
				//user.setLastName(set.getString("last_name"));
				//user.setActivity(set.getString("activity"));
				//user.setAge(set.getInt("age"));

			}

		}

		catch (SQLException exception) {
			exception.printStackTrace();
		}
		return user;
	}

	/*public List<Order> getOrders(String username) {
		Order order = null;
		List<Order> orders = new ArrayList<>();
		try {
			// get connection to database
			Connection connection = DBConnection.getConnectionToDatabase();

			// write select query to get order details
			String sql = "select * from orders where user_name=?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, username);

			// execute query, get resultset and return Orders info

			ResultSet set = statement.executeQuery();
			while (set.next()) {

				order = new Order();
				order.setOrderId(set.getInt("order_id"));
				order.setProductName(set.getString("product_name"));
				order.setProductImgPath(set.getString("image_path"));
				order.setOrderDate(new Date(set.getDate("order_date").getTime()));
				order.setUsername(set.getString("user_name"));
				orders.add(order);

			}

		} catch (SQLException exception) {
			exception.printStackTrace();
		}

		return orders;
	}*/
}
