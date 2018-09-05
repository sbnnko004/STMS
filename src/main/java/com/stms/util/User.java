package com.stms.util;

public class User {
	private String firstName;
	private String lastName;
	private String emailAddress;
	private String passWord;
	private String userName;
	
	public User(String userName,String firstName,String lastName, String emailAddress) {
		this.firstName=firstName;
		this.lastName=lastName;
		this.emailAddress=emailAddress;
		this.setUserName(userName);
	}
	public User(String userName,String firstName,String lastName, String emailAddress, String passWord) {
		this.setUserName(userName);
		this.firstName=firstName;
		this.lastName=lastName;
		this.emailAddress=emailAddress;
		this.passWord=passWord;
	}
	/**
	 * @return the emailAddress
	 */
	public String getEmailAddress() {
		return emailAddress;
	}
	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}
	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}
	/**
	 * @return the passWord
	 */
	public String getPassWord() {
		return passWord;
	}
	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param emailAddress the emailAddress to set
	 */
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	/**
	 * @param passWord the passWord to set
	 */
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}
