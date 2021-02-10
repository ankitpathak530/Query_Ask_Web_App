<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.MY_CNX"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entity.Message"%>
<%@page import="com.tech.blog.entity.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("login.jsp");
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
		          Books
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
		    </ul>
		    <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle "></span> <%= user.getName()%> </a>
                    </li>

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
        
        <!-- main body of the page -->
             <main>
                 <div class="container">
                         <!-- all post here  -->
                         <div class="container text-center"><br><h2>Your Contributed Post</h2></div>
        
                            <div class="container text-center" id="loader">
                               <i class="fa fa-refresh fa-4x fa-spin"></i>
                               <h3 class="mt-2">Loading...</h3>
                            </div>
                            
                            <div class="container-fluid" id ="post-container">
                            
                            
                            </div>
                  </div>
             </main>
        <!-- end of main body of the page -->
  
  
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
		                    <option selected="disable">---Select Category---</option>
		                    <option value="Programming">Programming </option>
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
			              <label for="myfile">Select a file:</label>
                          <input type="file" id="myfile" name="myfile">
			            </div>
			             <div class="form-group">
			                <textarea placeholder="Program." name="program" class="form-control" style="height:200px;"></textarea>
			            </div>
			            <div class="form-group">
							    <input type="checkbox" value="other" name="check">
							    <label class="form-check-label" for="exampleCheck1">Check it</label>
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

        <!--start profile modal-->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel"> TechBlog </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="images/<%= user.getProfile() %>" class="img-fluid" style="border-radius:50%;max-width: 150px;;" >
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getName()%> </h5>
                            <!--//details-->

                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row"> ID :</th>
                                            <td> <%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row"> Email : </th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">About :</th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on :</th>
                                            <td><%= user.getDateTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--profile edit-->
                            <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2">Please Edit Carefully</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td> <input type="email" class="form-control" name="email" value="<%= user.getEmail()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td> <input type="text" class="form-control" name="name" value="<%= user.getName()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td> <input type="password" class="form-control" name="password" value="<%= user.getPassword()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td> <%= user.getGender().toUpperCase()%> </td>
                                        </tr>
                                        <tr>
                                            <td>About  :</td>
                                            <td>
                                                <textarea  class="form-control" name="about" ><%= user.getAbout()%></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>New Profile:</td>
                                            <td>
                                                <input type="file" name="image" class="form-control" >
                                            </td>
                                        </tr>

                                    </table>

                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>

                                </form>    

                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button  id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end of profile modal-->
        
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        
        
        
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
       
        <!--loading post using ajax-->
        <script>
        function getPosts(pById){
        	$("#loader").show();
        	
        	  $.ajax({
          		url: "load_posts.jsp",
          		data: {cid:pById},
          		success: function(data , textStatus,jqXHR){
          			$("#loader").hide();
          			$("#post-container").html(data);
          			
          		}
          	  })
        }
        $(document).ready(function(e){
      	      getPosts('<%= user.getId() %>');
        })
        </script>
        
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
                     swal("Your post recorded")
                            //some line are missing for jump to another page
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