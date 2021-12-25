<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Edit Menu | CafeOS</title>
	</head>
	<body>
		<%@page import="com.cafeos.DAO.MenuDAO, com.cafeos.bean.Menu" %>

		<%
			String id = request.getParameter("menuId");
			Menu m = MenuDAO.getById(Integer.parseInt(id));
			
			String category = m.categoryToString();
			
			request.setAttribute("menuID", id);
			request.setAttribute("category", category);
		%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
		<h1>Edit Menu</h1>
		<form action="../action/update_menu.jsp">
			<input type="hidden" name="menuId" value=<%=m.getMenuId()%> />
			<table>
				<tr>
					<td>Menu ID:</td>
					<td><c:out value="${menuID}"></c:out></td>
				</tr>
				<tr>
					<td>Menu Name:</td>
					<td><input type="text" name="name" value="<%=m.getName()%>" /></td>
				</tr>
				<tr>
					<td>Price:</td>
					<td><input type="text" name="price" value="<%=m.getPrice()%>" /></td>
				</tr>
				<tr>
					<td>Category:</td>
					<td><c:out value="${category}"></c:out></td>
				</tr>
			</table>
			
			<div style="margin-top: 20px;">
				<input type="submit" value="Save Changes" /> &nbsp
				<span><a href="menulist.jsp">Cancel Edit</a></span>	
			</div>
		</form>
	</body>
</html>