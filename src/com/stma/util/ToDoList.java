package com.stma.util;

import java.util.ArrayList;

/** Class which holds all the tasks the student must do on a day.
 * @author Gareth
 */
public class ToDoList{
	private ToDoList todolist;
	private ArrayList<Task> tasks;
	
	public ToDoList(){
		tasks = new ArrayList<Task>();
	}
	
	public void addTask(Task task){
		tasks.add(task);
	}
	
	public void removeTask(Task task){
		tasks.remove(task);
	}
	
	public String toString(){
		return tasks.toString();
	}
	
	
}