package com.stms.listeners;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import com.stms.util.AutoScheduler;

@WebListener()
public class ScheduleListener implements ServletContextListener {


    private ScheduledExecutorService scheduler;

    // Public constructor is required by servlet spec
    public ScheduleListener() {
    }

    // -------------------------------------------------------
    // ServletContextListener implementation
    // -------------------------------------------------------

    /**
     * Method uses threads to Automatically schedule an event every five minutes.
     * @param sce
     */
    public void contextInitialized(ServletContextEvent sce) {
      /* This method is called when the servlet context is
         initialized(when the Web application is deployed).
         You can initialize servlet context related data here.
      */

      System.out.println("AUTO SCHEDULER - in contextInitialized method");
      this.scheduler = Executors.newSingleThreadScheduledExecutor();

      //Auto scheduler is run every five minutes
      this.scheduler.scheduleAtFixedRate(new AutoScheduler(), 0, 5, TimeUnit.MINUTES);

    }


    /**
     * Method shutdowns the auto schedular when application undeploys
     *
     * @param sce
     */
    public void contextDestroyed(ServletContextEvent sce) {
      /* This method is invoked when the Servlet Context
         (the Web application) is undeployed or
         Application Server shuts down.
      */

      System.out.println("AUTOSCHEDULER - contextDestroy");

      scheduler.shutdown();
    }

}
