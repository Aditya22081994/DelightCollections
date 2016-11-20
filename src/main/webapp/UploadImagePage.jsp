<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
    <%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
    <% BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();  %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Upload Image</title>
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
      
<form class="form-horizontal" action="<%= blobstoreService.createUploadUrl("/uploadimageservlet") %>" method="post" enctype="multipart/form-data">
             <div class="form-group">
      <label class="control-label col-sm-2" for="text">Upload Image : </label>
      <div class="col-sm-6">
        <input type="file" class="form-control" name="myFile"/>
      </div>
    </div>
    <div class="form-group">
<div class="col-sm-offset-2 col-lg-10">
<button type="submit" class="btn btn-primary">Upload</button>
</div>
</div>
</form>
<jsp:include page="FooterFile.html" /> 
</body>
</html>