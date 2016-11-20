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
   <%@ page import="com.Images.BlobKeyValues" %>
   <% 
   BlobKey blobKeyOne=null;  BlobKey blobKeyTwo=null;  BlobKey blobKeyThree=null;  
   BlobKey blobKeyFour=null; BlobKey blobKeyFive=null;  BlobKey blobKeySix=null;

   String imageOne=null; String imageTwo=null; String imageThree=null; 
   String imageFour=null; String imageFive=null; String imageSix=null;
   ImagesService imagesService;
   
   BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
   blobKeyOne = new BlobKey(BlobKeyValues.formalOne);
   blobKeyTwo = new BlobKey(BlobKeyValues.formalTwo);
   blobKeyThree = new BlobKey(BlobKeyValues.formalThree);
   blobKeyFour = new BlobKey(BlobKeyValues.formalFour);
   blobKeyFive = new BlobKey(BlobKeyValues.formalFive);
   blobKeySix = new BlobKey(BlobKeyValues.formalSix);

imagesService = ImagesServiceFactory.getImagesService();
imageOne = imagesService.getServingUrl(blobKeyOne);
imageTwo = imagesService.getServingUrl(blobKeyTwo);
imageThree = imagesService.getServingUrl(blobKeyThree);
imageFour = imagesService.getServingUrl(blobKeyFour);
imageFive = imagesService.getServingUrl(blobKeyFive);
imageSix = imagesService.getServingUrl(blobKeySix);
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
function functionOne(clicked_id){
	if(clicked_id=="1fs"){
		window.location = "ShowCaseFormals.jsp?blobOneKey="+"<%=BlobKeyValues.formalOne %>";
	} else if(clicked_id=="2fs"){
		window.location = "ShowCaseFormals.jsp?blobOneKey="+"<%=BlobKeyValues.formalTwo %>";
	} else if(clicked_id=="3fs"){
		window.location = "ShowCaseFormals.jsp?blobOneKey="+"<%=BlobKeyValues.formalThree %>";
	} else if(clicked_id=="4fs"){
		window.location = "ShowCaseFormals.jsp?blobOneKey="+"<%=BlobKeyValues.formalFour %>";
	} else if(clicked_id=="5fs"){
		window.location = "ShowCaseFormals.jsp?blobOneKey="+"<%=BlobKeyValues.formalFive %>";
	} else{
		window.location = "ShowCaseFormals.jsp?blobOneKey="+"<%=BlobKeyValues.formalSix%>";
	}
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
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="HomePage.jsp">Home</a></li>
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
        <li><a href="ViewFormalShirtsPage.jsp">Formal Wear</a></li>
        <li><a href="ViewCasualShirtsPage.jsp">Casual Wear</a></li>
        <li><a href="ViewJeansPage.jsp">Jeans</a></li>
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
           <img class="img-thumbnail" id="1fs" src="<%=imageOne %>" onclick="functionOne(this.id)"  style="width: 150px; height: 236px;">
        </div>
         <div class="col-sm-3">
           <img class="img-thumbnail" id="2fs" src="<%=imageTwo %>" onclick="functionOne(this.id)" style="width: 150px; height: 236px;">
        </div>
        <div class="col-sm-3">
           <img class="img-thumbnail" id="3fs" src="<%=imageThree %>" onclick="functionOne(this.id)" style="width: 150px; height: 236px;">
        </div>
        <div class="col-sm-3">
           <img class="img-thumbnail" id="4fs" src="<%=imageFour %>" onclick="functionOne(this.id)" style="width: 150px; height: 236px;">
        </div>
      </div>
      <div class="row">
        <div class="col-sm-3">
           <img class="img-thumbnail" id="5fs" src="<%=imageFive %>" onclick="functionOne(this.id)" style="width: 150px; height: 236px;">
        </div>
         <div class="col-sm-3">
           <img class="img-thumbnail" id="6fs" src="<%=imageSix %>" onclick="functionOne(this.id)" style="width: 150px; height: 236px;">
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="FooterFile.html" /> 
</body>
</html>

