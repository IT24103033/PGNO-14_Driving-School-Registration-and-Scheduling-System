//package com.drivingschool.model;
//
//import java.io.*;
//import java.util.*;
//
//public class FileHandler {
//    private String filePath;
//
//    public FileHandler(String filePath) {
//        this.filePath = filePath;
//    }
//
//    public void saveStudent(Student student) throws IOException {
//        File file = new File(filePath);
//
//        // Ensure the parent directory exists
//        File parentDir = file.getParentFile();
//        if (parentDir != null && !parentDir.exists()) {
//            parentDir.mkdirs();  // create directory and any non-existing parent directories
//        }
//
//        try (PrintWriter out = new PrintWriter(new FileWriter(file, true))) {
//            out.println(student.getId() + "," +
//                    student.getFullName() + "," +
//                    student.getEmail() + "," +
//                    student.getAddress() + "," +
//                    student.getPhoneNumber() + "," +
//                    student.getAge() + "," +
//                    student.getUsername() + "," +
//                    student.getPassword());
//        }
//    }
//
//
//    public List<Student> getAllStudents() throws IOException {
//        List<Student> students = new ArrayList<>();
//        File file = new File(filePath);
//
//        if (!file.exists()) {
//            return students;
//        }
//
//        try (Scanner scanner = new Scanner(file)) {
//            while (scanner.hasNextLine()) {
//                String line = scanner.nextLine();
//                String[] parts = line.split(",");
//                if (parts.length == 8) {
//                    Student student = new Student(
//                            parts[0], parts[1], parts[2], parts[3],
//                            parts[4], Integer.parseInt(parts[5]), parts[6], parts[7]
//                    );
//                    students.add(student);
//                }
//            }
//        }
//        return students;
//    }
//
//    // Add other methods for update, delete, search as needed
//}

package com.drivingschool.model;

import java.io.*;
import java.util.*;

public class FileHandler {
    private String filePath;

    public FileHandler(String filePath) {
        this.filePath = filePath;
    }

    public void saveStudent(Student student) throws IOException {
        File file = new File(filePath);

        // Ensure the parent directory exists
        File parentDir = file.getParentFile();
        if (parentDir != null && !parentDir.exists()) {
            parentDir.mkdirs(); // create directory and any non-existing parent directories
        }

        try (PrintWriter out = new PrintWriter(new FileWriter(file, true))) {
            out.println(student.getId() + "," +
                    student.getFullName() + "," +
                    student.getEmail() + "," +
                    student.getAddress() + "," +
                    student.getPhoneNumber() + "," +
                    student.getAge() + "," +
                    student.getUsername() + "," +
                    student.getPassword());
        }
    }

    public List<Student> getAllStudents() throws IOException {
        List<Student> students = new ArrayList<>();
        File file = new File(filePath);

        if (!file.exists()) {
            return students;
        }

        try (Scanner scanner = new Scanner(file)) {
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
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
        return students;
    }

    // Add the saveAllStudents method
    public void saveAllStudents(List<Student> students) {
        // Clear the existing file and write all students
        try (PrintWriter writer = new PrintWriter(new FileWriter(filePath, false))) {
            for (Student s : students) {
                writer.println(s.toFileString()); // assumes toFileString serializes Student data
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
