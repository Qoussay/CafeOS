<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Staff Dashboard | CafeOS</title>
	</head>
	<body>
		<%@ page import="com.cafeos.DAO.OrderDAO, com.cafeos.bean.Order, java.util.*" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
		<%
			List<Order> list = OrderDAO.getPendingOrder();
			request.setAttribute("list", list);
			request.setAttribute("listLength", list.size());
		%>
		
		<h1>Pending Orders: <c:out value="${listLength}"></c:out></h1>
		
		<table border="1" style="width: 100%; margin-top: 20px;">
			<tr>
				<th>ID</th>
				<th>Customer</th>
				<th>Items</th>
				<th>Total Price</th>
				<th>Date</th>
				<th>Completed?</th>
			</tr>
			<c:forEach items="${list}" var="item">
				<tr>
					<td>${item.getOrderId()}</td>
					<td>${item.getUserId()}</td>
					<td>${item.getOrderNames()}</td>
					<td>${item.getTotalPrice()}</td>
					<td>${item.getDate()}</td>
					<td><a href="action/complete_order.jsp?orderId=${item.getOrderId()}">Complete</a></td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>