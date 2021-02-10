<%@page import ="com.tech.blog.entity.Book" %>
<%@page import ="com.tech.blog.dao.UserDao" %>
<%@page import ="com.tech.blog.helper.MY_CNX" %>
<%@page import ="java.util.List" %>  
<%@page import ="java.util.ArrayList" %> 
<%@page import ="com.tech.blog.helper.Helper" %>

<html>
 <head>
   <style>
body{

 background-image:url("images/bg.jpg");
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
  @media screen and (max-width: 60px) {
  div.card {
    display: none;
  }
}


   </style>
 </head>
</html>  

<div class="row">
<%
   UserDao dao = new UserDao(MY_CNX.getConnection());
   List<Book> books= new ArrayList<Book>();
  String cid=request.getParameter("cid");
  
  if(cid.equals("Programming") || cid.equals("Web Technology") || cid.equals("Quants/Reasoning")
		  || cid.equals("Verbal") || cid.equals("Other")){
	  
		  books=dao.getBookByCatId(cid);
		  System.out.println("up to ok--"+books.size());
    }  
   for(Book b:books)
   {
			 %>
				<br>
	     <div class="card mb-3 mr-4 mt-4" style="width: 15rem">
			  <img src="images/books/<%= b.getbPic() %>" class="card-img-top" alt="..." width="100%" height="200">
			  <div class="card-body text-center">
			        <div class="card-title"><%= b.getbTitle() %></div>
				    <div class="card-title" style="font-size: 80%;">Author-<%= b.getbAuthor() %></div>			     
				    <a href="<%= b.getbLink() %>" class="btn btn-primary">Download</a>
				  </div>
		 </div>   
         <%
   }
 %>
 </div>