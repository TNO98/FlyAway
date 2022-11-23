<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page errorPage="error-page.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="assets/bootstrap.min.css">
<link rel="stylesheet" href="assets/style.css" />
</head>

<%if(session.getAttribute("adminId")!=null){ %>
<body class="d-flex flex-column min-vh-100">
	<header class="container">
		<nav class="navbar navbar-expand-lg bg-light ">
			<div class="container-fluid text-right">
				<a href=" index.html" class="navbar-brand mx-auto ms-md-5 "> <img
					src="assets/logo.png" alt="Logo" height="60px" width="180px" /></a>
			</div>

		</nav>
 
	</header>

	<div class="container text-center mt-3">
		<h3>Admin DashBoard</h3>
		<p> You are logged in as : <%=session.getAttribute("adminEmail") %></p>
	</div>
	<div class="container text-center mt-3">
		<a class="btn btn-primary mx-3" href="add-flight.html">
			Add Flight	
		</a>
		<a class="btn btn-primary mx-3" href="flight-list.jsp">
			flight list	
		</a>
		<a class="btn btn-primary mx-3" href="change-password.html">
			change password	
		</a>
		<a class="btn btn-primary mx-3" href="logout.jsp">
			Logout	
		</a>
		
	</div>
	<div class="container mt-auto text-center"><img class="img-fluid" src="assets/route.png" alt="route-img"></div>
	
	
	
	
	<footer class="bg-light text-center text-lg-start mt-auto">
		<!-- Copyright -->
		<div class="text-center p-3">
			© 2022 Copyright:
			<h5 class="text-dark">flyAway | Developed by Malay Sarkar</h5>
		</div>
		<!-- Copyright -->
	</footer>

</body>
<%}
else{
	PrintWriter pw= response.getWriter();
	pw.println("<h1>Please login first</h1>");
	response.setHeader("Refresh", "3;url=admin-login.html");
}

%>
</html>



