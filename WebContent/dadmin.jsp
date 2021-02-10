<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.MY_CNX"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entity.Message"%>
<%@page import="com.tech.blog.entity.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    String user=(String)session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("admin_login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PROFILE Page</title>
       <!-- CSS -->
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
  
    <!--NAVBAR--> 
       <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="position: fixed; top: 0; width: 100%;z-index: 2;">
		  <a class="navbar-brand" href="#"><i class="fa fa-desktop" style="font-size:36px"></i>TechLearn</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item active">
		        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
		      </li>
		     
		      <li class="nav-item dropdown">
		        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          Course
		        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		          <a class="dropdown-item" href="#">Programming language</a>
		          <a class="dropdown-item" href="#">DataStructure</a>
		              <div class="dropdown-divider">--------------</div>
		          <a class="dropdown-item" href="#">Aptitude</a>
		          <a class="dropdown-item" href="#">Reasoning</a>
		          <a class="dropdown-item" href="#">Verbal</a>
		       </div>
		     </li>
		     <li class="nav-item">
		        <a class="nav-link" href="#">About Us</a>
		     </li>
		     <li class="nav-item">
		        <a class="nav-link" href="#">Contact</a>
		     </li>   
		     <li class="nav-item">
		        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal">Do Post</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#" data-toggle="modal" data-target="#delete-post-modal">Delete Post</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-book-modal">Add Ebook</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#" data-toggle="modal" data-target="#delete-book-modal">Delete Ebook</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#" data-toggle="modal" data-target="#delete-book-modal">Add user</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#" data-toggle="modal" data-target="#delete-book-modal">Delete User</a>
		      </li>
		    </ul>
		    <ul class="navbar-nav mr-right">
                 

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus"></span> Logout</a>
                    </li>        
             </ul>
         </div>
    </nav>
        <!--END OF NAVBAR-->
        
 
        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div> 

        <%
                session.removeAttribute("msg");
            }
        %>



 <!-- Modal -->
 
         <!--add post modal -->
		<div class="modal fade" id="add-post-modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">Give post details.</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <form id="add-post-form">
		            <div class="form-group">
		               <select name="cid" id="cid">
		                    <option selected ="DISABLE">---Select Category---</option>
		                    <option value="Porgramming">Programming </option>
		                    <option value="Web Technology">Web technology </option>
		                    <option value="Quants/Reasoning"> Quants Reasoning </option>
		                    <option value="Verbal">Verbal</option>
		                    
		               </select>
		              </div>
	                   <div class="form-group">
	                     <input type="text" id="title" name="title" placeholder="Title of the post" class="form-control"/>
	                   </div>		           
			         
			            <div class="form-group">
			                <textarea id="content" name="content" placeholder="Write content." class="form-control" style="height:200px;"></textarea>
			            </div>
			            
			            <div class="form-group">
			              <label for="myfile">Select image:</label>
                          <input type="file" id="image" name="image">
			            </div>
			             <div class="form-group">
			                <textarea placeholder="Program." name="program" class="form-control" style="height:200px;"></textarea>
			            </div>
			            <div class="form-group">
							    <input type="checkbox" value="admin" name="check">
							    <label class="form-check-label" for="exampleCheck1">I am Admin</label>
						 </div>
			            <div class="container text-center">
			                <button type="submit" id="submit-btn" class="btn btn-outline-primary">Post</button>
			            </div>		         
		         </form>
		      </div>	      
		    </div>
		  </div>
		</div>
         <!-- end add post modal -->
      
      
        <!-- add EBOOK  -->
		<div class="modal fade" id="add-book-modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">Give Book details.</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <form id="add-book-form" enctype = "multipart/form-data">
		            <div class="form-group">
		               <select name="bCat" id="bCat">
		                    <option selected ="DISABLE">---Select Category---</option>
		                    <option value="Programming">Programming </option>
		                    <option value="Web Technology">Web technology </option>
		                    <option value="Quants/Reasoning"> Quants Reasoning </option>
		                    <option value="Verbal">Verbal</option>
		               </select>
		              </div>
	                   <div class="form-group">
	                     <input type="text" id="bTitle" name="bTitle" placeholder="Title of the Book" class="form-control"/>
	                   </div>		           
			         
			            <div class="form-group">
			                <input type="text" id="bAuthor" name="bAuthor" placeholder="Author Name." class="form-control" />
			            </div>
			            
			            <div class="form-group">
			                <input type="text" id="bLink" name="bLink" placeholder="Paste link here." class="form-control" />
			            </div>
			            
			            
			              <div class="file-field input-field">
					            <div class="btn">
					               <span>Book page icon</span>
					               <input type="file" name="image"></input>
					            </div>
      					   </div>
			            
			           
			            <div class="container text-center">
			                <button type="submit" id="submit-btn" class="btn btn-outline-primary">Post</button>
			            </div>		         
		         </form>
		      </div>	      
		    </div>
		  </div>
		</div>
        <!-- end add EBOOK -->
          
      <!-- delete post modal -->
     <div class="row text-center">
         <div class="modal" id="delete-book-modal" tabindex="-1">
            <br><br><br><br><br>
			  <div class="card" style="width: 15rem">
			    <form  action="DeleteToEbook" method="post">
			      <div class="card-bodyr">
			         <input type="text" name="bId" id="bId" placeholder="Enter Book Id.">
			     </div>
			    <div class="card-footer text-white bg-dark">
			        <button type="submit" id="mysubmit">Delete</button>
			    </div>
			   </form>
		   </div>
		 </div>
	  </div>
		
       <!-- end delete post modal --> 
        
      <!-- delete post modal -->
     <div class="row text-center">
         <div class="modal" id="delete-post-modal" tabindex="-1">
            <br><br><br><br><br>
			  <div class="card" style="width: 15rem">
			    <form  action="DeleteToPost" method="post">
			      <div class="card-bodyr">
			         <input type="text" name="pId" id="pId" placeholder="Enter Post Id.">
			     </div>
			    <div class="card-footer text-white bg-dark">
			        <button type="submit" id="mysubmit">Delete</button>
			    </div>
			   </form>
		   </div>
		 </div>
	  </div>
		
       <!-- end delete post modal -->
       
       
      
        
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
     <script>
       $(document).ready(function(){
    	   $('#delete-post-modal').hide();
    	   $('#delete-book-modal')
    	   
       })
     </script>
         
    
     <script>
        $(document).ready(function () {
            let editStatus = false;
            $('#edit-profile-button').click(function ()
            {
                if (editStatus == false)
                {
                    $("#profile-details").hide()
                    $("#profile-edit").show();
                    editStatus = true;
                    $(this).text("Back")
                } else
                {
                    $("#profile-details").show()
                    $("#profile-edit").hide();
                    editStatus = false;
                    $(this).text("Edit")
                }
            })
        })                
        </script>
      <!--now add post js-->
       
      
        
   <script>
     $(document).ready(function() {  
       $('#add-post-form').on('submit', function (event) {
         event.preventDefault();
         console.log("loaded........")
         var isVerified=false;
         if(!isVerified){
   //start of verification
		var category= document.getElementById("cid").value;
		var title= document.getElementById("title").value;
		var content= document.getElementById("content").value;			

		if(category=='---Select Categroy---')
		{
			swal('Please select category');
		}
		
		else if(title=='')
		{
			swal('Please enter title of the post');
		}
		else if(content=='')
		{
			swal('Write few words in content');
		}
		else
		{				                        
		    isVerified=true;		  
		}
    }
  //end of verification
   if(isVerified)
    {
	   let form = new FormData(this);
	   console.log("verified field now next process ......");
         
         $("#loader").show();
         //send register servlet:
         $.ajax({
             url: "AddToPost",
             type: 'POST',
             data: form,
             success: function (data, textStatus, jqXHR) {
                 //console.log(data)
                 $("#submit-btn").show();
                 $("#loader").hide();
                
                 if (data.trim() == 'done')
                 {
                     swal("Posted successfully.")
                            
                 } else
                 {
                     swal(data);
                 }
                
             },
             error: function (jqXHR, textStatus, errorThrown) {
                 $("#submit-btn").show();
                 $("#loader").hide();
                 swal("something went wrong..try again");
             },
             processData: false,
             contentType: false
         });
    }     
    
     });
 }); 
 </script>
 
   <!-- script to add book -->
 <script>
     $(document).ready(function() {  
       $('#add-book-form').on('submit', function (event) {
         event.preventDefault();
  // console.log("loaded........")
         var isVerified=false;
         if(!isVerified){
   //start of verification
		var bCat= document.getElementById("bCat").value;
		var bTitle= document.getElementById("bTitle").value;
		var bAuthor= document.getElementById("bAuthor").value;
		if(bCat=='---Select Categroy---')
		{
			swal('Please select category');
		}
		
		else if(bTitle=='')
		{
			swal('Please enter title of the book');
		}
		else if(bAuthor=='')
		{
			swal('Write name of Author');
		}
		else
		{				                        
		    isVerified=true;		  
		}
    }
  //end of verification
   if(isVerified)
    {
	   let form = new FormData(this);
	 //  console.log("verified field now next process ......");
         
         $("#loader").show();
         //send register servlet:
         $.ajax({
             url: "AddToEbook",
             type: 'POST',
             data: form,
             success: function (data, textStatus, jqXHR) {
                 console.log(data)
                 $("#submit-btn").show();
                 $("#loader").hide();
                
                 if (data.trim() == 'done')
                 {
                     swal("Book Added")
                            
                 } else
                 {
                     swal(data);
                 }
             
             },
             error: function (jqXHR, textStatus, errorThrown) {
                 $("#submit-btn").show();
                 $("#loader").hide();
                 swal("something went wrong..try again");
             },
             processData: false,
             contentType: false
         });
    }     
    
     });
 });
  
 </script>
  
    </body>
</html>