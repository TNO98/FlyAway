<%@page import="com.dao.BookingDao"%>
<%@page import="com.model.Booking"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page errorPage="error-page.jsp" %>

<%
String cName = request.getParameter("c-name");
String cEmail = request.getParameter("c-email");
String cPassport = request.getParameter("c-passport");
String mobile = request.getParameter("c-mob");

String source = request.getParameter("source");
String destination = request.getParameter("destination");
String dateOfBooking = request.getParameter("travel-date");
String flightName = request.getParameter("flight-name");
int noOfPerson = Integer.parseInt(request.getParameter("no-of-person"));
double ticketPrice = Double.parseDouble(request.getParameter("ticket-price"));
double totalTicketPrice = noOfPerson * ticketPrice;

Booking booking = new Booking();
booking.setcName(cName);
booking.setcEmail(cEmail);
booking.setcPassport(cPassport);
booking.setMobile(mobile);
booking.setSource(source);
booking.setDestination(destination);
booking.setDateOfBooking(dateOfBooking);
booking.setFlightName(flightName);
booking.setNoOfPerson(noOfPerson);
booking.setTotalTicketPrice(totalTicketPrice);
//BookingDao bd = new BookingDao();
//bd.saveBooking(booking);
session.setAttribute("booking", booking);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="assets/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" href="assets/style.css" />
<link rel="stylesheet" href="style.css">


</head>
<body class="d-flex flex-column min-vh-100">

	<header class="container">
		<nav class="navbar navbar-expand-lg bg-light ">
			<div class="container-fluid text-center">
				<a href=" index.html" class="navbar-brand ms-0 ms-md-5 "> <img
					src="assets/logo.png" alt="Logo" height="60px" width="180px" /></a>
			</div>
			<div class="mx-auto me-md-3 my-auto">

				<a class="btn btn-primary   admin-btn" href="admin-login-check.jsp">Admin</a>

			</div>


		</nav>

	</header>
<body>
	<div class="container mt-4 d-flex justify-content-center main">
		<div class="card">
			<div class="d-flex justify-content-between px-3 pt-4">
				<span class="pay">Pay amount</span>
				<div class="amount">
					<div class="inner">
						<span class="dollar">Rs.</span> <span class="total"><%=totalTicketPrice%></span>
					</div>
				</div>
			</div>
			<form action="ticket.jsp" method="post">
				<div class="px-3 pt-3">
					<label for="card number" class="d-flex justify-content-between">
						<span class="labeltxt">CARD NUMBER</span> <img
						src="assets/master.png" width="25" class="image">
					</label> <input type="number" name="number" required="required"
						class="form-control inputtxt" placeholder="8881 2545 2545 2245">
				</div>
				<div class="d-flex justify-content-between px-3 pt-4">
					<div>
						<label for="date" class="exptxt">Expiry</label> <input
							type="number" name="number" required="required"
							class="form-control expiry" placeholder="MM / YY">
					</div>
					<div>
						<label for="cvv" class="cvvtxt">CVV /CVC</label> <input
							type="number" name="number" min="100" max="999"
							required="required" class="form-control cvv" placeholder="123">
					</div>
				</div>
				<div
					class="d-flex align-items-center justify-content-between px-3 py-4">
					<div>
						<button type="reset" class="btn btn-primary">Reset</button>
					</div>
					<div>
						<button type="submit" class="btn btn-primary">Make
							Payment</button>
					</div>
				</div>
			</form>
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


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>

</body>


</html>