<%@page import="com.model.Flight"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.FlightDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>

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
<body class="d-flex flex-column min-vh-100">
	<%
	FlightDao fd = new FlightDao();

	List<Flight> flightList = fd.allFlightList();
	request.setAttribute("flightlist", flightList);
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
	
	<div class="container text-center mt-3">
		<p> You are logged in as : <%=session.getAttribute("adminEmail") %></p>
	</div>

	<div class="container">
		<div class="row ms-md-1 ">
			<div class="col-md-12 p-md-5 ">
				<div class="card m-5">
					<h3 class="card-header  text-center bg-white">List of flights
						available</h3>
					<div class="card-body bg-white">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">Name</th>
										<th scope="col">Source</th>
										<th scope="col">Destination</th>
										<th scope="col">Days available</th>
										<th scope="col">Ticket price</th>
									</tr>
								</thead>
								<tbody>

									<core:forEach items="${flightlist}" var="fl">
										<tr>
											<th scope="row">${fl.getFlightId()}</th>
											<td>${fl.getFlightName()}</td>
											<td>${fl.getSource()}</td>
											<td>${fl.getDestination()}</td>
											<td>${fl.getDays()}</td>
											<td>${fl.getTicketPrice()}</td>
										</tr>
									</core:forEach>


								</tbody>
							</table>

						</div>

					</div>
				</div>


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