<%-- dashboard.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.drivingschool.admin.Admin" %>
<!DOCTYPE html>
<html>
<head>
  <title>Welcome Page</title>
  <link rel="stylesheet" href="css/index.css">
</head>
<body>
<div class="container">
  <header>
    <h1></h1>
    <ul class="nav-menu">
      <li><a href="register.jsp">Register Admin</a></li>
      <li><a href="AdminServlet">View Admin List</a></li>
      <li><a href="dashboard.jsp">DashBoard</a> </li>
    </ul>
  </header>

  <main>
    <h2></h2>

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