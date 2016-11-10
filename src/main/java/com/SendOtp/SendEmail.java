package com.SendOtp;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SendEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	 Properties props = new Properties();
	 
	 Session session = Session.getDefaultInstance(props, null);
	 
	 HttpSession httpsession = request.getSession();
	 
	 SecureRandom sr = new SecureRandom();		 
	 int otppass = sr.nextInt(999999);
	 
	 httpsession.setAttribute("OtpEmail",otppass);
	 
	 String body = "Your One Time Password is "+" "+ otppass;
	 String subject = "Mobile No. Verification";
	 String email = (String)httpsession.getAttribute("email");
	 String name=(String)httpsession.getAttribute("name");
	 try{
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress("verification@delightcollectionstore.appspotmail.com","delightcollection ltd"));
			msg.addRecipient(Message.RecipientType.TO,new InternetAddress(email,name));
			msg.setSubject(subject);
			msg.setText(body);
			Transport.send(msg);
		} catch (Exception e){
		response.getWriter().println("Not a Valid Email Address");
		}
	 httpsession.setAttribute("testEmail","Email");
	 request.getRequestDispatcher("ConfirmEmailOtp.html").forward(request, response);
	}

}
