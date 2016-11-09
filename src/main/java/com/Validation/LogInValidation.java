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


public class LogInValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("CustomerRegistrationTable");
		
		Filter filter = new FilterPredicate("mobile",Query.FilterOperator.EQUAL,username);
		//Filter filter2 = new FilterPredicate("email",Query.FilterOperator.EQUAL,username);
		q.setFilter(filter);
		q.addSort("mobile");
		
		String cPassword=null;
		
		PreparedQuery pq = ds.prepare(q);
		for(Entity result : pq.asIterable()){
			cPassword=result.getProperty("password").toString();
		}
		
		if(password.equals(cPassword)){
			response.getWriter().print("You are Successfully registered!!!");
		} else{
			response.getWriter().print("You are not registered!!!");
		}
	}

}
