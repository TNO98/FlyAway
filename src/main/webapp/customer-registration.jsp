<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page errorPage="error-page.jsp" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>customer registration</title>
<link rel="stylesheet" href="assets/bootstrap.min.css">
<link rel="stylesheet" href="assets/style.css" />
</head>
<body>
	<% 
	String source = request.getParameter("source");
	String destination = request.getParameter("destination");
	int nummberOfPassengers = Integer.parseInt(request.getParameter("number-of-person")); 
	String travelDate = request.getParameter("travel-date");
	
	%> 
	<header class="container">
		<nav class="navbar navbar-expand-lg bg-light ">
			<div class="container-fluid text-right">
				<a href=" index.html" class="navbar-brand mx-auto ms-md-5 "> <img
					src="assets/logo.png" alt="Logo" height="60px" width="180px" /></a>
			</div>
			<div class="mx-auto me-md-3 my-auto">

				<a class="btn btn-primary   admin-btn" href="admin-login-check.jsp">Admin</a>

			</div>


		</nav>

	</header>

	<div class="container">
		<div class="row ms-md-1 ">
			<div class="col-md-6 p-md-5 ">
				<div class="card m-5">
					<h3 class="card-header  text-center bg-white">Passenger
						Details</h3>
					<div class="card-body bg-white">
						<form action="search-result.jsp" method="post">
						
							<input type="hidden" name="source" value=<%=source%>>
							<input type="hidden" name="destination" value=<%=destination%>>
							<input type="hidden" name="number-of-person" value=<%=nummberOfPassengers%>>
							<input type="hidden" name="travel-date" value=<%=travelDate%>>

							<div class="form-group">
								<label for="p-name">Name</label> <input type="text"
									class="form-control" name="p-name" id="p-name"
									required="required">
							</div>

							<div class="form-group">
								<label for="p-email">Email</label> <input type="email"
									class="form-control" name="p-email" id="p-email"
									required="required">
							</div>
							<div class="form-group">
								<label for="p-mob">Mobile Number</label> <input type="number"
									class="form-control" name="p-mob" id="p-mob"
									required="required">
							</div>
							<div class="form-group">
								<label for="passport">Passport Number</label> <input type="text"
									class="form-control" name="passport" id="passport"
									required="required">
							</div>
							<div class="form-group">
								<label for="address">Address</label>

								<textarea class="form-control" id="address" name="address" rows="5" cols="33" required="required"></textarea>
				
							</div>

							<div class="form-group mt-3">
								<input type="submit" class="btn btn-primary" value="submit" />
							</div>

						</form>
					</div>
				</div>


			</div>

			<div class="col-md-6 ">
				<img class="d-none d-md-block" src="assets/flyaway.png" alt="flight"
					height="100%" width="100%" />
			</div>

		</div>
	</div>
	
	<footer class="bg-light text-center text-lg-start mt-auto">
		<!-- Copyright -->
		<div class="text-center p-3">
			© 2022 Copyright:
			<h5 class="text-dark">flyAway | Developed by Malay Sarkar</h5>
		</div>
		<!-- Copyright -->
	</footer>

</body>
</html>