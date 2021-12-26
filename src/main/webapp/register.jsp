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
    <%@include file="./components/navbar.jsp" %>

    <!-- ======== REGISTER SECTION ======== -->
    <section class="login-section section">
        <div class="login-container container">
            <form class="login-form" action="register" method="POST">
                <h1 class="login-title">Register</h1>
                <div class="login-input">
                    <p>First Name:</p>
                    <input id="register-name" required type="text" placeholder="First Name" name="firstname">
                </div>
                <div class="login-input">
                    <p>Last Name:</p>
                    <input id="register-last" required type="text" placeholder="Last Name" name="lastname">
                </div>
                <div class="login-input">
                    <p>Email:</p>
                    <input id="register-email" required type="email" placeholder="Email" name="email">
                </div>
                <div class="login-input">
                    <p>Password:</p>
                    <input id="register-password" required type="password" placeholder="Password" name="password">
                </div>
                <div class="login-buttons">
                    <button id="register-submit" class="btn-primary" type="submit">Register</button>
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