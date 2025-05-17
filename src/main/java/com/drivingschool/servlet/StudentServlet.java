package com.drivingschool.servlet;

import com.drivingschool.model.Student;
import com.drivingschool.model.FileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.*;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
    private final FileHandler fileHandler = new FileHandler("data/users.txt");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "register";

        switch (action) {
            case "register":
                registerStudent(request, response);
                break;
            case "update":
                updateStudent(request, response);
                break;
            default:
                response.sendRedirect("error.jsp");
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "list":
                listStudents(request, response);
                break;
            case "search":
                searchStudents(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteStudent(request, response);
                break;
            default:
                response.sendRedirect("error.jsp");
                break;
        }
    }

    private void registerStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

        response.sendRedirect("login.jsp?message=Registration successful! Please login.");
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        int age = Integer.parseInt(request.getParameter("age"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        List<Student> students = fileHandler.getAllStudents();
        boolean updated = false;

        for (int i = 0; i < students.size(); i++) {
            if (students.get(i).getId().equals(id)) {
                Student updatedStudent = new Student(id, fullName, email, address, phoneNumber, age, username,
                        password.isEmpty() ? students.get(i).getPassword() : password);
                students.set(i, updatedStudent);
                updated = true;
                break;
            }
        }

        if (updated) {
            fileHandler.saveAllStudents(students);
            request.setAttribute("message", "Student updated successfully");
            request.setAttribute("messageType", "success");
        } else {
            request.setAttribute("message", "Student not found");
            request.setAttribute("messageType", "error");
        }

        listStudents(request, response);
    }

    private void listStudents(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Student> students = fileHandler.getAllStudents();
        request.setAttribute("students", students);
        request.getRequestDispatcher("studentList.jsp").forward(request, response);
    }

    private void searchStudents(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchTerm = request.getParameter("search").toLowerCase();
        List<Student> allStudents = fileHandler.getAllStudents();
        List<Student> filteredStudents = new ArrayList<>();

        for (Student student : allStudents) {
            if (student.getFullName().toLowerCase().contains(searchTerm) ||
                student.getId().toLowerCase().contains(searchTerm) ||
                student.getEmail().toLowerCase().contains(searchTerm)) {
                filteredStudents.add(student);
            }
        }

        request.setAttribute("students", filteredStudents);
        if (filteredStudents.isEmpty()) {
            request.setAttribute("message", "No students found matching your search.");
            request.setAttribute("messageType", "error");
        }
        request.getRequestDispatcher("studentList.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        List<Student> students = fileHandler.getAllStudents();
        
        for (Student student : students) {
            if (student.getId().equals(id)) {
                request.setAttribute("student", student);
                request.getRequestDispatcher("studentUpdate.jsp").forward(request, response);
                return;
            }
        }
        
        request.setAttribute("message", "Student not found");
        request.setAttribute("messageType", "error");
        listStudents(request, response);
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        List<Student> students = fileHandler.getAllStudents();
        boolean removed = students.removeIf(s -> s.getId().equals(id));

        if (removed) {
            fileHandler.saveAllStudents(students);
            request.setAttribute("message", "Student deleted successfully");
            request.setAttribute("messageType", "success");
        } else {
            request.setAttribute("message", "Student not found");
            request.setAttribute("messageType", "error");
        }

        listStudents(request, response);
    }
}

