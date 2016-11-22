package com.Validation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.*;

public class CustomerValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mobile = request.getParameter("mobileone");
		String password = request.getParameter("passwordone");
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("CustomerRegistrationTable"); 
		
		Filter filter = new FilterPredicate("mobile",Query.FilterOperator.EQUAL,mobile);
		q.setFilter(filter);
		q.addSort("mobile");
		
		PreparedQuery pq = ds.prepare(q);
		String obtpass=null;
		String obtname=null;
		for(Entity result : pq.asIterable()){
			obtpass = (String)result.getProperty("password");
			obtname = (String)result.getProperty("name");
		}
		if(password.equals(obtpass)){
			HttpSession session = request.getSession();
			session.setAttribute("Cusername",obtname);
			response.sendRedirect("CustomerHomePage.jsp");
		} else{
			response.getWriter().println("Username or password are not matching");
		}
		
	}

}
