<<<<<<< HEAD

<%@ page import="com.safetylearners.drivingschoolregistrationandschedulingsystem.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="JavaScript/navbar.js"></script>
</head>
<body>
<jsp:include page="navbar.jsp" />
<div class="container mt-4">
    <h2>Login</h2>
    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
            out.println("<div class='alert alert-danger'>" + errorMessage + "</div>");
        }
    %>
    <form action="login" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <div class="mb-3">
            <label for="role" class="form-label">Role</label>
            <select class="form-control" id="role" name="role" required>
                <option value="Student">Student</option>
                <option value="Instructor">Instructor</option>
                <option value="Admin">Admin</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Login</button>
        <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        <p>Don't have an account? <a href="registerStudent.jsp">Register</a></p>
    </form>
</div>
</body>
</html>
=======
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login - Instructor Management</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-image: url("backgroundImage.jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .overlay {
            background: rgba(255, 255, 255, 0.92);
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        .overlay h2 {
            margin-bottom: 25px;
            color: #333;
            font-size: 24px;
            text-align: center;
        }

        label {
            font-weight: 500;
            display: block;
            margin-top: 12px;
            margin-bottom: 5px;
            color: #444;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        .btn {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.3s;
        }

        .btn:hover {
            background-color: #1e7e34;
        }

        .link {
            margin-top: 15px;
            display: block;
            text-align: center;
            font-size: 14px;
            color: #007bff;
            text-decoration: none;
        }

        .link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="overlay">
    <h2>Instructor Login</h2>
    <form action="InstructorServlet" method="post">
        <input type="hidden" name="action" value="login">

        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required>

        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required>

        <button class="btn" type="submit">Login</button>
    </form>
    <a class="link" href="home.jsp">← Back to Home</a>
</div>
</body>
</html>
>>>>>>> origin/IT24101396_Instructor_Management
