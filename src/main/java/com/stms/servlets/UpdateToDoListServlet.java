package com.stms.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stms.Scheduler.Scheduler;
import com.stms.dao.ApplicationDao;
import com.stms.util.Event;
import com.stms.util.Task;

public class UpdateToDoListServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("/dashboard");					
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if(session!=null) {
			System.out.println("updating to do list");
			if(session.getAttribute("username")!=null) {
				ApplicationDao dao = new ApplicationDao();
				ArrayList<Event> events = dao.getEvents(session.getAttribute("username").toString());
				ArrayList<Task> tasks = Scheduler.getTasks(events,null,0);
				//TODO make tasks for each day for four days and add them to the database. Deleting previous tasks 
				dao.saveTasks(tasks, session.getAttribute("username").toString(),"2018-09-05");
			}
		}
		resp.sendRedirect("/dashboard");
		
	}
}
