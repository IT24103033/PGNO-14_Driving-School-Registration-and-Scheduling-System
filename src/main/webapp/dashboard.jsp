<<<<<<< HEAD
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
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Safety Learners - Admin Dashboard</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>
<!-- Sidebar -->
<div class="sidebar">
  <div class="logo-text">Safety Learners</div>
  <div class="logo-subtext">Admin Panel</div>

  <ul class="nav flex-column">
    <li class="nav-item">
      <a class="nav-link active" href="dashboard.jsp">
        <i class="fas fa-home"></i> Dashboard
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="student-management.jsp">
        <i class="fas fa-user-graduate"></i> Student Management
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="instructor-management.jsp">
        <i class="fas fa-chalkboard-teacher"></i> Instructor Management
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="vehicle-management.jsp">
        <i class="fas fa-car"></i> Vehicle Management
      </a>
    </li>
  </ul>
</div>

<!-- Main Content -->
<div class="content-area">
  <h1 class="mb-4">Admin Dashboard</h1>

  <!-- Stats Cards Row -->
  <div class="row">
    <!-- Students Stats -->
    <div class="col-md-4">
      <div class="card stat-card">
        <div class="d-flex">
          <div class="stat-icon student-icon">
            <i class="fas fa-user-graduate fa-lg"></i>
          </div>
          <div>
            <div class="stat-label">Total Students</div>
            <div class="stat-value">327</div>
            <div class="stat-detail positive">+54 this month</div>
          </div>
        </div>
      </div>
    </div>

    <!-- Instructors Stats -->
    <div class="col-md-4">
      <div class="card stat-card">
        <div class="d-flex">
          <div class="stat-icon instructor-icon">
            <i class="fas fa-chalkboard-teacher fa-lg"></i>
          </div>
          <div>
            <div class="stat-label">Instructors</div>
            <div class="stat-value">24</div>
            <div class="stat-detail">18 active classes</div>
          </div>
        </div>
      </div>
    </div>

    <!-- Vehicles Stats -->
    <div class="col-md-4">
      <div class="card stat-card">
        <div class="d-flex">
          <div class="stat-icon vehicle-icon">
            <i class="fas fa-car fa-lg"></i>
          </div>
          <div>
            <div class="stat-label">Vehicles</div>
            <div class="stat-value">42</div>
            <div class="stat-detail warning">5 in maintenance</div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Activity Chart -->
  <div class="card mt-4">
    <div class="chart-header">
      <h5 class="card-title">Activity Overview</h5>
      <div>
        <i class="fas fa-chart-bar"></i>
      </div>
    </div>
    <div class="card-body">
      <div class="activity-chart">
        Bar chart showing student activity would appear here
      </div>
    </div>
  </div>

  <!-- Recent Activity / Additional Stats could go here -->

</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // JavaScript to handle active link state
  document.addEventListener('DOMContentLoaded', function() {
    const navLinks = document.querySelectorAll('.nav-link');

    navLinks.forEach(link => {
      link.addEventListener('click', function() {
        navLinks.forEach(l => l.classList.remove('active'));
        this.classList.add('active');
      });
    });
  });
</script>
</body>
</html>
>>>>>>> 4aa42681a382a7310c04f16173954f4db93913a8
