<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login - Instructor Management</title>
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
            background: rgba(255, 255, 255, 0.92);
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
        input[type="password"] {
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
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.3s;
        }

        .btn:hover {
            background-color: #1e7e34;
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
    <h2>Instructor Login</h2>
    <form action="InstructorServlet" method="post">
        <input type="hidden" name="action" value="login">

        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required>

        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required>

        <button class="btn" type="submit">Login</button>
    </form>
    <a class="link" href="home.jsp">← Back to Home</a>
</div>
</body>
</html>
