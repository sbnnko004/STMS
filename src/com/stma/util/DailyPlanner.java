package com.stma.util;

import java.util.ArrayList;

/**
*	Class that contains the events happening on a day.
*	
*	@author Gareth Edwards
*/

public class DailyPlanner{
		private Event event;
		private ArrayList<Event> events;
		
		public DailyPlanner(){
			events = new ArrayList<Event>();
		}

		public void addEvent(Event e){
			events.add(e);
		}
		
		public void removeEvent(Event e){
			events.remove(e);
		}
		
		public String toString(){
			return events.toString();
		}
}



