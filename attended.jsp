<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>


<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
	<title>Done Complaint</title>
</head>
<body>

<style>

body {
	background-image: url("Images/techteam.png");
	background-repeat: no-repeat;
	background-size: cover;
}

p{
	font-family: "Serif";
	font-size : 30px;
	float : center;
	color : #ffff00 ;
}
a{
	color : #040404;
}
</style>
	<%
		Class.forName("com.mysql.jdbc.Driver");
  		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/OOAD", "root", "ani");

  		String sql = "update users set complaint_status = ? where complaint_no = ?";

  		int no = Integer.parseInt(request.getParameter("cno"));

  		PreparedStatement ps = conn.prepareStatement(sql);

  		String s = "Done";
  		ps.setString(1, s);
  		ps.setInt(2, no);

  		ps.executeUpdate();

  	%>

  	<p>Issue No: <%= no%> was Resolved Successfully</p>
	<a style="float:bottom;" href="TechTeamHome.jsp">Back to Homepage</a>
</body>
</html>