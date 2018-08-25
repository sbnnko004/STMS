package com.stma.util;

import java.util.ArrayList;

/**
*	Weekly planner class that contains the events for each day of the week.
*	
*	@author Gareth Edwards
*/

public class WeeklyPlanner{
		private ArrayList<DailyPlanner> dailyEvents;

		public WeeklyPlanner(){
			dailyEvents = new ArrayList<DailyPlanner>();
		}
		
		public void addDay(DailyPlanner dp){
			dailyEvents.add(dp);
		}
		
		public void removeDay(DailyPlanner dp){
			dailyEvents.remove(dp);
		}
		
		public String toString(){
			return dailyEvents.toString();
		}
}
