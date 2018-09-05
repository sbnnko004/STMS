package com.stms.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stms.dao.ApplicationDao;
import com.stms.util.Assignment;
import com.stms.util.Event;
import com.stms.util.Project;
import com.stms.util.Test;

//@WebServlet("/addevent")
/**
 * @author nkosi
 * servlet for url pattern /addevent
 */
public class AddEventServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -700146937865479138L;



	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("/dashboard");	
	}
	
	/* 
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 * This method adds events from a html form to the database through the ApplicationDao class
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// call DAO layer and save the user object to DB
		ApplicationDao dao = new ApplicationDao();
		Event event = null;		
		// collect all form data
		String eventname = req.getParameter("eventname");
		String eventdescription = req.getParameter("eventdescription");
		String startdate = req.getParameter("startdate");
		String starttime = req.getParameter("starttime")+":00";
		String type = req.getParameter("type");
		if(type.equals("other")) {
			String enddate = req.getParameter("enddate");
			String endtime = req.getParameter("endtime")+":00";
			event  = new Event(eventname,eventdescription,startdate,enddate,starttime,endtime);;
		}
		String coursecode = req.getParameter("coursecode");
		System.out.println(type);
		if("other".equals(coursecode)) {
			coursecode = req.getParameter("manualCourseCode");
		}
		if(type.equals("assignment")) {
			String enddate = req.getParameter("enddate");
			String endtime = req.getParameter("endtime")+":00";
			
			event = new Assignment(eventname,eventdescription,startdate,enddate,starttime,endtime,coursecode);
		}
		else if(type.equals("test")) {
			String enddate = startdate;
			int min = Integer.parseInt(starttime.split(":")[0])*60+Integer.parseInt(starttime.split(":")[1])+Integer.parseInt(req.getParameter("duration"));
			String endtime = min/60 +":"+min%60+":00";
			int timeNeededInMinutes = Integer.parseInt(req.getParameter("timeneeded").split("-")[0])*60+Integer.parseInt(req.getParameter("timeneeded").split("-")[1]);
			event = new Test(eventname,eventdescription,startdate,enddate,starttime,endtime,coursecode,timeNeededInMinutes);
		}
		else if(type.equals("project")) {
			System.out.println("here");
			String enddate = req.getParameter("enddate");
			String endtime = req.getParameter("endtime")+":00";
			int timeNeededInMinutes = Integer.parseInt(req.getParameter("timeneeded").split("-")[0])*60+Integer.parseInt(req.getParameter("timeneeded").split("-")[1]);
			event = new Project(eventname,eventdescription,startdate,enddate,starttime,endtime,coursecode,timeNeededInMinutes);
		}
		
		int rows = dao.addEvent(event, req.getSession().getAttribute("username").toString());
		 
		// prepare an information message for user about the success or failure of the operation
		String infoMessage = null;
		if(rows==0){
			infoMessage="Sorry, an error occurred!";
		}
		else{
			infoMessage="Event added.";
		}
		resp.sendRedirect("/updateToDoList");					

	}

	
}
