<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Form</title>

<script type="text/javascript">
function validatePassword(){
	var passwordOne = document.getElementById("passwordOne").value;
	var passwordTwo = document.getElementById("passwordTwo").value;
	if(passwordOne!=passwordTwo){
		alert("Passwords do not match");
		return false;
	} else {
		return true;
	}
}
function validateMobile(){
	var mobileOne = document.getElementById("mobileOne").value;
	if(mobileOne.length!=10){
		alert("Invalid Number");
		return false;
	} else{
		return true;
	}
}
function validate(){
	  var validation = true;
	  validation &= validatePassword();
	  validation &= validateMobile();
	  return validation;
	}
</script>
</head>
<body>

<form action="registrationservlet" method="post" onsubmit="return validate()">
Name : <input type="text" name="username" required/><br>
Email : <input type="text" name="email" required/><br>
Password : <input type="password" name="passone" id="passwordOne" required/><br>
Confirm Password : <input type="password" name="passtwo" id="passwordTwo" required/><br>
Mobile : <input type="text" name="mobile" placeholder="An OTP is sent to this number" id="mobileOne" required/><br>
<input type="submit" value="Register"/>
</form>

</body>
</html>