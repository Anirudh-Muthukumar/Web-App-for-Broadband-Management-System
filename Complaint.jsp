<%@ page import = "java.io.*,java.util.*,java.sql.*,java.util.Random"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
	<title>Complaint Registration</title>
</head>
<style >
	body {
		background-image: url("Images/Complaint.jpg");background-repeat: no-repeat;background-size: cover;
	}
</style>
<body>
	<%
		String user = "";
		String name = "";
		String email = "";
		String pack = "";
		Cookie[] cookies = null;
        cookies = request.getCookies();

            for(int i=0; i < cookies.length; ++i)
            {
                if(cookies[i].getName().equals("username"))
                {
                    user = cookies[i].getValue();
                    break;
                }
            }

            Class.forName("com.mysql.jdbc.Driver");
  			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/OOAD", "root", "ani");

  			String sql = "Select * from users where username = ?";

  			PreparedStatement ps = conn.prepareStatement(sql);

  			ps.setString(1, user);

  			ResultSet rs = ps.executeQuery();

  			while(rs.next())
  			{
  				name = rs.getString("fullname");
  				email = rs.getString("email");
  				pack = rs.getString("package");
  				if(pack=="")
  					pack="Not Selected";
  			}
      %>
	<form action="register.jsp" method="post" style="float:centre; font-size: 30px; color: #FF2A00; margin-top: 50px; margin-left: 50px;">
	<a style="float:right; margin-right:15px; color: #FF2A00;"href="homepage.jsp">Back to Homepage</a><br>
	Name :  <%= name %><br>
	E-Mail : <%= email%><br>
	Package : <%= pack%><br>
	Select the Issue : <br>
	<input type="radio" name="r1" value="a">Low Speed<br>
	<input type="radio" name="r1" value="b">No Signal<br>
	<input type="radio" name="r1" value="c">Disconnection<br>
	<input type="radio" name="r1" value="d">Wrong Plan<br>
	<input type="submit" value="Register">

	</form>
	<script language="javascript" type="text/javascript">
			history.pushState({page:1}, "title 1","#nbb");
			window.onhashchange = function(event) {
				window.location.hash = "nbb";
			};
		</script>

</body>
</html>