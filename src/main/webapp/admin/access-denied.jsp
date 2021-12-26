<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Access Denied | CafeOS</title>
	</head>
	<body>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
		<div style="text-align: center;">
			<h1>Access Denied!</h1>
			<h3>Staff only area!</h3>
			<p>
				You do not have access to the admin area!<br/>
				If you are a staff member, please contact IT Team or Supervisor.<br/><br/>
				<a href="../index.jsp">Return to Home</a>
			</p>
			<br/><hr/><br/>
			<p>
				<strong>Session Information:</strong><br/>
				Session ID: <c:out value="${pageContext.session.id}"/><br/>
				Logged in user: <c:out value="${sessionScope.username}"/>
			</p>
		</div>
	</body>
</html>