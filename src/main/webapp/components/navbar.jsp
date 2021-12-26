<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<header class="header">
		<h2 class="header-logo">
			<a href="/CafeOS/index.jsp">Java Beans</a>
		</h2>
		<i class="fas fa-bars header-toggle" id="header-toggle"></i>
	
		<nav class="nav" id="nav">
			<i class="fas fa-times nav-close" id="nav-close"></i>
			<ul class="nav-menu">
				<li class="nav-item"><a href="/CafeOS/index.jsp#about"
					class="nav-link">About</a></li>
				<li class="nav-item"><a href="/CafeOS/menu.jsp" class="nav-link">Menu</a></li>
				<li class="nav-item"><a href="/CafeOS/index.jsp#contact"
					class="nav-link">Contact</a></li>
				<% if (session.getAttribute("username") == null) { %>
				<li class="nav-item"><a href="/CafeOS/login.jsp"
					class="nav-link">Login</a></li>
				<li class="nav-item"><a href="/CafeOS/register.jsp"
					class=" btn-primary">Register</a></li>
				<% } else { %>
				<li class="nav-item"><a href="/CafeOS/order_history.jsp"
					class="nav-link">History</a></li>
				<li class="nav-item"><a href="/CafeOS/logout" class="nav-link">Logout</a></li>
				<li class="nav-item"><a href="/CafeOS/action/checkout.jsp"
					class=" btn-primary"><i class="fas fa-shopping-cart"></i> Cart</a></li>
				<% } %>
			</ul>
		</nav>
	</header>