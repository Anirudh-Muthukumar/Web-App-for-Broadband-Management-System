<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
* {
    box-sizing: border-box;
}

.columns {
    float: left;
    width: 33.3%;
    padding: 8px;
}

.price {
    list-style-type: none;
    border: 1px solid #eee;
    margin: 0;
    padding: 0;
    -webkit-transition: 0.3s;
    transition: 0.3s;
}

.price:hover {
    box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2)
}

.price .header {
    background-color: #111;
    color: white;
    font-size: 20px;
}

.price li {
    border-bottom: 1px solid #eee;
    padding: 20px;
    text-align: center;
}

.price .grey {
    background-color: #eee;
    font-size: 20px;
}

input[type=submit] {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 10px 25px;
    text-align: center;
    text-decoration: none;
    font-size: 18px;
}

@media only screen and (max-width: 600px) {
    .columns {
        width: 100%;
    }
}
</style>
</head>
<body>

<h2 style="text-align:center">Our Plans</h2>
<a href="homepage.jsp" style="float:right;">Back to Homepage</a>
<br>
<form method = "post" action = "checkout.jsp">
<div class="columns">
  <ul class="price">
    <li class="header">Home Starter</li>
    <li class="grey">$ 9.99 / month</li>
    <li>10Mbps for 50 GB</li>
    <li>1Mbps post 50 GB</li>
    <li class="grey"><input type="submit" value="Sign Up" name="starter"></li>
  </ul>
</div>

<div class="columns">
  <ul class="price">
    <li class="header" style="background-color:#4CAF50">Home Basic</li>
    <li class="grey">$ 24.99 / month</li>
    <li>15Mbps for 75 GB</li>
    <li>1Mbps post 75 GB</li>
    <li class="grey"><input type="submit" value="Sign Up" name="basic"></li>
  </ul>
</div>

<div class="columns">
  <ul class="price">
    <li class="header">Home Premium</li>
    <li class="grey">$ 49.99 / month</li>
    <li>25Mbps for 125 GB</li>
    <li>5Mbps post 125 GB</li>
    <li class="grey"><input type="submit" value="Sign Up" name="premium"></li>
  </ul>
</div>

<div class="columns">
  <ul class="price">
    <li class="header">Home Ultimate</li>
    <li class="grey">$ 79.99 / month</li>
    <li>50Mbps for 150 GB</li>
    <li>10Mbps post 150 GB</li>
    <li class="grey"><input type="submit" value="Sign Up" name="ultimate"></li>
  </ul>
</div>

<div class="columns">
  <ul class="price">
    <li class="header">Home Pro</li>
    <li class="grey">$ 99.99 / month</li>
    <li>100Mbps for 200 GB</li>
    <li>10Mbps post 200 GB</li>
    <li class="grey"><input type="submit" value="Sign Up" name="pro"></li>
  </ul>
</div>
</form>
<script language="javascript" type="text/javascript">
			history.pushState({page:1}, "title 1","#nbb");
			window.onhashchange = function(event) {
				window.location.hash = "nbb";
			};
		</script>
</body>
</html>
