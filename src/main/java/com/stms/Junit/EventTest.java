/**
 * 
 */
package com.stms.Junit;

import org.junit.Before;
import org.junit.Test;

import com.stms.util.Event;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
/**
 * @author Gareth
 *
 */
public class EventTest {
	Event event1;
	Event event2;
	Event event3;
	

	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		event1 = new Event("event 1", "Event1 description", "2018-09-09","2018-09-11","19:00","20:00");
		event2 = new Event("event 2", "Event2 description", "2018-09-10","2018-09-14","21:00","22:00");
		event3 = new Event(123,"event 3", "Event3 description", "2018-09-11","2018-09-15","21:30","22:30");
	}

	@Test
	public void EventDescriptionTest() {
		Assert.assertEquals("Event1 description", event1.getEventDescription());
		Assert.assertEquals("Event2 description", event2.getEventDescription());
		Assert.assertEquals("Event3 description", event3.getEventDescription());
		
	}
	
	@Test
	public void EventIDTest() {
		Assert.assertEquals(123, event3.getEventID());

	}
	
	@Test
	public void EventNameTest() {
		Assert.assertEquals("event 1", event1.getEventName());
		Assert.assertEquals("event 2", event2.getEventName());
		Assert.assertEquals("event 3", event3.getEventName());
		
	}
	
	@Test
	public void StartDateTest() {
		Assert.assertEquals("2018-09-09", event1.getStartDate());
		Assert.assertEquals("2018-09-10", event2.getStartDate());
		Assert.assertEquals("2018-09-11", event3.getStartDate());
		
	}
	
	@Test
	public void EndDateTest() {
		Assert.assertEquals("2018-09-11", event1.getEndDate());
		Assert.assertEquals("2018-09-14", event2.getEndDate());
		Assert.assertEquals("2018-09-15", event3.getEndDate());
	}
	
	@Test
	public void StartTimeTest() {
		Assert.assertEquals("19:00", event1.getStartTime());
		Assert.assertEquals("21:00", event2.getStartTime());
		Assert.assertEquals("21:30", event3.getStartTime());
	}
	
	@Test
	public void EndTimeTest() {
		Assert.assertEquals("20:00", event1.getEndTime());
		Assert.assertEquals("22:00", event2.getEndTime());
		Assert.assertEquals("22:30", event3.getEndTime());
	}
	
	@Test
	public void toStringTest() {
		Assert.assertEquals("event 1",event1.toString());
		Assert.assertEquals("event 2",event2.toString());
		Assert.assertEquals("event 3",event3.toString());
		
	}

}
