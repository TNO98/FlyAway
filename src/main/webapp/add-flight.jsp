<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.dao.FlightDao"%>
<%@page import="com.model.Flight"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="error-page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("adminId")!=null){
	
	PrintWriter pw = response.getWriter();
	String flightName=request.getParameter("flight-name");
	String flightSource=request.getParameter("source");
	String flightDestination=request.getParameter("destination");
	String[] days=request.getParameterValues("days");
	String daysAvailable=String.join("_", days);
	double ticketPrice=Integer.parseInt(request.getParameter("ticket-price"));

	Flight flight= new Flight(flightName,flightSource,flightDestination,daysAvailable,ticketPrice);

	FlightDao fd = new FlightDao();
	fd.saveFlight(flight);


	pw.println("Flight Saved sucessfully !!...redirecting");

	response.setHeader("Refresh", "3;url=admin-dashboard.jsp"); 
	
}
else{
	PrintWriter pw= response.getWriter();
	pw.println("<h1>Please login first</h1>");
	response.setHeader("Refresh", "3;url=admin-login.html");
}



%>
</body>
</html>