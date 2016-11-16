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
blobKeyOne = new BlobKey("AMIfv952iTwOgbL2_PHNI5zHjDY9pb_fwKDdTzRrdcN9lYHlS2Ws99uvBex-9gY17hTZCutq0ScdaPDdnClEAt1ds2qs6cgLNWS3LwhIftmYyA5hb7zsWRGdwBPD-0Yx0sPikB_6qHEtbd_3GZ9x3V9kayc6bDJX5VXMJxxuPN2xlX7EfwDcNGrZaarVhGT1MquxHM_sI1y9bjXM9XeI-vFEtc4MFwVAqcVgh1pSvymLFbf5StMp7CFRNe3qE46le7IO3WnXjNXoAg6GJ-6WatQxTjbbEg7yFYxHwyh7vAEsPToOPd6SmSc3i0IeBp_lBxNwjRkpzbDWKtaTmAd771Zhr0le1WRw4dAO7njKmg4TVPKsBaJW-99j8lkcyxfJXHvFYyHpW917xdp23OUVevGSAY6rp_2vpw");
blobKeyTwo = new BlobKey("AMIfv94TKyRiatZ_whzDDKWcBN9exmz4dEDYnYGtbjGPZEYdDLi9TtJWWo0vIjgLLtIcxMIhRNplIpsFpam1W9nVQSbev38rk1D5dGKqeauNKmCklz03DmkGaSR3pTmdq89B8sjClA27-G9hvj_LQCq9J1FDWXQr5CWmMJlVcJ7bAw_qYMJ7dHQ1aeiT2AUeJ0nP3VO19UaH_gN-_LYmb21h6QNwaTrC8TF_QiFRG3BIgxeQd-uzA5ax613HMY9mD1I4TsHY3Q56cAc3Z7uGpGDNn2dafBTC6pw7ZO1k71W47CYzFQuQsoqqI--9hL4oayySjDIOMd_M-IDg3NHhvXMcaiw3aiWD6_UnaOs2h2VueuC3tEETBJ0Hza48KudfCR5oXXjL0G0HUtHjb9r6ZIx9nvGwLeE8Jg");
blobKeyThree = new BlobKey("AMIfv97AOK9I1ItI-goBaL_4VEZSsjmjN9mZVwTlep5EGVn0_Fzk8Ou3U2Nmny_q_3JWH3nkELEZauYTX4XLVEzYKB3pCyLCIF-KQcB8KiNJKyl3eRBYWNb59kzsQ8UD-mbYVvfGQVrVbA4zwbK8RybRolBUObzYDywXhrO_j15VCmK6xYETnWCqBgfqxJ9cDqfF_hdKcqI2pIK6qGhLzfhzg68HnNrW2qOJofK4aqQoD2LhLv23E9AElZ6RoKKjLseE2QJUDok-2lLXgmR6EvEuGHFHhqY90WfilkbNID0Ujs_iSVkGO89loglYRGC6Rb4BDbseaBIqYOSKy7QJk0hxdxW-360d0utNcqfHrOifYj9bU_QOM8cdsKIlg2fAIUjBHLNoEEPodPpZOIhjBSJ5XgcvoZihLA");
blobKeyFour = new BlobKey("AMIfv97ImPIt6IqWqVdT0cVSAI7_Mr0g5afFDMzW-sLb9lellKImfxgyJhwD6MIykbnBAVNR_3DNBuHer9iAbjpzy-Fkw8eC0d7rkS0Zmfb6FPS_AhUefijATiaBVWpp9vgpjTHMQWfusy6wD50Pcp53OBBD61XGDon6sS_47VUjy4LYkxdnfW9ETCcgFaJYsrWbfnCk4aCVO39Sl69x_2K6veec5eOP5SHNSKg-xoE1Akrk_PO7SQVS65tn1d4EMHogZ_mpo4qW32uDKGHYTaBPiu0G_czaT434SouJ_4VcTRtfovhk89s84mshVAIFlzv85uy2FldkNXMmf5IvAbQ5yvFw5eLUewr7MCIXjtLkmlr5Mm0q7VLSqYZlHSbx_983ky-2Aq4gXARRefp6bQKiiFummOUjoA");
blobKeyFive = new BlobKey("AMIfv94yUwZxWVkmliOyVrATw-lhuDAI2u5nsG9-BzoSB0AYk_DO1VEr1ISkcKX8LeE86FdKb5KV2v0qw3Z3z4HYxh1MjgFRDma8xkqic4vabsJlXj5e5wWPxriB4ItVuqMl74x5mOOPNRfFW-qrKulFqpQkJQ5RvsVcDK-RN5SUynHmnQtY8GeqknX3GXmJzEYayWILt2JmmzQ4toU0TN-DOhlewpUPobFQRnefSGh6v_gLeWskojF8h7LCaTNm1YQWuc6jUdB2rpvzH-KsOjauTbr5M49dyGYTt8Kyloxq13QjHXrffMJTedrRj1nHRV9JZM_Jy0nQF6vW1dz77tGkKG_CPJKEvvBijHpdTOFyWy36iPIYYF8tPNABctzdUm8stFgmWjfQJIAPtmDVJIbvO-170JwYBA");
blobKeySix = new BlobKey("AMIfv95Ec9lwjM54quN6a96tLEVDVvGNk99QirR8oePn-hm7MmgOVF_Arc_bFRqmXiIdRjbfKjOYjZx-eGagi_vrDrThhT-Hq1DFgzoFnBRB5lTzqN5VC047ix_1GTm5qnof-jpVNLlW6Vk-xjaJRRrL4C3645fH1MFcI6hCP5NC84dCviZd6sWtsTOAVY0LiZwhzj_0R1CQdyP_psvRHZMcbxQk1cp_K8PDdrgdKLnpj7DFwHuXv-wL74PoIrx2ecgGkbSdKvQ0Flf5wVs2HIkwIUn6KNe4Y5gaiuzKFB5gUAnsklUAVY8x5oRy4QYlk_RGM-ohAFk_sK8kdSMfvt5AvgpA8tVkZZjbwm6asFq6PbBZgiH7f4pxz7piJPKjD9rhBKvI2lZc0c6cSgCqd72vaZ-ZTAhjAw");

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

