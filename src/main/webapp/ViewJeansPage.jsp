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
blobKeyOne = new BlobKey("AMIfv97X8FEKeLVtdw1YOr8Zv0t3849vLD7Vqy_TZwTPndoefsXXBPk2W0GDYBddUDCXDRTkbPKBuYIxqKEQqcwlaQDYIFTskSkCglRCyOdMPLC_AS9G5Dj5LPQH4TpFpyhDGL8QCeL10XrEFBeVD9jOafThghcXQhsRI364FINoJzTQa7SitGDrqsttGkgO_eHgc3U_avgpkywFKvppqIWvw4LCtmtV_wa5MAZCLtnKIZZcTGIqjgQx8jDjJtCXH67qfanhcSab7QOSY3_5bcz1uBvf0OBwNPtLWOtSFk4n1lymaEviXyf_Pv5mV3j8v1Izl_iOta_zfY-8sQ4CokwGqsfOjerJryd7K2etJltFTU8qUcofoMY20FCPxmXQzy-XW9yna13Cp5QxCNEdRgt_ULCieP86ag");
blobKeyTwo = new BlobKey("AMIfv94PKkpat5j9fZOleMIArInauGJbAfoSHHuFpIayAisxAOtpNPsWdccSTtsitW38rYs2K8CtUKqBgem_RNl-UOfDEnKnK6H-7rqkPIDyabuMRevEuGAQ8LunFjj0PoJr54Oq2dRmSpXI6Q7_n9KwmaaPiUVKo49WzQvLPcdhe3b50bSwDpmAw0h8bU0o0ejuhhk1w_gymvOn8-TnfzkZA58O5Srk1QNIHCbBjPrFJotHTrsG-eYWHjoRQ2V3r-Af-4Z0KgYfADCUgf2AcJwL5Mqx926kxEgG8ptFAIfPZSzLchpIy0vWfgcpMol7z2ZnNkSCt5Ht3veIC30M-RkGpwDmTR2vPoZF7EYEhvUsPLdAhUIPYafkzQV-xXyl7qGqeXm0OAI1YOLdk0akSSZMI8c2KmF3HA");
blobKeyThree = new BlobKey("AMIfv9528kZM1SCaTEASFYnKi0W1xNaRA5egkinyTkjV-IRrAoCrzujTi_mdGPAyUQ5sfvfXrbW8dxHrn2hbMazyTNWrU3_GsxZcUmtimRodv3opQj0MqRHUycGsZe-jK-s7soxXONl5GoIN335qUW_obxP7y84yTjTMZRZYZGvHEbW7dP2yoBoJ2wL4_55pAU79LSM3nAdQtziynKdmqnjNX7Q9SyWge_-iNwKYUHc19rXHW05PbH5l1-jjlD4Grr4zjW6MnnRScu1hc5xYXwLWsDUhwW_djVCt1_lQrCpcWRFpFYv1UnX9yK6juNQcT401CEMds37tDKuw061jIMeaWcMTdujx1lUyO-DSHMVZgGMF2BZ5oeyFJKDfGAXGat1Bpi97zto210QywmVOzxFtoOYVCP8rKQ");
blobKeyFour = new BlobKey("AMIfv97TrKbHJSgBDgvHk9OE63p7wMzGOfx6eNmOAeU-HqErOlHJeRcV11exh4SLTUY-mtBMvXF2fVp9Wc4nWHl2EyMhtvAnSbHoiqlcxAxENjM1MZOylEz0NJ5wbr3KEs8-s8d3pLQXqsqPO-aCgY5JciV5M9hfhqh0xTCC1p3Exjn5Wt0UkzV3h1YpAZJ77nSWkNmJumcxbH5SbidMjcKtrCpsGbcBpBatF7GTPBVe3xa5tpZ5C1ux9VA2nSkQbKCz-CxwBGUV6KeKjmM1T9yhnPK7c83MJgand9kiv5vUfx2-IJWxweHn1v-u7dH-xJVUfEpq8Hi-MR_lHfGEKqfn5NYiJ0rZntvYCMlG9iMP18RyEhxE5AuXHdwNWIZ9aAMTEgOz6qBQh_3_oWd0YRO0OReH4QleZg");
blobKeyFive = new BlobKey("AMIfv96-uJ5bQm-ZSvnvcI587Dpx--ewINzRrjR1qQi_asc-zE_VTJhZyXiCfonwXsdvxJdyDPj4g2dqHoRZvBTD3SVgm2f1FNxlHWZ3YSzSHNi9brSj_hk6jaWaSYOvP67F6-HQtOi_52-EU5elGCiTqx3ilRAMEA7g-ppyUu-7OO9dl2wyW6tTUoD5fjcWKA9eQzOFJlvi3f2DfR2HCOn8GMx1m33lyMkDygBaEBXJuxJMjZ79u0GUjBByvdAUszpzrfpHhTl7pNDrladc-Hl_fOGSBQR4muvKM4stX_9XR-kNhZsbUgG8Mj8MTnskID5FlF6spxa_qi6M5BC9TNVdQGoutjZuWjbKersrHYwoJ5JFHB5RnUK_d8TeHpKNR38hK0u1ctLyr2XL4f1edE6aPzJwZ3Rtsg");
blobKeySix = new BlobKey("AMIfv94wPNoeqeQvA3NV1fKMRxaV8MlmbK6Kd0-3Ifssi6TvJSKXVD3gc5R3mZzIKpz1zNrXvKbOcwMBocGLY4c5h6OdHyYpiGqmAv5GJJ2cng20f3Q6etMVb0tZMzNxanCDMT6YUu3tdH3BAiIL_m2mqJlskssPIT-JFsHtRKNTPApxwiPu21lHHZl2nU534TLj2iXmhaf2FvdZySetUeaW_05f2deQtfPF0f5Ka0fr_18Er_B3-VC1GDl0qs62HyfhzxGzOy71IT2yRFqKnP5d1PsC86kMwxt_Ul7Ohti9ijd4I3PE5X0YWjYDz5orZ8GAjg-g_XUX7t5Xqn0HcLEq3WPMAm1uuQ1IyfHVXk8M9CBjHeajIENbn-SZdRkOcCAJesWZOncRWlf0I7Z79pzPJqxrYOPcDw");

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

