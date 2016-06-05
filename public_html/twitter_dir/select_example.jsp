<%@page language="java" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="com.mysql.jdbc.*" %>

<%
     
      try {

         java.sql.Connection con = null;
         String url = "";

	 String p1 = request.getParameter("handle");
	 String p2 = request.getParameter("password");

	 out.println("debug: " + p1);


	 String query = "select * from users"; 
		
	 //open sql:
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         url = "jdbc:mysql://localhost:3306/mmanson";
         con = DriverManager.getConnection(url, "mmanson", "dalton123");
         java.sql.Statement stmt = con.createStatement();
         
	 //executes the query:
	 java.sql.ResultSet rs = stmt.executeQuery(query);

	 String p_key = ""; 

	 //loop through result set until there is no more data
          while(rs.next())
	  {
		p_key = rs.getString("p_key_from_table");
	  } //end while

      } catch (Exception e) {
         out.println(e);
      }
%>


