<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Request Lesson</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/request-lesson-style.css">
</head>
<body>
<div class="container">
  <h2>Request a New Lesson</h2>
  <form action="lesson" method="post">
    <input type="hidden" name="action" value="request">
    <div class="mb-3">
      <label for="studentId" class="form-label">Student ID</label>
      <input type="text" class="form-control" id="studentId" name="studentId" required>
    </div>
    <div class="mb-3">
      <label for="lessonType" class="form-label">Lesson Type</label>
      <select class="form-control" id="lessonType" name="lessonType" required>
        <option value="Highway Driving">Highway Driving</option>
        <option value="Parallel Parking">Parallel Parking</option>
        <option value="City Driving">City Driving</option>
        <option value="Practice Test">Practice Test</option>
        <option value="Night Driving">Night Driving</option>
      </select>
    </div>
    <div class="mb-3">
      <label for="date" class="form-label">Date</label>
      <input type="date" class="form-control" id="date" name="date" required>
    </div>
    <div class="mb-3">
      <label for="time" class="form-label">Time</label>
      <input type="time" class="form-control" id="time" name="time" required>
    </div>
    <button type="submit" class="btn btn-primary">Request Lesson</button>
  </form>
  <%
    String message = (String) request.getAttribute("message");
    if (message != null) {
      System.out.println("<p class='text-success'>" + message + "</p>");
    }
  %>
  <a href="index.jsp" class="btn btn-secondary mt-3">Back to Home</a>
</div>
</body>
</html>