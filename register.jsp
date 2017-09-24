<%@ page import = "java.io.*,java.util.*,java.sql.*,java.util.Random"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>


<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
	<title>Complaint</title>
</head>
<body>
<script language="javascript" type="text/javascript">
			history.pushState({page:1}, "title 1","#nbb");
			window.onhashchange = function(event) {
				window.location.hash = "nbb";
			};
		</script>
	<%
		String ch = request.getParameter("r1");
		String complaint = "";

		if(ch.equals("a")){
			complaint = "Low Speed";
		}
		if(ch.equals("b")){
			complaint = "No Signal";
		}
		if(ch.equals("a")){
			complaint = "Disconnection";
		}
		if(ch.equals("a")){
			complaint = "Wrong Plan";
		}

		Random rand = new Random();

		int no = rand.nextInt(355)+1001;
		String status = "Queued";

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

		Class.forName("com.mysql.jdbc.Driver");
  		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/OOAD", "root", "ani");

  		String sql = "update users set complaint_no = ?, complaint_status = ? where username = ?";

		PreparedStatement ps = conn.prepareStatement(sql);

		ps.setInt(1, no);
		ps.setString(2, status);
		ps.setString(3, username);

  		ps.executeUpdate();
	%>
	Complaint Successfully Registered!!!!
	Your Complaint no. is <%= no%>
	<a href="homepage.jsp">Continue to Homepage</a>
</body>
</html>
