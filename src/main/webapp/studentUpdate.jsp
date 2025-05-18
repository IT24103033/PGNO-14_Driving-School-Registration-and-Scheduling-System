<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Student - Driving School</title>
    <style>
        .container {
            width: 600px;
            margin: 20px auto;
            padding: 20px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 5px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .button-group {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }
        .submit-btn {
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .submit-btn:hover {
            background-color: #218838;
        }
        .cancel-btn {
            padding: 10px 20px;
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        .cancel-btn:hover {
            background-color: #5a6268;
        }
        .message {
            padding: 10px;
            margin: 10px 0;
            border-radius: 4px;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Update Student</h2>
            <a href="StudentServlet?action=list" class="cancel-btn">Back to List</a>
        </div>

        <c:if test="${not empty error}">
            <div class="message error">
                ${error}
            </div>
        </c:if>

        <form action="StudentServlet" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${student.id}">

            <div class="form-group">
                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" value="${student.fullName}" required>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${student.email}" required>
            </div>

            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="${student.address}" required>
            </div>

            <div class="form-group">
                <label for="phoneNumber">Phone Number:</label>
                <input type="tel" id="phoneNumber" name="phoneNumber" value="${student.phoneNumber}" required>
            </div>

            <div class="form-group">
                <label for="age">Age:</label>
                <input type="number" id="age" name="age" value="${student.age}" required min="16">
            </div>

            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="${student.username}" required>
            </div>

            <div class="form-group">
                <label for="password">New Password (leave blank to keep current):</label>
                <input type="password" id="password" name="password">
            </div>

            <div class="button-group">
                <button type="submit" class="submit-btn">Update Student</button>
                <a href="StudentServlet?action=list" class="cancel-btn">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html> 