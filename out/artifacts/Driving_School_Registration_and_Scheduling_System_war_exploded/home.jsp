<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Instructor Management - Home</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-image: url("backgroundImage.jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        nav {
            background: #007bff;
            color: white;
            padding: 12px 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-weight: 500;
        }

        nav a:hover {
            text-decoration: underline;
        }

        .content-wrapper {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding-top: 250px; /* ⬅️ increased from 200px to 250px */
        }

        .welcome-box {
            background: rgba(255, 255, 255, 0.96);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            width: 300px;
            text-align: center;
        }

        .btn {
            display: block;
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #28a745;
        }

        .btn-secondary:hover {
            background-color: #1e7e34;
        }
    </style>
</head>
<body>

<nav>
    <div><strong>Driving School System</strong></div>
    <div>
        <a href="home.jsp">Home</a>
        <a href="registerInstructor.jsp">Register</a>
        <a href="instructorList.jsp">Instructor List</a>
        <a href="#">Dashboard</a>
    </div>
</nav>

<div class="content-wrapper">
    <div class="welcome-box">
        <a class="btn" href="registerInstructor.jsp">Register Instructor</a>
        <a class="btn btn-secondary" href="login.jsp">Login</a>
    </div>
</div>

</body>
</html>
