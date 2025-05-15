package com.drivingschool.admin;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DATA_FILE = "data/admins.txt";
    private File dataFile;

    @Override
    public void init() throws ServletException {
        super.init();
        // Get the real path to the data file
        String realPath = getServletContext().getRealPath("/");
        dataFile = new File(realPath + DATA_FILE);

        // Create the file if it doesn't exist
        try {
            if (!dataFile.exists()) {
                dataFile.getParentFile().mkdirs();
                dataFile.createNewFile();

                // Add sample data for demonstration
//                List<Admin> sampleData = new ArrayList<>();
//                sampleData.add(new Admin("1001", "John Doe", "john.doe@example.com", "Active"));
//                sampleData.add(new Admin("1002", "Jane Smith", "jane.smith@example.com", "Active"));
//                saveAdmins(sampleData);
            }
        } catch (IOException e) {
            throw new ServletException("Failed to initialize admin data file", e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            // Handle edit action
            String id = request.getParameter("id");
            Admin adminToEdit = findAdminById(id);
            if (adminToEdit != null) {
                request.setAttribute("admin", adminToEdit);
                request.getRequestDispatcher("edit.jsp").forward(request, response);
            } else {
                response.sendRedirect("dashboard.jsp");
            }
        } else {
            // Default action - show all admins
            List<Admin> adminList = loadAdmins();
            request.setAttribute("adminList", adminList);
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            // Handle create action
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password"); // In real app, hash this!
            String role = request.getParameter("role");

            // Simple validation
            if (id == null || name == null || email == null || password == null) {
                request.setAttribute("error", "All fields are required");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Check if ID already exists
            Admin existingAdmin = findAdminById(id);
            if (existingAdmin != null) {
                request.setAttribute("error", "Admin ID already exists");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            Admin newAdmin = new Admin(id, name, email, "Active");
            newAdmin.setRole(role);
            newAdmin.setPassword(password); // In real app, hash this!

            List<Admin> adminList = loadAdmins();
            adminList.add(newAdmin);
            saveAdmins(adminList);

            response.sendRedirect("AdminServlet"); // Redirect to view all
        } else if ("delete".equals(action)) {
            // Handle delete action
            String id = request.getParameter("id");
            List<Admin> adminList = loadAdmins();
            removeAdminById(adminList, id);
            saveAdmins(adminList);

            response.sendRedirect("AdminServlet"); // Redirect to view all
        } else if ("update".equals(action)) {
            // Handle update action
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String status = request.getParameter("status");
            String role = request.getParameter("role");

            List<Admin> adminList = loadAdmins();
            updateAdmin(adminList, id, name, email, status, role);
            saveAdmins(adminList);

            response.sendRedirect("AdminServlet"); // Redirect to view all
        }
    }

    // Helper methods for file operations
    private List<Admin> loadAdmins() {
        List<Admin> adminList = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(dataFile))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;

                String[] parts = line.split("\\|");
                if (parts.length >= 4) {
                    Admin admin = new Admin(parts[0], parts[1], parts[2], parts[3]);
                    if (parts.length >= 5) {
                        admin.setRole(parts[4]);
                    }
                    if (parts.length >= 6) {
                        admin.setPassword(parts[5]);
                    }
                    adminList.add(admin);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return adminList;
    }

    private void saveAdmins(List<Admin> adminList) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(dataFile))) {
            for (Admin admin : adminList) {
                writer.write(admin.getId() + "|" +
                        admin.getName() + "|" +
                        admin.getEmail() + "|" +
                        admin.getStatus() + "|" +
                        admin.getRole() + "|" +
                        admin.getPassword());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private Admin findAdminById(String id) {
        List<Admin> adminList = loadAdmins();
        for (Admin admin : adminList) {
            if (admin.getId().equals(id)) {
                return admin;
            }
        }
        return null;
    }

    private void removeAdminById(List<Admin> adminList, String id) {
        adminList.removeIf(admin -> admin.getId().equals(id));
    }

    private void updateAdmin(List<Admin> adminList, String id, String name, String email, String status, String role) {
        for (Admin admin : adminList) {
            if (admin.getId().equals(id)) {
                admin.setName(name);
                admin.setEmail(email);
                if (status != null) {
                    admin.setStatus(status);
                }
                if (role != null) {
                    admin.setRole(role);
                }
                break;
            }
        }
    }
}