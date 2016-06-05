<%//pulls primary key
String p_key = request.getParameter("key");
//out.print("p_key"); %>

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
    
    <!-- Custom styles for this template -->
  <!--  <link href="style.css" rel="stylesheet"> -->

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
            <h1 class="cover-heading"><font color="blue">Please enter the calculus class you have taken</h1>
          </div>
          
           <form action="insert-class.jsp" method="get">
                    	<input type="hidden" name="p_key" value="<%=p_key%>" > 
                    	<font color="blue">
                        <textarea class="class-box" name="newclass" placeholder="Class" id="tweet-box-mini-home-profile"></textarea>
                        <div> </div>
                    	<font color="blue"> <button type="submit">Submit</button>
        	</form>
        	
        <div class="inner cover">
        	<font color="blue"> <h1 class="cover-heading">OR</h1>
        </div>
        	
        <div class="inner cover">
        
        	<h1 class="cover-heading">Please enter the calculus class you need help with</h1>
        </div>
        			<font color="blue">
        			<form action="insert-class1.jsp" method="get">
        				<input type="hidden" name="p_key" value="<%=p_key%>" > 
        				
                        <textarea class="class-box" name="newclass" placeholder="Class" id="tweet-box-mini-home-profile"></textarea>
                       
                        <div> </div>
                    	<font color="blue"> <button type="submit">Submit</button>
        	</form>

          <div class="mastfoot">
          </div>

        </div>
        
        
        <div class="container">
        
