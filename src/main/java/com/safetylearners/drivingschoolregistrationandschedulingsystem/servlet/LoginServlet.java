package com.safetylearners.drivingschoolregistrationandschedulingsystem.servlet;

import com.safetylearners.drivingschoolregistrationandschedulingsystem.model.User;
import com.safetylearners.drivingschoolregistrationandschedulingsystem.model.UserDatabase;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDatabase userDatabase;



    @Override
    public void init() throws ServletException {
        String contextPath = getServletContext().getRealPath("/");
        userDatabase = new UserDatabase(contextPath);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String selectedRole = request.getParameter("role");

        User user = userDatabase.getUser(username);

        if (user == null) {
            request.setAttribute("errorMessage", "Invalid username.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        if (!user.getPassword().equals(password)) {
            request.setAttribute("errorMessage", "Invalid password.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        if (!user.getRole().equals(selectedRole)) {
            request.setAttribute("errorMessage", "Selected role does not match your account. You cannot log in as a " + selectedRole + ".");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        // Login successful, set session attributes
        HttpSession session = request.getSession();
        session.setAttribute("username", username);
        session.setAttribute("role", user.getRole());

        // Redirect all user to index.jsp
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("LoginServlet loaded");
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
}