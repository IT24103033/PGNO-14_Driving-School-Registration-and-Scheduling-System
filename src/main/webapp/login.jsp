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

