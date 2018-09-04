package com.stms.util;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;

public class Priority {

    /**
     * Enum for the status of an event.
     */

    public enum EventStatus{
        CRITICAL,
        HIGH,
        MEDIUM,
        LOW,
        MISSED
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
     * Obtains current Time.
     *
     * @return LocalTime
     */
    private LocalTime getTodayTime() { return LocalTime.now(); }

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
     * Obtains the time between todays time and deadline time.
     * @param deadlineTime
     * @return
     */
    private long getTotalTimeBetween(String deadlineTime){

        // Converts string to LocalTime
        LocalTime localTime = LocalTime.parse(deadlineTime);

        // Gets todays time.
        LocalTime todayTime = LocalTime.of(getTodayTime().getHour(), getTodayTime().getMinute(), getTodayTime().getSecond());

        // Gets deadline time
        LocalTime endTime = LocalTime.of(localTime.getHour(), localTime.getMinute(), localTime.getSecond());


        return ChronoUnit.MINUTES.between(todayTime, endTime);
    }

    /**
     * Obtains the priority of an event
     * @param event
     * @return event Priority.
     */
    public String getPriority(Event event){

        //Retrieves the end date from the current event.
        String eventEndDate = event.getEndDate();

        //Retrieves the end time for the current event.
        String eventEndTime = event.getEndTime();

        //returns days between
        long daysBetween = getTotalDaysBetween(eventEndDate);

        //returns time between
        long timeBetween = getTotalTimeBetween(eventEndTime);

        //Checks the statuses of of events.
        if(daysBetween > 14){
            this.eventStatus = EventStatus.LOW;
        }
        else if (daysBetween <= 14 && daysBetween > 7){
            this.eventStatus = EventStatus.MEDIUM;
        }
        else if (daysBetween <= 7 && daysBetween > 4){
            this.eventStatus = EventStatus.HIGH;
        }
        else if(daysBetween > 0 && daysBetween <=4) {
            this.eventStatus = EventStatus.CRITICAL;
        }
        else if (daysBetween == 0){

            //status is updated to missed if the time reaches zero.
            if(timeBetween == 0)
                this.eventStatus = EventStatus.CRITICAL;
            else
                this.eventStatus = EventStatus.MISSED;
        }

        return eventStatus.toString();
    }

}
