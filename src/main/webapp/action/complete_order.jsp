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
		
			System.out.println("Param: " + request.getParameter("do"));
		
			if (request.getParameter("do").equals("complete"))
			{
				int i = OrderDAO.completeOrder(id);				
				response.sendRedirect("../staff-dashboard.jsp?action=complete&orderId=" + id);
			}
			else if (request.getParameter("do").equals("undo"))
			{
				int i = OrderDAO.undoCompleteOrder(id);
				response.sendRedirect("../staff-dashboard.jsp?action=undo&orderId=" + id);
			}
			else
			{
				response.sendRedirect("../staff-dashboard.jsp?action=bad");
			}
		%>
	</body>
</html>