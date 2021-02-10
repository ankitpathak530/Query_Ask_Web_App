<%@page import ="com.tech.blog.entity.Post" %>
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
   List<Post> posts= new ArrayList<Post>();
  String cid=request.getParameter("cid");
  System.out.println("\n olllllllllllllllllllllllllllllllllllllllllllllllllllllllllllaaaaaaaaaa");
  if(cid.equals("Programming") || cid.equals("Web Technology") || cid.equals("Quants/Reasoning")
		  || cid.equals("Verbal") || cid.equals("0")){
	  if(cid.equals("0")){
		  posts = dao.getAllPosts();  
		  
	  }
	  else{
		  posts=dao.getPostByCatId(cid);
	  }
	  if(posts.size()==0){
		  out.println("<h3 class='display-3 text-center'>No Post is Available in this section.</h3>");
	  }
  }
  else{
	  int pById=Integer.parseInt(cid);
	  posts =dao.getAllPostById(pById);
  }

   for(Post p:posts)
   {
	 %>
	     <br>
	     <div class="card   mb-3 mr-4 mt-4" style="width: 21rem">
			  <div class="card-header text-white bg-dark"><%= p.getpCat() %></div>
			  <div class="card-body">
			     <h5 class="card-title"><%= p.getpTitle() %></h5>
			     <p class="card-text"><%= Helper.getTwentyWords(p.getpContent()) %></p>
			   </div>
			   
			   <div class="card-footer text-white bg-dark text-center">
			    <a href="show_blog_page.jsp?post_id=<%= p.getpId() %>"><button type="button" class="btn btn-outline-primary">Read More...</button></a>
			      <button type="button" class="btn btn-outline-success"><i class="fa fa-thumbs-o-up"></i></button>
			      <button type="button" class="btn btn-outline-success"><i class="fa fa-commenting-o"></i></button>
			 
			   </div>
		 </div>	 
	 <%   
	
   }
%>
</div>