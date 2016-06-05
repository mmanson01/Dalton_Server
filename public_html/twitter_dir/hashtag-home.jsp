<%@page language="java" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="com.mysql.jdbc.*" %>

<%
java.sql.Connection conn = null;
String url = "";
String username = "";
int tweets = 0;
//people you are following = following
int follower = 0;
//people who are following you = followers
int followee = 0;
String fullname = "";
String tweetcontent = "";
String tweetusername = "";
String tweetfullname = "";
String hashtag = "";
String hashtag_id = "";


//pulls primary key
session.getAttribute("key");
String p_key = request.getParameter("key");
session.setAttribute("key", p_key);

try{

//connects to mysql
Class.forName("com.mysql.jdbc.Driver").newInstance();
         url = "jdbc:mysql://localhost:3306/mmanson";
         conn = DriverManager.getConnection(url, "mmanson", "dalton123");
         java.sql.Statement stmt = conn.createStatement();
         java.sql.Statement stmt1 = conn.createStatement();
       
         
//creates and executes the query:
String hashtagquery = "SELECT hashtag_content FROM hashtag WHERE hashtag_id =" + "'" + p_key + "'";




String usernamequery = "SELECT a.username FROM user a, hashtag b WHERE b.hashtag_id =" + "'" + p_key + "'";
String tweetquery = "SELECT b.username, COUNT(*) FROM tweet a, user b WHERE a.user_key ="  + "'" + p_key + "'"  + "AND b.user_id=a.user_key";
String followerquery = "SELECT b.username, COUNT(*) FROM follower_following a, user b WHERE a.followee_id = b.user_id AND b.user_id =" + "'" + p_key + "'";
String followeequery = "SELECT b.username, COUNT(*) FROM follower_following a, user b WHERE a.follower_id = b.user_id AND b.user_id =" + "'" + p_key + "'";
String fullnamequery = "SELECT fullname FROM user WHERE user_id =" + "'" + p_key + "'";	


String tweetcontentquery = "SELECT b.tweet_content, c.username, c.fullname FROM hashtag_tweet a, tweet b, user c WHERE a.hashtag_id=" + "'" + p_key + "'" + "AND a.tweet_id=b.tweet_id AND c.user_id = b.user_key ORDER BY b.tweet_time DESC";
	
//out.println(tweetquery);
//out.println(followerquery);
//out.println(followeequery);
	
java.sql.ResultSet rs = stmt.executeQuery(hashtagquery);
	while(rs.next())
	{
		hashtag = rs.getString("hashtag_content");
	}

/*java.sql.ResultSet rs1 = stmt.executeQuery(tweetcontentquery);

while(rs1.next())
	{
		tweetcontent = rs1.getString("tweet_content");
		username = rs1.getString("username");
		fullname = rs1.getString("fullname");
		
	//	out.print(tweets);
	}


java.sql.ResultSet rs2 = stmt.executeQuery(followerquery);

while(rs2.next())
	{
		follower = Integer.parseInt(rs2.getString("COUNT(*)"));
	//	out.print(follower);
	}
	
java.sql.ResultSet rs3 = stmt.executeQuery(followeequery);

	while(rs3.next())
	{
		followee = Integer.parseInt(rs3.getString("COUNT(*)"));
	//	out.print(followee);
	}
	
java.sql.ResultSet rs4 = stmt.executeQuery(fullnamequery);

	while(rs4.next())
	{
		fullname = rs4.getString("fullname");
	//	out.print(fullname);
	}

*/

%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <meta name="description" content="">
    <meta name="author" content="">
    <style type="text/css">
    	body {
    		padding-top: 60px;
    		padding-bottom: 40px;
    	}
    	.sidebar-nav {
    		padding: 9px 0;
    	}
    </style>    
    <link rel="stylesheet" href="css/gordy_bootstrap.min.css">
</head>
<body class="user-style-theme1">
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
                <i class="nav-home"></i> <a href="#" class="brand">!Twitter</a>
				<div class="nav-collapse collapse">
					<p class="navbar-text pull-right">Logged in as <a href="#" class="navbar-link"><%out.print(username);%></a>
					</p>
					<ul class="nav">
						<li class="active"><a href="index.html">Home</a></li>
						<li><a href="queries.html">Test Queries</a></li>
						<li><a href="twitter-signin.html">Main sign-in</a></li>
					</ul>
				</div><!--/ .nav-collapse -->
			</div>
		</div>
	</div>

    <div class="container wrap">
        <div class="row">


            <!-- right column -->
            <div class="span8 content-main">
                <div class="module">
                    <div class="content-header">
                        <div class="header-inner">
                            <h2 class="js-timeline-title">#<%=hashtag%></h2>
                        </div>
                    </div>

                    <!-- new tweets alert -->
                    <div class="stream-item hidden">
                        <div class="new-tweets-bar js-new-tweets-bar well">
                            2 new Tweets
                        </div>
                    </div>

                    <!-- all tweets -->
                    <div class="stream home-stream">

              <%  
                java.sql.ResultSet rs5 = stmt.executeQuery(tweetcontentquery); 
                while(rs5.next())    
				{
				
				tweetcontent = rs5.getString("tweet_content");
				tweetusername = rs5.getString("username");
				tweetfullname = rs5.getString("fullname");
			%>
                        <!-- start tweet -->
                        <div class="js-stream-item stream-item expanding-string-item">
                            <div class="tweet original-tweet">
                                <div class="content">
                                    <div class="stream-item-header">
                                        <small class="time">
                                            <a href="#" class="tweet-timestamp" title="10:15am - 16 Nov 12">
                                                <span class="_timestamp">6m</span>
                                            </a>
                                        </small>
                                        <a class="account-group">
                                            <img class="avatar" src="images/obama.png" alt="Barak Obama">
                                            <strong class="fullname"><%=tweetfullname%></strong>
                                            <span>&rlm;</span>
                                            <span class="username">
                                                <s>@<%=tweetusername%></s>
                                            </span>
                                        </a>
                                    </div>
                                    <p class="js-tweet-text">
                                       
                                		 <%
                                		 
                                		String[] splited = tweetcontent.split(" ");
                                		 
                                		for (int i = 0; i < splited.length; i++) 	
										{
												if (splited[i].startsWith("#"))
													{	
													hashtag = splited[i].substring(1);
														
														String selecthashtagquery = "SELECT hashtag_id FROM hashtag WHERE hashtag_content =" + "'" + hashtag + "'";
														//out.print(selecthashtagquery);
														
														java.sql.ResultSet rs6 = stmt1.executeQuery(selecthashtagquery);
				
														//if hashtag already exists, get id
														while(rs6.next())
														{
															hashtag_id = rs6.getString("hashtag_id");
															//out.print("hashtag_id =" + hashtag_id);
															%> 
															<a href="hashtag-home.jsp?key=<%=hashtag_id%>"> <%=splited[i]%> </a> 
															<%
														}
													
                                		 				
                                		 			}//close if
                                		 			
                                		 		else
                                		 			{ 
                                		 				%>
                                		 					<%out.print(splited[i]);%>
                                		 				<%
                                		 				
                                		 			}//else
                                		 
                                		 }//close for
                                		 
                                		 
                                		 %>
                                 
                                        <a href="http://t.co/xOqdhPgH" class="twitter-timeline-link" target="_blank" title="http://OFA.BO/xRSG9n" dir="ltr">
                                            <span class="invisible">http://</span>
                                            <!--<span class="js-display-url">OFA.BO/xRSG9n</span>-->
                                            <span class="invisible"></span>
                                            <span class="tco-ellipsis">
                                                <span class="invisible">&nbsp;</span>
                                            </span>
                                        </a>
                                    </p>
                                </div>
                            </a>
                                <div class="expanded-content js-tweet-details-dropdown"></div>
                            </div>
                        </div><!-- end tweet -->
                          
                        
                    	<%
                    	}
                    	%>
                       
                    </div>
                    <div class="stream-footer"></div>
                    <div class="hidden-replies-container"></div>
                    <div class="stream-autoplay-marker"></div>
                </div>
                </div>
               
            </div>
        </div>
    </div>
     <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
     <script type="text/javascript" src="js/main-ck.js"></script>
  </body>
</html>


<%
} //close try

catch(Exception e)
{
	out.println(e);
}

%>

