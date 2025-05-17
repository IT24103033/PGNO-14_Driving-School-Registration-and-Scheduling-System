<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Safety Learners</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            line-height: 1.6;
            background-color: #f8f9fa;
        }

        /* Top Navigation */
        .top-nav {
            background-color: #1e3c72;
            padding: 15px 0;
            color: white;
        }

        .nav-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 90%;
            margin: 0 auto;
        }

        .brand {
            display: flex;
            align-items: center;
            color: white;
            text-decoration: none;
            font-size: 1.5em;
            font-weight: 600;
        }

        .brand-icon {
            font-size: 1.2em;
            margin-right: 10px;
        }

        /* Login Form */
        .login-container {
            max-width: 400px;
            margin: 60px auto;
            padding: 30px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-header h1 {
            color: #1e3c72;
            font-size: 2em;
            margin-bottom: 10px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1em;
            transition: border-color 0.3s;
        }

        .form-group input:focus {
            border-color: #2962ff;
            outline: none;
        }

        .login-btn {
            width: 100%;
            padding: 12px;
            background-color: #2962ff;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 1em;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .login-btn:hover {
            background-color: #1e3c72;
        }

        .register-link {
            text-align: center;
            margin-top: 20px;
        }

        .register-link a {
            color: #2962ff;
            text-decoration: none;
            font-weight: 500;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .message {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 4px;
            text-align: center;
        }

        .error {
            background-color: #fee;
            color: #e33;
            border: 1px solid #e33;
        }

        .success {
            background-color: #e8f5e9;
            color: #4caf50;
            border: 1px solid #4caf50;
        }
    </style>
</head>
<body>
    <nav class="top-nav">
        <div class="nav-container">
            <a href="index.jsp" class="brand">
                <span class="brand-icon">➜</span>
                Safety Learners
            </a>
        </div>
    </nav>

    <div class="login-container">
        <div class="login-header">
            <h1>Welcome Back</h1>
            <p>Sign in to continue your learning journey</p>
        </div>

        <% if(request.getParameter("error") != null) { %>
            <div class="message error">
                <%= request.getParameter("error") %>
            </div>
        <% } %>

        <% if(request.getParameter("success") != null) { %>
            <div class="message success">
                <%= request.getParameter("success") %>
            </div>
        <% } %>

        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>

            <button type="submit" class="login-btn">Sign In</button>

            <div class="register-link">
                <p>Don't have an account? <a href="registerStudent.jsp">Register Now</a></p>
            </div>
        </form>
    </div>
</body>
</html>
