package com.stms.Junit;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.stms.util.Assignment;

/**
 * Test class for the Assignment class
 */

/**
 * @author Gareth
 *
 */
public class AssignmentTest {
	private Assignment assignment1;
	private Assignment assignment2;
	private Assignment assignment3;
	

	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		assignment1 = new Assignment("Description", "Assign1 Name", "2018-09-05","2018-09-7","19:00","20:00","");
		assignment2 = new Assignment("Description2", "Assign2 Name", "2018-09-06","2018-09-8","22:00","23:00","STA1000S");
	}

	@Test
	public void CourseCodetest() {
		String course = "CSC3003S";
		assignment1.setCourseCode(course);
		Assert.assertEquals(course, assignment1.getCourseCode());
		Assert.assertEquals("STA1000S", assignment2.getCourseCode());
	}

}
