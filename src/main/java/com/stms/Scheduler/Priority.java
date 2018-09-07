package com.stms.Scheduler;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;

import com.stms.util.Event;

public class Priority {

    public enum EventStatus{
        CRITICAL,
        HIGH,
        MEDIUM,
        LOW,
        PAST
    }

    /**
     * Obtains the priority of an event
     * @param event
     * @return event Priority.
     */
    public static EventStatus getPriority(Event event){
    	Priority priority = new Priority();
        String eventEndDate = event.getEndDate();

        long daysBetween = getTotalDaysBetween(eventEndDate);

        if(daysBetween > 14){
            priority.eventStatus = EventStatus.LOW;
        }
        else if (daysBetween <= 14 && daysBetween > 7){
        	priority.eventStatus = EventStatus.MEDIUM;
        }
        else if (daysBetween <= 7 && daysBetween > 4){
        	priority.eventStatus = EventStatus.HIGH;
        }
        else if(daysBetween > 0 && daysBetween <=4) {
        	priority.eventStatus = EventStatus.CRITICAL;
        }
        else if (daysBetween == 0){
        	int timeBetween = (int) priority.getTotalTimeBetween(event.getEndTime());
            
        	//status is updated to missed if the time reaches zero.
            if(timeBetween == 0)
            	priority.eventStatus = EventStatus.CRITICAL;
            else
            	priority.eventStatus = EventStatus.PAST;
        }

        return priority.eventStatus;
    }
    private EventStatus eventStatus;

    /**
     * Obtains current date.
     *
     * @return LocalDate
     */
    private LocalDate getTodayDate() {
        return LocalDate.now();
    }

    /**
     * Obtains the time between todays time and deadline time.
     * @param deadlineTime
     * @return
     */
    private long getTotalTimeBetween(String deadlineTime){
    	LocalTime timeNow = LocalTime.now();
        // Converts string to LocalTime
        LocalTime localTime = LocalTime.parse(deadlineTime);

        // Gets todays time.
        LocalTime todayTime = LocalTime.of(timeNow.getHour(), timeNow.getMinute(), timeNow.getSecond());

        // Gets deadline time
        LocalTime endTime = LocalTime.of(localTime.getHour(), localTime.getMinute(), localTime.getSecond());


        return ChronoUnit.MINUTES.between(todayTime, endTime);
    }
    
    /**
     * Method calculates the days between the current day and the deadline.
     * @param deadline
     * @return long
     */
    public static long getTotalDaysBetween(String deadline){

        // Converts string to LocalDate
        LocalDate localDate = LocalDate.parse(deadline);
        Priority priority = new Priority();
        // Gets todays date.
        LocalDate todayDate = LocalDate.of(priority.getTodayDate().getYear(),priority.getTodayDate().getMonth(), priority.getTodayDate().getDayOfMonth());

        // Gets deadline date
        LocalDate endDate = LocalDate.of(localDate.getYear(), localDate.getMonth(), localDate.getDayOfMonth());


        return ChronoUnit.DAYS.between(todayDate, endDate)-1;
    }

}
