<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- ======== FONT AWESOME ICONS ======== -->
    <script src="https://kit.fontawesome.com/bae18c500b.js" crossorigin="anonymous"></script>

    <!-- ======== STYLE CSS ======== -->
    <link rel="stylesheet" href="./assets/css/style.css">

    <!-- ======== TITLE ======== -->
    <title>Java Beans - Menu</title>
</head>
<body>
    <!-- ======== HEADER ======== -->
    <%@include file="./components/navbar.jsp" %>
    

    <!-- FEATURES SECTION -->
    <div class="featured-section section" style="margin-top: var(--header-height);">
        <div class="featured-container container">
            <div class="featured-row">
                <div class="featured-text">
                    <h1 class="featured-title">Midnight Frappuccino</h1>
                    <p class="featured-description">
                        Lorem ipsum dolor sit, amet consectetur adipisicing elit. 
                        Quisquam architecto, eius sed quas. 
                    </p>
                    <h2 class="featured-cost">RM 8.50</h2>
                    <div class="featured-buttons">
                        <form action="menu" method="post">
	                    	<input type="hidden" name="item_name" value="Midnight Frappuccino">
	                    	<input type="hidden" name="item_price" value="8.50">
	                    	<input type="hidden" name="request" value="addItem">
		                    <button type="submit" class="btn-primary">Add To Cart</button>
                    	</form>
                    </div>
                </div>
                <div class="featured-circle">
                    <img src="./assets/img/latte-removebg-preview.png" alt="">
                </div>
                <div class="featured-info">
                    <div class="featured-info-item">
                        <h2>
                            <i style="color: pink" class="fas fa-ice-cream featured-icon"></i>
                            Deliciously Creamy.
                        </h2>
                        <p>So creamy you'd feel like you're in cloud nine.</p>
                    </div>
                    <div class="featured-info-item">
                        <h2>
                            <i class="fas fa-cookie-bite featured-icon"></i>
                            Calories Free.
                        </h2>
                        <p>0 Calories, 0 saturated fat and 0 sugar.</p>
                    </div>
                    <div class="featured-info-item">
                        <h2>
                            <i style="color: green" class="fas fa-seedling featured-icon"></i>
                            Vegan Friendly.
                        </h2>
                        <p>Fret not, our drinks all friendly to you.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ======== MENU SECTION ======== -->
    <%@page import="com.cafeos.bean.Menu, com.cafeos.DAO.MenuDAO, java.util.*" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
    <section class="menu-section section">
        <div class="menu-container container">
			<div class="menu-grid">
				<div class="menu-item">
					<h2 class="menu-heading">Drinks</h2>

					<%
					List<Menu> drinkList = MenuDAO.getByCategoryId(2);
					request.setAttribute("drinkList", drinkList);
					%>

					<c:forEach items="${drinkList}" var="d">
						<div class="menu-grid">
							<div class="menu-col">
								<form action="menu" method="post">
									<input type="hidden" name="item_name" value="${d.getName()}">
									<input type="hidden" name="item_price" value="${d.getPrice()}">
									<input type="hidden" name="request" value="addItem">
									<button type="submit" class="menu-item-button">${d.getName()}</button>
								</form>
							</div>
							<div class="menu-col">
								<p>RM ${d.getPrice()}</p>
							</div>
						</div>
					</c:forEach>
				</div>

				<div class="menu-item">
					<h2 class="menu-heading">Food</h2>

					<%
					List<Menu> foodList = MenuDAO.getByCategoryId(1);
					request.setAttribute("foodList", foodList);
					%>

					<c:forEach items="${foodList}" var="f">
						<div class="menu-grid">
							<div class="menu-col">
								<form action="menu" method="post">
									<input type="hidden" name="item_name" value="${f.getName()}">
									<input type="hidden" name="item_price" value="${f.getPrice()}">
									<input type="hidden" name="request" value="addItem">
									<button type="submit" class="menu-item-button">${f.getName()}</button>
								</form>
							</div>
							<div class="menu-col">
								<p>RM ${f.getPrice()}</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
    </section>
    
    <!-- ======== FOOTER SECTION ======== -->
    <footer class="footer">
        JAVA BEANS COPYRIGHT
    </footer>
    
    <!-- ======== TOOLTIPS JS ======== -->
    <script src="https://unpkg.com/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://unpkg.com/tippy.js@6.3.3/dist/tippy-bundle.umd.min.js"></script>
    
    <!-- ======== MAIN JS ======== -->
    <script src="./assets/js/main.js"></script>
</body>
</html>