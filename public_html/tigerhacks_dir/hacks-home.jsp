<%@page language="java" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="com.mysql.jdbc.*" %>


<%

java.sql.Connection conn = null;
String url = "";
String username = "";
String subject = "";
String question = "";
String p_key = "";

p_key = request.getParameter("p_key");
subject = request.getParameter("p1");
subject = "Calculus";

try{

//connects to mysql
Class.forName("com.mysql.jdbc.Driver").newInstance();
         url = "jdbc:mysql://localhost:3306/mmanson";
         conn = DriverManager.getConnection(url, "mmanson", "dalton123");
         java.sql.Statement stmt = conn.createStatement();
       
         
//creates and executes the query:
String query = "SELECT c.username, a.question FROM hack_questions a, hack_subjects b, hack_user c WHERE b.subjectname = " + "'" + subject + "'" + " AND a.user_id = c.id AND a.subject_id = b.id;";


/*java.sql.ResultSet rs = stmt.executeQuery(query);
	while(rs.next())
	{
		username = rs.getString("username");
		question = rs.getString("question");
		out.print(username);
		out.print(question);
	}
*/
%>

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

    <title>App Homepage</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">

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

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Homepage</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
           
           
           
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Other Users</a></li>
           
            <li> <form name="form1" method="post" action="Login.jsp">
            	 <style>
					padding: 0, 0, -10; 0;
 			  </style>
			  <label class="btn logoutLblPos">
 			  <input name="submit2" type="submit" id="submit2" value="log out">
 			 
 			 </label> </li>
		</form>
            	
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search Questions...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">All Subjects <span class="sr-only">(current)</span></a></li>
            <li><a href="#">Math</a></li>
            <li><a href="#">History</a></li>
            <li><a href="#">English</a></li>
        	<li><a href="">Science</a></li>
            <li><a href="">Language</a></li>
          </ul>
          <ul class="nav nav-sidebar">

            <li><a href="">Extra Subject 1</a></li>
            <li><a href="">Extra Subject 2</a></li>
            <li><a href="">Extra Subject 3</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">New Questions/Messages</h1>

          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Other People's Questions">
               <h4> <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Math</h4>
              <span class="text-muted">Add a Question!</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Other People's Questions">
              <h4> <span class="glyphicon glyphicon-book" aria-hidden="true"></span> History</h4>
              <span class="text-muted">Add a Question!</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Other People's Questions">
              <h4> <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> English</h4>
              <span class="text-muted">Add a Question!</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Other People's Questions">
              <h4> <span class="glyphicon glyphicon-erase"   aria-hidden="true"></span> Science</h4>
              <span class="text-muted">Add a Question!</span>
            </div>
            <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Other People's Questions">
              <h4> <span class="glyphicon glyphicon-console" aria-hidden="true"></span> Language</h4>
              <span class="text-muted">Add a Question!</span>
            </div>
            
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Other People's Questions">
              <h4> <span class="glyphicon glyphicon-bookmark" aria-hidden="true"></span> Extra 1</h4>
              <span class="text-muted">Add a Question!</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Other People's Questions">
              <h4> <span class="glyphicon glyphicon-bookmark" aria-hidden="true"></span> Extra 2</h4>
              <span class="text-muted">Add a Question!</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Other People's Questions">
              <h4> <span class="glyphicon glyphicon-bookmark" aria-hidden="true"></span> Extra 3</h4>
              <span class="text-muted">Add a Question!</span>
            </div>
          </div>
          
          

          <h2 class="sub-header">Recent Questions</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr> 
                  <th>		     Username</th>
                  <th>     Subject</th>
                  <th>     Question</th>
                </tr>
              </thead>
                
             <tbody>
               
        <%    java.sql.ResultSet rs = stmt.executeQuery(query);
			while(rs.next())
			{
				username = rs.getString("username");
				question = rs.getString("question");
         %>
           		 <tr>
                  <td><%=username%></td>
                  <td><%=subject%></td>
                  <td><%=question%></td>
                </tr> 
                
             <% 
              }
               %>
             
              </tbody>
            </table>
          </div>
        </div>
      </div>
      
      
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

<%


}//close try

catch(Exception e)
{}

%>