package com.stms.util;

public class Assignment extends Event {
	
    private String courseCode;

    public Assignment(String eventDescription, String eventName, String startDate, String endDate, String startTime, String endTime,String courseCode) {
    	super(eventDescription, eventName, startDate, endDate, startTime, endTime);
        this.courseCode = courseCode;
    }
    public Assignment(int EventID,String eventDescription, String eventName, String startDate, String endDate, String startTime, String endTime,String courseCode) {
    	super(EventID,eventDescription, eventName, startDate, endDate, startTime, endTime);
        this.courseCode = courseCode;
    }
    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

}
