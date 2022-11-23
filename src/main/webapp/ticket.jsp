<%@page import="com.dao.BookingDao"%>
<%@page import="com.model.Booking"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page errorPage="error-page.jsp"%>

<%
Booking b = new Booking();
b = (Booking) session.getAttribute("booking");

BookingDao bd = new BookingDao();
bd.saveBooking(b);
Double ticketPrice = b.getTotalTicketPrice() / b.getNoOfPerson();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<link rel="stylesheet" href="assets/bootstrap.min.css">
<link rel="stylesheet" href="assets/style.css" />
<script>
	function printDiv() {
		var body = document.getElementById("body").innerHTML;
		var ticket = document.getElementById("ticket").innerHTML;
		document.getElementById("body").innerHTML = ticket;
		window.print();
		document.getElementById("body").innerHTML = body;

	}
</script>
</head>
<body class="d-flex flex-column min-vh-100" id="body">
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
	<div class="d-inline-flex justify-content-center p-2">
		<div class="alert alert-success " role="alert">
			Payment successfull!! <br> Your ticket has been booked. The
			summary/details are as follows
		</div>
	</div>
	<div class=" d-inline-flex justify-content-center  mt-2  p-2"
		id="ticket">
		<div class="card">
			<div class="card-header">
				Ticket ID #<%=b.getBookingId()%></div>
			<div class="card-body ">


				<div>
					<h5 class="source"><%=b.getSource().toUpperCase()%>
						to
						<%=b.getDestination().toUpperCase()%></h5>
				</div>
				
				<div>
					<p>23/12/2022</p>
				</div>
				<div>
					<p>Flight Name : <%=b.getFlightName() %></p>
				</div>
				<div>
					<p>Passenger's Name : <%=b.getcName()%></p>
				</div>
				
				<div>
					<p>
						Number of persons :
						<%=b.getNoOfPerson()%></p>
				</div>
				<div>
					<p>
						Total Ticket price : Rs.
						<%=ticketPrice%>
						x
						<%=b.getNoOfPerson()%>
						=Rs.
						<%=b.getTotalTicketPrice()%></p>
				</div>
				<button class="btn btn-primary" onclick="printDiv()">Print
					Ticket</button>
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



	<%
	session.invalidate();
	%>
</body>
</html>
