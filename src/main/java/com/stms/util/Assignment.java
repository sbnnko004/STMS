package com.stms.util;

public class Assignment extends Event {
	
    private String courseCode;

    public Assignment(int EventID, String eventName,String eventDescription, String startDate, String endDate, String startTime, String endTime,String courseCode) {
    	super(EventID,eventDescription, eventName, startDate, endDate, startTime, endTime);
        this.courseCode = courseCode;
    }
    public Assignment( String eventName,String eventDescription, String startDate, String endDate, String startTime, String endTime,String courseCode) {
    	super( eventName,eventDescription, startDate, endDate, startTime, endTime);
        this.courseCode = courseCode;
    }
    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

}
