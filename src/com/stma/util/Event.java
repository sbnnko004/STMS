/**
 * 
 */
package com.stma.util;

/**
 * @author nkosi
 *
 */
public class Event {
    //Attributes
    protected String eventDescription;
    protected String eventName;
    protected String startDate;
    protected String endDate;
    protected String startTime;
    protected String endTime;

    public Event(String eventDescription, String eventName, String startDate, String endDate, String startTime, String endTime) {
        this.eventDescription = eventDescription;
        this.eventName = eventName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public String getEventDescription() {
        return eventDescription;
    }

    public String getEventName() {
        return eventName;
    }

    public String getStartDate() {
        return startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public String getStartTime() {
        return startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public String toString() {
    	return eventName+" /n"+eventDescription+" /n"+startDate;
    }
}
