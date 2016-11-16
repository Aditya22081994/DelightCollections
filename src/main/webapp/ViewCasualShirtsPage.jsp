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
BlobKey blobKeyThree=null; BlobKey blobKeyFour=null; BlobKey blobKeyFive=null; BlobKey blobKeySix=null;
String imageOne=null; String imageTwo=null; String imageThree=null; String imageFour=null; String imageFive=null; String imageSix=null;
ImagesService imagesService;
String keyString=null;
BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
blobKeyOne = new BlobKey("AMIfv95pbROBwx20LeOPvEJIbI1iA-S6cscNz2zgCJMshO-lOJ8JNdzWK1p3bgTIpErCfy-U7iexKs6cYScv59AQXRTqBmZjF1sYaJJ-UUojPVhqqKK6qxqquJ7P7jexFD8aUREoglJPYsaXZjY_u4XKaPa9ALpB32exu3pfFeOsSbplyAyPR9Pt9WedRB0ndExeHxPCwkxidPg8kDVRC-2AlUvNHKTPFYKIrQV7sU_KXtlbCpl1W7jJwRnH0KkCvRrjU-Y-Hm7Ox32mNGzSpjJXmGL1Nc9_pbbTxejFOg9cLDVu8-3DfG5F3F59ezkAg1M9nNMfQID5yuKmMHFM0c4YUfRwBMMhn93FN5b9Z_lKjyvKRdySNghsjiBfQ9MQIMd7vGKVXQP60Dy0uRGkoqmNXkwpvl5gIg");
blobKeyTwo = new BlobKey("AMIfv95aYik3qqfxkrYkNMDY_jkDBD2u1iEMGeIWYW6Oh0D2rR5BHKobY0dGKb1ibfy3Q5EWvqKWnW4ydmhD5AH75Zpz1obNLv-0g0-TSPH1Jkqt4R_S7t_fjtAcHwaaDHBaKQi-TPhiwgIibXFDmdYrX8BrZ5s8qc_R5QEpJePhJkxR55o75HvTKrsigWRKvAt90dud8Ly4VZRjpiAUhVMO5PZviYYpuyr49ZcUQM00XM2UufoFapKCQ5fZsF-bYTvgJgk1ZNTsUIOx0MxP5-owqXNUuHf_6BoTWnUjdVboIL0C-jI9Vbup2pLgThEOo-I0A7DaUCBazsyVpaG-b_GyB1mLS4I9MHx2lnfSfw74lIFCIqJ4J2VQECQEACNaS98OlK5bg9gNGp6GvQun8VGaWam5QO9pBg");
blobKeyThree = new BlobKey("AMIfv941P3wP6yteTG1IxW_die-xkgBu41fuQokjo3wWP1j8f838g4UgxKBcv2rgTxPxwsOoH1jlFN1L0olgzDSs4f32_6_IB1rNNJsyktEsdY0Pa1PHA4BN_rk0aeDcir-UUrf2SilLXlA47--FqaGRQKuaLheXi26LHE_qJ9E9ZPXPPiSx0DiAxjH9F4LgjpfT2G_ppcPpj7d3hZyeMs8QR7wTfRiSh0PSMhB9S6xutAqY66BZFEfbQwT9DFCeq5Peo5alT3JMtIU2agI6Moi-Mgrgo9QM9igReAI3QEahYYNYRJMX0Rogy3BEbL4Vf6erYLbEdhrHGSKuaT5z5rNz0iJfdT-h3guExZ-SOyYftcoA3we09heI7zNMUcBiVL7eP1I77IkN6DKt-SAOYjxrwvCLklZ-ig");
blobKeyFour = new BlobKey("AMIfv947U0nXNCtnv0Vn3J6GpdYRdbsmJRg6p3h-IPeSXz4njjDnAfn4uUiU_Vc-F53l6DqET5bO6jSN_Dj99kRaJPsvt6-fIH4f-cmkiNVDF0BY_zwIuq8VEMnLR9Rd6mqb4brXjQebNOXU7rRdZAmptY4jLNGNNyfNEIRSgWSL-49M24IWLimY5y27WMl-9QtXM6xeIQ3QekOC02RZjlLN5vVGUR5uFWIi-U7z8XU4q_Pr0sH14KZxoNP0sI26r1Jru-V4eiDsOUmZZtT6hE-227k2VmnOiSbi4G-fiJ8TpZVvs2Mkaha9h0Sm5_JHpBEpTuqte37MIpal1rtLE8o2k6X6IFVgne5GPXOlV6_hEf7ZW46bB1-exQPx_lo1fEIyI6cZltSj-S2ADNWB4QE4bCnWueHJJQ");
blobKeyFive = new BlobKey("AMIfv94fvU1Nz4pwcpGnyeKBZCoHby1bj--9NKuqmN_XuloeYQWzCXvgkM6kT2uX2uXuxj00Ka96NWdO240kCSkJbQ00vBwrcLHIdDg4WjTVofhWgfeHdxQqt-wpU_Za6h0g6jqYmXjUHH3YAboz8n5xFjJ77PekU4x4SbUqSDH-lFtcKjVkqt0rmTzqu2ftqGxiFfjrDHowdjlD2XzdAW9r2PCcY5Awt08SuJKUr8OYU22ydq4XP9Ty9LKnSGDsbsN_1V-LjIAk0qkHbOZGBCxdTtBrokZlW8IADyHw4L4TYb3v47rKEdtJlUFexNKQ8RY8FcMapuNNHQChty4HCHrWmzVtYtqpjLEQJ-2iVV8nrNV6d3l7-knN7H9PTM0l-5AiZ6GoLXGjxkYqVqrJquITBEXpC5Qu_A");
blobKeySix = new BlobKey("AMIfv97ADt0wrBfE5BLI5Kx9NDebVIt9LQ2emYy72iwqXSfDnU3Ib54DCEeUrdVcZqySEF3GqN3V2bGNSG8zQulNFWealyb5Vvffmobnehx6ahKB-j7Sdr-DM5uVjPitMqc0kWRd-OfpvUcZXYbLUdlP6Br1HUkb8frQ1hCDC7a5tljV-d-2IkGOX4yNXZagkdSKTi1H6mYW7JacNSI7EgJr4CcRni7pnM99fNQnRhZygo2mcrd5qNm6z3aMIjJ1cemp3wLmuCghWxaFEFPhyBnfsD6mlOwJ35eZdhLjw2U0pOv-7hpjBVzvAcysFE_Hfru3yQju1bWzFxyqd2iZ7EtdWHvLfZ2q3vm50kCpwrF5NGdq7SbtT7eT38vCTWzALUaeJrlzJUFgdItxqTF5XPKcvKdVZo2mKw");

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
           <img class="img-thumbnail" src="<%=imageOne %>" id="<%= blobKeyOne %>" style="width: 150px; height: 236px;">
        </div>
         <div class="col-sm-3">
           <img class="img-thumbnail" src="<%=imageTwo %>" style="width: 150px; height: 236px;">
        </div>
        <div class="col-sm-3">
           <img class="img-thumbnail" src="<%=imageThree %>" style="width: 150px; height: 236px;">
        </div>
        <div class="col-sm-3">
           <img class="img-thumbnail" src="<%=imageFour %>" style="width: 150px; height: 236px;">
        </div>
      </div>
     <div class="row">
        <div class="col-sm-3">
           <img class="img-thumbnail" src="<%=imageFive %>" style="width: 150px; height: 236px;">
        </div>
         <div class="col-sm-3">
           <img class="img-thumbnail" src="<%=imageSix %>" style="width: 150px; height: 236px;">
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>

