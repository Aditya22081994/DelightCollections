<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
    <%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
    <% BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();  %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload Image</title>
</head>
<body>

<form action="<%= blobstoreService.createUploadUrl("/uploadimageservlet") %>" method="post" enctype="multipart/form-data">
            <input type="text" name="imagename"/>
            <input type="file" name="myFile"/>
            <input type="submit" value="Submit"/>
</form>
</body>
</html>