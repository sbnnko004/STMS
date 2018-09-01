package com.stms.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stms.dao.ApplicationDao;
import com.stms.util.Event;

//@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if(session!=null) {
			if(session.getAttribute("username")!=null) {
				ApplicationDao dao = new ApplicationDao();
			
				List<Event> events = dao.getEvents(session.getAttribute("username").toString());
				req.setAttribute("events", events);
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
