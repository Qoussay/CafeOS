<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Delete User | CafeOS</title>
	</head>
	<body>
		<%@ page import="com.cafeos.DAO.MenuDAO" %>
		
		<jsp:useBean id="m" class="com.cafeos.bean.Menu"></jsp:useBean>
		<jsp:setProperty property="*" name="m"/>
		
		<%
			System.out.println("[New] " + m);
			int i = MenuDAO.save(m);
			response.sendRedirect("../admin/menulist.jsp");
		%>
	</body>
</html>