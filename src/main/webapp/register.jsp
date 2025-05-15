<%--&lt;%&ndash; register.jsp &ndash;%&gt;--%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Register Admin</title>--%>
<%--    <style>--%>
<%--        * {--%>
<%--            margin: 0;--%>
<%--            padding: 0;--%>
<%--            box-sizing: border-box;--%>
<%--            font-family: Arial, sans-serif;--%>
<%--        }--%>

<%--        body {--%>
<%--            background-color: #f5f7fa;--%>
<%--            padding: 20px;--%>
<%--            color: #333;--%>
<%--        }--%>

<%--        .container {--%>
<%--            max-width: 600px;--%>
<%--            margin: 0 auto;--%>
<%--            background-color: #ffffff;--%>
<%--            border-radius: 8px;--%>
<%--            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);--%>
<%--            padding: 25px;--%>
<%--        }--%>

<%--        header {--%>
<%--            display: flex;--%>
<%--            justify-content: space-between;--%>
<%--            align-items: center;--%>
<%--            padding-bottom: 20px;--%>
<%--            border-bottom: 1px solid #e1e5eb;--%>
<%--            margin-bottom: 20px;--%>
<%--        }--%>

<%--        h1 {--%>
<%--            color: #2c3e50;--%>
<%--            font-size: 24px;--%>
<%--        }--%>

<%--        .back-link {--%>
<%--            text-decoration: none;--%>
<%--            color: #3498db;--%>
<%--            font-weight: bold;--%>
<%--            display: inline-flex;--%>
<%--            align-items: center;--%>
<%--        }--%>

<%--        .back-link:before {--%>
<%--            content: "←";--%>
<%--            margin-right: 5px;--%>
<%--        }--%>

<%--        .back-link:hover {--%>
<%--            text-decoration: underline;--%>
<%--        }--%>

<%--        .form-group {--%>
<%--            margin-bottom: 20px;--%>
<%--        }--%>

<%--        label {--%>
<%--            display: block;--%>
<%--            margin-bottom: 5px;--%>
<%--            color: #2c3e50;--%>
<%--            font-weight: bold;--%>
<%--        }--%>

<%--        input[type="text"],--%>
<%--        input[type="email"],--%>
<%--        input[type="password"],--%>
<%--        select {--%>
<%--            width: 100%;--%>
<%--            padding: 10px 12px;--%>
<%--            border: 1px solid #dce4ec;--%>
<%--            border-radius: 4px;--%>
<%--            font-size: 14px;--%>
<%--            transition: border 0.3s, box-shadow 0.3s;--%>
<%--        }--%>

<%--        input[type="text"]:focus,--%>
<%--        input[type="email"]:focus,--%>
<%--        input[type="password"]:focus,--%>
<%--        select:focus {--%>
<%--            border-color: #3498db;--%>
<%--            outline: none;--%>
<%--            box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);--%>
<%--        }--%>

<%--        .btn {--%>
<%--            padding: 10px 15px;--%>
<%--            border: none;--%>
<%--            border-radius: 4px;--%>
<%--            cursor: pointer;--%>
<%--            font-weight: bold;--%>
<%--            font-size: 14px;--%>
<%--            transition: background-color 0.3s;--%>
<%--        }--%>

<%--        .btn-primary {--%>
<%--            background-color: #3498db;--%>
<%--            color: white;--%>
<%--        }--%>

<%--        .btn-primary:hover {--%>
<%--            background-color: #2980b9;--%>
<%--        }--%>

<%--        .btn-secondary {--%>
<%--            background-color: #e1e5eb;--%>
<%--            color: #566573;--%>
<%--        }--%>

<%--        .btn-secondary:hover {--%>
<%--            background-color: #d5d8dc;--%>
<%--        }--%>

<%--        .form-footer {--%>
<%--            margin-top: 25px;--%>
<%--            display: flex;--%>
<%--            justify-content: space-between;--%>
<%--            align-items: center;--%>
<%--        }--%>

<%--        .required-field::after {--%>
<%--            content: " *";--%>
<%--            color: #e74c3c;--%>
<%--        }--%>

<%--        .form-hint {--%>
<%--            color: #7f8c8d;--%>
<%--            font-size: 12px;--%>
<%--            margin-top: 3px;--%>
<%--        }--%>

<%--        .error-message {--%>
<%--            color: #e74c3c;--%>
<%--            font-size: 12px;--%>
<%--            margin-top: 5px;--%>
<%--            display: none;--%>
<%--        }--%>

<%--        input.error {--%>
<%--            border-color: #e74c3c;--%>
<%--        }--%>

<%--        .form-group.success input {--%>
<%--            border-color: #2ecc71;--%>
<%--        }--%>

<%--        .message {--%>
<%--            padding: 10px;--%>
<%--            margin-bottom: 15px;--%>
<%--            border-radius: 4px;--%>
<%--        }--%>

<%--        .success {--%>
<%--            background-color: #d4edda;--%>
<%--            color: #155724;--%>
<%--            border: 1px solid #c3e6cb;--%>
<%--        }--%>

<%--        .error-box {--%>
<%--            background-color: #f8d7da;--%>
<%--            color: #721c24;--%>
<%--            border: 1px solid #f5c6cb;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <header>--%>
<%--        <h1>Register New Admin</h1>--%>
<%--        <a href="AdminServlet" class="back-link">Back to Dashboard</a>--%>
<%--    </header>--%>

<%--    <main>--%>
<%--        <% if(request.getAttribute("error") != null) { %>--%>
<%--        <div class="message error-box">--%>
<%--            <%= request.getAttribute("error") %>--%>
<%--        </div>--%>
<%--        <% } %>--%>

<%--        <form action="AdminServlet" method="post" id="registerForm" onsubmit="return validateForm()">--%>
<%--            <input type="hidden" name="action" value="create"/>--%>

<%--            <div class="form-group">--%>
<%--                <label for="id" class="required-field">Admin ID</label>--%>
<%--                <input type="text" id="id" name="id" required placeholder="Enter unique ID (e.g., AD001)"/>--%>
<%--                <p class="form-hint">Must be unique and alphanumeric</p>--%>
<%--                <p class="error-message" id="idError">Admin ID is required and must be alphanumeric</p>--%>
<%--            </div>--%>

<%--            <div class="form-group">--%>
<%--                <label for="name" class="required-field">Full Name</label>--%>
<%--                <input type="text" id="name" name="name" required placeholder="Enter full name"/>--%>
<%--                <p class="error-message" id="nameError">Full name is required</p>--%>
<%--            </div>--%>

<%--            <div class="form-group">--%>
<%--                <label for="email" class="required-field">Email Address</label>--%>
<%--                <input type="email" id="email" name="email" required placeholder="Enter email address"/>--%>
<%--                <p class="error-message" id="emailError">Please enter a valid email address</p>--%>
<%--            </div>--%>

<%--            <div class="form-group">--%>
<%--                <label for="password" class="required-field">Password</label>--%>
<%--                <input type="password" id="password" name="password" required placeholder="Enter password"/>--%>
<%--                <p class="form-hint">Minimum 8 characters with at least one number and special character</p>--%>
<%--                <p class="error-message" id="passwordError">Password must be at least 8 characters long and contain at least one number and one special character</p>--%>
<%--            </div>--%>


<%--            <div class="form-group">--%>
<%--                <label for="role">Role</label>--%>
<%--                <select id="role" name="role" style="width: 100%; padding: 10px; border: 1px solid #dce4ec; border-radius: 4px;">--%>
<%--                    <option value="admin">Admin</option>--%>
<%--                    <option value="superadmin">Super Admin</option>--%>
<%--                    <option value="readonly">Read Only</option>--%>
<%--                </select>--%>
<%--            </div>--%>

<%--            <div class="form-footer">--%>
<%--                <button type="button" onclick="location.href='AdminServlet'" class="btn btn-secondary">Cancel</button>--%>
<%--                <button type="submit" class="btn btn-primary">Register Admin</button>--%>
<%--            </div>--%>
<%--        </form>--%>
<%--    </main>--%>
<%--</div>--%>

<%--</body>--%>
<%--</html>--%>






<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Register Admin</title>
  <link rel="stylesheet" href="css/register.css">
  <script src="js/validation.js" defer></script>
</head>
<body>
<div class="container">
  <header>
    <h1>Register New Admin</h1>
    <a href="AdminServlet" class="back-link">Back to Dashboard</a>
  </header>

  <main>
    <% if(request.getAttribute("error") != null) { %>
    <div class="message error-box">
      <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <form action="AdminServlet" method="post" id="registerForm" onsubmit="return validateForm()">
      <input type="hidden" name="action" value="create"/>

      <div class="form-group">
        <label for="id" class="required-field">Admin ID</label>
        <input type="text" id="id" name="id" required placeholder="Enter unique ID (e.g., AD001)"/>
        <p class="form-hint">Must be unique and alphanumeric</p>
        <p class="error-message" id="idError">Admin ID is required and must be alphanumeric</p>
      </div>

      <div class="form-group">
        <label for="name" class="required-field">Full Name</label>
        <input type="text" id="name" name="name" required placeholder="Enter full name"/>
        <p class="error-message" id="nameError">Full name is required</p>
      </div>

      <div class="form-group">
        <label for="email" class="required-field">Email Address</label>
        <input type="email" id="email" name="email" required placeholder="Enter email address"/>
        <p class="error-message" id="emailError">Please enter a valid email address</p>
      </div>

      <div class="form-group">
        <label for="password" class="required-field">Password</label>
        <input type="password" id="password" name="password" required placeholder="Enter password"/>
        <p class="form-hint">Minimum 8 characters with at least one number and special character</p>
        <p class="error-message" id="passwordError">Password must be at least 8 characters long and contain at least one number and one special character</p>
      </div>

      <div class="form-group">
        <label for="role">Role</label>
        <select id="role" name="role">
          <option value="admin">Admin</option>
          <option value="superadmin">Super Admin</option>
          <option value="readonly">Read Only</option>
        </select>
      </div>

      <div class="form-footer">
        <button type="button" onclick="location.href='AdminServlet'" class="btn btn-secondary">Cancel</button>
        <button type="submit" class="btn btn-primary">Register Admin</button>
      </div>
    </form>
  </main>
</div>
</body>
</html>