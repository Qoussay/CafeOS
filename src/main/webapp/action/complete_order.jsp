<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Delete User | CafeOS</title>
	</head>
	<body>
		<%@ page import="com.cafeos.DAO.OrderDAO" %>
		
		<%
			int id = Integer.parseInt(request.getParameter("orderId"));
			int i = OrderDAO.completeOrder(id);
			response.sendRedirect("../staff-dashboard.jsp");
		%>
	</body>
</html>