<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Safety Learners</title>
    <link rel="stylesheet" href="css/home.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="JavaScript/navbar.js"></script>
    <script src="JavaScript/hero-section.js"></script>
</head>
<body>
<jsp:include page="navbar.jsp" />

<!-- Hero Section with Image Slider -->
<section class="hero-section">
    <!-- Image Slider -->
    <div class="hero-slider">
        <div class="slide slide-1 active"></div>
        <div class="slide slide-2"></div>
        <div class="slide slide-3"></div>
    </div>

    <!-- Slider Navigation Dots -->
    <div class="slider-controls">
        <div class="slider-dot active" data-slide="0"></div>
        <div class="slider-dot" data-slide="1"></div>
        <div class="slider-dot" data-slide="2"></div>
    </div>

    <!-- Slider Arrow Navigation -->
    <div class="slider-nav">
        <div class="slider-arrow prev">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
        </div>
        <div class="slider-arrow next">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <polyline points="9 18 15 12 9 6"></polyline>
            </svg>
        </div>
    </div>

    <!-- Content Overlay -->
    <div class="hero-content">
        <h1 class="hero-title">Welcome to Safety Learners</h1>
        <p class="hero-subtitle">Your journey to becoming a confident driver starts here. Schedule lessons, track your progress, and achieve your driving goals.</p>

        <%
            String role = (String) session.getAttribute("role");
            if (role == null) {
        %>
        <div class="hero-buttons">
            <a href="requestLesson.jsp" class="btn btn-primary">Register as a Student</a>
            <br>
            <a href="requestLesson.jsp" class="btn btn-primary">Register as an Instructor</a>
        </div>
        <% } %>
    </div>
</section>

<!-- Stats Section -->
<section class="stats-section">
    <div class="stat-item">
        <div class="icon-circle">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                <circle cx="9" cy="7" r="4"></circle>
                <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
            </svg>
        </div>
        <div class="stat-number">2,500+</div>
        <div class="stat-label">Students Trained</div>
    </div>
    <div class="stat-item">
        <div class="icon-circle">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <polyline points="20 6 9 17 4 12"></polyline>
            </svg>
        </div>
        <div class="stat-number">95%</div>
        <div class="stat-label">Pass Rate</div>
    </div>
    <div class="stat-item">
        <div class="icon-circle">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <circle cx="12" cy="12" r="10"></circle>
                <polyline points="12 6 12 12 16 14"></polyline>
            </svg>
        </div>
        <div class="stat-number">15,000+</div>
        <div class="stat-label">Driving Hours</div>
    </div>
    <div class="stat-item">
        <div class="icon-circle">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M8 17l4 4 4-4"></path>
                <path d="M12 12v9"></path>
                <path d="M20.88 14.09c1.33-1.25 2.15-2.79 2.15-4.47 0-3.87-3.13-7-7-7s-7 3.13-7 7c0 4.12 3.25 7.39 6.97 7.39 1.23 0 2.38-.3 3.39-.84"></path>
            </svg>
        </div>
        <div class="stat-number">7</div>
        <div class="stat-label">Expert Instructors</div>
    </div>
</section>

<footer>
<div class="container">
    <div class="footer-content">
        <div class="footer-column">
            <h3>Safety Learners</h3>
            <p>A comprehensive driving school management system to help you manage your school efficiently.</p>
        </div>
        <div class="footer-column">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">Features</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h3>Resources</h3>
            <ul>
                <li><a href="#">Help Center</a></li>
                <li><a href="#">API Documentation</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Tutorials</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h3>Contact Us</h3>
            <ul>
                <li>Email: info@safetylearners.com</li>
                <li>Phone: +94 77 123 1234</li>
                <li>Address: 123 Main Road, Malabe</li>
            </ul>
        </div>
    </div>
    <div class="copyright">
        <center>&copy; 2025 safety learners System. All rights reserved.</center>
    </div>
</div>
</footer>
</body>
</html>

