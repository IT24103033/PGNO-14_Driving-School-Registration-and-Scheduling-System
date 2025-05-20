<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp" style="font-weight: bold; font-size: 1.5rem;">Safety Learners</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="index.jsp" id="homeLink">Home</a>
        </li>

        <%
          String username = (String) session.getAttribute("username");
          String role = (String) session.getAttribute("role");

          if ("Student".equals(role)) {
        %>
        <li class="nav-item">
          <a class="nav-link" href="requestLesson.jsp" id="requestLessonLink">Request Lesson</a>
        </li>
        <% } %>

        <li class="nav-item">
          <a class="nav-link" href="lessonQueue.jsp" id="lessonQueueLink">Lesson Queue</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="submitFeedback.jsp" id="feedbackLink">Feedbacks</a>
        </li>
      </ul>

      <ul class="navbar-nav ms-auto">
        <%
          if (username != null && role != null){
        %>
        <li class="nav-item">
          <span class="nav-link text-white">Welcome, <%= username %> (<%= role %>)</span>
        </li>
        <li class="nav-item">
          <a class="nav-link btn btn-danger" href="logout" style="font-size: 1.1rem; padding: 0.5rem 1rem;">Logout</a>
        </li>
        <%
        } else {
        %>
        <li class="nav-item">
          <a class="nav-link btn btn-primary" href="login.jsp" id="loginLink" style="font-size: 1.1rem; padding: 0.5rem 1rem;">Login</a>
        </li>
        <%
          }
        %>
      </ul>
    </div>
  </div>
</nav>

<style>
  .nav-link.active {
    background-color: rgba(255, 255, 255, 0.2); /* Slight white background for active link */
    border-radius: 5px;
  }
  .nav-link:hover {
    background-color: rgba(255, 255, 255, 0.1); /* Subtle hover effect */
    border-radius: 5px;
  }
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>