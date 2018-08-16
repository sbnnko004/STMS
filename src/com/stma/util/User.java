package com.stma.util;

public class User {
	private String firstName;
	private String lastName;
	private String emailAddress;
	private String passWord;
	private String userName;
	
	public User(String userName,String firstName,String lastName, String emailAddress, String passWord) {
		this.setUserName(userName);
		this.firstName=firstName;
		this.lastName=lastName;
		this.emailAddress=emailAddress;
		this.passWord=passWord;
	}
	public User(String userName,String firstName,String lastName, String emailAddress) {
		this.firstName=firstName;
		this.lastName=lastName;
		this.emailAddress=emailAddress;
		this.setUserName(userName);
	}
	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}
	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}
	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	/**
	 * @return the emailAddress
	 */
	public String getEmailAddress() {
		return emailAddress;
	}
	/**
	 * @param emailAddress the emailAddress to set
	 */
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	/**
	 * @return the passWord
	 */
	public String getPassWord() {
		return passWord;
	}
	/**
	 * @param passWord the passWord to set
	 */
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}
