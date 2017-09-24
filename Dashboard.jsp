<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Dashboard</title>
	</head>
	<body>
	<style>
		body{
			background-image: url("Images/dashboard.jpg");background-repeat: no-repeat;background-size: cover;
		}
	</style>
		<a style="float:right; margin-top: 15px; font-size: 30px;" href="homepage.jsp">Back to HomePage</a><br>
		<%
			Cookie[] cookies = null;
			cookies = request.getCookies();

			String username ="";
			String email = "";
			String name = "";
			String password = "";
			String pack = "";
			int no = 0;
			String status = "";
			for(int i=0;i<cookies.length;++i)
			{
				if(cookies[i].getName().equals("username"))
				{
		 			username = cookies[i].getValue();
		 			break;
				}
			}

			Class.forName("com.mysql.jdbc.Driver");

 			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/OOAD", "root", "ani");

  			String sql = "Select * from users where username = ?";

  			PreparedStatement ps = conn.prepareStatement(sql);

  			ps.setString(1, username);

  			ResultSet rs = ps.executeQuery();
  			
  			 				
  			while(rs.next())
  			{
  				name = rs.getString("fullname");
  				email = rs.getString("email");
  				password = rs.getString("password");
  				pack = rs.getString("package");
  				no = rs.getInt("complaint_no");
  				status = rs.getString("complaint_status");

  			
		  	}

		%>

		<TABLE cellpadding="15" border="1" style="background-color: #ffffcc; margin-left: 300px;">
  			<TR><h3 style="margin-left: 430px;">User Details</h3></TR>
  			<TR>
  			<h2><TD>Customer Name</TD></h2>
  			<TD><%= name%></TD>
  			</TR>
  			<TR>
  			<h2><TD>User Name</TD></h2>
  			<TD><%= username%></TD>
  			</TR>
  			<TR>
  			<h2><TD>E-Mail Id</TD></h2>
  			<TD><%= email%></TD>
  			</TR>
  			<TR>
  			<h2><TD>Package</TD></h2>
  			<TD><%= pack%></TD>
  			</TR>
  			<TR>
  			<h2><TD>Complaint No.</TD></h2>
  			<TD><%= no%></TD>
  			</TR>
  			<TR>
  			<h2><TD>Complaint Status</TD></h2>
  			<TD><%= status%></TD>
  			</h2>
  			</TR>	
  		</TABLE>
		
	</body>
	<script language="javascript" type="text/javascript">
			history.pushState({page:1}, "title 1","#nbb");
			window.onhashchange = function(event) {
				window.location.hash = "nbb";
			};
		</script>
</html>
