package com.drivingschool.admin;

public class Admin {
    private String id;
    private String name;
    private String email;
    private String status;
    private String role;
    private String password;

    public Admin() {
        // Default constructor
        this.role = "admin"; // Default role
        this.status = "Active"; // Default status
    }

    public Admin(String id, String name, String email, String status) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.status = status;
        this.role = "admin"; // Default role
    }

    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Admin [id=" + id + ", name=" + name + ", email=" + email +
                ", status=" + status + ", role=" + role + "]";
    }
}