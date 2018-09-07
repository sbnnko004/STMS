package com.stms.Scheduler;
import java.time.LocalDate;
import java.util.ArrayList;

import com.stms.util.Assignment;
import com.stms.util.Event;
import com.stms.util.Project;
import com.stms.util.Task;
import com.stms.util.Test;

public class Scheduler {
	public static ArrayList<Event> getCurrentEvents(ArrayList<Event> events){
		ArrayList<Event> currentEvents = new ArrayList<>();
		for(Event event: events) {
			if(Priority.getTotalDaysBetween(event.getEndDate())==0) {
				
					currentEvents.add(event);
			}
			
		}
		return currentEvents;
	}
	
	public static ArrayList<Event> getUpcomingEvents(ArrayList<Event> events){
		ArrayList<Event> upcomingEvents = new ArrayList<>();
		for(Event event: events) {
			if(Priority.getTotalDaysBetween(event.getEndDate())==0) {
				
				if(Priority.getTotalTimeBetween(event.getEndTime())>0) {
					upcomingEvents.add(event);
				}
			}
			else if(Priority.getTotalDaysBetween(event.getEndDate())>0) {
				
				upcomingEvents.add(event);
				
			}
		}
		return upcomingEvents;
	}
	public static ArrayList<Event> getPastEvents(ArrayList<Event> events){
		ArrayList<Event> pastEvents = new ArrayList<>();
		for(Event event: events) {
			if(Priority.getTotalDaysBetween(event.getEndDate())==0) {
				
				if(Priority.getTotalTimeBetween(event.getEndTime())>0) {
					continue;
				}
				
			}
			else if(Priority.getTotalDaysBetween(event.getEndDate())>0) {
				
				//pastEvents.add(event);
				continue;
			}
			else {
				pastEvents.add(event);
			}
		}
		return pastEvents;
	}
	public static ArrayList<Task> getTasks(ArrayList<Event> events, ArrayList<Task> prevDay, int studyTime){
		ArrayList<Event> upcomingEvents = Scheduler.getUpcomingEvents(events);
		
		
		
		ArrayList<Task> tasks = new ArrayList<>();
		ArrayList<Event> critical = new ArrayList<>();
		ArrayList<Event> high = new ArrayList<>();
		ArrayList<Event> medium = new ArrayList<>();
		ArrayList<Event> low = new ArrayList<>();
		ArrayList<Event> general = new ArrayList<>();
		for(Event event : upcomingEvents) {
			if(!(event instanceof Test)&&!(event instanceof Project)&&!(event instanceof Assignment)) {
				general.add(event);
			}
			else if(Priority.getPriority(event)==Priority.EventStatus.CRITICAL) {
				critical.add(event);
			}
			else if(Priority.getPriority(event)==Priority.EventStatus.HIGH) {
				high.add(event);
			}
			else if(Priority.getPriority(event)==Priority.EventStatus.MEDIUM) {
				medium.add(event);
			}
			else if(Priority.getPriority(event)==Priority.EventStatus.LOW) {
				low.add(event);
			}
		}
		
		for(Event event: critical) {
			int daysRemaining = (int) Priority.getTotalDaysBetween(event.getEndDate());
			if(event instanceof Test) {
				int duration = 0;
				if(((Test)event).timeRemaining/daysRemaining<=60) { // finish task if it can be done within an hour
					duration = 60;
					if(((Test)event).timeRemaining<=60) {
						duration=((Test)event).timeRemaining;
					}
				}
				else {
					duration = ((Test)event).timeRemaining/daysRemaining; 
				}
				tasks.add(new Task(event.getEventID(), "Study for "+event.getEventName(), duration, LocalDate.now()));
			}
			else if(event instanceof Project) {
				int duration = 0;
				if(((Project)event).timeRemaining/daysRemaining<=60) { // finish task if it can be done within an hour
					duration = 60;
					if(((Test)event).timeRemaining<=60) {
						duration=((Project)event).timeRemaining;
					}
				}
				else {
					duration = ((Project)event).timeRemaining/daysRemaining; 
				}
				tasks.add(new Task(event.getEventID(), "Complete "+event.getEventName(), duration,LocalDate.now()));
			}
			else if(event instanceof Assignment) {
				tasks.add(new Task(event.getEventID(), "Complete "+event.getEventName(), 60,LocalDate.now()));
			}
		}
		for(Event event: high) {
			int daysRemaining = (int) Priority.getTotalDaysBetween(event.getEndDate());
			if(event instanceof Test) {
				int duration = 0;
				if((((double)((Test)event).timeRemaining*0.75)/daysRemaining)<=45) { // finish task if it can be done within an hour
					duration = 45;
					if(((Test)event).timeRemaining<=45) {
						duration=((Test)event).timeRemaining;
					}
				}
				else {
					duration = (int)(((double)((Test)event).timeRemaining*0.75)/daysRemaining); 
				}
				tasks.add(new Task(event.getEventID(), "Study for "+event.getEventName(), duration,LocalDate.now()));
			}
			else if(event instanceof Project) {
				int duration = 0;
				if((((double)((Project)event).timeRemaining*0.75)/daysRemaining)<=45) { // finish task if it can be done within an hour
					duration = 45;
					if(((Test)event).timeRemaining<=45) {
						duration=((Project)event).timeRemaining;
					}
				}
				else {
					duration = (int)(((double)((Project)event).timeRemaining*0.75)/daysRemaining); 
				}
				tasks.add(new Task(event.getEventID(), "Complete "+event.getEventName(), duration,LocalDate.now()));
			}
			else if(event instanceof Assignment) {
				tasks.add(new Task(event.getEventID(), "Complete "+event.getEventName(), 45,LocalDate.now()));
			}
		}
		for(Event event: medium) {
			int daysRemaining = (int) Priority.getTotalDaysBetween(event.getEndDate());
			if(event instanceof Test) {
				int duration = 0;
				if((((double)((Test)event).timeRemaining*0.66)/daysRemaining)<=45) { // finish task if it can be done within an hour
					duration = 45;
					if(((Test)event).timeRemaining<=45) {
						duration=((Test)event).timeRemaining;
					}
				}
				else {
					duration = (int)(((double)((Test)event).timeRemaining*0.66)/daysRemaining); 
				}
				tasks.add(new Task(event.getEventID(), "Study for "+event.getEventName(), duration,LocalDate.now()));
			}
			else if(event instanceof Project) {
				int duration = 0;
				if((((double)((Project)event).timeRemaining*0.66)/daysRemaining)<=45) { // finish task if it can be done within an hour
					duration = 45;
					if(((Project)event).timeRemaining<=45) {
						duration=((Project)event).timeRemaining;
					}
				}
				else {
					duration = (int)(((double)((Project)event).timeRemaining*0.66)/daysRemaining); 
				}
				tasks.add(new Task(event.getEventID(), "Complete "+event.getEventName(), duration,LocalDate.now()));
			}
			else if(event instanceof Assignment) {
				tasks.add(new Task(event.getEventID(), "Complete "+event.getEventName(), 45,LocalDate.now()));
			}
		}
		for(Event event: low) {
			int daysRemaining = (int) Priority.getTotalDaysBetween(event.getEndDate());
			if(event instanceof Test) {
				int duration = 0;
				if((((double)((Test)event).timeRemaining*0.66)/daysRemaining)<=30) { // finish task if it can be done within an hour
					duration = 30;
					if(((Test)event).timeRemaining<=30) {
						duration=((Test)event).timeRemaining;
					}
				}
				else {
					duration = (int)(((double)((Test)event).timeRemaining*0.66)/daysRemaining); 
				}
				tasks.add(new Task(event.getEventID(), "Study for "+event.getEventName(), duration,LocalDate.now()));
			}
			else if(event instanceof Project) {
				int duration = 0;
				if((((double)((Project)event).timeRemaining*0.66)/daysRemaining)<=30) { // finish task if it can be done within an hour
					duration = 30;
					if(((Test)event).timeRemaining<=30) {
						duration=((Project)event).timeRemaining;
					}
				}
				else {
					duration = (int)(((double)((Project)event).timeRemaining*0.66)/daysRemaining); 
				}
				tasks.add(new Task(event.getEventID(), "Complete "+event.getEventName(), duration,LocalDate.now()));
			}
			
		}
		
		return tasks;
	}
}
