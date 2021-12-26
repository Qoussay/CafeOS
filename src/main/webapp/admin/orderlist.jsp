<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Orders | CafeOS</title>
		<style>
			th, td { text-align: center; padding: 10px; }
		</style>
	</head>
	<body>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ page import="com.cafeos.DAO.OrderDAO, com.cafeos.bean.Order, 
						 com.cafeos.DAO.UserDAO, com.cafeos.bean.User, 
						 java.util.*" %>
		
		<%
			/* USER AUTHENTICATION */
			int uid = Integer.parseInt(session.getAttribute("userId").toString());
			User user = UserDAO.getById(uid);
			
			System.out.println(user);

			if (user.getIsAdmin() != 1)
				response.sendRedirect("access-denied.jsp");
		%>
		
		<%
			List<Order> list= null;
			String dateFilter = "All Time";
			int statusFilter = 2;
			
			if (request.getParameter("dateFilter") != "")
				dateFilter = request.getParameter("dateFilter");
			
			if (request.getParameter("statusFilter") != null)
				statusFilter = Integer.parseInt(request.getParameter("statusFilter")); 
			
			System.out.println(dateFilter + "/" + statusFilter);
			
			if (dateFilter == "All Time" || dateFilter == null)
			{
				list = OrderDAO.getAllOrder();
				dateFilter = "All Time";
			}
			else
				list = OrderDAO.getOrderByDate(dateFilter);
			
			List<Order> filtered_list = OrderDAO.filterOrderByStatus(list, (short) statusFilter);
			
			request.setAttribute("dateFilterValue", dateFilter);
			request.setAttribute("statusFilterValue", statusFilter);
			request.setAttribute("list", filtered_list);
		%>
		
		<h1>Order List - CafeOS</h1>
		
		<div>
			<strong>Order List</strong> &#9679;
			<a href="menulist.jsp">Menu List</a> &#9679;
			<a href="userlist.jsp">User List</a> &#9679;
			<a href="staff-dashboard.jsp">Return to Dashboard...</a>
		</div>

		<div style="margin-top: 20px;">		

			<form action="orderlist.jsp" method="post">
				<p>Filter by Date: <input type="date" name="dateFilter"/> <i>(Leave empty for "All Time")</i></p>
				<p>
					Filter by Status:
					<input type="radio" name="statusFilter" value="0" <c:if test="${statusFilterValue == 0}">checked</c:if> />Active Only
					<input type="radio" name="statusFilter" value="1" <c:if test="${statusFilterValue == 1}">checked</c:if> />Completed Only
					<input type="radio" name="statusFilter" value="2" <c:if test="${statusFilterValue == 2}">checked</c:if> />All
				</p>
				<input type="submit" value="Filter"/>
				<input type="button" onclick="location.href='orderlist.jsp';" value="Refresh" />
			</form>
		</div>
		
		<c:choose>
			<c:when test="${list.isEmpty()}">	
				<hr/><p><strong>No orders found on date: <c:out value="${dateFilterValue}"></c:out> with current status filter!</strong></p>
				<p>Click <a href="orderlist.jsp">here</a> to refresh.</p>
			</c:when>
			<c:otherwise>
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
							<td>${item.getIsCompleted()}</td>
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
		
		<br/><hr/>
		<p>
			<strong>Session Information:</strong><br/>
			Session ID: <c:out value="${pageContext.session.id}"/><br/>
			Logged in User: <c:out value="${sessionScope.username}"/> | ID: <c:out value="${sessionScope.userId}"/>
		</p>
	</body>
</html>