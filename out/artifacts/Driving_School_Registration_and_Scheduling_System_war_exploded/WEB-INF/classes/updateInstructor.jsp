<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Update Instructor</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f0f2f5;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .form-card {
            background: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        .form-card h2 {
            margin-bottom: 25px;
            color: #333;
            font-size: 24px;
            text-align: center;
        }

        label {
            font-weight: 500;
            display: block;
            margin-top: 12px;
            margin-bottom: 5px;
            color: #444;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        .btn {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background-color: #ffc107;
            color: black;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.3s;
        }

        .btn:hover {
            background-color: #e0a800;
        }

        .link {
            margin-top: 15px;
            display: block;
            text-align: center;
            font-size: 14px;
            color: #007bff;
            text-decoration: none;
        }

        .link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="form-card">
    <h2>Update Instructor</h2>
    <form action="InstructorServlet" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">

        <label for="name">Name:</label>
        <input type="text" name="name" id="name" value="<%= request.getParameter("name") %>" required>

        <label for="experience">Experience:</label>
        <input type="number" name="experience" id="experience" value="<%= request.getParameter("experience") %>" required>

        <label for="phone">Phone:</label>
        <input type="text" name="phone" id="phone" value="<%= request.getParameter("phone") %>" required>

        <button class="btn" type="submit">Update</button>
    </form>
    <a class="link" href="instructorList.jsp">← Back to List</a>
</div>
</body>
</html>
