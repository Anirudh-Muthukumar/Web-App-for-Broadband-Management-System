<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
<style>
form {
    border: 3px solid #f1f1f1;
}

input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
a:link, a:visited 
    { 
        background-color: #040404;
        color: white;    
        padding:15px 95px;
        text-align: center; 
        text-decoration: none;
        display: inline-block;
    }

a:hover, a:active 
    {
        background-color: #73C6B6;
    }

</style>
<body>

<h2>Login Form</h2>

<form name="form2" action="Login.jsp" method="post" style="border:1px solid #ccc">
  <div class="imgcontainer">
    <img src="Images/login.jpg" style="width:125px;height:125px" alt="Avatar" class="avatar">
  </div>

  <div class="container">
    <label><b>Email</b></label>
    <input type="text" placeholder="Enter email" name="email" required>

    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pass" required>
        
    <button type="submit">Login</button>
    <input type="checkbox" checked="checked"> Remember me
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <a href="JavaScript:window.close()">Cancel</a>
  </div>
</form>



<%
  
  String e = request.getParameter("email");
  String p = request.getParameter("pass") ;

  Class.forName("com.mysql.jdbc.Driver");

  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/OOAD", "root", "ani");

  String sql = "Select * from users where email = ?";

  int status = 0;
  String uname = "";
  String email = "";
  String pass = "";
  String name = "";

  if(e!=null && p!=null)
  {
    PreparedStatement ps = conn.prepareStatement(sql);

    ps.setString(1, e);

    ResultSet rs = ps.executeQuery();

    while(rs.next())
    {
    if(p.equals(rs.getString("password")))
    {
        name = rs.getString("fullname");
        uname = rs.getString("username");
        email = e;
        pass = p;
        status = 1;

        Cookie[] cookies = null;
        cookies = request.getCookies();

            for(int i=0; i < cookies.length; ++i)
            {
                if(cookies[i].getName().equals("username"))
                {
                    cookies[i].setMaxAge(0);
                }
            }

        Cookie c = new Cookie("username",uname);
        c.setMaxAge(60*60*24);
        response.addCookie(c);
        response.sendRedirect("homepage.jsp");        
    } 
    else
    {
        response.sendRedirect("Login.jsp");
    }
    }
  }
%>



</body>
</html>
