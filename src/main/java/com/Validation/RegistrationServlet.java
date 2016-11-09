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

public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("username");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String passwordOne = request.getParameter("passone");
		String passwordTwo = request.getParameter("passtwo");
		
	
		String keyvalue = "2003"+mobile;
		Date d = new Date();
		
		HttpSession session = request.getSession();
		session.setAttribute("mobileno",mobile);
		session.setAttribute("email",email);
		session.setAttribute("name", name);
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		
		Entity customerDetail = new Entity("CustomerRegistrationTable",keyvalue);
		
		customerDetail.setProperty("name",name);
		customerDetail.setProperty("email",email);
		customerDetail.setProperty("mobile",mobile);
		customerDetail.setProperty("password",passwordOne);
		customerDetail.setProperty("date",d.toString());
		
		ds.put(customerDetail);
		
		RequestDispatcher rd = request.getRequestDispatcher("smssend");
		
		rd.forward(request, response);		
		
	}
}