<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- ======== FONT AWESOME ICONS ======== -->
    <script src="https://kit.fontawesome.com/bae18c500b.js" crossorigin="anonymous"></script>

    <!-- ======== STYLE CSS ======== -->
    <link rel="stylesheet" href="./assets/css/style.css">

    <!-- ======== TITLE ======== -->
    <title>Java Beans - Order History</title>
</head>
<body>
    <!-- ======== HEADER ======== -->
    <%@include file="./components/navbar.jsp" %>

	<%@page import="com.cafeos.bean.User, com.cafeos.bean.Order, com.cafeos.DAO.UserDAO, com.cafeos.DAO.OrderDAO, java.util.*" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
    <!-- CHECKOUT SECTION -->
    <section class="checkout-section section">
        <div class="checkout-container container">
            <h1 class="checkout-title">Order History</h1>
            <div class="checkout-list">
				<%
					if (session.getAttribute("username") == null)
						response.sendRedirect("/CafeOS/login.jsp");
					else{
						/* USER AUTHENTICATION */
						int uid = Integer.parseInt(session.getAttribute("userId").toString());
						User user = UserDAO.getById(uid);

						/* GET ORDER BY USER ID */
						List<Order> order_history = OrderDAO.getByUserId(uid);
						request.setAttribute("order_history", order_history);
					}
				
					
				%>
			</div>
			<table border="1" style="width: 100%; margin-top: 20px;">
					<tr>
						<th>Order ID</th>
						<th>Items</th>
						<th>Total Price</th>
						<th>Date</th>
						<th>Completed?</th>
					</tr>
					<c:forEach items="${order_history}" var="item">
						<tr>
							<td>${item.getOrderId()}</td>
							<td>${item.getOrderNames()}</td>
							<td>${item.getTotalPrice()}</td>
							<td>${item.getDate()}</td>
							<td>
							<c:if test="${item.getIsCompleted() == 0}" var="condition">
							    No
							</c:if>
							<c:if test="${!condition}">
							    Yes
							</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
		</div>
    </section>

    
    <!-- ======== FOOTER SECTION ======== -->
    <footer class="footer">
        JAVA BEANS COPYRIGHT
    </footer>
    
    <!-- ======== MAIN JS ======== -->
    <script src="./assets/js/main.js"></script>
</body>
</html>