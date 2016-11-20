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
.alignpos{
line-height: 60px;
}
</style>
</head>
<body>
<% String admin=null;
if(session.getAttribute("admin")==null){
	response.sendRedirect("AdministratorLogInPage.html"); 
} else{
admin=session.getAttribute("admin").toString();
}
%>
<% 
BlobKey blobKeyOne=null;
BlobKey blobKeyTwo=null;
BlobKey blobKeyThree=null;
String imageOne=null; String imageTwo=null; String imageThree=null; 
ImagesService imagesService;
String keyString=null;
BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
blobKeyOne = new BlobKey("AMIfv967v4Q07uAhVUARmK-E_C5BccmwiLrWWDXYNZp7grMjgUIJ8cHFrgn9TKstGLY6mEkPE1BH5NlGfIByQamPyLTODPz5pt6Iuu8qxeX0G5BcozMeWM5cb-s4MuQ6HGZDFycrDQyAOmb0GO_d97Rbg8TJuAhlCmlXxUnKxUkTvmE2YFSfgr8Xpuut2CuN3WBCULrM5eYrDQTcngKiLOaUJEwjIGA4UOaU5P6V_Poiu07n5YlSJaCcdeZrCP4cIryeaZJ4C1NMWTV_TE307SjANGECe7JnySBX9YBT22S7qijRZr1Hf2NBtopppVx4XoipVj3cnV-4BqIYAfOJXiuv6UdClVPb_gc4aJGOwboWRI3V-4dEy7G3nXbC406s5XRPd5ezdDeaEV9EXITu5sxzQJAkzgvdOUgDcctDgHIGgc-M7GuNe7cx5WxbJ8fzKayYyNMBdTjb");
blobKeyTwo = new BlobKey("AMIfv97G7dEXQ704Q5Jfzvx303mGzIZNl_bZP4qsI-KUkKuOD4lgFRMbOrkPkTEvZD1mnWTAInoo4DWKtWJSkWXAIq6TGfCv0P8EXuhbUqcwhcInBjI7RAc96hVs3wZbg8XJDZcIACsFtzGJ1p2USKgJT9JQJM_849X0FFcerGWGhrJKB0aaZth2w3dBzCUgHB6YSIbz2Qkq3yMCHRg1YCxhIKpzDg1PRYyZtjxtRWjzSoAuTOj83M_dBM5jLmUG_i2iuxEuVTzHE_3hekv-9h7hPn66hh7RDyA4Cei7I80qf0M0nSuayFFfOHoUTQMpERtJXcnWAmeD056BU57lh-BMhSoHfKPvgioa-cTyQ3z5pNLrQApnkOsuBLU2diV2fIyD1sIJcuf3M1wzezrV0ZrkdOmKChQjTvRbPAd6XA7H9LJ7pgcBqVQZZ83AD-Orh4l_U_ZKpz-d");
blobKeyThree = new BlobKey("AMIfv97aWxBOQ0RlLlEtL4owm2kTUXLNZdENu3uaqJB5dnlsEf5H0UFF7xhlbbfB_SeMcYs9n8avq5p9BnzVEBBy_atcFNaspnYUgbFBpOETadruOvmgPc3L_9lM-qiIQCEp3E-jU6NPV_v30hzGKPjgZ4BtEpwL8U-4aU5C-rNL-80tzERoNhk9hJyJ6FmLQDHZIUDBdSVu7n6pyTp0TFhdkPxNh-1nIiPmlZHIC0Y3QIe6zfReTK4uy2mglhvVh6ZkjTBHKfg_moX6zBfKTerdjPoX9N3cSK_rHrZDIpLVurW5BXPU-EU27Qgtx9wKHE3zSEVB_EDd-HWwVHqN7LVyYVB9aQ6hjAc3KPD3QCwMYiyZkoNL8T-9albPuxIwbPQkrp9-f9fPFlRsPnPzG2a_pUuIK7riS-eZhwVxqa21w4Etj4VYSx3C9IrnF-iBwXEu2wiHf8rx");
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
            <a class="navbar-brand" href="AdminHomePage.jsp"">Delight Collections</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="AdminHomePage.jsp">Home</a></li>
              <li><a href="UploadImagePage.jsp">Upload Image</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Categories <span class="caret"></span></a>
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
            <li><a href="#"><b>Welcome <%= admin %></b></a></li>
      <li><a href="adminlogout"><span class="glyphicon glyphicon-log-out"></span> LogOut</a></li> 
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
        <img  src="<%=imageTwo %>" alt="Chania" width="300" height="100" >
      </div>

      <div class="item">
        <img src="<%=imageOne %>" alt="Chania" width="460" height="345">
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

<jsp:include page="FooterFile.html" /> 
</body>
</html>