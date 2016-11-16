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
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 550px; }
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
      width: 200px;
    }
        
    /* On small screens, set height to 'auto' for the grid */
    @media screen and (max-width: 767px) {
      .row.content {height: auto;}
    }
   .row{
   height: 300px;
   }

  </style>
<script type="text/javascript">
$(document).ready(function(){
    $(<%= blobKeyOne %>).click(function(){
        alert("The paragraph was clicked.");
    });
});
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
            <a class="navbar-brand" href="#">Delight Collections</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#">Contact</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li role="separator" class="divider"></li>
                  <li class="dropdown-header">Nav header</li>
                  <li><a href="#">Separated link</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
        <!--       <li class="active"><a href="./">Default <span class="sr-only">(current)</span></a></li>   -->
              <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li> 
            </ul>
          </div>
        </div>
      </nav>

<nav class="navbar navbar-inverse visible-xs">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Categories</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Dashboard</a></li>
        <li><a href="#">Age</a></li>
        <li><a href="#">Gender</a></li>
        <li><a href="#">Geo</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav hidden-xs">
      <h2>Categories</h2>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#section1">Formal Wear</a></li>
        <li><a href="#section2">Ethnic Wear</a></li>
        <li><a href="#section3">Casual Wear</a></li>
        <li><a href="#section3">Sports Wear</a></li>
      </ul><br>
    </div>
    <br>
    
    <div class="col-sm-9">
      <div class="well">
        <h4>Dashboard</h4>
        <p>Some text..</p>
      </div>
<div class="row">
        <div class="col-sm-3">
           <img class="img-thumbnail" src="<%=imageOne %>" id="<%= blobKeyOne %>" style="width: 150px; height: 236px;">
        </div>
         <div class="col-sm-3">
           <img class="img-thumbnail" src="<%=imageTwo %>" style="width: 150px; height: 236px;">
        </div>
        <div class="col-sm-3">
           <img class="img-thumbnail" src="<%=imageThree %>" style="width: 150px; height: 236px;">
        </div>
        <div class="col-sm-3">
           <img class="img-thumbnail" src="<%=imageOne %>" style="width: 150px; height: 236px;">
        </div>
      </div>
      <div class="row">
        <div class="col-sm-3">
           <img class="img-thumbnail" src="<%=imageOne %>" style="width: 150px; height: 236px;">
        </div>
         <div class="col-sm-3">
           <img class="img-thumbnail" src="<%=imageTwo %>" style="width: 150px; height: 236px;">
        </div>
        <div class="col-sm-3">
           <img class="img-thumbnail" src="<%=imageThree %>" style="width: 150px; height: 236px;">
        </div>
        <div class="col-sm-3">
           <img class="img-thumbnail" src="<%=imageOne %>" style="width: 150px; height: 236px;">
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>

