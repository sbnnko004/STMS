/**
 * 
 */
package com.stms.Junit;

import static org.junit.Assert.*;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.stms.util.Student;


/**
 * @author Gareth
 *
 */
public class StudentTest {
	Student student1;
	Student student2;


	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		student1 = new Student("username","Firstname","Lastname","student@gmail.com","STD003");
		student2 = new Student("","","","","");
		
	}

	@Test
	public void StudentNoTest() {
		student2.setStudentNo("EEE009");
		
		Assert.assertEquals("EEE009", student2.getStudentNo());
		Assert.assertEquals(student1.getStudentNo(), "STD003");
		
	}

}
