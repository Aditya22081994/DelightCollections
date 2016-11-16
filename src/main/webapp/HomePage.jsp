<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
   <%@ page import="java.io.IOException" %>
   <%@ page import="javax.servlet.http.HttpServlet" %>
   <%@ page import="javax.servlet.http.HttpServletRequest" %>
   <%@ page import="javax.servlet.http.HttpServletResponse" %>
   <%@ page import="com.google.appengine.api.blobstore.BlobKey" %>
   <%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
   <%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
   <%@ page import="com.google.appengine.api.images.ImagesService" %>
   <%@ page import="com.google.appengine.api.images.ImagesServiceFactory" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Home Page</title>
<style type="text/css">
body,html{
height: 100%;
}
.carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 100%;
      margin: auto;
      height: 30%;
  }
  .carousel .item {
  height: 400px;
}
.item img {
    position: absolute;
    top: 0;
    left: 0;
    min-height: 400px;
}
.footer {
  position: static;
  bottom: 0;
  width: 100%;
  /* Set the fixed height of the footer here */
  height: 50px;
  line-height: 60px; /* Vertically center the text there */
  background-color: #f5f5f5;
   padding-right: 15px;
  padding-left: 15px;
}
</style>
</head>
<body>
<% 
BlobKey blobKeyOne=null;
BlobKey blobKeyTwo=null;
BlobKey blobKeyThree=null;
String imageOne=null; String imageTwo=null; String imageThree=null; 
ImagesService imagesService;
String keyString=null;
BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
blobKeyOne = new BlobKey("AMIfv97serA9GvK1QvACY9nmZcpjk0Q9_vei6jPgLsvr_g8H7Pz3E21rexdpEz-M8OzitwDcIFsrvu89PUS54N5hrLqk7WpyLRMsxdiseGBmDBRtwZLjaYs-Ni6SYkx6bv9glXVnmt79J5IyC2m6cfQ-MkmW7MWnVou6TYo0-ZZLNspTa9bplkiwhefHYXMJs7za-vZ5SD4U5Ear-hyxPS6iie8rvM8IVcy6vDNyUw7YqcMxnA2mxKLPjO586BNG4ExvoNM68zizSakxvimCbvphckmmGL2WcblApnZ_ShAIoAsUU1sF9XDGPxgsSaJENF4_3FgJdeJPQfSDsMPlQ24SjdQ69JE27wnszxhYdx2PijkoKmZt_coQjqdT4TbklkF_UqzukJJZO2XZAYvyVcH4fwbspQN6_Q5fRROJbnKlssa6aqI2l3pAmfaH_HPXOvkm3EQ26FEC");
blobKeyTwo = new BlobKey("AMIfv96qx0iX295RZ-7lf8gybli-khoMf-Ok42NHqRug0FoSZw0oN-FiCKiRAiIYwqT4p_eDdeFTWTaPvA8C1HHCwA-JDMBQr5Z86ElxHWXkpEDLstdo3ulMamKrcW4bIFFeVumtp-_WjhkPMH0Vi3MQ5j0qy6GsnzjI2VB5WERLU_KR-tqatkBSpCM-V_ZQpFueEX1wcV0o9yKNycTlR5y2GsBOCGKLVpHrRPIqF6ZnuhlRh1ZBcpDFVlcYSez62-0hpDC28-QajRM2Dkq4S6dWpmRT46-pQkns4ONOeYq4_lhv_C0UCzhHF5Jrfm3EAZCnEMHyyuUc8JqHBqD0plwsWdjiTuLYOcOI-7rBcoF8474ZlyuMxJ3LGhw-DARIA-xZ49Onejl8XOWTF7ANvnWF_reOBEfYwaYLiXsAvJhAozAW1-S1sJhK1aSCHFZxOvqo9DQNWlKB");
blobKeyThree = new BlobKey("AMIfv966Iz2j9Xi-JnHFEFRdRxItIqqGj2ARXqGdzD0BLnBbiLSbszTd0QDxrOlpro4KOfBc23yBTgM1F78efTyyL9ItGGy8wCxVSLikjkkq6eK_1I5AWYc-3hq2n-Zxzdm5JjINgF_j-wIgZ7p7j6zwGAqE5qISpG_HiYfHXarMI0BNs0KzdTQ3RBVxUsg3Uq5blacL_l3HutH7_jojAip56z9q0Ev3f91AF68LFmlXtI-TLrmFohv8rMDbJ7L9lYqaG_kPu34hewCz_mhyDXcQVKCXz7zBNzlLfxpI24NIi_ExchSmygpzjJ9e03Bh1ge85hHLTyOKLwGIKCdJEeytxFJ_l7ngq1VE3yRqW4na3L0SIXmqEfmMQMmF7UIvAM0rG9Wxd8LrF8N5E0NY8KLOD3t9ul8xX5yRGarK4GJUPWSGXHIcrORQzaTCuIZDQXbx-snwZKwi");
imagesService = ImagesServiceFactory.getImagesService();
imageOne = imagesService.getServingUrl(blobKeyOne);
imageTwo = imagesService.getServingUrl(blobKeyTwo);
imageThree = imagesService.getServingUrl(blobKeyThree);
%>
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
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="#">Home</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                <ul class="dropdown-menu">
                <li><a href="ViewFormalShirtsPage.jsp">View Formals</a></li>
                  <li><a href="ViewCasualShirtsPage.jsp">View Casuals</a></li>
                  <li><a href="ViewJeansPage.jsp">View Jeans</a></li>
                  <li role="separator" class="divider"></li>
                  <li class="dropdown-header">Nav header</li>
                  <li><a href="#">Separated link</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
      <li><a href="AdministratorLogInPage.html"><span class="glyphicon glyphicon-log-in"></span> Admin Login</a></li> 
              <li><a href="RegistrationForm.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="CustomerLogInPage.html"><span class="glyphicon glyphicon-log-in"></span> Login</a></li> 
            </ul>
          </div>
        </div>
      </nav>
          
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active shade">
        <img  src="<%=imageOne %>" alt="Chania" width="300" height="100" >
      </div>

      <div class="item">
        <img src="<%=imageTwo %>" alt="Chania" width="460" height="345">
      </div>
    
      <div class="item">
        <img src="<%=imageThree %>" alt="Flower" width="460" height="345">
      </div>

    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

  <footer class="footer">
      <div class="container">
        <p class="text-muted">&copy;&nbsp;Copyright Protected</p>
      </div>
    </footer>
</body>
</html>