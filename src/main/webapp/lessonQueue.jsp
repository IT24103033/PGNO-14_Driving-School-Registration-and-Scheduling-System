<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.safetylearners.drivingschoolregistrationandschedulingsystem.model.FileHandler" %>
<%@ page import="com.safetylearners.drivingschoolregistrationandschedulingsystem.model.QueueManager" %>
<%@ page import="com.safetylearners.drivingschoolregistrationandschedulingsystem.model.Lesson" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
  if (application.getAttribute("queueManager") == null) {
    request.getRequestDispatcher("/lesson").forward(request, response);
    return;
  }
%>
<%
  String role = (String) session.getAttribute("role");
  if (role == null) {

    response.sendRedirect("login.jsp");
    return;
  }
  if (application.getAttribute("queueManager") == null) {
    request.getRequestDispatcher("/lesson").forward(request, response);
    return;
  }
%>
<html>
<head>
  <title>Lesson Queue</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .action-btn { margin-right: 5px; }
    .pending-count { font-weight: bold; }
  </style>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="JavaScript/custom.js"></script>
  <script src="JavaScript/navbar.js"></script>
  <script>
    // Trigger modal on update error


      // Add validation to update form submissions
      document.querySelectorAll('form[action="lesson"][method="post"]').forEach(form => {
        if (form.querySelector('input[name="action"][value="update"]')) {
          form.onsubmit = function(event) {
            const lessonId = form.querySelector('input[name="lessonId"]').value;
            if (!validateUpdateForm(lessonId)) {
              event.preventDefault();
            }
          };
        }
      }
    }
  </script>
</head>
<body>
<jsp:include page="navbar.jsp" />
<div class="container">
  <h2>Lesson Queue</h2>
  <p>Current Queue: <span class="pending-count">
            <%= ((QueueManager) application.getAttribute("queueManager")).size() %>
        </span> Manage Queue</p>
  <%
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) {
      out.println("<div class='alert alert-danger'>" + errorMessage + "</div>");
    }
  %>
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>Queue Position</th>
      <th>Student</th>
      <th>Lesson Type</th>
      <th>Requested Date</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
      QueueManager queueManager = (QueueManager) application.getAttribute("queueManager");
      List<Lesson> queue = new ArrayList<>(queueManager.getLessonQueue());
      for (int i = 0; i < queue.size(); i++) {
        Lesson lesson = queue.get(i);
        String lessonIdFromError = (String) request.getAttribute("lessonId");
        boolean isErrorLesson = lessonIdFromError != null && lessonIdFromError.equals(lesson.getLessonId());
        String modalDate = isErrorLesson ? (String) request.getAttribute("date") : lesson.getDate();
        String modalTime = isErrorLesson ? (String) request.getAttribute("time") : lesson.getTime();
        String modalLessonType = isErrorLesson ? (String) request.getAttribute("lessonType") : lesson.getLessonType();
    %>
    <tr>
      <td><%= i + 1 %></td>
      <td><%= lesson.getStudentId() %></td>
      <td><%= lesson.getLessonType() %></td>
      <td><%= lesson.getDate() + " " + lesson.getTime() %></td>
      <td>
        <form action="lesson" method="post" style="display:inline;">
          <input type="hidden" name="action" value="schedule">
          <input type="hidden" name="lessonId" value="<%= lesson.getLessonId() %>">
          <button type="submit" class="btn btn-primary action-btn">Schedule</button>
        </form>
        <form action="lesson" method="post" style="display:inline;">
          <input type="hidden" name="action" value="remove">
          <input type="hidden" name="lessonId" value="<%= lesson.getLessonId() %>">
          <button type="submit" class="btn btn-danger action-btn">Remove</button>
        </form>
        <button type="button" class="btn btn-warning action-btn" data-bs-toggle="modal" data-bs-target="#updateModal-<%= lesson.getLessonId() %>">Update</button>

        <div class="modal fade" id="updateModal-<%= lesson.getLessonId() %>" tabindex="-1" aria-labelledby="updateModalLabel-<%= lesson.getLessonId() %>" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="updateModalLabel-<%= lesson.getLessonId() %>">Update Lesson</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form action="lesson" method="post">
                  <input type="hidden" name="action" value="update">
                  <input type="hidden" name="lessonId" value="<%= lesson.getLessonId() %>">
                  <div class="mb-3">
                    <label for="date-<%= lesson.getLessonId() %>" class="form-label">Date</label>
                    <input type="date" class="form-control" id="date-<%= lesson.getLessonId() %>" name="date" value="<%= modalDate %>" required min="<%= java.time.LocalDate.now() %>">
                  </div>
                  <div class="mb-3">
                    <label for="time-<%= lesson.getLessonId() %>" class="form-label">Time</label>
                    <input type="time" class="form-control" id="time-<%= lesson.getLessonId() %>" name="time" value="<%= modalTime %>" required>
                  </div>
                  <div class="mb-3">
                    <label for="lessonType-<%= lesson.getLessonId() %>" class="form-label">Lesson Type</label>
                    <select class="form-control" id="lessonType-<%= lesson.getLessonId() %>" name="lessonType" required>
                      <option value="Highway Driving" <%= "Highway Driving".equals(modalLessonType) ? "selected" : "" %>>Highway Driving</option>
                      <option value="Parallel Parking" <%= "Parallel Parking".equals(modalLessonType) ? "selected" : "" %>>Parallel Parking</option>
                      <option value="City Driving" <%= "City Driving".equals(modalLessonType) ? "selected" : "" %>>City Driving</option>
                      <option value="Practice Test" <%= "Practice Test".equals(modalLessonType) ? "selected" : "" %>>Practice Test</option>
                      <option value="Night Driving" <%= "Night Driving".equals(modalLessonType) ? "selected" : "" %>>Night Driving</option>
                    </select>
                  </div>
                  <button type="submit" class="btn btn-primary">Save Changes</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
  <div class="mt-3">
    <a href="requestLesson.jsp" class="btn btn-primary">Request New Lesson</a>
    <form action="lesson" method="post" style="display:inline;">
      <input type="hidden" name="action" value="schedule">
    </form>
    <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
  </div>
  <p>Number of pending requests: <%= queueManager.size() %></p>
  <%
    String message = (String) request.getAttribute("message");
    if (message != null) {
      out.println("<p class='text-success'>" + message + "</p>");
    }
  %>
</div>
</body>
</html>