package com.stms.Scheduler;
import java.util.ArrayList;

import com.stms.util.Event;
import com.stms.util.Task;

public class Scheduler {
	public static ArrayList<Task> getTasks(ArrayList<Event> events, Double studyTimeMinutes){
		ArrayList<Task> tasks = new ArrayList<>();
		ArrayList<Event> critical = new ArrayList<>();
		ArrayList<Event> high = new ArrayList<>();
		ArrayList<Event> medium = new ArrayList<>();
		ArrayList<Event> low = new ArrayList<>();
		for(Event event : events) {
			if(Priority.getPriority(event)==Priority.EventStatus.CRITICAL) {
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
		
		return null;
	}
}
