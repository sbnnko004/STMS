package com.stms.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.stms.util.Event;
import com.stms.dao.ApplicationDao;

//@WebServlet("/addevent")
public class AddEventServlet extends HttpServlet {

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
		
		// fill it up in a User bean
		Event event = new Event(eventname,eventdescription,startdate,enddate,starttime+":00",endtime+":00");
		
		// call DAO layer and save the user object to DB
		ApplicationDao dao = new ApplicationDao();
		int rows =0;
		if(type.equals("other"))
			rows = dao.addEvent(event, req.getSession().getAttribute("username").toString());
		else if(type.equals("test"))
			rows = dao.addEvent(event, req.getSession().getAttribute("username").toString());
		else if(type.equals("assignment"))
			rows = dao.addEvent(event, req.getSession().getAttribute("username").toString());
		else if(type.equals("project"))
			rows = dao.addEvent(event, req.getSession().getAttribute("username").toString());
		
		//int rows = 0;

		// prepare an information message for user about the success or failure of the operation
		String infoMessage = null;
		if(rows==0){
			infoMessage="Sorry, an error occurred!";
		}
		else{
			infoMessage="Event added.";
			
					
		}
		//System.out.println(infoMessage);
		
		resp.sendRedirect("/dashboard");					

	}
	
	
		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("/dashboard");	
	}

	
}
