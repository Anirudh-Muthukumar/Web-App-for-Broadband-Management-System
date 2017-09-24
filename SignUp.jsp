<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<html>
    <head>
        <script type = "text/javascript">
            function validateForm()
            {
                var x = document.forms["form1"]["email"].value;
                if ( /^\w+([\.-]?\w+)*@\w+.com$/.test(x)){
                    alert("Email not in correct format!");
                    return false;
                }
                else (x==""){
                    alert("Email should be filled!");
                    return false;
                }
                return true;
            }
        </script>
    </head>

<body>
<style>
  a:link, a:visited 
    { 
        background-color: #ff0000;
        color: white;    
        padding:15px 95px;
        text-align: center; 
        text-decoration: none;
        display: inline-block;
        margin-left: 300px;
        width : 35%;
    }

a:hover, a:active 
    {
        background-color: #ff0000;
    }
</style>
<link rel="stylesheet" type="text/css" href="SignUp.css">
<h2>Signup Form</h2>

<form name="form1" action="SignUp.jsp" style="border:1px solid #ccc" method="post" onsubmit="return validateForm()">
  <div class="container">
    <label><b>Full Name</b></label>
    <input type="text" placeholder="Enter Full Name" name="name" required>

    <label><b>User Name</b></label>
    <input type="text" placeholder="Enter User Name" name="uname" required>

    <label><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>

    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pass" required>

    <input type="checkbox" checked="checked"> Remember me
    <p>By creating an account you agree to our <b>Terms & Privacy</b>.</p>

    <div class="clearfix">
      <a href = "JavaScript:window.close()" >Cancel</a>
      <button type="submit" class="signupbtn" style="margin-left: 300px;">Sign Up</button>
    </div>
  </div>
</form>

<%
  String name = request.getParameter("name");
  String email = request.getParameter("email");
  String pass = request.getParameter("pass") ;
  String uname = request.getParameter("uname");

  Class.forName("com.mysql.jdbc.Driver");

  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/OOAD", "root", "ani");

  
  String sql = "insert into users values(?,?,?,?,?,?,?)";

   if (name!=null && email!=null && pass!=null && uname!=null) {
      PreparedStatement ps = conn.prepareStatement(sql);
      ps.setString(1, name);
      ps.setString(2, uname); 
      ps.setString(3, email);
      ps.setString(4, pass);
      ps.setString(5, "");
      ps.setInt(6, 0);
      ps.setString(7, "");
      ps.execute();

      Cookie[] cookies = null;
          cookies = request.getCookies();

          for(int i=0; i < cookies.length; ++i)
          {
            if(cookies[i].getName().equals("username"))
            {
              cookies[i].setMaxAge(0);
            }
          }

      Cookie c = new Cookie("username", uname);
      c.setMaxAge(60*60*24);
      response.addCookie(c);

      response.sendRedirect("homepage.jsp");
  }
  %>
  

      
</body>
</html>
