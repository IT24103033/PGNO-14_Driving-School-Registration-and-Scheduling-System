
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
    <a href="dashboard.jsp" class="back-link">Back to Dashboard</a>
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