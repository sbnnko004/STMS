package com.stma.util;
/** Class which represents the tasks needed to be done each day by the student.
 * @author Gareth
 */
public class Task{
	private String taskName;
	private int taskDuration;
	
	public Task(String taskName, int taskDuration){
		this.taskName = taskName;
		this.taskDuration = taskDuration;
	}
	
	public void setTaskName(String name){
		this.taskName = name;
	}
	
	public void setTaskDuration(int duration){
		this.taskDuration = duration;
	}
	
	public String getTaskName(){
		return taskName;
	}
	
	public int getTaskDuration(){
		return taskDuration;
	}
	
	public String toString(){
		return taskName + " " + taskDuration;
	}

}
	