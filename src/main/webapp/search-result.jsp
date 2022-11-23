<%@page import="com.model.Flight"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.FlightDao"%>
<%@page import="com.utils.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page errorPage="error-page.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
	
	<% 
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String travelDate = request.getParameter("travel-date");
		String noOfPerson =request.getParameter("number-of-person");
		String cName=request.getParameter("p-name");
		String cEmail=request.getParameter("p-email");
		String cMobile=request.getParameter("p-mob");
		String cPassport=request.getParameter("passport");
		
		String day=DateUtil.getDay(travelDate);
		
		FlightDao fd =new FlightDao();
		
		List<Flight> flightList = fd.getFlightList(source, destination, day);
		request.setAttribute("flightlist", flightList);
		if(flightList!=null){
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search result</title>
<link rel="stylesheet" href="assets/bootstrap.min.css">
<link rel="stylesheet" href="assets/style.css" />
</head>
<body>
	<header class="container">
		<nav class="navbar navbar-expand-lg bg-light ">
			<div class="container-fluid text-right">
				<a href=" index.html" class="navbar-brand mx-auto ms-md-5 "> <img
					src="assets/logo.png" alt="Logo" height="60px" width="180px" /></a>
			</div>


		</nav>

	</header>
	<div class="container text-center">
        <h2><span><strong>Search Result</strong></span></h2>
        <p><span><strong>Showing available flights from <%=source %> to <%=destination %><br>
        	Date of travel: <%=travelDate %> <br>
        	No of travellers : <%=  noOfPerson%></strong></span>
        </p>
    </div>
    <div class="container responsive-table">
    <table class="table table-hover table-striped">
        <thead>
         <tr>
            <th scope="col">Flight</th>
            <th scope="col">Source</th>
            <th scope="col">Destination</th>
            <th scope="col">Days Available</th>
            <th scope="col">Ticket Price</th>
            <th scope="col">#</th>
         </tr>
        </thead>
        <tbody>
        	
            <core:forEach items="${flightlist}" var="fl">
            	<tr style="background-color:#F5F5F5">
                <td>${fl.getFlightName()}</td>
                <td>${fl.getSource()}</td>
                <td>${fl.getDestination()}</td>
                <td>${fl.getDays()}</td>
                <td>${fl.getTicketPrice()}</td>
           
                <td>
                	<form action="payment.jsp" method="post">
                		<input type="hidden" id="flight-name" name="flight-name" value="${fl.getFlightName()}">
                		<input type="hidden" id="source" name="source" value="${fl.getSource()}">
                		<input type="hidden" id="destination" name="destination" value="${fl.getDestination()}">
                		<input type="hidden" id="ticket-price" name="ticket-price" value="${fl.getTicketPrice()}">
                		<input type="hidden" id="c-name" name="c-name" value="<%=cName%>">
                		<input type="hidden" id="c-email" name="c-email" value="<%=cEmail%>">
                		<input type="hidden" id="c-mob" name="c-mob" value="<%=cMobile%>">
                		<input type="hidden" id="c-passport" name="c-passport" value="<%=cPassport%>">
                		<input type="hidden" id="no-of-person" name="no-of-person" value="<%=noOfPerson%>">
                		<input type="hidden" id="travel-date" name="travel-date" value="<%=travelDate%>">
                		<input type="submit" class="btn btn-outline-primary" value="Book">
                		
                	</form>
                </td>
            </tr>
            
            </core:forEach>
        </tbody>
    </table>
  </div>
	
</body>
<%}
		else{
			
			out.println("<h3>No flight found using given input, Please search for another flight..redirecting</h3>");
			response.setHeader("Refresh", "3;url=index.html");
		}
%>
</html>