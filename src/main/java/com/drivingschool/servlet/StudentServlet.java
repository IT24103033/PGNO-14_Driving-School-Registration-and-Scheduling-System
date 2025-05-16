//package com.drivingschool.servlet;
//
//import com.drivingschool.model.Student;
//// StudentServlet.java
//import com.drivingschool.model.*;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.*;
//import java.util.*;
//
//public class StudentServlet extends HttpServlet {
//    private final FileHandler fileHandler = new FileHandler("data/students.txt");
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        String action = request.getParameter("action");
//
//        if ("register".equals(action)) {
//            // Create new student
//            String id = UUID.randomUUID().toString();
//            String fullName = request.getParameter("fullName");
//            String email = request.getParameter("email");
//            String address = request.getParameter("address");
//            String phoneNumber = request.getParameter("phoneNumber");
//            int age = Integer.parseInt(request.getParameter("age"));
//            String username = request.getParameter("username");
//            String password = request.getParameter("password");
//
//            Student student = new Student(id, fullName, email, address, phoneNumber, age, username, password);
//            fileHandler.saveStudent(student);
//
//            // Redirect to login page after registration
//            response.sendRedirect("login.jsp?message=Registration successful! Please login.");
//        }
//        // Add other actions (update, delete) as needed
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String action = request.getParameter("action");
//
//        if ("list".equals(action)) {
//            List<Student> students = fileHandler.getAllStudents();
//            request.setAttribute("students", students);
//            request.getRequestDispatcher("studentList.jsp").forward(request, response);
//        }
//
//    }
package com.drivingschool.servlet;

import com.drivingschool.model.Student;
import com.drivingschool.model.FileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.*;

public class StudentServlet extends HttpServlet {
    private final FileHandler fileHandler = new FileHandler("data/students.txt");

    @Override
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
        // Add more actions here if you want to handle updates via POST
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "list":
                List<Student> students = fileHandler.getAllStudents();
                request.setAttribute("students", students);
                request.getRequestDispatcher("studentList.jsp").forward(request, response);
                break;

            case "search":
                String searchTerm = request.getParameter("search");
                List<Student> allStudents = fileHandler.getAllStudents();
                List<Student> filteredStudents = new ArrayList<>();

                for (Student s : allStudents) {
                    if (s.getFullName().toLowerCase().contains(searchTerm.toLowerCase()) ||
                            s.getId().toLowerCase().contains(searchTerm.toLowerCase())) {
                        filteredStudents.add(s);
                    }
                }

                request.setAttribute("students", filteredStudents);
                request.setAttribute("message", filteredStudents.isEmpty() ? "No matching students found." : "Search results:");
                request.getRequestDispatcher("studentList.jsp").forward(request, response);
                break;

            case "delete":
                String deleteId = request.getParameter("id");
                List<Student> studentList = fileHandler.getAllStudents();
                studentList.removeIf(s -> s.getId().equals(deleteId));
                fileHandler.saveAllStudents(studentList);  // You’ll need to implement this method in FileHandler

                request.setAttribute("students", studentList);
                request.setAttribute("message", "Student deleted successfully.");
                request.getRequestDispatcher("studentList.jsp").forward(request, response);
                break;

            default:
                response.sendRedirect("error.jsp"); // or some fallback page
                break;
        }
    }
}

