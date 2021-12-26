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
    <title>Java Beans - Checkout</title>
</head>
<body>
    <!-- ======== HEADER ======== -->
     <%@include file="../components/navbar.jsp" %>

	<%@page import="com.cafeos.web.AddToCart, com.cafeos.bean.Cart, java.util.*" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<%
		if (session.getAttribute("username") == null)
			response.sendRedirect("/CafeOS/login.jsp");
			
			// Cart cart = (Cart) session.getAttribute("cart");
			
			if (cart == null)
				return;
			
		int counter = cart.counter;
		//get the array that has order names but in a string format
		String order_name_str = cart.getOrderNameArray();
		order_name_str = order_name_str.substring(1, order_name_str.length()-1);
		//change it back to array format 
		String[] order_name = order_name_str.split(",");
		//do same thing for order price array
		String order_price_str = cart.getOrderPriceArray();
		order_price_str = order_price_str.substring(1, order_price_str.length()-1);
		String[] order_price = order_price_str.split(",");
		
		//total price float
		float total_price = cart.getTotalPrice();
		request.setAttribute("counter", counter);
	%>
	
    <!-- CHECKOUT SECTION -->
    <section class="checkout-section section">
        <div class="checkout-container container">
            <h1 class="checkout-title">Checkout</h1>
            <form action="/CafeOS/menu" method="post">
            	<input type="hidden" name="request" value="clearCart">
                <div class="login-buttons">
					<c:if test="${counter > 0}">
						<button class="btn-primary"><i class="far fa-trash-alt"></i> Clear Cart</button>
					</c:if>
                </div>
            </form>
            <div class="checkout-list">
                <!-- Add for each here -->
                
                <% 	//get the counter which is the number of order added to cart
	                
                	
                	for (int i=0; i<counter; i++) {
                %>
                
                <div class="checkout-item">
                    <h2 class="checkout-name"><% out.print(order_name[i]); %></h2>
                    <h3 class="checkout-price">RM <% out.print(order_price[i]); %></h3>
                </div>
                
                <%} 
                
                %>
            </div>
            <form class="checkout-form" action="/CafeOS/menu" method="post">
        		<div class="checkout-item total-price-field">
                    <h2 class="checkout-name ">Total Price</h2>
                    <h3 class="checkout-price">RM <% out.print(total_price);%></h3>
                </div>
                <!-- 
                <div class="checkout-input">
                    <p>Table Number:</p>
                    <input  placeholder="No." type="number" name="tableNumber">
                </div>
                 -->
                <input type="hidden" name="request" value="checkout">
                <div class="login-buttons">
					<c:if test="${counter == 0}" var="condition">
						<span class="promise-icon">Order an item to pay...</span>
					</c:if>
					<c:if test="${counter > 0}">
						<button class="btn-primary">Pay</button>
					</c:if>
				</div>
            </form>
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