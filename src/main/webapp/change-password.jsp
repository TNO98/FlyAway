<%@page import="java.text.ParsePosition"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="error-page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ichange Password</title>
</head>
<body>
<%
	if(session.getAttribute("adminId")!=null){
		
		String adminEmail= (String)session.getAttribute("adminEmail");
		String password= request.getParameter("admin-pass");
		String confirmPassword= request.getParameter("admin-repeat-pass");
		PrintWriter pw = response.getWriter();
		
		if(password.equals(confirmPassword)){
			AdminDao ad = new AdminDao();
			int n = ad.updateAdmin((int)session.getAttribute("adminId"), password);
			
			if(n>0){
				
				pw.println("<h1> password changed successfully..Redirecting to dashboard</h1>");
				response.setHeader("Refresh", "3;url=admin-dashboard.jsp");
			}
			else{
				pw.println("Some error occured please try again");
				response.setHeader("Refresh", "3;url=change-password.html");
			}
			
		}
		else{
			pw.println("<h1>Passwords do not match, redirecting...</h1>");
			response.setHeader("Refresh", "3;url=change-password.html");
		}
	}
	else{
		PrintWriter pw = response.getWriter();
		pw.println("<h1>Please login first</h1>");
		response.setHeader("Refresh", "3;url=admin-login.html");
	}

%>


</body>
</html>