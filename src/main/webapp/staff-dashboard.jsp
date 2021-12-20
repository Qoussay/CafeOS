<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Staff Dashboard | CafeOS</title>
	</head>
	<body>
		<%@ page import="com.cafeos.DAO.OrderDAO, com.cafeos.bean.Order, java.util.*, java.io.*" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
		<%
			// Auto Refresh Every 30 seconds
			response.setIntHeader("Refresh", 30);
		
			List<Order> list = OrderDAO.getPendingOrder();
			request.setAttribute("list", list);
			request.setAttribute("listLength", list.size());
			
			Calendar calendar = new GregorianCalendar();
			String period;
			
			String h = String.format("%02d", calendar.get(Calendar.HOUR));
			String m = String.format("%02d", calendar.get(Calendar.MINUTE));
			String s = String.format("%02d", calendar.get(Calendar.SECOND));
			
			if (calendar.get(Calendar.AM_PM) == 0)
				period = "AM";
			else
				period = "PM";
			
			String time = h + ":" + m + ":" + s + " " + period;
			request.setAttribute("time", time);
		%>
		
		<h1>Pending Orders: <c:out value="${listLength}"></c:out></h1>
		<p>Last Refresh: <c:out value="${time}"></c:out> ||
		   <a href="staff-dashboard.jsp">Refresh</a>
		</p>
		
		<c:if test="${param.action != null}">
			<c:choose>
			<c:when test="${param.action == 'bad'}">
				<p><strong>ERROR:</strong> Bad Request</p>
			</c:when>
			<c:otherwise>
				<c:if test="${param.action == 'complete'}">
					<p>
						Successfully completed order with ID: <c:out value="${param.orderId}"></c:out> :::
						<a href="action/complete_order.jsp?do=undo&orderId=${param.orderId}">Undo Complete Order</a></span>
					</p>
				</c:if>
				<c:if test="${param.action == 'undo'}">
					<p>Successfully undone complete order with ID: <c:out value="${param.orderId}"></c:out></p>
				</c:if>
			</c:otherwise>
			</c:choose>
		</c:if>
		
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
					<td><a href="action/complete_order.jsp?do=complete&orderId=${item.getOrderId()}">Complete</a></td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>