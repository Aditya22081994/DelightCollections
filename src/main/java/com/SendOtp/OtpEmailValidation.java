package com.SendOtp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OtpEmailValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
HttpSession session = request.getSession();
		
		String smsotp = session.getAttribute("OtpEmail").toString();
	
		String otp = request.getParameter("verifyemailotp");
		
		if(smsotp.equals(otp)){
		  //RequestDispatcher red = request.getRequestDispatcher("Homepage.jsp");
		  //red.forward(request, response);
			response.getWriter().println("Entered OTP is Correct!!!!!!!");
		} else {
			response.getWriter().println("Entered OTP is not Correct");
		}
	}

}
