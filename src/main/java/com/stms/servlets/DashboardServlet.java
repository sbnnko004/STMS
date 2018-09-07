package com.stms.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stms.Scheduler.Scheduler;
import com.stms.dao.ApplicationDao;
import com.stms.util.Event;
import com.stms.util.Task;

//@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if(session!=null) {
			if(session.getAttribute("username")!=null) {
				ApplicationDao dao = new ApplicationDao();
			
				ArrayList<Event> events = dao.getEvents(session.getAttribute("username").toString());
				ArrayList<Task>  tasks = dao.getTasks(session.getAttribute("username").toString());
				ArrayList<Event> upcomingEvents = Scheduler.getUpcomingEvents(events);
				ArrayList<Event> pastEvents = Scheduler.getPastEvents(events);
				ArrayList<Event> currentEvents = Scheduler.getCurrentEvents(events);
				ArrayList<String> courses = dao.getCourses();
				req.setAttribute("events", events);
				req.setAttribute("courses", courses);
				req.setAttribute("tasks", tasks);
				req.setAttribute("upcomingEvents", upcomingEvents);
				req.setAttribute("pastEvents", pastEvents);
				req.setAttribute("currentEvents", currentEvents);
				req.getRequestDispatcher("/html/dashboard.jsp").forward(req, resp);
			}
			else {
				resp.sendRedirect("/home");					
			}
		}
		else {
			resp.sendRedirect("/home");
		}
	}
}
