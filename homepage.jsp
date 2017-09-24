<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>

	<head>
			<title> Home Page </title>
		<link rel="stylesheet" type="text/css" href="homepagestyle.css">
	
	</head>
	<%
		

		Cookie[] cookies = null;
		cookies = request.getCookies();

		String username ="";
		for(int i=0;i<cookies.length;++i)
		{
			if(cookies[i].getName().equals("username"))
			{
		 		username = cookies[i].getValue();
		 		break;
			}
		}
	%>
	<script language="javascript" type="text/javascript">
			history.pushState({page:1}, "title 1","#nbb");
			window.onhashchange = function(event) {
				window.location.hash = "nbb";
			};
		</script>
	<body>
        
		<center><img src="Images/Logo.jpg" alt=logo style="width:125px;height:125px";></center>
		<h2 style="float:right; margin-right:25px; color:#a3a385;">Welcome <c:out value="<%= username%>"/><br></h2><br><br><br><br>

		<a href="Packages.jsp">Packages</a>
		<a href="Dashboard.jsp" >Dashboard</a>
		<a href="Complaint.jsp" >Complaint Register</a>
		<a href="JavaScript:window.close()" >Logout</a>
		<a href="FAQ.html" >FAQ</a>
		
		
	</body>

</html>

