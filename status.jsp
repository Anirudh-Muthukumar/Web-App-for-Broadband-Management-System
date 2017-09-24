<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>


<!DOCTYPE html>
<html>
	<head>
		<title>Transaction Status</title>
	</head>
	<body>
	<style >
		body{
			background-image: url("Images/success.jpg");background-repeat: no-repeat;background-size: cover;
		}
		h1,a{
			margin-left: 500px;
			color : #ffff00;
			margin-top: 400px;
		}
	</style>
	<script language="javascript" type="text/javascript">
			history.pushState({page:1}, "title 1","#nbb");
			window.onhashchange = function(event) {
				window.location.hash = "nbb";
			};
		</script>
		<%
			int cno = Integer.parseInt(request.getParameter("cno"));
			int pin = Integer.parseInt(request.getParameter("pin"));

			int status = 0;

			if(cno==12345 && pin==1234)
				status = 1;
			else
				status = 0;
		%>
		<c:set var="chk" value="<%=status %>"/>
		<c:if test="${chk == 1}" >
			<h1>Transaction completed Successfully</h1>
			<%

				Cookie[] cookies = null;
				cookies = request.getCookies();

				String username ="";
				String pack = "";
				for(int i=0;i<cookies.length;++i)
				{
					if(cookies[i].getName().equals("username"))
					{
		 				username = cookies[i].getValue();
		 				break;
					}
				}

				for(int i=0;i<cookies.length;++i)
				{
					if(cookies[i].getName().equals("Plan"))
					{
		 				pack = cookies[i].getValue();
		 				break;
					}
				}

				Class.forName("com.mysql.jdbc.Driver");
  				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/OOAD", "root", "ani");

  				String sql = "update users set package = ? where username = ?";

  				PreparedStatement ps = conn.prepareStatement(sql);

  				ps.setString(1, pack);
  				ps.setString(2, username);

  				ps.executeUpdate();

  				for(int i=0;i<cookies.length;++i)
				{
					if(cookies[i].getName().equals("Plan"))
					{
		 				cookies[i].setMaxAge(0);
		 				break;
					}
				}
			%>
			<a href="homepage.jsp"> Click here to continue </a>
		</c:if>
		<c:if test="${chk == 0}" >
			<h1>Transaction Failed</h1>
			<a href="Packages.jsp"> Click here to continue </a>
		</c:if>
	</body>
</html>