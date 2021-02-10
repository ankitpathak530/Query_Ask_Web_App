<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sory something went wrong.</title>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
   
    <div class="container text-center">
       <img src="images/warning-sign.png" class="img-fluid">
       <h3 class="display-3">Sorry ! Something went wrong...</h3>
       <%= exception %>
       <a href="index.jsp">
      <button type="button" class=" btn btn-primary"><span class="fas fa-arrow-alt-circle-left"></span>Home</button></a>&nbsp;&nbsp;
  
    </div>
</body>
</html>