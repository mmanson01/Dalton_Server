<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.*" %>

<%

	String p1 = request.getParameter("name"); //suck in html ; store in java var
	String p2 = request.getParameter("email"); //suck in html ; store in java var
	String p3 = request.getParameter("username"); //suck in html ; store in java var
	String p4 = request.getParameter("password"); //suck in html ; store in java var
	String p5 = request.getParameter("school"); //suck in html ; store in java var
	String p6 = request.getParameter("grade"); //suck in html ; store in java var
	int status = 0;  //capture status after insertion attempt

	out.println("p1 is: " + p1);
	out.println("p2 is: " + p2);
	out.println("p3 is: " + p3);
	out.println("p4 is: " + p4);
	out.println("p5 is: " + p5);
	out.println("p6 is: " + p6);

	//connect to db
	java.sql.Connection conn = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://127.0.0.1/mmanson";   //location and name of database
        String userid = "mmanson";
        String password = "dalton123";
        conn = DriverManager.getConnection(url, userid, password);      //connect to database

//check to see if the username already exists	
   
   	java.sql.Statement stmt1 = conn.createStatement();
	String query1 = "SELECT id FROM hack_user WHERE username =" + "'" + p3 + "'";
	java.sql.ResultSet rs1 = stmt1.executeQuery(query1);
	boolean found = true;
	String p_key = ""; 
	String message = "";

	out.print("query1");
	
	while(rs1.next())
	{
		p_key = rs1.getString("id");
		found = false;
		out.print("found");
	}
// if it's not found	 
	if(found == true)
	{	
		out.print("found");
		//inserts new user
			
		if((p1.equals("") | p2.equals("") |  p3.equals("") |  p4.equals("") |  p5.equals("") | p6.equals("")))
		{
			found = false;
		}
		
		else {
			java.sql.PreparedStatement ps = conn.prepareStatement("insert into mmanson.hack_user (name, email, username, password, school, grade) values (?,?,?,?,?,?)");
			ps.setString (1, p1);
			ps.setString (2, p2);
			ps.setString (3, p3);
			ps.setString (4, p4);
			ps.setString (5, p5);
			ps.setString (6, p6);
			status = ps.executeUpdate();  
		}
		
   //executes the query to pull new user_id from db:
   	
   	java.sql.Statement stmt2 = conn.createStatement();
	
	String query2 = "SELECT id FROM hack_user WHERE username =" + "'" + p3 + "'" +  " AND password = " + "'" + p4 + "'";
	
	java.sql.ResultSet rs2 = stmt2.executeQuery(query2);

	 //loop through result set until there is no more data
	  found = false;
	  
      while(rs2.next())
	  {
		 p_key = rs2.getString("id");
		 found = true;
		 out.print("found");
	  } //end while
	  
	}
	
	 //success

	if(found)
		response.sendRedirect("select-classes.jsp?key=" + p_key);
	
	else
		response.sendRedirect("Login.jsp?message=Invalid sign up. Please try again.");
	
		

      
%>

<input type="hidden" name="key" value="99">
<h1> its a beautiful day in the neighborhood! </h1>



