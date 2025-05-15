<%-- dashboard.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.drivingschool.admin.Admin" %>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: Arial, sans-serif;
    }

    body {
      background-color: #f5f7fa;
      padding: 20px;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      background-color: #ffffff;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      padding: 20px;
    }

    header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding-bottom: 20px;
      border-bottom: 1px solid #e1e5eb;
      margin-bottom: 20px;
    }

    h1 {
      color: #2c3e50;
      font-size: 24px;
    }

    .nav-menu {
      display: flex;
      list-style: none;
      gap: 15px;
    }

    .nav-menu li a {
      text-decoration: none;
      color: #ffffff;
      background-color: #3498db;
      padding: 10px 15px;
      border-radius: 4px;
      font-weight: bold;
      transition: background-color 0.3s;
    }

    .nav-menu li a:hover {
      background-color: #2980b9;
    }

    .admin-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    .admin-table th, .admin-table td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #e1e5eb;
    }

    .admin-table th {
      background-color: #f8f9fa;
      color: #2c3e50;
      font-weight: bold;
    }

    .admin-table tr:hover {
      background-color: #f1f4f8;
    }

    .action-btn {
      padding: 6px 12px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-weight: bold;
    }

    .edit-btn {
      background-color: #f39c12;
      color: white;
    }

    .delete-btn {
      background-color: #e74c3c;
      color: white;
    }

    .status-tag {
      padding: 4px 8px;
      border-radius: 4px;
      font-size: 12px;
      font-weight: bold;
    }

    .active {
      background-color: #2ecc71;
      color: white;
    }

    .inactive {
      background-color: #95a5a6;
      color: white;
    }

    .message {
      padding: 10px;
      margin-bottom: 15px;
      border-radius: 4px;
    }

    .success {
      background-color: #d4edda;
      color: #155724;
      border: 1px solid #c3e6cb;
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
  <header>
    <h1>Admin Dashboard</h1>
    <ul class="nav-menu">
      <li><a href="register.jsp">Register Admin</a></li>
      <li><a href="AdminServlet">Refresh List</a></li>
    </ul>
  </header>

  <main>
    <h2>Admin Management</h2>

    <% if(request.getAttribute("message") != null) { %>
    <div class="message success">
      <%= request.getAttribute("message") %>
    </div>
    <% } %>

    <% if(request.getAttribute("error") != null) { %>
    <div class="message error">
      <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <table class="admin-table">
      <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Role</th>
        <th>Status</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <%
        List<Admin> adminList = (List<Admin>)request.getAttribute("adminList");
        if(adminList != null && !adminList.isEmpty()) {
          for(Admin admin : adminList) {
      %>
      <tr>
        <td><%= admin.getId() %></td>
        <td><%= admin.getName() %></td>
        <td><%= admin.getEmail() %></td>
        <td><%= admin.getRole() != null ? admin.getRole() : "admin" %></td>
        <td><span class="status-tag <%= "Active".equals(admin.getStatus()) ? "active" : "inactive" %>"><%= admin.getStatus() %></span></td>
        <td>
          <form action="AdminServlet" method="get" style="display:inline;">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="id" value="<%= admin.getId() %>">
            <button type="submit" class="action-btn edit-btn">Edit</button>
          </form>
          <form action="AdminServlet" method="post" style="display:inline;">
            <input type="hidden" name="action" value="delete">
            <input type="hidden" name="id" value="<%= admin.getId() %>">
            <button type="submit" class="action-btn delete-btn" onclick="return confirm('Are you sure you want to delete this admin?');">Delete</button>
          </form>
        </td>
      </tr>
      <%
        }
      } else {
      %>
      <tr>
        <td colspan="6" style="text-align: center;">No admin records found</td>
      </tr>
      <% } %>
      </tbody>
    </table>
  </main>
</div>
</body>
</html>