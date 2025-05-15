<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <title>Student List</title>
</head>
<body>
<h1>Student List</h1>

<% if (request.getAttribute("message") != null) { %>
<p style="color: green;"><%= request.getAttribute("message") %></p>
<% } %>

<form action="StudentServlet" method="get">
    <input type="text" name="search" placeholder="Search Student by Name or ID...">
    <input type="hidden" name="action" value="search">
    <input type="submit" value="Search">
</form>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Full Name</th>
        <th>Email</th>
        <th>Address</th>
        <th>Phone Number</th>
        <th>Age</th>
        <th>Actions</th>
    </tr>
    <c:forEach items="${students}" var="student">
        <tr>
            <td>${student.id}</td>
            <td>${student.fullName}</td>
            <td>${student.email}</td>
            <td>${student.address}</td>
            <td>${student.phoneNumber}</td>
            <td>${student.age}</td>
            <td>
                <a href="updateStudent.jsp?id=${student.id}">Edit</a>
                <a href="StudentServlet?action=delete&id=${student.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
