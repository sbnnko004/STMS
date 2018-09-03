package com.stms.util;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Priority {

    public enum EventStatus{
        CRITICAL,
        HIGH,
        MEDIUM,
        LOW
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

    /**
     * Obtains the priority of an event
     * @param event
     * @return event Priority.
     */
    public String getPriority(Event event){

        String eventEndDate = event.getEndDate();

        long daysBetween = getTotalDaysBetween(eventEndDate);

        if(daysBetween > 14){
            this.eventStatus = EventStatus.LOW;
        }
        else if (daysBetween <= 14 && daysBetween > 7){
            this.eventStatus = EventStatus.MEDIUM;
        }
        else if (daysBetween <= 7 && daysBetween > 4){
            this.eventStatus = EventStatus.HIGH;
        }
        else
            this.eventStatus = EventStatus.CRITICAL;

        return eventStatus.toString();
    }

}
