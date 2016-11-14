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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Image</title>
</head>
<body>
<% 
BlobKey blobKey=null;
String imageUrl=null;
ImagesService imagesService;
String keyString=null;
BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
blobKey = new BlobKey(request.getParameter("blob-key"));
session.setAttribute("blob-key",blobKey.getKeyString());
imagesService = ImagesServiceFactory.getImagesService();
imageUrl = imagesService.getServingUrl(blobKey);
%>
<div style="width:80%; align:center">
<div style="display:block; float:left; margin-right: 10px;">
<img src="<%=imageUrl %>" alt="myImage"/>
</div>
</div>
</body>
</html>