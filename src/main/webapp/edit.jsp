<%-- edit.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.drivingschool.admin.Admin" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Admin</title>
  <link rel="stylesheet" href="css/edit.css">
</head>
<body>
<div class="container">
  <header>
    <h1>Edit Admin</h1>
    <a href="AdminServlet" class="back-link">Back to Dashboard</a>
  </header>

  <main>
    <% if(request.getAttribute("error") != null) { %>
    <div class="message error">
      <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <%
      Admin admin = (Admin)request.getAttribute("admin");
      if(admin != null) {
    %>
    <form action="AdminServlet" method="post" id="editForm">
      <input type="hidden" name="action" value="update"/>
      <input type="hidden" name="id" value="<%= admin.getId() %>"/>

      <div class="form-group">
        <label for="id">Admin ID</label>
        <input type="text" id="id" value="<%= admin.getId() %>" disabled/>
        <p class="form-hint">ID cannot be changed</p>
      </div>

      <div class="form-group">
        <label for="name" class="required-field">Full Name</label>
        <input type="text" id="name" name="name" required value="<%= admin.getName() %>"/>
      </div>

      <div class="form-group">
        <label for="email" class="required-field">Email Address</label>
        <input type="email" id="email" name="email" required value="<%= admin.getEmail() %>"/>
      </div>

      <div class="form-group">
        <label for="status">Status</label>
        <select id="status" name="status">
          <option value="Active" <%= "Active".equals(admin.getStatus()) ? "selected" : "" %>>Active</option>
          <option value="Inactive" <%= "Inactive".equals(admin.getStatus()) ? "selected" : "" %>>Inactive</option>
        </select>
      </div>

      <div class="form-group">
        <label for="role">Role</label>
        <select id="role" name="role">
          <option value="admin" <%= "admin".equals(admin.getRole()) ? "selected" : "" %>>Admin</option>
          <option value="superadmin" <%= "superadmin".equals(admin.getRole()) ? "selected" : "" %>>Super Admin</option>
          <option value="readonly" <%= "readonly".equals(admin.getRole()) ? "selected" : "" %>>Read Only</option>
        </select>
      </div>

      <div class="form-footer">
        <button type="button" onclick="location.href='AdminServlet'" class="btn btn-secondary">Cancel</button>
        <button type="submit" class="btn btn-primary">Update Admin</button>
      </div>
    </form>
    <% } else { %>
    <div class="message error">Admin not found!</div>
    <div class="form-footer">
      <button type="button" onclick="location.href='AdminServlet'" class="btn btn-secondary">Back to Dashboard</button>
    </div>
    <% } %>
  </main>
</div>
</body>
</html>