<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Form</title>
</head>
<body>

<form action="registrationservlet" method="post">
Name : <input type="text" name="username"/><br>
Email : <input type="text" name="email"/><br>
Password : <input type="password" name="passone"/><br>
Confirm Password : <input type="password" name="passtwo"/><br>
Mobile : <input type="text" name="mobile" placeholder="An OTP is sent to this number"/><br>
<input type="submit" value="Register"/>
</form>

</body>
</html>