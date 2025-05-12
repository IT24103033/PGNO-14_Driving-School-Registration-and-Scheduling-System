<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Request Lesson</title>
  <link rel="stylesheet" href="css/request-lesson-style.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="JavaScript/custom.js"></script>
  <script src="JavaScript/navbar.js"></script>
</head>
<body>
<div class="container mt-4">
  <h2><center><b>Request a Lesson</b></center></h2>
  <%
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) {
      out.println("<div class='alert alert-danger'>" + errorMessage + "</div>");
    }
    String studentId = (String) request.getAttribute("studentId");
    String lessonType = (String) request.getAttribute("lessonType");
    String date = (String) request.getAttribute("date");
    String time = (String) request.getAttribute("time");
  %>
  <form action="lesson" method="post" onsubmit="return validateForm()">
    <input type="hidden" name="action" value="request">
    <div class="mb-3">
      <label for="studentId" class="form-label">Student ID</label>
      <input type="text" class="form-control" id="studentId" name="studentId" value="<%= studentId != null ? studentId : "" %>" required>
    </div>
    <div class="mb-3">
      <label for="lessonType" class="form-label">Lesson Type</label>
      <select class="form-control" id="lessonType" name="lessonType" required>
        <option value="Highway Driving" <%= "Highway Driving".equals(lessonType) ? "selected" : "" %>>Highway Driving</option>
        <option value="Parallel Parking" <%= "Parallel Parking".equals(lessonType) ? "selected" : "" %>>Parallel Parking</option>
        <option value="City Driving" <%= "City Driving".equals(lessonType) ? "selected" : "" %>>City Driving</option>
        <option value="Practice Test" <%= "Practice Test".equals(lessonType) ? "selected" : "" %>>Practice Test</option>
        <option value="Night Driving" <%= "Night Driving".equals(lessonType) ? "selected" : "" %>>Night Driving</option>
      </select>
    </div>
    <div class="mb-3">
      <label for="date" class="form-label">Date</label>
      <input type="date" class="form-control" id="date" name="date" value="<%= date != null ? date : "" %>" required min="<%= java.time.LocalDate.now() %>">
    </div>
    <div class="mb-3">
      <label for="time" class="form-label">Time</label>
      <input type="time" class="form-control" id="time" name="time" value="<%= time != null ? time : "" %>" required>
    </div>
    <button type="submit" class="btn btn-primary">Submit Request</button>
  </form>
</div>
</body>
</html>