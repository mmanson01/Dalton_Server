<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.*" %>

<%
//for people to teach

	String p1 = request.getParameter("newclass"); //suck in html ; store in java var
	String p_key = request.getParameter("p_key"); //suck in html ; store in java var
	//out.print(p1);
	//out.print(p_key);
	
	//connect to db
	java.sql.Connection conn = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://127.0.0.1/mmanson";   //location and name of database
        String userid = "mmanson";
        String password = "dalton123";
        conn = DriverManager.getConnection(url, userid, password);      //connect to database

//check to see if the username already exists	
   
   	java.sql.Statement stmt1 = conn.createStatement();
	String query1 = "SELECT id FROM hack_subjects WHERE subjectname =" + "'" + p1 + "'";
	java.sql.ResultSet rs1 = stmt1.executeQuery(query1);
	boolean found = false;
	int status = 0;
	String subject_key = ""; 
	String message = "";
	String p2 = "";

	//out.print(query1);
	
	while(rs1.next())
	{
		found = true;
		out.print(found);
		p2 = rs1.getString("id");
	}
	
	//if it's not found	 
	if(found == false)
	{	
		java.sql.PreparedStatement ps1 = conn.prepareStatement("insert into mmanson.hack_subjects (subjectname) values (?)");
			ps1.setString (1, p1);
			status = ps1.executeUpdate();
			//out.print(status);
		
		java.sql.Statement stmt2 = conn.createStatement();
		java.sql.ResultSet rs2 = stmt2.executeQuery(query1);
		
		while(rs2.next())
		{
			out.print("next");
			p2 = rs2.getString("id");
			out.print("p2 = " + p2);
		}
	}
	
		java.sql.PreparedStatement ps2 = conn.prepareStatement("insert into mmanson.hack_user_subject_help (user_id, subject_id) values (?,?)");
			ps2.setString (1, p_key);
			ps2.setString (2, p2);
			status = ps2.executeUpdate();  
			
	 //success

	response.sendRedirect("hacks-home.jsp?key=" + p_key);
	
	%>