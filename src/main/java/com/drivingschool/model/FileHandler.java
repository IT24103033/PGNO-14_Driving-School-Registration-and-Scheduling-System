package com.drivingschool.model;

import java.io.*;
import java.util.*;
import jakarta.servlet.ServletContext;

public class FileHandler {
    private String filePath;

    public FileHandler(String filePath) {
        this.filePath = filePath;
    }

    public void saveStudent(Student student) throws IOException {
        // Get the absolute path
        String absolutePath = new File(filePath).getAbsolutePath();
        File file = new File(absolutePath);

        // Ensure the parent directory exists
        File parentDir = file.getParentFile();
        if (parentDir != null && !parentDir.exists()) {
            parentDir.mkdirs();
        }

        // Append the new student data
        try (PrintWriter out = new PrintWriter(new FileWriter(file, true))) {
            out.println(student.toFileString());
            out.flush(); // Ensure data is written immediately
        } catch (IOException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public List<Student> getAllStudents() throws IOException {
        List<Student> students = new ArrayList<>();
        String absolutePath = new File(filePath).getAbsolutePath();
        File file = new File(absolutePath);

        if (!file.exists()) {
            return students;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {  // Skip empty lines
                    String[] parts = line.split(",");
                    if (parts.length == 8) {
                        Student student = new Student(
                            parts[0], parts[1], parts[2], parts[3],
                            parts[4], Integer.parseInt(parts[5]), parts[6], parts[7]
                        );
                        students.add(student);
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            throw e;
        }
        return students;
    }

    public void saveAllStudents(List<Student> students) throws IOException {
        String absolutePath = new File(filePath).getAbsolutePath();
        File file = new File(absolutePath);

        try (PrintWriter writer = new PrintWriter(new FileWriter(file, false))) {
            for (Student student : students) {
                writer.println(student.toFileString());
            }
            writer.flush(); // Ensure data is written immediately
        } catch (IOException e) {
            e.printStackTrace();
            throw e;
        }
    }
}
