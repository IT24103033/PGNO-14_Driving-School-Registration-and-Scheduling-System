package com.drivingschool.servlet;

import com.drivingschool.model.FileHandler;
import com.drivingschool.model.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private final FileHandler fileHandler = new FileHandler("data/students.txt");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Get all students and check credentials
        List<Student> students = fileHandler.getAllStudents();
        boolean authenticated = false;
        Student authenticatedStudent = null;

        for (Student student : students) {
            if (student.getUsername().equals(username) && student.getPassword().equals(password)) {
                authenticated = true;
                authenticatedStudent = student;
                break;
            }
        }

        if (authenticated) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("studentId", authenticatedStudent.getId());
            session.setAttribute("fullName", authenticatedStudent.getFullName());
            
            // Check if there's a redirect destination
            String redirectTo = (String) session.getAttribute("redirect_after_login");
            if (redirectTo != null) {
                session.removeAttribute("redirect_after_login"); // Clear the redirect
                response.sendRedirect(redirectTo);
            } else {
                // If no specific redirect, go to main interface
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("login.jsp?error=Invalid username or password");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect("index.jsp");
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
} 