<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <title>Update Student</title>
</head>
<body>
<h1>Update Student</h1>

<form action="StudentServlet" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="${student.id}">

    <label for="fullName">Full Name:</label>
    <input type="text" id="fullName" name="fullName" value="${student.fullName}" required><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="${student.email}" required><br>

    <label for="address">Address:</label>
    <input type="text" id="address" name="address" value="${student.address}" required><br>

    <label for="phoneNumber">Phone Number:</label>
    <input type="tel" id="phoneNumber" name="phoneNumber" value="${student.phoneNumber}" required><br>

    <label>Age:</label>
    <c:forEach begin="16" end="100" var="ageOption">
        <input type="radio" id="age${ageOption}" name="age" value="${ageOption}"
               <c:if test="${student.age == ageOption}">checked</c:if>>
        <label for="age${ageOption}">${ageOption}</label>
    </c:forEach><br>

    <label for="username">Username:</label>
    <input type="text" id="username" name="username" value="${student.username}" required><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" placeholder="Enter new password to change"><br>

    <input type="submit" value="Update">
</form>
</body>
</html>
