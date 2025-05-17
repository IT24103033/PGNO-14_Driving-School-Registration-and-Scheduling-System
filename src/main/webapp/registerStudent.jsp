<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Safety Learners</title>
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

        /* Registration Form */
        .register-container {
            max-width: 600px;
            margin: 40px auto;
            padding: 30px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .register-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .register-header h1 {
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

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .register-btn {
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

        .register-btn:hover {
            background-color: #1e3c72;
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
        }

        .login-link a {
            color: #2962ff;
            text-decoration: none;
            font-weight: 500;
        }

        .login-link a:hover {
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

    <div class="register-container">
        <div class="register-header">
            <h1>Create Account</h1>
            <p>Join us and start your driving journey today</p>
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

        <form action="StudentServlet" method="post" onsubmit="return validateForm()">
            <input type="hidden" name="action" value="register">
            
            <div class="form-row">
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" id="fullName" name="fullName" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" required>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="phoneNumber">Phone Number</label>
                    <input type="tel" id="phoneNumber" name="phoneNumber" pattern="^0\d{9}$" title="Phone number must be 10 digits and start with 0" required>
                </div>
                <div class="form-group">
                    <label for="age">Age</label>
                    <input type="number" id="age" name="age" min="16" max="99" title="Age must be between 16 and 99 years old" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
            </div>

            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>

            <button type="submit" class="register-btn">Create Account</button>

            <div class="login-link">
                <p>Already have an account? <a href="login.jsp">Sign In</a></p>
            </div>
        </form>
    </div>

    <script>
        function validateForm() {
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirmPassword').value;
            var age = document.getElementById('age').value;
            var phoneNumber = document.getElementById('phoneNumber').value;
            
            // Validate age (between 16 and 99)
            if (age < 16 || age > 99) {
                alert('Age must be between 16 and 99 years old.');
                return false;
            }
            
            // Validate phone number (10 digits starting with 0)
            var phoneRegex = /^0\d{9}$/;
            if (!phoneRegex.test(phoneNumber)) {
                alert('Phone number must be 10 digits and start with 0.');
                return false;
            }
            
            // Validate password match
            if (password !== confirmPassword) {
                alert('Passwords do not match!');
                return false;
            }
            
            return true;
        }
    </script>
</body>
</html>
