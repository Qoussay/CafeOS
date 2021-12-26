<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Staff Dashboard | CafeOS</title>
		<style>
			th, td { text-align: center; padding: 10px; }
		</style>
	</head>
	<body>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ page import="com.cafeos.DAO.OrderDAO, com.cafeos.bean.Order, 
						 com.cafeos.DAO.UserDAO, com.cafeos.bean.User,
						 java.util.*, java.io.*" %>
		
		<%
			/* USER AUTHENTICATION */
			int uid = -1;
			if (session.getAttribute("userId") != null)
				uid = Integer.parseInt(session.getAttribute("userId").toString());
			
			User user = UserDAO.getById(uid);
			
			System.out.println(user);

			if (user.getIsAdmin() != 1)
				response.sendRedirect("access-denied.jsp");
		%>
		
		<%
			// Auto Refresh Every 30 seconds
			response.setIntHeader("Refresh", 30);
		
			List<Order> list = OrderDAO.filterOrderByStatus(null, (short) 0);
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
		<p>
		   	Last Refresh: <c:out value="${time}"></c:out> <i>(Auto refresh every 30 seconds)</i> || 
		   	<input type="button" onclick="location.href='staff-dashboard.jsp';" value="Refresh" /> 
		   	<input type="button" onclick="location.href='orderlist.jsp';" value="View All Orders (Admin View)" />
		   	<span style="float: right;">[ <a href="../logout">Logout</a> ]</span>	
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
						<span><input type="button" onclick="location.href='../action/complete_order.jsp?do=undo&orderId=${param.orderId}';" value="Undo" /></span>
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
					<td>
						<input type="button" onclick="location.href='../action/complete_order.jsp?do=complete&orderId=${item.getOrderId()}';" value="Complete" />
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<br/><hr/>
		<p>
			<strong>Session Information:</strong><br/>
			Session ID: <c:out value="${pageContext.session.id}"/><br/>
			Logged in User: <c:out value="${sessionScope.username}"/> | ID: <c:out value="${sessionScope.userId}"/>
		</p>
	</body>
</html>