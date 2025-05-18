<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, model.Instructor" %>
<html>
<head>
    <title>Instructor List</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f0f2f5;
            padding: 40px;
        }

        .container {
            max-width: 900px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        th {
            background: #007bff;
            color: white;
        }

        tr:hover {
            background: #f1f1f1;
        }

        .btn {
            padding: 6px 12px;
            border: none;
            background-color: #dc3545;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn:hover {
            background-color: #a11e2e;
        }

        .edit-btn {
            background-color: #28a745;
            margin-left: 6px;
        }

        .edit-btn:hover {
            background-color: #1e7e34;
        }

        .link {
            display: block;
            text-align: center;
            font-size: 14px;
            color: #007bff;
            text-decoration: none;
            margin-top: 10px;
        }

        .link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Instructor List</h2>
    <%
        List<Instructor> instructors = (List<Instructor>) request.getAttribute("instructors");
        if (instructors != null && !instructors.isEmpty()) {
    %>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Experience</th>
            <th>Phone</th>
            <th>Actions</th>
        </tr>
        <% for (Instructor i : instructors) { %>
        <tr>
            <td><%= i.getId() %></td>
            <td><%= i.getName() %></td>
            <td><%= i.getExperience() %></td>
            <td><%= i.getPhone() %></td>
            <td>
                <form action="InstructorServlet" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= i.getId() %>">
                    <button type="submit" class="btn">Delete</button>
                </form>
                <form action="updateInstructor.jsp" method="get" style="display:inline;">
                    <input type="hidden" name="id" value="<%= i.getId() %>">
                    <input type="hidden" name="name" value="<%= i.getName() %>">
                    <input type="hidden" name="experience" value="<%= i.getExperience() %>">
                    <input type="hidden" name="phone" value="<%= i.getPhone() %>">
                    <button type="submit" class="btn edit-btn">Edit</button>
                </form>
            </td>
        </tr>
        <% } %>
    </table>
    <% } else { %>
    <p style="text-align:center; color: #555;">No instructors registered.</p>
    <% } %>

    <a class="link" href="registerInstructor.jsp">← Back to Registration</a>
</div>
</body>
</html>
