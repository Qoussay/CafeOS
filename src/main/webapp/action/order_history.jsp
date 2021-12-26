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
    <link rel="stylesheet" href="../assets/css/style.css">

    <!-- ======== TITLE ======== -->
    <title>Java Beans - Order History</title>
</head>
<body>
    <!-- ======== HEADER ======== -->
    <header class="header">
        <h2 class="header-logo">
            <a href="../index.jsp">Java Beans</a>
        </h2>
        <i class="fas fa-bars header-toggle" id="header-toggle"></i>

        <nav class="nav" id="nav">
            <i class="fas fa-times nav-close" id="nav-close"></i>
            <ul class="nav-menu">
                <li class="nav-item"><a href="../index.jsp#about" class="nav-link">About</a></li>
                <li class="nav-item"><a href="../menu.jsp" class="nav-link">Menu</a></li>
                <li class="nav-item"><a href="../index.jsp#contact" class="nav-link">Contact</a></li>
                <% if (session.getAttribute("username") == null) { %>
                <li class="nav-item"><a href="../login.jsp" class="nav-link">Login</a></li>
                <li class="nav-item"><a href="../register.jsp" class=" btn-primary">Register</a></li>
                <% } else { %>
                <li class="nav-item"><a href="../login.jsp" class="nav-link">Logout</a></li>
                <li class="nav-item"><a href="../menu.jsp" class=" btn-primary">Order</a></li>
                <% } %>
            </ul>
        </nav>
    </header>

	<%@page import="com.cafeos.bean.User, com.cafeos.bean.Order, com.cafeos.DAO.UserDAO, com.cafeos.DAO.OrderDAO, java.util.*" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
    <!-- CHECKOUT SECTION -->
    <section class="checkout-section section">
        <div class="checkout-container container">
            <h1 class="checkout-title">Order History</h1>
            <div class="checkout-list">
				<%
					if (session.getAttribute("username") == null)
						response.sendRedirect("access-denied.jsp");
					else{
						/* USER AUTHENTICATION */
						int uid = Integer.parseInt(session.getAttribute("userId").toString());
						User user = UserDAO.getById(uid);

						System.out.println(user);

						if (user.getIsAdmin() != 0)
							response.sendRedirect("access-denied.jsp");
						
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