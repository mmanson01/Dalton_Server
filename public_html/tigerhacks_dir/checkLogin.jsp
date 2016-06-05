<%@page language="java" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="com.mysql.jdbc.*" %>

<%
     
      try {

         java.sql.Connection con = null;
         String url = "";
         boolean found = false;
         String p_key = "";
		 String message = ""; 

	String p1 = request.getParameter("username"); //suck in html ; store in java var
	String p2 = request.getParameter("password"); //suck in html ; store in java var

	out.println("debug: " + p1);
	out.println("debug: " + p2);
	 
		
	 //open sql:
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         url = "jdbc:mysql://localhost:3306/mmanson";
         con = DriverManager.getConnection(url, "mmanson", "dalton123");
         java.sql.Statement stmt = con.createStatement();
         
  	if(p1.equals("") | p2.equals("")){
  		found = false;
  	}
  
  	else{
       //executes the query:
	String query = "SELECT id FROM hack_user WHERE username =" + "'" + p1 + "'" +  " AND password = " + "'" + p2 + "'";
	
	out.println(query);
	
	java.sql.ResultSet rs = stmt.executeQuery(query);

	 //loop through result set until there is no more data
      while(rs.next())
	  {
		 p_key = rs.getString("id");
		 out.print(p_key);
		 found = true;
	  } //end while
	  
	}
	
	     //success

	if(found)
		response.sendRedirect("hacks-home.jsp?key=" + p_key);
	
	else
		response.sendRedirect("Login.jsp?message=Invalid Login"); 
	}
	
	catch (Exception e) {
         out.println(e);
      }
	
   	

%>


