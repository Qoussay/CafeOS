<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>User | CafeOS</title>
		<style>
			th, td { text-align: center; padding: 10px; }
		</style>
	</head>
	<body>
		<%@ page import="com.cafeos.DAO.UserDAO, com.cafeos.bean.User, java.util.*" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
		<%
			/* USER AUTHENTICATION */
			int uid = Integer.parseInt(session.getAttribute("userId").toString());
			User user = UserDAO.getById(uid);
			
			System.out.println(user);

			if (user.getIsAdmin() != 1)
				response.sendRedirect("access-denied.jsp");
		%>
		
		<%
			List<User> list = UserDAO.getAllUser();
			request.setAttribute("list", list);
		%>
		
		<h1>User List - CafeOS</h1>
		
		<div>
			<a href="orderlist.jsp">Order List</a> &#9679;
			<a href="menulist.jsp">Menu List</a> &#9679;
			<strong>User List</strong> &#9679;
			<a href="staff-dashboard.jsp">Return to Dashboard...</a>	
		</div>	
		
		<table border="1" style="width: 100%; margin-top: 20px;">
			<tr>
				<th>ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th>Password</th>
				<th>Admin?</th>
				<th>Actions</th>
			</tr>
			<c:forEach items="${list}" var="item">
				<tr>
					<td>${item.getUserId()}</td>
					<td>${item.getfName()}</td>
					<td>${item.getlName()}</td>
					<td>${item.getEmail()}</td>
					<td>${item.getPassword()}</td>
					<td>${item.getIsAdmin()}</td>
					<td>
						<input type="button" onclick="location.href='edituser.jsp?userId=${item.getUserId()}';" value="Edit" />
						<input type="button" onclick="location.href='../action/delete_user.jsp?userId=${item.getUserId()}';" value="Delete" />
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