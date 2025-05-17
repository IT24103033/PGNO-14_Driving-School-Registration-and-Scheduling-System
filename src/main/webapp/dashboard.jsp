<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Safety Learners</title>
    <style>
        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding: 20px;
            background-color: #1e3c72;
            color: white;
            border-radius: 5px;
        }
        .welcome {
            font-size: 24px;
        }
        .nav-buttons {
            display: flex;
            gap: 15px;
        }
        .btn {
            padding: 10px 20px;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .home-btn {
            background-color: #2962ff;
        }
        .home-btn:hover {
            background-color: #1e4bd8;
        }
        .logout-btn {
            background-color: #dc3545;
        }
        .logout-btn:hover {
            background-color: #c82333;
        }
        .content {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .menu {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .menu-item {
            background-color: #2962ff;
            color: white;
            padding: 20px;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .menu-item:hover {
            background-color: #1e4bd8;
        }
    </style>
</head>
<body>
    <%
        // Check if user is logged in
        if (session.getAttribute("username") == null) {
            // Store the intended destination
            session.setAttribute("redirect_after_login", "dashboard.jsp");
            response.sendRedirect("login.jsp");
            return;
        }
    %>
    <div class="container">
        <div class="header">
            <div class="welcome">Welcome, ${sessionScope.fullName}!</div>
            <div class="nav-buttons">
                <a href="index.jsp" class="btn home-btn">Back to Main Page</a>
                <a href="LoginServlet?action=logout" class="btn logout-btn">Logout</a>
            </div>
        </div>
        <div class="content">
            <h2>Student Dashboard</h2>
            <div class="menu">
                <a href="schedule.jsp" class="menu-item">View Schedule</a>
                <a href="book-lesson.jsp" class="menu-item">Book Lesson</a>
                <a href="profile.jsp" class="menu-item">My Profile</a>
                <a href="progress.jsp" class="menu-item">View Progress</a>
            </div>
        </div>
    </div>
</body>
</html> 