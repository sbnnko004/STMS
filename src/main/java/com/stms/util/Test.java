package com.stms.util;

public class Test extends Event {
    private String courseCode;
	private int timeNeededInMinutes;
    public int timeRemaining;
    
    public Test(int EventID, String eventName,String eventDescription, String startDate, String endDate, String startTime, String endTime,String courseCode, int timeNeededInMinutes, int timeRemaining) {
    	super(EventID, eventName, eventDescription, startDate, endDate, startTime, endTime);
        this.courseCode = courseCode;
        this.timeNeededInMinutes = timeNeededInMinutes;
        this.timeRemaining = timeRemaining;
    }
    public Test( String eventName,String eventDescription, String startDate, String endDate, String startTime, String endTime,String courseCode, int timeNeededInMinutes) {
    	super(eventName,eventDescription,  startDate, endDate, startTime, endTime);
        this.courseCode = courseCode;
        this.timeNeededInMinutes = timeNeededInMinutes;
        this.timeRemaining = timeNeededInMinutes;
    }
    public String getCourseCode() {
        return courseCode;
    }

    public int getTimeNeededInMinutes() {
		return timeNeededInMinutes;
	}
    public int getTimeRemaining() {
		return timeRemaining;
	}
	public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }
}
