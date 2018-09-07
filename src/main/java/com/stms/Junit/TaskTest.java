/**
 * 
 */
package com.stms.Junit;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.stms.util.Project;
import com.stms.util.Task;

/**
 * @author Gareth
 *
 */
public class TaskTest {
	
	Task task1;
	Task task2;
	Task task3;
	

	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		task1 = new Task("task 1",30);
		task2 = new Task("task 2",50);
		task3 = new Task("",0);
	}

	@Test
	public void TaskNameTest() {
		task3.setTaskName("task 3");
		
		Assert.assertEquals("task 3", task3.getTaskName());
		Assert.assertEquals("task 2", task2.getTaskName());
		Assert.assertEquals("task 1", task1.getTaskName());
		
	}
	
	@Test
	public void TaskDurationTest() {
		task3.setTaskDuration(20);
		
		Assert.assertEquals(20, task3.getTaskDuration());
		Assert.assertEquals(30, task1.getTaskDuration());
		Assert.assertEquals(50, task2.getTaskDuration());
		
	}
	
	@Test
	public void toStringTest() {
		Assert.assertEquals("task 1 30", task1.toString());
		Assert.assertEquals("task 2 50", task2.toString());
		
	}

}
