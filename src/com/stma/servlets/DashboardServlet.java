package com.stma.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stma.dao.ApplicationDao;
import com.stma.dao.DBConnection;
import com.stma.util.Event;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ApplicationDao dao = new ApplicationDao();
		String username = req.getParameter("username");
		List<Event> events = dao.getEvents(username);
		req.setAttribute("events", events);
		req.getRequestDispatcher("/html/dashboard.jsp").forward(req, resp);

	}
}
