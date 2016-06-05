<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.*" %>

<%
	int status = 0;
	String retrievedtweet = "";
	String hashtag = "";
	String hashtag_id = "";
	String tweet_id = "";
	
	//session variables
	
	session.getAttribute ("p_key");
	String p_key = request.getParameter("p_key");
	session.setAttribute ("p_key", p_key);
	
	session.getAttribute ("newtweet");
	String newtweet = request.getParameter("newtweet");
	session.setAttribute ("newtweet", newtweet);
	
	//out.println("p_key is: " + p_key);
	//out.println("newtweet is: " + newtweet);

	
//connect to db
	java.sql.Connection conn = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://127.0.0.1/mmanson";   //location and name of database
        String userid = "mmanson";
        String password = "dalton123";
        conn = DriverManager.getConnection(url, userid, password);      //connect to database
        java.sql.Statement stmt = conn.createStatement();
        java.sql.Statement stmt2 = conn.createStatement();

	java.sql.PreparedStatement ps = conn.prepareStatement("insert into mmanson.tweet (tweet_content, user_key) values (?,?)");

	ps.setString (1, newtweet);
	ps.setString (2, p_key);
    status = ps.executeUpdate(); 
    
    String selecttweetquery = "SELECT tweet_content, tweet_id FROM tweet WHERE user_key =" + "'" + p_key + "'";	
    
    java.sql.ResultSet rs = stmt.executeQuery(selecttweetquery);
	while(rs.next())
	{
		retrievedtweet = rs.getString("tweet_content");
		tweet_id = rs.getString("tweet_id");
		
	}
	
	String[] splited = retrievedtweet.split(" ");
	//out.print(Arrays.toString(splited));
	
	for (int i = 0; i < splited.length; i++) 
		{
	
		//out.print("in loop");
		
		if (splited[i].startsWith("#"))
		
			{
		
				hashtag =(splited[i].substring(1)).toLowerCase();
				out.print("hashtag =" + hashtag);
				String selecthashtagquery = "SELECT hashtag_id FROM hashtag WHERE hashtag_content =" + "'" + hashtag + "'";
				java.sql.ResultSet rs1 = stmt.executeQuery(selecthashtagquery);
				
				//if hashtag already exists, get id
				if(rs1.next())
					{
						hashtag_id = rs1.getString("hashtag_id");
						out.print("hashtag_id =" + hashtag_id);
						
					}
				
				//if hashtag does not already exist, insert and get id
				else{
					
						java.sql.PreparedStatement ps1 = conn.prepareStatement("insert into mmanson.hashtag (hashtag_content) values (?)");
						ps1.setString (1, hashtag);
				 		status = ps1.executeUpdate();
				 		java.sql.ResultSet rs2 = stmt2.executeQuery(selecthashtagquery);
					
					 if(rs2.next())
				 		{
				 			hashtag_id = rs2.getString("hashtag_id");
				 		}
				 		out.print("hashtag_id =" + hashtag_id);
				 		
					}
					
				//add to hashtag-tweet relationship table
				
				java.sql.PreparedStatement ps2 = conn.prepareStatement("insert into mmanson.hashtag_tweet (hashtag_id, tweet_id) values (?,?)");
				ps2.setString (1, hashtag_id);
				ps2.setString (2, tweet_id);
				status = ps2.executeUpdate();
				
				
			} // close if it starts with a hashtag
		
	
		} //close big for loop


		response.sendRedirect("twitter-home.jsp?key=" + p_key);
	
%>

<input type="hidden" name="key" value="99">
<h1> its a beautiful day in the neighborhood! </h1>



