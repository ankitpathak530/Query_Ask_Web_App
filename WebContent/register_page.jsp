<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<HTML>
<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<title>Register Page</title>
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
         <div class="col-md-6 offset-md-3">
              <div class="card">
                  <div class="card-header text-white bg-dark text-center">
                     <span class="fa fa-3x fa-user-circle"></span>
                        <br>Register here                 
                  </div>
                  <div class="card-body">
                  
                         <form id="register-form">
                             <div class="form-group">
							    <input type="text" class="form-control" id="name"  placeholder="name" name="name">
							  </div>
							  
							   <div class="form-group">
							    <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Email" name="email">
							  </div>
							  
							   <div class="form-group">
							    <input type="password" class="form-control" id="Password1"  placeholder="Password" name="Password1">
							  </div>
                              
							   <div class="form-group">
							    <input type="password" class="form-control" id="Password2"  placeholder="Confirm Password" name="Password2">
							  </div>
                              
							  <div class="form-group">			 
				                 <label><input name="gender" value="male" type="radio" checked /><span>Male</span></label>
				                 <label><input name="gender" value="female"  type="radio" checked /><span>Female</span></label>
				              </div>
				              
				              
				              <div class="form-group">
							    <textarea name="about" rows="4" class="form-control"  placeholder="Enter something about youself" ></textarea>
							  </div>
                                  
							  <div class="form-group form-check">
							    <input type="checkbox" class="form-check-input" name="check">
							    <label class="form-check-label" for="exampleCheck1">Remember me.</label>
							  </div>
							  
							  <div class="container text-center" style="display:none" id="loader">
							       <i class="fa fa-refresh fa-spin" style="font-size:28px;"></i>
							       <h4>Please wait..</h4>
							  </div>
							
							  <div class="container text-center">
									 <button type="submit" id="submit-btn" class="btn btn-primary">Submit</button>
						      </div>
						</form>
						
                  </div>
                  <div class="card-footer">
                  
                  </div>
              
              </div>
         
         </div>
     
     </div>
  </main>
 
 <script>
 $(document).ready(function () {  
     $('#register-form').on('submit', function (event) {
         event.preventDefault();
         console.log("loaded........")
         var isVerified=false;
         if(!isVerified){
 //start of verification
		var name= document.getElementById("name").value;
		var email= document.getElementById("email").value;
		var pwd= document.getElementById("Password1").value;			
		var cpwd= document.getElementById("Password2").value;
		
     //email id expression code
		var pwd_expression = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/;
		var letters = /^[A-Za-z]+$/;
		var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

		if(name=='')
		{
			swal('Please enter your name');
		}
		else if(!letters.test(name))
		{
			swal('Name field required only alphabet characters');
		}
		else if(email=='')
		{
			swal('Please enter your user email id');
		}
		else if (!filter.test(email))
		{
			swal('Invalid email');
		}
		
		else if(pwd=='')
		{
			swal('Please enter Password');
		}
		else if(cpwd=='')
		{
			swal('Enter Confirm Password');
		}
		else if(!pwd_expression.test(pwd))
		{
			swal ('Upper case, Lower case, Special character and Numeric letter are required in Password filed');
		}
		else if(pwd != cpwd)
		{
			swal ('Password not Matched');
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
         $("#submit-btn").hide();
         $("#loader").show();
         //send register servlet:
         $.ajax({
             url: "RegisterServlet",
             type: 'POST',
             data: form,
             success: function (data, textStatus, jqXHR) {
                 //console.log(data)
                 $("#sumbimt-btn").show();
                 $("#loader").hide();
                
                 if (data.trim() == 'done')
                 {
                     swal("Registered successfully..We are going to redirect to login page")
                             .then((value) => {
                                 window.location = "login.jsp"
                             });
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

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  
</body>
</html>