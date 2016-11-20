package com.Validation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.*;


public class AdminValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("AdministratorRegistrationTable");
		
		Filter filter = new FilterPredicate("mobile",Query.FilterOperator.EQUAL,mobile);
		//Filter filter2 = new FilterPredicate("email",Query.FilterOperator.EQUAL,username);
		q.setFilter(filter);
		q.addSort("mobile");
		
		String aPassword=null;
		
		PreparedQuery pq = ds.prepare(q);
		for(Entity result : pq.asIterable()){
			aPassword=result.getProperty("password").toString();
		}
		
		if(password.equals(aPassword)){
			response.sendRedirect("AdminHomePage.jsp");
		} else{
			response.getWriter().print("You are not registered!!!");
		}
	}

}
