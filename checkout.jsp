<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<html>
	<head>
		<title> Payment </title>
		<link rel="stylesheet" type="text/css" href="checkout.css">
		<style type="text/css">
		
	</style>
	</head>
	
	<script language="javascript" type="text/javascript">
			history.pushState({page:1}, "title 1","#nbb");
			window.onhashchange = function(event) {
				window.location.hash = "nbb";
			};
		</script>
	<body>
		<%
		double amt = 0.0;
		double tax = 0.0;
		double tot = 0.0;
		String n = "";

		if(request.getParameter("starter")!=null){
			String plan = (String)request.getParameter("starter");
			n = "Home Starter";
			if(plan.equals("Sign Up")){
				amt = 9.99;
			}
		}

		if(request.getParameter("basic")!=null){
			String plan = (String)request.getParameter("basic");
			n = "Home Basic";
			if(plan.equals("Sign Up")){
				amt = 24.99;
			}
		}

		if(request.getParameter("premium")!=null){
			String plan = (String)request.getParameter("premium");
			n = "Home Premium";
			if(plan.equals("Sign Up")){
				amt = 49.99;
			}
		}

		if(request.getParameter("ultimate")!=null){
			String plan = (String)request.getParameter("ultimate");
			n = "Home Ultimate";
			if(plan.equals("Sign Up")){
				amt = 79.99;
			}
		}

		if(request.getParameter("pro")!=null){
			String plan = (String)request.getParameter("pro");
			n = "Home Pro";
			if(plan.equals("Sign Up")){
				amt = 99.99;
			}
		}
		
		tax = Math.round(amt * 0.18);
		tot = amt + tax;

		Cookie c = new Cookie("Plan",n);
		c.setMaxAge(3600*24);
		response.addCookie(c);
		%>

		
	 	<p >Plan Cost    : $<%=amt %> </p>
		<p >Tax          : $<%=tax %></p>
		<p >Total Amount : $<%=tot %></p>
		<form method = "post" action="status.jsp">
			<fieldset>
			<legend>Card Details</legend>
			Card Number <input type = "Number" name="cno" required><br><br>
			Name on Card <input type = "text" name="cname" required><br><br>
			Enter Pin <input type = "password" name="pin" required><br><br>
			<input type = "submit" value = "Pay" style="float:center;">
			</fieldset>
		</form>
	</body>
</html>