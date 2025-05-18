<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student List - Safety Learners</title>
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
            background-color: #f8f9fa;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .header h2 {
            color: #1e3c72;
            font-size: 24px;
        }

        .back-btn {
            background-color: #2962ff;
            color: white;
            padding: 8px 20px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            transition: background-color 0.3s;
        }

        .back-btn:hover {
            background-color: #1e4bd8;
        }

        .search-box {
            margin-bottom: 30px;
            text-align: center;
        }

        .search-box form {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        .search-box input[type="text"] {
            width: 50%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }

        .search-box button {
            background-color: #2962ff;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            transition: background-color 0.3s;
        }

        .search-box button:hover {
            background-color: #1e4bd8;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f8f9fa;
            color: #1e3c72;
            font-weight: 600;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .edit-btn, .delete-btn {
            padding: 6px 12px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            font-size: 14px;
        }

        .edit-btn {
            background-color: #28a745;
            color: white;
        }

        .delete-btn {
            background-color: #dc3545;
            color: white;
        }

        .message {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 4px;
            text-align: center;
        }

        .error {
            background-color: #fee;
            color: #dc3545;
            border: 1px solid #dc3545;
        }

        .success {
            background-color: #e8f5e9;
            color: #28a745;
            border: 1px solid #28a745;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Student List</h2>
            <a href="index.jsp" class="back-btn">Back to Dashboard</a>
        </div>

        <div class="search-box">
            <form action="StudentServlet" method="get">
                <input type="hidden" name="action" value="search">
                <input type="text" name="search" placeholder="Search student by name or ID..." value="${param.search}" required>
                <button type="submit">Search</button>
            </form>
        </div>

        <c:if test="${not empty message}">
            <div class="message ${messageType == 'error' ? 'error' : 'success'}">
                ${message}
            </div>
        </c:if>

        <c:if test="${not empty param.search}">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Phone Number</th>
                        <th>Age</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="student" items="${students}">
                        <tr>
                            <td>${student.id}</td>
                            <td>${student.fullName}</td>
                            <td>${student.email}</td>
                            <td>${student.phoneNumber}</td>
                            <td>${student.age}</td>
                            <td class="action-buttons">
                                <a href="StudentServlet?action=edit&id=${student.id}" class="edit-btn">Edit</a>
                                <a href="StudentServlet?action=delete&id=${student.id}" 
                                   onclick="return confirm('Are you sure you want to delete this student?')" 
                                   class="delete-btn">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</body>
</html>
