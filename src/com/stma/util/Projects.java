package com.stma.util;

public class Projects extends Event{
	
    private String courseCode;

    public Projects(String eventDescription, String eventName, String startDate, String endDate, String startTime, String endTime,String courseCode) {
    	super(eventDescription, eventName, startDate, endDate, startTime, endTime); 
        this.courseCode = courseCode;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

}