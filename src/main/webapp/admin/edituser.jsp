<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Edit User | CafeOS</title>
	</head>
	<body>
		<%@page import="com.cafeos.DAO.UserDAO, com.cafeos.bean.User" %>

		<%
			String id = request.getParameter("userId");
			User u = UserDAO.getById(Integer.parseInt(id));
		%>
		
		<h1>Edit User</h1>
		<form action="../action/update_user.jsp">
			<input type="hidden" name="userId" value=<%=u.getUserId()%> />
			<table>
				<tr>
					<td>First Name:</td>
					<td><input type="text" name="fName" value=<%=u.getfName()%> /></td>
				</tr>
				<tr>
					<td>Last Name:</td>
					<td><input type="text" name="lName" value=<%=u.getlName()%> /></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="text" name="email" value=<%=u.getEmail()%> /></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="text" name="password" value=<%=u.getPassword()%> /></td>
				</tr>
				<tr>
					<td>Is Admin?</td>
					<td><input type="text" name="isAdmin" value=<%=u.getIsAdmin()%> disabled /></td>
				</tr>
			</table>
			
			<div style="margin-top: 20px;">
				<input type="submit" value="Save Changes" /> &nbsp
				<span><a href="userlist.jsp">Cancel Edit</a></span>	
			</div>
		</form>
	</body>
</html>