<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Menu | CafeOS</title>
	</head>
	<body>
		<%@ page import="com.cafeos.DAO.MenuDAO, com.cafeos.bean.Menu, java.util.*" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
		<%
			List<Menu> list = MenuDAO.getAllMenu();
			request.setAttribute("list", list);
		%>
		
		<h1>Menu List - CafeOS</h1>
		
		<div>
			<a href="orderlist.jsp">Order List</a> &#9679;
			<strong>Menu List</strong> &#9679;
			<a href="userlist.jsp">User List</a>	
		</div>		
		
		<table border="1" style="width: 100%; margin-top: 20px;">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Price</th>
				<th>Category</th>
			</tr>
			<c:forEach items="${list}" var="item">
				<tr>
					<td>${item.getMenuId()}</td>
					<td>${item.getName()}</td>
					<td>${item.getPrice()}</td>
					<td>${item.getCategoryId()}</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>