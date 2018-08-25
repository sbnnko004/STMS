package com.stma.util;

import java.util.ArrayList;

/**
*	Monthly planner class that contains the events for each week of the month.
*	
*	@author Gareth Edwards
*/

public class MonthlyPlanner{
		private ArrayList<WeeklyPlanner> weeklyEvents;

		
		public MonthlyPlanner(){
			weeklyEvents = new ArrayList<WeeklyPlanner>(); 
		}
		public void addWeek(WeeklyPlanner wp){
			weeklyEvents.add(wp);
		}
		
		public void removeWeek(WeeklyPlanner wp){
			weeklyEvents.remove(wp);
		}
		
		public String toString(){
			return weeklyEvents.toString();
		}
}