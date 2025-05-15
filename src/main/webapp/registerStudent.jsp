<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <title>Register a New Student</title>
</head>
<body>
<h1>Register a New Student</h1>
<form action="StudentServlet" method="post">
    <input type="hidden" name="action" value="register">

    <label for="fullName">Full Name:</label>
    <input type="text" id="fullName" name="fullName" required><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br>

    <label for="address">Address:</label>
    <input type="text" id="address" name="address" required><br>

    <label for="phoneNumber">Phone Number:</label>
    <input type="tel" id="phoneNumber" name="phoneNumber" required><br>

    <label for="age">Age:</label>
    <input type="number" id="age" name="age" min="16" required><br>

    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>

    <input type="submit" value="Register">
</form>
</body>
</html>
