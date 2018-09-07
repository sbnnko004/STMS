/**
 * 
 */
package com.stms.Junit;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.stms.util.Project;

/**
 * @author Gareth
 *
 */
public class ProjectTest {
	private Project project1;
	private Project project2;
	private Project project3;

	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		project1 = new Project("Proj1 description", "project 1", "2018-09-09","2018-09-10","19:00","20:00","PRO1CODE",200);
		project2 = new Project(123,"Proj2 description", "project 2", "2018-09-10","2018-09-11","19:30","20:30","PRO2CODE",300,150);
		project3 = new Project("", "", "","","","","",200);
	}

	@Test
	public void CourseCodetest() {
		project3.setCourseCode("EDO009");
		
		Assert.assertEquals("EDO009", project3.getCourseCode());
		Assert.assertEquals("PRO1CODE", project1.getCourseCode());
		Assert.assertEquals("PRO2CODE", project2.getCourseCode());
	
	}
	
	@Test
	public void TimeNeededTest() {
		Assert.assertEquals(200, project1.getTimeNeededInMinutes());
		Assert.assertEquals(300, project2.getTimeNeededInMinutes());
	}
	
	@Test
	public void TimeRemainingTest() {
		Assert.assertEquals(150, project2.getTimeRemaining());
	}

}
