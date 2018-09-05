package com.stms.Scheduler;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import com.stms.util.Event;

public class Priority {

    public enum EventStatus{
        CRITICAL,
        HIGH,
        MEDIUM,
        LOW
    }

    /**
     * Obtains the priority of an event
     * @param event
     * @return event Priority.
     */
    public static EventStatus getPriority(Event event){
    	Priority priority = new Priority();
        String eventEndDate = event.getEndDate();

        long daysBetween = priority.getTotalDaysBetween(eventEndDate);

        if(daysBetween > 14){
            priority.eventStatus = EventStatus.LOW;
        }
        else if (daysBetween <= 14 && daysBetween > 7){
        	priority.eventStatus = EventStatus.MEDIUM;
        }
        else if (daysBetween <= 7 && daysBetween > 4){
        	priority.eventStatus = EventStatus.HIGH;
        }
        else
        	priority.eventStatus = EventStatus.CRITICAL;

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
     * Method calculates the days between the current day and the deadline.
     * @param deadline
     * @return long
     */
    private long getTotalDaysBetween(String deadline){

        // Converts string to LocalDate
        LocalDate localDate = LocalDate.parse(deadline);

        // Gets todays date.
        LocalDate todayDate = LocalDate.of(getTodayDate().getYear(), getTodayDate().getMonth(), getTodayDate().getDayOfMonth());

        // Gets deadline date
        LocalDate endDate = LocalDate.of(localDate.getYear(), localDate.getMonth(), localDate.getDayOfMonth());


        return ChronoUnit.DAYS.between(todayDate, endDate);
    }

}
