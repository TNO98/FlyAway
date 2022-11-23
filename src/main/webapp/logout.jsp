<%@page import="java.io.PrintWriter"%>
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
PrintWriter pw = response.getWriter();
if(session.getAttribute("adminId")!=null){
	session.invalidate();
	pw.println("<h1>logging out...</h1>");
	response.setHeader("Refresh", "3;url=admin-login.html");
	
}
else {
	response.setHeader("Refresh", "1;url=admin-login.html");
}



%>


</body>
</html>