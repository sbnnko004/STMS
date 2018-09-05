/**
 * 
 */
package com.stms.util;

/**
 * @author nkosi
 *
 */
public class Event {
    //Attributes
	protected int eventID;
	protected String eventDescription;
    protected String eventName;
    protected String startDate;
    protected String endDate;
    protected String startTime;
    protected String endTime;

    public Event(int eventID, String eventName, String eventDescription, String startDate, String endDate, String startTime, String endTime) {
        this.eventDescription = eventDescription;
        this.eventName = eventName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.startTime = startTime;
        this.endTime = endTime;
        this.eventID = eventID;
    }
    public Event(String eventName, String eventDescription, String startDate, String endDate, String startTime, String endTime) {
        this.eventDescription = eventDescription;
        this.eventName = eventName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.startTime = startTime;
        this.endTime = endTime;
    }
    public String getEndDate() {
        return endDate;
    }
    public String getEndTime() {
        return endTime;
    }
    public String getEventDescription() {
        return eventDescription;
    }
    public int getEventID() {
		return this.eventID;
	}
    public String getEventName() {
        return eventName;
    }
    public String getStartDate() {
        return startDate;
    }
    public String getStartTime() {
        return startTime;
    }
    @Override
	public String toString() {
    	return getEventName();
    }
}
