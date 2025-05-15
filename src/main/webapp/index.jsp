<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Safety Learners - Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        :root {
            --primary-blue: #1e3a8a;
            --hover-blue: #172554;
            --light-blue: #eff6ff;
        }

        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .dashboard-container {
            min-height: 100vh;
            background: url('${pageContext.request.contextPath}/images/dashboard-bg.jpg') no-repeat center center;
            background-size: cover;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            position: relative;
            padding: 40px 20px;
        }

        .dashboard-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(255, 255, 255, 0.85);
            z-index: 0;
        }

        .dashboard-content {
            position: relative;
            z-index: 1;
            max-width: 1000px;
            width: 100%;
        }

        .logo {
            color: var(--primary-blue);
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
        }

        .welcome-message {
            color: var(--primary-blue);
            font-size: 1.8rem;
            margin-bottom: 2rem;
            font-weight: 600;
        }

        /* Stats grid */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 2rem;
            margin: 3rem auto;
            max-width: 900px;
        }

        .stat-card {
            text-align: center;
            padding: 1.5rem;
            background-color: white;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .stat-value {
            font-size: 2.2rem;
            font-weight: 700;
            color: var(--primary-blue);
            margin-bottom: 0.5rem;
        }

        .stat-label {
            color: #4b5563;
            font-size: 1rem;
        }

        /* Register Now button */
        .btn-register {
            display: inline-block;
            background-color: var(--primary-blue);
            color: white;
            padding: 1rem 2.5rem;
            border-radius: 0.5rem;
            text-decoration: none;
            font-weight: 600;
            font-size: 1.2rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(30, 58, 138, 0.2);
            margin: 2rem 0;
            border: none;
            cursor: pointer;
        }

        .btn-register:hover {
            background-color: var(--hover-blue);
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(30, 58, 138, 0.3);
        }

        .btn-register:active {
            transform: translateY(0);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 1.5rem;
            }

            .logo {
                font-size: 2.5rem;
            }

            .welcome-message {
                font-size: 1.5rem;
            }
        }

        @media (max-width: 480px) {
            .stats-grid {
                grid-template-columns: 1fr;
                gap: 1rem;
            }

            .logo {
                font-size: 2rem;
            }

            .welcome-message {
                font-size: 1.3rem;
            }

            .btn-register {
                padding: 0.8rem 2rem;
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
<div class="dashboard-container">
    <div class="dashboard-overlay"></div>

    <div class="dashboard-content">
        <h1 class="logo">Safety Learners</h1>

        <p class="welcome-message">Register a new student for the Safety Learners program</p>

        <a href="${pageContext.request.contextPath}/registerStudent.jsp" class="btn-register">Register Now</a>

        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-value">2,500+</div>
                <div class="stat-label">Students Registered</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">95%</div>
                <div class="stat-label">Pass Rate</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">15,000+</div>
                <div class="stat-label">Driving Hours</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">12</div>
                <div class="stat-label">Expert Instructors</div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

