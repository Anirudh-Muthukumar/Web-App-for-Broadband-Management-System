<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>


<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
	<title>Attend Complaint</title>
</head>
<style>
body{
	background-image: url("Images/tech.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}

fieldset{
	margin-top: 50px;
}
</style>
<body>
	<a style="float:right;" href="TechTeamHome.jsp">Back to Homepage</a><br>
	<fieldset>
	<legend>Complain Details</legend>
	<form action="attended.jsp" method="post">
	Enter Complaint No. : <input type="number" name="cno"><br><br>
	<input type="submit" value="Attend">
	</form>
	</fieldset>
</body>
</html>