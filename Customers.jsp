<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
	<title>Customer Report</title>
</head>
<body>
	<h1>Customer Report</h1>
	<%
		Class.forName("com.mysql.jdbc.Driver");
  		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/OOAD", "root", "ani");

  		String sql = "Select * from users";

  		PreparedStatement ps = conn.prepareStatement(sql);

  		ResultSet rs = ps.executeQuery();
  	%>
  		<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
  		<TR>
  		<h2>
  		<TD>Customer Name</TD>
  		<TD>User Name</TD>
  		<TD>Complaint No.</TD>
  		<TD>Complaint Status</TD>
  		</h2>
  		</TR>	
		<%
		while (rs.next()) {
		%>
		<TR>
		<TD><%=rs.getString(1)%></TD>
		<TD><%=rs.getString(2)%></TD>
		<TD><%=rs.getInt(6)%></TD>
		<TD><%=rs.getString(7)%></TD>
		</TR>
		<% } %>

</body>

	<a style="float:right;" href="TechTeamHome.jsp">Back to Homepage</a>
</html>