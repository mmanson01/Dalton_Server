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

	String p1 = request.getParameter("handle");
	String p2 = request.getParameter("password");

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
	String query = "SELECT user_id FROM user WHERE username =" + "'" + p1 + "'" + " OR email = " + "'" + p1 + "'" +  " AND password = " + "'" + p2 + "'";
	
	//out.println(query);
	
	java.sql.ResultSet rs = stmt.executeQuery(query);

	 //loop through result set until there is no more data
      while(rs.next())
	  {
		 p_key = rs.getString("user_id");
		 found = true;
	  } //end while
	  
	}
	     //success

	if(found)
	{
		session.setAttribute("p_key", p_key);
		response.sendRedirect("twitter-home.jsp");
	}
	
	
	else{
		response.sendRedirect("Login.jsp?message=Invalid Login");
	}
	}
	
	catch (Exception e) {
         out.println(e);
      }
	
   	

%>


