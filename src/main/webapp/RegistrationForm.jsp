<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Form</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
<nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="HomePage.jsp">Delight Collections</a>
          </div>
        </div>
      </nav>
<div class="container">
<form class="form-horizontal" action="registrationservlet" method="post" onsubmit="return validate()">

<div class="form-group">
      <label class="control-label col-sm-2" for="email">NAME :</label>
      <div class="col-sm-5">
        <input type="text" class="form-control" name="username" placeholder="Enter Name" required/>
      </div>
    </div>

<div class="form-group">
      <label class="control-label col-sm-2" for="email">EMAIL :</label>
      <div class="col-sm-5">
        <input type="email" class="form-control" name="email" placeholder="Enter email" required/>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">PASSWORD :</label>
      <div class="col-sm-5">
        <input class="form-control" type="password" name="passone" id="passwordOne" placeholder="Type your Password" required />
      </div>
    </div>
    
  <div class="form-group">
      <label class="control-label col-sm-2" for="email">CONFIRM PASSWORD :</label>
     <div class="col-sm-5">
        <input class="form-control" type="password" name="passtwo" id="passwordTwo" placeholder="Re-Type your Password" required />
      </div>
    </div>
    
     <div class="form-group">
      <label class="control-label col-sm-2" for="email">MOBILE NO. :</label>
      <div class="col-sm-5">
        <input class="form-control" type="text" name="mobile" placeholder="An OTP will be sent to this number" id="mobileOne" required />
      </div>
    </div>
    
    <div class="form-group">
<div class="col-sm-offset-2 col-lg-10">
<button type="submit" class="btn btn-success">Register</button>
</div>
</div>
</form>
</div>
</body>
</html>