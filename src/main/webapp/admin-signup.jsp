<%@page import="java.io.PrintWriter"%>
<%@page import="com.dao.AdminDao"%>
<%@page import="com.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String adminEmail= request.getParameter("admin-email");
	String adminPass= request.getParameter("admin-pass");
	
	Admin admin= new Admin(adminEmail,adminPass);

	AdminDao adminDao = new AdminDao();
	adminDao.saveAdmin(admin);
	
	PrintWriter pw = response.getWriter();
	pw.println("Admin Saved sucessfully !!");
	
	response.setHeader("Refresh", "3;url=admin-login.html"); 

%>


</body>
</html>