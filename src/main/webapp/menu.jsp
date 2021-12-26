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
    <section class="menu-section section">
        <div class="menu-container container">
            <!-- Drinks -->
            <h2 class="menu-heading">Drinks</h2>
            <div class="menu-grid">
            
            <!-- FORM USED FOR ADDING ITEM INFORMATION TO THE ARRAY -->
                <div class="menu-item">
                
                    <img src="./assets/img/coffee-menu-1-removebg-preview.png" alt="">
                    <h3 class="menu-title">Java Express</h3>
                    <p class="menu-description">Lorem ipsum dolor sit amet.</p>
                    <p class="menu-price">RM 6.90</p>
	                    
	                <form action="menu" method="post">
                    	<input type="hidden" name="item_name" value="Java Express">
                    	<input type="hidden" name="item_price" value="6.90">
	                    	<input type="hidden" name="request" value="addItem">
	                    <button type="submit" class="btn-primary">Add To Cart</button>
                    </form>
                </div>
               

                <div class="menu-item">
                
                    <img src="./assets/img/latte-removebg-preview.png" alt="">
                    <h3 class="menu-title">Midnight Frappuccino</h3>
                    <p class="menu-description">Lorem ipsum dolor sit amet.</p>
                    <p class="menu-price">RM 8.50</p>
	                    
	                <form action="menu" method="post">
                    	<input type="hidden" name="item_name" value="Midnight Frappuccino">
                    	<input type="hidden" name="item_price" value="8.50">
	                    	<input type="hidden" name="request" value="addItem">
	                    <button type="submit" class="btn-primary">Add To Cart</button>
                    </form>
                </div>

                <div class="menu-item">
                
                    <img src="./assets/img/lattebeans.png" alt="">
                    <h3 class="menu-title">Bean Delight</h3>
                    <p class="menu-description">Lorem ipsum dolor sit amet.</p>
                    <p class="menu-price">RM 7.90</p>
	                    
                	<form action="menu" method="post">
                    	<input type="hidden" name="item_name" value="Bean Delight">
                    	<input type="hidden" name="item_price" value="7.90">
	                    	<input type="hidden" name="request" value="addItem">
	                    <button type="submit" class="btn-primary">Add To Cart</button>
                    </form>
                </div>

                <div class="menu-item">
                
                    <img src="./assets/img/icebeans-removebg-preview.png" alt="">
                    <h3 class="menu-title">Iced Bean Delight</h3>
                    <p class="menu-description">Lorem ipsum dolor sit amet.</p>
                    <p class="menu-price">RM 8.90</p>
                    
	                <form action="menu" method="post">
                    	<input type="hidden" name="item_name" value="Icead Bean Delight">
                    	<input type="hidden" name="item_price" value="8.90">
	                    	<input type="hidden" name="request" value="addItem">
	                    <button type="submit" class="btn-primary">Add To Cart</button>
                    </form>
                </div>
            </div>

            <!-- Food -->
            <h2 class="menu-heading">Food</h2>
            <div class="menu-grid">
                <div class="menu-item">
                
                    <img src="./assets/img/brownies-removebg-preview.png" alt="">
                    <h3 class="menu-title">Bean Brownies</h3>
                    <p class="menu-description">Lorem ipsum dolor sit amet.</p>
                    <p class="menu-price">RM 13.90</p>
                    
                    <form action="menu" method="post">
                    	<input type="hidden" name="item_name" value="Bean Brownies">
                    	<input type="hidden" name="item_price" value="13.90">
	                    	<input type="hidden" name="request" value="addItem">
	                    <button type="submit" class="btn-primary">Add To Cart</button>
                    </form>
                </div>

                <div class="menu-item">
                	
	                    <img src="./assets/img/cheeseburger.png" alt="">
	                    <h3 class="menu-title">Signature Burger</h3>
	                    <p class="menu-description">Lorem ipsum dolor sit amet.</p>
	                    <p class="menu-price">RM 14.50</p>
	                    
                    <form action="menu" method="post">
                    	<input type="hidden" name="item_name" value="Signature Burger">
                    	<input type="hidden" name="item_price" value="14.50">
	                    	<input type="hidden" name="request" value="addItem">
	                    <button type="submit" class="btn-primary">Add To Cart</button>
                    </form>
                </div>

                <div class="menu-item">
                	
                   	<img src="./assets/img/crossianttrans.png" alt="">
                    <h3 class="menu-title">Crossiant Express</h3>
                    <p class="menu-description">Lorem ipsum dolor sit amet.</p>
                    <p class="menu-price">RM 2.90</p>
                    
					<form action="menu" method="post">
	                   	<input type="hidden" name="item_name" value="Croissant Express">
	                    <input type="hidden" name="item_price" value="2.90">
	                    	<input type="hidden" name="request" value="addItem">
	                    <button type="submit" class="btn-primary">Add To Cart</button>
                    </form>
                </div>
            </div>
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