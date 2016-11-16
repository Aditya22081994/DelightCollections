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
<title>Insert title here</title>
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

</body>
</html>