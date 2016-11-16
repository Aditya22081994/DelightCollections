package com.Validation;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

public class AdminRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("username");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String passwordOne = request.getParameter("passone");
	
		String keyvalue = "2005"+mobile;
		Date date = new Date();
		
		HttpSession session = request.getSession();
		session.setAttribute("mobileno",mobile);
		session.setAttribute("email",email);
		session.setAttribute("name", name);
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		
		Entity adminDetail = new Entity("AdministratorRegistrationTable",keyvalue);
		
		adminDetail.setProperty("name",name);
		adminDetail.setProperty("email",email);
		adminDetail.setProperty("mobile",mobile);
		adminDetail.setProperty("password",passwordOne);
		adminDetail.setProperty("date",date.toString());
		
		ds.put(adminDetail);
		
		response.getWriter().println("Administrator is Registered!!!!!!!!!!!!");
	}
}
