package com.drivingschool.servlet;

import com.drivingschool.model.Student;
// StudentServlet.java
import com.drivingschool.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.*;

public class StudentServlet extends HttpServlet {
    private final FileHandler fileHandler = new FileHandler("data/students.txt");

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("register".equals(action)) {
            // Create new student
            String id = UUID.randomUUID().toString();
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phoneNumber");
            int age = Integer.parseInt(request.getParameter("age"));
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            Student student = new Student(id, fullName, email, address, phoneNumber, age, username, password);
            fileHandler.saveStudent(student);

            // Redirect to login page after registration
            response.sendRedirect("login.jsp?message=Registration successful! Please login.");
        }
        // Add other actions (update, delete) as needed
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("list".equals(action)) {
            List<Student> students = fileHandler.getAllStudents();
            request.setAttribute("students", students);
            request.getRequestDispatcher("studentList.jsp").forward(request, response);
        }

    }
}
