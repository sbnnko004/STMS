package com.stms.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stms.util.Assignment;
import com.stms.util.Event;
import com.stms.util.Project;
import com.stms.util.Test;
import com.stms.dao.ApplicationDao;

//@WebServlet("/addevent")
public class AddEventServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -700146937865479138L;



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// collect all form data
		String eventname = req.getParameter("eventname");
		String eventdescription = req.getParameter("eventdescription");
		String startdate = req.getParameter("startdate");
		String enddate = req.getParameter("enddate");
		String starttime = req.getParameter("starttime");
		String endtime = req.getParameter("endtime");
		String coursecode = req.getParameter("coursecode");
		String type = req.getParameter("type");
		String timeNeeded = req.getParameter("timeneeded");
		
		// fill it up in a User bean
		Event event = new Event(eventname,eventdescription,startdate,enddate,starttime+":00",endtime+":00");
		
		// call DAO layer and save the user object to DB
		ApplicationDao dao = new ApplicationDao();
		int timeNeededInMinutes = -1;
		if(type.equals("test")||type.equals("project")) {
			timeNeededInMinutes = 60 * Integer.parseInt(timeNeeded.split("-")[0])+Integer.parseInt(timeNeeded.split("-")[1]);
		}
			
		if(type.equals("test"))
			event = new Test(eventname,eventdescription,startdate,enddate,starttime+":00",endtime+":00",coursecode,timeNeededInMinutes);
		else if(type.equals("assignment"))
			event = new Assignment(eventname,eventdescription,startdate,enddate,starttime+":00",endtime+":00",coursecode);
		else if(type.equals("project"))
			event = new Project(eventname,eventdescription,startdate,enddate,starttime+":00",endtime+":00",coursecode,timeNeededInMinutes);
		int rows = dao.addEvent(event, req.getSession().getAttribute("username").toString());

		// prepare an information message for user about the success or failure of the operation
		String infoMessage = null;
		if(rows==0){
			infoMessage="Sorry, an error occurred!";
		}
		else{
			infoMessage="Event added.";
			
					
		}
		resp.sendRedirect("/dashboard");					

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("/dashboard");	
	}

	
}
