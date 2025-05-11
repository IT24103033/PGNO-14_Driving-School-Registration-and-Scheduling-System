<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Schedule Lesson</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2>Schedule a Lesson</h2>
    <form action="lesson" method="post">
        <input type="hidden" name="action" value="schedule">
        <button type="submit" class="btn btn-success">Schedule Next Lesson</button>
    </form>
    <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
            System.out.println("<p class='text-success'>" + message + "</p>");
        }
    %>
    <a href="lessonQueue.jsp" class="btn btn-secondary mt-3">Back to Queue</a>
</div>
</body>
</html>