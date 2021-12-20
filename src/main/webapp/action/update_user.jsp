<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Delete User | CafeOS</title>
	</head>
	<body>
		<%@ page import="com.cafeos.DAO.UserDAO" %>
		
		<jsp:useBean id="u" class="com.cafeos.bean.User"></jsp:useBean>
		<jsp:setProperty property="*" name="u"/>
		
		<%
			System.out.println("[New] " + u);
			int i = UserDAO.update(u);
			response.sendRedirect("../admin/userlist.jsp");
		%>
	</body>
</html>