package com.SendOtp;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.MessageFactory;
import com.twilio.sdk.resource.instance.Account;
import com.twilio.sdk.resource.instance.Message;

import org.apache.http.message.BasicNameValuePair;
import org.apache.http.NameValuePair;



public class SmsSend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	 public void service(HttpServletRequest req, HttpServletResponse resp) throws IOException,
     ServletException {
		 
		 final String accountsid = System.getenv("TWILIO_ACCOUNT_SID");
		 final String authToken = System.getenv("TWILIO_AUTH_TOKEN");
		 final String twilioNumber = System.getenv("TWILIO_NUMBER");
		 String mobile = req.getParameter("mobileotp");
		 final String endMobile = "+91"+mobile;
		 
		 SecureRandom sr = new SecureRandom();		 
		 int otp = sr.nextInt(999999);
		 TwilioRestClient client = new TwilioRestClient(accountsid, authToken);
		 
		 Account account = client.getAccount();
		 
		MessageFactory msg =  account.getMessageFactory();
		
		List<NameValuePair> list = new ArrayList<NameValuePair>();
		
		list.add(new BasicNameValuePair("To",endMobile));
		list.add(new BasicNameValuePair("From",twilioNumber));
		list.add(new BasicNameValuePair("Body","Your One Time Password is "+otp));
		
		try {
		      Message sms = msg.create(list);
		      resp.getWriter().println("You are registered");
		    } catch (TwilioRestException e) {
		      throw new ServletException("Twilio error", e);
		    
		  }
		
		
		 
		 
	}

}
