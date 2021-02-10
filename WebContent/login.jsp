<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.tech.blog.entity.Message" %>
<!DOCTYPE html>
<html>
<head>

<title>Login page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<meta charset="ISO-8859-1">
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
  <main class="p-5" style="padding-bottom: 50px;">
     <div class="container">
         <div class="col-md-4 offset-md-4">
              <div class="card ">
                  <div class="card-header text-white bg-dark text-center">
                     <span class="	fa fa-user-circle-o"></span>
                        <br>Login               
                  </div>
                  <%
                     Message m= (Message)session.getAttribute("msg");
                     if(m!=null){
                     %>
                    	 <div class="alert alert-danger" role="alert">
                            <%= m.getContent() %>
                         </div>
   				    <%
   				          session.removeAttribute("msg");
                     }
                  %>
                  
                 
                  
                  <div class="card-body">
                  
                         <form action="LoginServlet" method="post">
                             <div class="form-group">
							    <input type="text" class="form-control"  placeholder="Username or Email" name="username">
							  </div>
							  					
							   <div class="form-group">
							    <input type="password" class="form-control" id="exampleInputPassword1"  placeholder="Password" name="password">
							  </div>
                              
							  <div class="form-group form-check">
							    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
							    <label class="form-check-label" for="exampleCheck1">Remember me.</label>
							  </div>
							  <div class="container text-center">
							  <button type="submit" class="btn btn-primary text-center">Login</button>
						      </div>
						      <a href="register_page.jsp" style="font-size:x-small;margin:65px;" >Don't have account ? Create account</a>
						</form>
		
                  </div>
                  <div class="card-footer">
                  
                  </div>
              
              </div>
         
         </div>
     
     </div>
  </main>
  
</body>
</html>