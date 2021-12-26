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
    <title>Java Beans - Register</title>
</head>
<body>
    <!-- ======== HEADER ======== -->
    <header class="header">
        <h2 class="header-logo">
            <a href="index.jsp">Java Beans</a>
        </h2>
        <i class="fas fa-bars header-toggle" id="header-toggle"></i>

        <nav class="nav" id="nav">
            <i class="fas fa-times nav-close" id="nav-close"></i>

            <ul class="nav-menu">
                <li class="nav-item"><a href="index.jsp#about" class="nav-link">About</a></li>
                <li class="nav-item"><a href="menu.jsp" class="nav-link">Menu</a></li>
                <li class="nav-item"><a href="index.jsp#contact" class="nav-link">Contact</a></li>
                <% if (session.getAttribute("username") == null) { %>
                <li class="nav-item"><a href="login.jsp" class="nav-link">Login</a></li>
                <li class="nav-item"><a href="#" class=" btn-primary">Register</a></li>
                <% } else { %>
                <li class="nav-item"><a href="logout" class="nav-link">Logout</a></li>
                <li class="nav-item"><a href="action/checkout.jsp" class=" btn-primary"><i class="fas fa-shopping-cart"></i> Cart</a></li>
                <% } %>
            </ul>
        </nav>
    </header>

    <!-- ======== REGISTER SECTION ======== -->
    <section class="login-section section">
        <div class="login-container container">
            <form class="login-form" action="register" method="POST">
                <h1 class="login-title">Register</h1>
                <div class="login-input">
                    <p>First Name:</p>
                    <input id="login-name" required type="text" placeholder="First Name" name="firstname">
                </div>
                <div class="login-input">
                    <p>Last Name:</p>
                    <input id="login-name" required type="text" placeholder="Last Name" name="lastname">
                </div>
                <div class="login-input">
                    <p>Email:</p>
                    <input id="login-name" required type="email" placeholder="Email" name="email">
                </div>
<!--                 <div class="login-input">
                    <p>Username:</p>
                    <input id="login-name" required type="text" placeholder="Name" name="username">
                </div> -->
                <div class="login-input">
                    <p>Password:</p>
                    <input id="login-password" required type="password" placeholder="Password" name="password">
                </div>
                <div class="login-buttons">
                    <button class="btn-primary" type="submit">Register</button>
                </div>
                <p>Already have an account? <span><a class="login-link" href="login.jsp">Login here.</a></span></p>
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