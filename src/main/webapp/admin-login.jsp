<%@page import="java.io.PrintWriter"%>
<%@page import="com.model.Admin"%>
<%@page import="com.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page errorPage="error-page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login Jsp</title>
</head>
<body>
	<%
		String adminEmail=request.getParameter("email");
		String adminPassword=request.getParameter("password");
		
		AdminDao adminDao=new AdminDao();
		Admin admin = adminDao.getAdmin(adminEmail, adminPassword);
		
		if(admin!=null){
			session.setAttribute("adminEmail", admin.getEmail());
			session.setAttribute("adminId", admin.getAdminId());
			response.sendRedirect("admin-dashboard.jsp");
		}
		else{
			PrintWriter pw = response.getWriter();
			pw.println("<h1>invalid email or password</h1>");

			response.setHeader("Refresh", "3;url=admin-login.html"); 
		}
	%>



</body>
</html>