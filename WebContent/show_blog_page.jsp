<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page errorPage="error_page.jsp" %>
 <%@ page import="com.tech.blog.entity.User" %>
 <%@ page import ="com.tech.blog.helper.MY_CNX" %>
 <%@ page import ="com.tech.blog.dao.UserDao" %>
 <%@ page import="com.tech.blog.entity.Post" %>
 <%@ page import ="java.util.*" %>

 <%
   int postId=Integer.parseInt(request.getParameter("post_id"));
   UserDao dao = new UserDao(MY_CNX.getConnection());
   
   Post post =dao.getAllPostDetailsById(postId);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- Css -->
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
        body{

 background-image:url("images/bg.jpg");
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
        </style>
</head>
<body>
   <%@include file="header.jsp" %>
   <br><br><br>
     <div class="container  text-center">
       <div class="row" >	
          <div class="col-sm-2"></div>
          
           <div class="card col-8 mb-3 mr-4 mt-4 text-center" style="width: 21rem;">
			  <div class="card-header text-white bg-dark"><%= post.getpCat() %></div>
			  <div class="card-body">
			     <h5 class="card-title"><%= post.getpTitle() %></h5>
			     <p class="card-text"><%= post.getpContent() %>.</p>
			     <p class="card-text"><%= post.getpCode() %>
			   </div>
			   <p Style="text-align: right;font-weight:100;"><em>Posted by <%=post.getpBy() %><br>
			   on <%= post.getpDate().toLocaleString().toString() %></em>/<%= post.getpId() %>
			  
			   <div class="card-footer text-white bg-dark text-center">
			    <a href="login.jsp"><button type="button" class="btn btn-outline-primary">Contribute Post</button></a>
			      <button type="button" class="btn btn-outline-success"><i class="fa fa-thumbs-o-up"></i></button>
			      <button type="button" class="btn btn-outline-success"><i class="fa fa-commenting-o"></i></button>
			   </div>
		   </div>
		   
          <div class="col-sm-2"></div>         
	    
     </div>
   </div>
</body>
</html>