<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Menu | CafeOS</title>
		<style>
			th, td { text-align: center; padding: 10px; }
		</style>
	</head>
	<body>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ page import="com.cafeos.DAO.MenuDAO, com.cafeos.bean.Menu, 
						 com.cafeos.DAO.UserDAO, com.cafeos.bean.User,
						 java.util.*" %>
		
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
			List<Menu> list = MenuDAO.getAllMenu();
			request.setAttribute("list", list);
		%>
		
		<h1>Menu List - CafeOS</h1>
		
		<div>
			<a href="orderlist.jsp">Order List</a> &#9679;
			<strong>Menu List</strong> &#9679;
			<a href="userlist.jsp">User List</a> &#9679;
			<a href="staff-dashboard.jsp">Return to Dashboard...</a>
			<span style="float: right;">[ <a href="../logout">Logout</a> ]</span>
		</div>		
		
		<p><input type="button" onclick="location.href='addmenu.jsp';" value="Add New Menu Item..." /></p>
		
		<table border="1" style="min-width: 50vw; margin-top: 20px;">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Price</th>
				<th>Category</th>
				<th>Actions</th>
			</tr>
			<c:forEach items="${list}" var="item">
				<tr>
					<td>${item.getMenuId()}</td>
					<td>${item.getName()}</td>
					<td>${item.getPrice()}</td>
					<td>${item.categoryToString()}</td>
					<td>
						<input type="button" onclick="location.href='editmenu.jsp?menuId=${item.getMenuId()}';" value="Edit" />
						<input type="button" onclick="location.href='../action/delete_menu.jsp?menuId=${item.getMenuId()}';" value="Delete" />
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