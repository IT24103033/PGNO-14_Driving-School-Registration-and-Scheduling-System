<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Safety Learners - Driving School</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            line-height: 1.6;
        }

        /* Top Navigation */
        .top-nav {
            background-color: #1e3c72;
            padding: 15px 0;
            color: white;
        }

        .nav-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 90%;
            margin: 0 auto;
        }

        .brand {
            display: flex;
            align-items: center;
            color: white;
            text-decoration: none;
            font-size: 1.5em;
            font-weight: 600;
        }

        .brand-icon {
            font-size: 1.2em;
            margin-right: 10px;
        }

        .user-section {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .login-btn {
            background-color: #2962ff;
            color: white;
            padding: 8px 24px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: 500;
        }

        .nav-links a:hover {
            text-decoration: underline;
        }

        /* Hero Section */
        .hero {
            position: relative;
            height: 600px;
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
                        url('https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .hero-content {
            max-width: 800px;
            padding: 20px;
        }

        .hero h1 {
            font-size: 3em;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .hero p {
            font-size: 1.2em;
            margin-bottom: 30px;
        }

        .register-btn {
            background-color: #2962ff;
            color: white;
            padding: 12px 32px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            display: inline-block;
        }

        /* Slider Navigation */
        .slider-nav {
            position: absolute;
            bottom: 30px;
            left: 0;
            right: 0;
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .slider-dot {
            width: 10px;
            height: 10px;
            background-color: rgba(255, 255, 255, 0.5);
            border-radius: 50%;
            cursor: pointer;
        }

        .slider-dot.active {
            background-color: white;
        }

        /* Stats Section */
        .stats {
            padding: 60px 0;
            background-color: #f8f9fa;
            text-align: center;
        }

        .stats-container {
            display: flex;
            justify-content: space-around;
            max-width: 1200px;
            margin: 0 auto;
        }

        .stat-item {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .stat-icon {
            width: 64px;
            height: 64px;
            background-color: #e8eaf6;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
        }

        .stat-number {
            font-size: 2.5em;
            color: #2962ff;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .stat-label {
            color: #666;
            font-size: 1.1em;
        }
    </style>
</head>
<body>
    <nav class="top-nav">
        <div class="nav-container">
            <a href="index.jsp" class="brand">
                <span class="brand-icon">➜</span>
                Safety Learners
            </a>
            <div class="nav-links">
                <% if(session.getAttribute("username") != null) { %>
                    <span>Welcome, ${sessionScope.fullName}</span>
                    <a href="dashboard.jsp" class="login-btn">Dashboard</a>
                    <a href="LoginServlet?action=logout" style="color: white; margin-left: 15px;">Logout</a>
                <% } else { %>
                    <span>Welcome, User</span>
                    <a href="login.jsp" class="login-btn">Login</a>
                <% } %>
            </div>
        </div>
    </nav>

    <section class="hero">
        <div class="hero-content">
            <h1>Welcome to Safety Learners</h1>
            <p>Your journey to becoming a confident driver starts here. Schedule lessons, track your progress, and achieve your driving goals.</p>
            <a href="registerStudent.jsp" class="register-btn">Register Now</a>
        </div>
        <div class="slider-nav">
            <div class="slider-dot active"></div>
            <div class="slider-dot" onclick="window.location.href='StudentServlet?action=list'"></div>
        </div>
    </section>

    <section class="stats">
        <div class="stats-container">
            <div class="stat-item">
                <div class="stat-icon">👥</div>
                <div class="stat-number">2,500+</div>
                <div class="stat-label">Students Trained</div>
            </div>
            <div class="stat-item">
                <div class="stat-icon">✓</div>
                <div class="stat-number">95%</div>
                <div class="stat-label">Pass Rate</div>
            </div>
            <div class="stat-item">
                <div class="stat-icon">⏰</div>
                <div class="stat-number">15,000+</div>
                <div class="stat-label">Hours of Training</div>
            </div>
            <div class="stat-item">
                <div class="stat-icon">🎯</div>
                <div class="stat-number">7</div>
                <div class="stat-label">Years Experience</div>
            </div>
        </div>
    </section>
</body>
</html>

