<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>

	<head>
			<title> Home Page </title>
		<link rel="stylesheet" type="text/css" href="tthomepagestyle.css">
	
	</head>
	
		<script language="javascript" type="text/javascript">
			history.pushState({page:1}, "title 1","#nbb");
			window.onhashchange = function(event) {
				window.location.hash = "nbb";
			};
		</script>



	<body>

        
		<center><img src="Images/Logo.jpg" alt=logo style="width:125px;height:125px";></center>
		Welcome Admin<br>
		<a href="Customers.jsp">Customer Reports</a>
		<a href="Attend.jsp" >Attend Complaint</a>
		<a href="JavaScript:window.close()" >Logout</a>		
		
	</body>

</html>

