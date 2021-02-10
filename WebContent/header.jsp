<html>
 <head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <style>
   </style>
  
  
  
</head>
<body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

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
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Books
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item"  href="books.jsp?cid=Programming">Programming language</a>
          <a class="dropdown-item"  href="books.jsp?cid=Web Technology">Web Technology</a>
          <a class="dropdown-item"  href="books.jsp?cid=Datastructure">Datastructure</a>
             <div class="dropdown-divider">--------------</div>
          <a class="dropdown-item"  href="books.jsp?cid=Aptitude">Aptitude</a>
          <a class="dropdown-item"  href="books.jsp?cid=Reasoning">Reasoning</a>
          <a class="dropdown-item"  href="books.jsp?cid=Verbal">Verbal</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
      
      
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <a href="admin_login.jsp" class="btn navbar-dark bg-dark"></a>&nbsp;&nbsp;
      <input class="form-control mr-sm-2" type="search" id="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>&nbsp;&nbsp;
      
      <a href="register_page.jsp" >
      <button type="button" onclick="register_page.jsp" class=" btn btn-primary"><span class="fa fa-user-plus fa-spin"></span>Signup</button></a>&nbsp;&nbsp;
      <a href="login.jsp">
      <button type="button" class=" btn btn-primary"><span class="fa fa-user-circle fa-spin"></span>Login</button></a>&nbsp;&nbsp;

    </form>
  </div>
</nav>


