package com.stms.util;

import java.time.LocalDate;

/** Class which represents the tasks needed to be done each day by the student.
 * @author Gareth
 */
public class Task{
	private String taskName;
	private int taskDuration;
	private int taskID;
	private LocalDate date;
	


	public Task(int taskID, String taskName, int taskDuration, LocalDate date) {
		this.taskName = taskName;
		this.taskDuration = taskDuration;
		this.taskID = taskID;
		this.date=date;
		
	}

	public Task(String taskName, int taskDuration){
		this.taskName = taskName;
		this.taskDuration = taskDuration;
	}
	
	public int getTaskDuration(){
		return taskDuration;
	}
	
	public String getTaskName(){
		return taskName;
	}
	
	public void setTaskDuration(int duration){
		this.taskDuration = duration;
	}
	
	public void setTaskName(String name){
		this.taskName = name;
	}

	public int getTaskID() {
		return this.taskID;
	}

	public LocalDate getDate() {
		return this.date;
	}
	@Override
	public String toString(){
		return taskName + " " + taskDuration;
	}

}
	