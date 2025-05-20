package com.safetylearners.drivingschoolregistrationandschedulingsystem.model;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class UserDatabase {
    private static final String USERS_FILE = "data/users.txt";
    private Map<String, User> users;

    public UserDatabase(String contextPath) {
        users = new HashMap<>();
        System.out.println(users);
        loadUsers(contextPath);
    }

    private void loadUsers(String contextPath) {
        try (BufferedReader br = new BufferedReader(new FileReader(contextPath + USERS_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 3) {
                    String username = parts[0].trim();
                    String password = parts[1].trim();
                    String role = parts[2].trim();
                    users.put(username, new User(username, password, role));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public User getUser(String username) {
        return users.get(username);
    }
}