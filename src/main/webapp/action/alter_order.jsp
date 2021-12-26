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
			int i;
			int id = Integer.parseInt(request.getParameter("orderId"));
		
			System.out.println("Param: " + request.getParameter("do"));
		
			if (request.getParameter("do").equals("complete"))
				i = OrderDAO.completeOrder(id);				
			else if (request.getParameter("do").equals("undo"))
				i = OrderDAO.undoCompleteOrder(id);
			
			response.sendRedirect("../admin/orderlist.jsp");
		%>
	</body>
</html>