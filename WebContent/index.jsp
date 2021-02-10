<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  
<meta charset="ISO-8859-1">
<title>index</title>
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
 
   <!-- banner -->
   <div class="container-fluid " id="tp">
      <div class="jumbotron">
        <div class="container">
           <h3 class="display-3">Welcome to TechLearn </h3>
           <p>Push yourself<br> Because no one is going to do it for you.</p>
        </div>
      </div>
   </div>
    <!-- main body of the page -->
             <main>
                 <div class="container">
                    <div class="row mt-5">
                        <!-- first column -->
                         <div class="col-md-4">
                            <div class="list-group"><br>
							  <a href="#" onclick="getPosts('0',this)" class="c-link list-group-item list-group-item-action active">
							    All Post
							  </a>
							  <a href="#" onclick="getPosts('Programming',this)"     class="c-link list-group-item list-group-item-action">Programming</a>
							  <a href="#" onclick="getPosts('Web Technology',this)"  class="c-link list-group-item list-group-item-action">Web Technology</a>
							  <a href="#" onclick="getPosts('Quants/Reasoning',this)"class="c-link list-group-item list-group-item-action">Quants Reasoning</a>
							  <a href="#" onclick="getPosts('Verbal',this)"          class="c-link list-group-item list-group-item-action">Verbal</a>
							</div>
                         </div>
                                                  
                         <!-- second column -->
                         <div class="col-md-8">
                            <!-- all post here  -->
                            <div class="container text-center" id="loader">
                               <i class="fa fa-refresh fa-4x fa-spin"></i>
                               <h3 class="mt-2">Loading...</h3>
                            </div>
                            
                            <div class="container-fluid" id ="post-container">
                            
                            
                            </div>
                         </div>
                    </div>
                 </div>
             </main>
        <!-- end of main body of the page -->
        
        
   
   
   <!-- cards -->
   <!-- end of cards -->
   
   
		 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        
    <!--loading post using ajax-->
        <script>
	        function getPosts(catId,temp){
	        	$("#loader").show();
	        	$(".c-link").removeClass('active');
	        	  $.ajax({
	          		url: "load_posts.jsp",
	          		data: {cid:catId},
	          		success: function(data , textStatus,jqXHR){
	          			console.log(data);
	          			$("#loader").hide();
	          			$("#post-container").html(data);
	          			$(temp).addClass('active');
	          		}
	          	  })
	        }
	          $(document).ready(function(e){
	        	  let reference = $('.c-link')[0];
	        	  getPosts('0',reference);
	          })
	        
        </script>
         <script>
	        function getBook(catId){
	        	$("#loader").show();
	        	  $.ajax({
	          		url: "load_book.jsp",
	          		data: {cid:catId},
	          		success: function(data , textStatus,jqXHR){
	          			console.log(data);
	          			$("#loader").hide();
	          			$("#post-container").html(data);
	          			
	          		}
	          	  
	          	  })
	        }	        
        </script>
 
</body>
</html>