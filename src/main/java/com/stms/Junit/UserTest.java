/**
 * 
 */
package com.stms.Junit;

import static org.junit.Assert.*;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.stms.util.User;


/**
 * Test class for the User class
 * @author Gareth
 *
 */
public class UserTest {
	
	private User user1;
	private User user2;
	private User user3;
	private User user4;

	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		user1 = new User("Username","Firstname","Lastname","email.address@gmail.com","password123");
		user2 = new User("","","","","");
		
		// different constructor
		user3 = new User("","","","");
		user4 = new User("Username4","Firstname4","Lastname4","FourthEmail.address@gmail.com");
	}
	
	@Test
	public void UsernameTest() {
		user2.setUserName("gareth");
		user3.setUserName("greggy");
		
		Assert.assertEquals("gareth", user2.getUserName());
		Assert.assertEquals("greggy", user3.getUserName());
		Assert.assertEquals("Username", user1.getUserName());
		Assert.assertEquals("Username4", user4.getUserName());
	}

	@Test
	public void FirstNameTest() {
		String name = "Rob";
		user2.setFirstName(name);
		
		String name2 = "greg";
		user3.setFirstName(name2);
		
		Assert.assertEquals(name,user2.getFirstName());
		Assert.assertEquals("Firstname", user1.getFirstName());
		Assert.assertEquals("Firstname4", user4.getFirstName());
		Assert.assertEquals(name2, user3.getFirstName());
		
	}
	
	@Test
	public void LastNameTest() {
		String Lastname = "Rob";
		user2.setLastName(Lastname);
		
		String Lastname2 = "greg";
		user3.setLastName(Lastname2);
		
		Assert.assertEquals(Lastname,user2.getLastName());
		Assert.assertEquals("Lastname", user1.getLastName());
		Assert.assertEquals("Lastname4", user4.getLastName());
		Assert.assertEquals(Lastname2, user3.getLastName());
		
	}
	
	@Test
	public void EmailAddressTest() {
		String emailAddress = "Rob@gmail.com";
		user2.setEmailAddress(emailAddress);
		
		String emailAddress2 = "greg@gmail.com";
		user3.setEmailAddress(emailAddress2);
		
		Assert.assertEquals(emailAddress,user2.getEmailAddress());
		Assert.assertEquals("email.address@gmail.com", user1.getEmailAddress());
		Assert.assertEquals("FourthEmail.address@gmail.com", user4.getEmailAddress());
		Assert.assertEquals(emailAddress2, user3.getEmailAddress());
	}
	
	@Test
	public void PasswordTest() {
		String password = "password444";
		user2.setPassWord(password);
		
		String password2 = "password555";
		user3.setPassWord(password2);
		
		Assert.assertEquals(password,user2.getPassWord());
		Assert.assertEquals("password123", user1.getPassWord());
		Assert.assertEquals(password2, user3.getPassWord());
	}
	
	

}
