<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register Instructor</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-image: url("backgroundImage.jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .overlay {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        .overlay h2 {
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
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
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
<div class="overlay">
    <h2>Register Instructor</h2>
    <form action="InstructorServlet" method="post">
        <input type="hidden" name="action" value="add">

        <label for="id">ID:</label>
        <input type="text" name="id" id="id" required>

        <label for="name">Name:</label>
        <input type="text" name="name" id="name" required>

        <label for="experience">Experience:</label>
        <input type="number" name="experience" id="experience" required>

        <label for="phone">Phone:</label>
        <input type="text" name="phone" id="phone" required>

        <button class="btn" type="submit">Register</button>
    </form>
    <a class="link" href="instructorList.jsp">View All Instructors</a>
</div>
</body>
</html>
