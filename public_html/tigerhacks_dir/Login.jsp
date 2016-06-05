<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Cover Template for Bootstrap</title>
    
    
    <!-- JQuery -->
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    
    <!-- Bootstrap -->
   <!-- <link rel="stylesheet" href="css/midulla.css">-->
    <link rel="stylesheet" href = "bootstrap-theme.min.css">

    <!-- Bootstrap core CSS -->
    <link href="bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="cover.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="masthead clearfix">
            <div class="inner">
               <!--
              <h3 class="masthead-brand">Cover</h3>
              -->
              <nav>
                <ul class="nav masthead-nav">
                <!--
                  <li class="active"><a href="#">Home</a></li>
                  <li><a href="#">Features</a></li>
                  <li><a href="#">Contact</a></li>
                   -->
                </ul>
              </nav>
            </div>
          </div>

          <div class="inner cover">
            <h1 class="cover-heading">Welcome to Tiger Helper!</h1>
            </p>
          </div>

          <div class="mastfoot">
          </div>

        </div>
        
        
        <div class="container">


      <form action="checkLogin.jsp" class="form-signin" method="get">
        <h2 class="form-signin-heading">For Returning Users: Log In</h2>
        <label for="inputUsername" class="sr-only">Username</label>
        <input type="username" id="inputUsername" name= "username" class="form-control" placeholder="Username" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" name= "password" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-success btn-block" type="submit">Sign in</button>
      </form>

    </div> <!-- /container -->


<div class="container">

  <h2 class="form-signin-heading">For First Time Users: Sign Up</h2>

   	<form action="newLogin.jsp" class="form-signin" method="get">
      
        <input type="name" id="inputName" name="name" class="form-control" placeholder="Name" required autofocus>
        <label for="inputName" class="sr-only">Name</label>
    	<input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email" required autofocus>
        <label for="inputEmail" class="sr-only">Email</label>
        <input type="username" id="inputUsername" name="username" class="form-control" placeholder="Username" required autofocus>
        <label for="inputUsername" class="sr-only">Username</label>
        <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="school" id="inputSchool" name="school" class="form-control" placeholder="School" required autofocus>
        <label for="inputSchool" class="sr-only">School</label>
    	<input type="grade" id="inputGrade" name="grade" class="form-control" placeholder="Grade (example: 12)" required autofocus>
        <label for="inputGrade class="sr-only">Grade</label>
        
        
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>

    </div> <!-- /container -->


      </div>

    </div>
    

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
