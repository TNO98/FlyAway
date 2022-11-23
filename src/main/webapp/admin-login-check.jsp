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
	if (session.getAttribute("adminEmail") != null) {
		response.sendRedirect("admin-dashboard.jsp");
	}
	else{
		response.sendRedirect("admin-login.html");
	}
	%>
</body>
</html>