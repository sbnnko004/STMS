package com.stms.util;

public class Test extends Event {
    private String courseCode;
	private int timeNeededInMinutes;
    public int timeRemaining;
    
    public Test(String eventDescription, String eventName, String startDate, String endDate, String startTime, String endTime,String courseCode, int timeNeededInMinutes) {
    	super(eventDescription, eventName, startDate, endDate, startTime, endTime);
        this.courseCode = courseCode;
        this.timeNeededInMinutes = timeNeededInMinutes;
        this.timeRemaining = timeNeededInMinutes;
    }
    public Test(int EventID,String eventDescription, String eventName, String startDate, String endDate, String startTime, String endTime,String courseCode, int timeNeededInMinutes, int timeRemaining) {
    	super(EventID,eventDescription, eventName, startDate, endDate, startTime, endTime);
        this.courseCode = courseCode;
        this.timeNeededInMinutes = timeNeededInMinutes;
        this.timeRemaining = timeRemaining;
    }
    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }
    public int getTimeNeededInMinutes() {
		return timeNeededInMinutes;
	}
	public int getTimeRemaining() {
		return timeRemaining;
	}
}
