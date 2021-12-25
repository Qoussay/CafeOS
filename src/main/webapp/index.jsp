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
    <title>Java Beans - Home</title>
</head>
<body>
    <!-- ======== HEADER ======== -->
    <header class="header">
        <h2 class="header-logo">
            <a href="#">Java Beans</a>
        </h2>
        <i class="fas fa-bars header-toggle" id="header-toggle"></i>

        <nav class="nav" id="nav">
            <i class="fas fa-times nav-close" id="nav-close"></i>

            <ul class="nav-menu">
                <li class="nav-item"><a href="#about" class="nav-link">About</a></li>
                <li class="nav-item"><a href="menu.html" class="nav-link">Menu</a></li>
                <li class="nav-item"><a href="#contact" class="nav-link">Contact</a></li>
                <%
                if (session.getAttribute("username") == null) {
                %>
                <li class="nav-item"><a href="login.html" class="nav-link">Login</a></li>
                <li class="nav-item"><a href="register.html" class=" btn-primary">Register</a></li>
                <%
                }
                else{
                %>
                <li class="nav-item"><a href="login.html" class="nav-link">Logout</a></li>
                <li class="nav-item"><a href="register.html" class=" btn-primary">Order</a></li>
                <%
                }
                %>
            </ul>
        </nav>
    </header>

    <!-- HERO SECTION -->
    <section class="hero-section section">
        <div class="hero-container container">
            <div class="hero-text">
                <h1 class="hero-title">Start Your Day Strong</h1>
                <h2 class="hero-subtitle">Roasted With Love from Java.</h2>
                <p class="hero-description">
                    Order your invigorating coffee now and have it served hot today.
                </p>
                <div class="hero-buttons">
                    <a href="menu.html" class="btn-primary">Order</a>
                    <a href="menu.html" class="btn">Menu</a>
                </div>
            </div>
        </div>
    </section>
    
    <!-- PROMISE SECTION -->
    <section id="promise" class="promise-section section">
        <div class="promise-container container">
            <div class="promise-content">
                <h1 class="promise-title">Our Promise</h1>
                <p class="promise-description">
                    <i class="fas fa-quote-left promise-icon__right"></i>
                    <br>
                    We guarantee a quality meal every time. 
                    If for any reason you feel like your order was
                    not up to your standards or something was wrong, 
                    please let us know and we will immediately replace 
                    your order at no cost, or give you your money back. 
                    We don't want anyone to pay for something 
                    they aren't happy with.
                    <br>
                    <i class="fas fa-quote-right promise-icon__left"></i>
                </p>
                <h2 class="promise-subtitle">
                    <i class="fas fa-minus promise-icon__subtitle"></i> 
                    Gustavo Fring, CEO of Java Beans
                </h2>
                <div class="promise-buttons">
                    <a href="#about" class="btn-primary">About Us</a>
                </div>
            </div>
            <img class="promise-image" src="./assets/img/gus.jpg" alt="">
        </div>
    </section>

    <!-- COUNTER SECTION -->
    <section id="facts" class="counter-section section">
        <div class="counter-container container">
            <div class="counter-row">
                <div class="counter-item">
                    <i class="fas fa-mug-hot counter-icon"></i>
                    <h1 class="counter-title"><span class="counter">100</span>%</h1>
                    <h2 class="counter-subtitle">Freshly Roasted Beans.</h2>
                </div>
                <div class="counter-item">
                    <i class="fas fa-store counter-icon"></i>
                    <h1 class="counter-title"><span class="counter">82</span>+</h1>
                    <h2 class="counter-subtitle">Stores Worldwide.</h2>
                </div>
                <div class="counter-item">
                    <i class="fas fa-clock counter-icon"></i>
                    <h1 class="counter-title"><span class="counter">24</span>+</h1>
                    <h2 class="counter-subtitle">Hours of Rest Time.</h2>
                </div>
            </div>
        </div>
    </section>

    <!-- ABOUT SECTION -->
    <section id="about" class="about-section section">
        <div class="about-container container">
            <div class="about-row">
                <div class="about-card">
                    <img src="./assets/img/cafe-about-1.jpg" alt="">
                    <div class="about-inner">
                        <h1>Safe Environment</h1>
                        <p>We are open to everyone.</p>
                    </div>
                </div>
                <div class="about-modal">
                    <div class="about-modal-content">
                        <h4>Safe Environment</h4>
                        <p>
                            At Java Beans cafe you can enjoy your cup of coffee at a safe place, 
                            chilled withm AC and unlimited wifi.
                        </p>
                        <ul>
                            <li>
                                <i class="far fa-check-circle"></i>
                                Unlimited wifi
                            </li>
                            <li>
                                <i class="far fa-check-circle"></i>
                                Safe and quiet 
                            </li>
                            <li>
                                <i class="far fa-check-circle"></i>
                                Relaxing atmosphere
                            </li>
                        </ul>
                        <i class="fas fa-times about-modal-close"></i>
                    </div>
                </div>

                <div class="about-card">
                    <img src="./assets/img/cafe-about-2.jpg" alt="">
                    <div class="about-inner">
                        <h1>Open 24/7</h1>
                        <p>Never feel tired.</p>
                    </div>
                </div>
                <div class="about-modal">
                    <div class="about-modal-content">
                        <h4>Open 24/7</h4>
                        <p>
                            Get your coffee fix anytime of the day. Our beans 
                            are brewed fresh daily and will give you the energy
                            you need to finsih off your work.                                                    
                        </p>
                        <ul>
                            <li>
                                <i class="far fa-check-circle"></i>
                                100% Pure Java beans
                            </li>
                            <li>
                                <i class="far fa-check-circle"></i>
                                Ready to serve anytime
                            </li>
                            <li>
                                <i class="far fa-check-circle"></i>
                                Always fresh
                            </li>
                        </ul>
                        <i class="fas fa-times about-modal-close"></i>
                    </div>
                </div>

                <div class="about-card">
                    <img src="./assets/img/cafe-about-3.jpg" alt="">
                    <div class="about-inner">
                        <h1>Fresh Ingredients</h1>
                        <p>Brought-in daily.</p>
                    </div>
                </div>
                <div class="about-modal">
                    <div class="about-modal-content">
                        <h4>Fresh Ingredients</h4>
                        <p>
                            Our beans are brewed fresh daily and will give you the energy
                            you need to finsih off your work. Along with hot 
                            pastries, you'll come back everytime.                                                   
                        </p>
                        <ul>
                            <li>
                                <i class="far fa-check-circle"></i>
                                Always fresh
                            </li>
                            <li>
                                <i class="far fa-check-circle"></i>
                                Ingredients brought daily
                            </li>
                            <li>
                                <i class="far fa-check-circle"></i>
                                Never microwaved
                            </li>
                        </ul>
                        <i class="fas fa-times about-modal-close"></i>
                    </div>
                </div>

                <div class="about-card">
                    <img src="./assets/img/cafe-about-4.jpg" alt="">
                    <div class="about-inner">
                        <h1>Environment Friendly</h1>
                        <p>All products are recycled.</p>
                    </div>
                </div>
                <div class="about-modal">
                    <div class="about-modal-content">
                        <h4>Environment Friendly</h4>
                        <p>
                            All products are recycled and not wasted. We never throw
                            away our fresh produces.                                              
                        </p>
                        <ul>
                            <li>
                                <i class="far fa-check-circle"></i>
                                Clean and hygenic
                            </li>
                            <li>
                                <i class="far fa-check-circle"></i>
                                Green energy 
                            </li>
                            <li>
                                <i class="far fa-check-circle"></i>
                                Fresh grown farms
                            </li>
                        </ul>
                        <i class="fas fa-times about-modal-close"></i>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FEATURES SECTION -->
    <div class="featured-section section">
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
                        <a href="menu.html" class="btn-primary">Full Menu</a>
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

    <!-- CONTACT SECTION -->
    <section id="contact" class="contact-section section">
        <div class="contact-container container">
            <h1 class="contact-title">Contact Us</h1>
            <div class="contact-content">
                <div class="contact-form">
                    <form action="">
                        <div class="contact-input">
                            <p>Name:</p>
                            <input id="contact-name" required type="text" placeholder="Name" name="Name">
                            <span class="contact-error">Please use a valid name</span>
                        </div>
                        <div class="contact-input">
                            <p>Email:</p>
                            <input id="contact-email" required type="email" placeholder="Email" name="Email">
                            <span class="contact-error">Please use a valid email</span>
                        </div>
                        <div class="contact-input">
                            <p>Subject:</p>
                            <input id="contact-subject" required type="text" placeholder="Subject" name="Subject">
                            <span class="contact-error">Please use a valid subject</span>
                        </div>
                        <div class="contact-input">
                            <p>Message:</p>
                            <textarea id="contact-message" required></textarea>
                            <span class="contact-error">Please write a valid message</span>
                        </div>
                    </form>
                    <button id="contact-submit" type="submit" class="btn-primary">Submit</button>
                </div>
                <div class="contact-image">
                    <img src="./assets/img/contact-cafe.jpg" alt="">
                </div>
            </div>
        </div>
    </section>

    <!-- ======== FOOTER SECTION ======== -->
    <footer class="footer">
        JAVA BEANS COPYRIGHT
    </footer>
    
    <!-- ======== COUNTER JS ======== -->
     <script src="./assets/js/jquery.js"></script>
     <script src="./assets/js/waypoints.min.js"></script>
     <script src="./assets/js/jquery.counterup.min.js"></script>
     <script>
        $('.counter').counterUp({
                delay: 10,
                time: 1000
            });
     </script>
    <script src="./assets/js/main.js"></script>
</body>
</html>