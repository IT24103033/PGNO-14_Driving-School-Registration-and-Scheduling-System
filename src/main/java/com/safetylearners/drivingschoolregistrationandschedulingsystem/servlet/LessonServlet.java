//package com.safetylearners.drivingschoolregistrationandschedulingsystem.servlet;
//
//import com.safetylearners.drivingschoolregistrationandschedulingsystem.model.Lesson;
//import com.safetylearners.drivingschoolregistrationandschedulingsystem.model.QueueManager;
//import com.safetylearners.drivingschoolregistrationandschedulingsystem.model.FileHandler;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.time.LocalDate;
//import java.time.LocalDateTime;
//import java.time.LocalTime;
//import java.time.format.DateTimeFormatter;
//import java.time.format.DateTimeParseException;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.UUID;
//import java.io.File;
//
//@WebServlet("/lesson")
//public class LessonServlet extends HttpServlet {
//    private QueueManager queueManager;
//    private static final String LESSONS_FILE_PATH = "/Users/sujana/IdeaProjects/Driving-School-Registration-and-Scheduling-System/data/lessons.txt";
//
//    @Override
//    public void init() throws ServletException {
//        queueManager = new QueueManager();
//        System.out.println("LessonServlet: Initializing and loading lessons from file");
//        File file = new File(LESSONS_FILE_PATH);
//        try {
//            if (!file.exists()) {
//                file.getParentFile().mkdirs();
//                file.createNewFile();
//                System.out.println("LessonServlet: Created lessons.txt file at " + LESSONS_FILE_PATH);
//            }
//            List<String> lessons = FileHandler.readFromFile(LESSONS_FILE_PATH);
//            System.out.println("LessonServlet: Loaded " + lessons.size() + " lessons from file");
//            for (String lessonData : lessons) {
//                queueManager.loadLessonFromString(lessonData);
//            }
//        } catch (IOException e) {
//            System.err.println("LessonServlet: Failed to load lessons from file: " + e.getMessage());
//        }
//        getServletContext().setAttribute("queueManager", queueManager);
//        System.out.println("LessonServlet: queueManager set in ServletContext");
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String action = request.getParameter("action");
//        System.out.println("LessonServlet: Processing action: " + action);
//
//        if ("request".equals(action)) {
//            try {
//                System.out.println("LessonServlet: Handling lesson request");
//                String lessonId = UUID.randomUUID().toString().substring(0, 8);
//                String studentId = request.getParameter("studentId");
//                String lessonType = request.getParameter("lessonType");
//                String date = request.getParameter("date");
//                String time = request.getParameter("time");
//                String status = "Pending";
//
//                // Log the received parameters
//                System.out.println("LessonServlet: Received parameters - studentId: " + studentId +
//                        ", lessonType: " + lessonType +
//                        ", date: " + date +
//                        ", time: " + time);
//
//                // Validate that required fields are not null or empty
//                if (studentId == null || studentId.trim().isEmpty() ||
//                        lessonType == null || lessonType.trim().isEmpty() ||
//                        date == null || date.trim().isEmpty() ||
//                        time == null || time.trim().isEmpty()) {
//                    System.out.println("LessonServlet: Validation failed - missing required fields");
//                    request.setAttribute("errorMessage", "All fields are required. Please fill out the form completely.");
//                    request.setAttribute("studentId", studentId);
//                    request.setAttribute("lessonType", lessonType);
//                    request.setAttribute("date", date);
//                    request.setAttribute("time", time);
//                    request.getRequestDispatcher("/requestLesson.jsp").forward(request, response);
//                    return;
//                }
//
//                // Server-side date and time validation
//                System.out.println("LessonServlet: Validating date and time");
//                LocalDate requestDate = LocalDate.parse(date);
//                LocalDate today = LocalDate.now();
//                LocalTime requestTime = LocalTime.parse(time, DateTimeFormatter.ofPattern("HH:mm"));
//                LocalDateTime requestDateTime = LocalDateTime.of(requestDate, requestTime);
//                LocalDateTime now = LocalDateTime.now();
//
//                if (requestDate.isBefore(today)) {
//                    System.out.println("LessonServlet: Validation failed - past date: " + date);
//                    request.setAttribute("errorMessage", "Cannot request a lesson for a past date. Please select a date starting from today.");
//                    request.setAttribute("studentId", studentId);
//                    request.setAttribute("lessonType", lessonType);
//                    request.setAttribute("date", date);
//                    request.setAttribute("time", time);
//                    request.getRequestDispatcher("/requestLesson.jsp").forward(request, response);
//                    return;
//                }
//
//                if (requestDate.equals(today) && requestDateTime.isBefore(now)) {
//                    System.out.println("LessonServlet: Validation failed - past time on today: " + time);
//                    request.setAttribute("errorMessage", "Cannot request a lesson for a past time today. Please select a future time.");
//                    request.setAttribute("studentId", studentId);
//                    request.setAttribute("lessonType", lessonType);
//                    request.setAttribute("date", date);
//                    request.setAttribute("time", time);
//                    request.getRequestDispatcher("/requestLesson.jsp").forward(request, response);
//                    return;
//                }
//
//                // Create and enqueue the lesson
//                System.out.println("LessonServlet: Creating and enqueuing lesson");
//                Lesson lesson = new Lesson(lessonId, studentId, null, date, time, status, lessonType);
//                queueManager.enqueueLesson(lesson);
//                updateFileWithLessons();
//                request.setAttribute("message", "Lesson request queued successfully!");
//                System.out.println("LessonServlet: Redirecting to lessonQueue.jsp");
//                request.getRequestDispatcher("/lessonQueue.jsp").forward(request, response);
//            } catch (DateTimeParseException e) {
//                System.err.println("LessonServlet: DateTimeParseException - " + e.getMessage());
//                request.setAttribute("errorMessage", "Invalid date or time format. Please use the correct format (e.g., YYYY-MM-DD for date, HH:MM for time).");
//                request.setAttribute("studentId", request.getParameter("studentId"));
//                request.setAttribute("lessonType", request.getParameter("lessonType"));
//                request.setAttribute("date", request.getParameter("date"));
//                request.setAttribute("time", request.getParameter("time"));
//                request.getRequestDispatcher("/requestLesson.jsp").forward(request, response);
//            } catch (Exception e) {
//                System.err.println("LessonServlet: Unexpected error - " + e.getMessage());
//                e.printStackTrace();
//                request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
//                request.setAttribute("studentId", request.getParameter("studentId"));
//                request.setAttribute("lessonType", request.getParameter("lessonType"));
//                request.setAttribute("date", request.getParameter("date"));
//                request.setAttribute("time", request.getParameter("time"));
//                request.getRequestDispatcher("/requestLesson.jsp").forward(request, response);
//            }
//        } else if ("schedule".equals(action)) {
//            String lessonId = request.getParameter("lessonId");
//            Lesson lessonToSchedule = findLessonById(lessonId);
//            if (lessonToSchedule != null && queueManager.getLessonQueue().contains(lessonToSchedule)) {
//                lessonToSchedule.setStatus("Scheduled");
//                queueManager.dequeueLesson();
//                updateFileWithLessons();
//                request.setAttribute("message", "Lesson scheduled: " + lessonId);
//            } else {
//                request.setAttribute("message", "Lesson not found in queue.");
//            }
//            request.getRequestDispatcher("/lessonQueue.jsp").forward(request, response);
//        } else if ("remove".equals(action)) {
//            String lessonId = request.getParameter("lessonId");
//            Lesson lessonToRemove = findLessonById(lessonId);
//            if (lessonToRemove != null) {
//                queueManager.getLessonQueue().remove(lessonToRemove);
//                updateFileWithLessons();
//                request.setAttribute("message", "Lesson removed: " + lessonId);
//            } else {
//                request.setAttribute("message", "Lesson not found.");
//            }
//            request.getRequestDispatcher("/lessonQueue.jsp").forward(request, response);
//        } else if ("update".equals(action)) {
//            try {
//                String lessonId = request.getParameter("lessonId");
//                String date = request.getParameter("date");
//                String time = request.getParameter("time");
//                String lessonType = request.getParameter("lessonType");
//
//                Lesson lessonToUpdate = findLessonById(lessonId);
//                if (lessonToUpdate != null) {
//                    LocalDate updateDate = LocalDate.parse(date);
//                    LocalTime updateTime = LocalTime.parse(time, DateTimeFormatter.ofPattern("HH:mm"));
//                    LocalDateTime updateDateTime = LocalDateTime.of(updateDate, updateTime);
//                    LocalDate today = LocalDate.now();
//                    LocalDateTime now = LocalDateTime.now();
//
//                    if (updateDate.isBefore(today)) {
//                        request.setAttribute("errorMessage", "Cannot update to a past date. Please select a date starting from today.");
//                        request.setAttribute("lessonId", lessonId);
//                        request.setAttribute("date", date);
//                        request.setAttribute("time", time);
//                        request.setAttribute("lessonType", lessonType);
//                        request.getRequestDispatcher("/lessonQueue.jsp").forward(request, response);
//                        return;
//                    }
//
//                    if (updateDate.equals(today) && updateDateTime.isBefore(now)) {
//                        request.setAttribute("errorMessage", "Cannot update to a past time today. Please select a future time.");
//                        request.setAttribute("lessonId", lessonId);
//                        request.setAttribute("date", date);
//                        request.setAttribute("time", time);
//                        request.setAttribute("lessonType", lessonType);
//                        request.getRequestDispatcher("/lessonQueue.jsp").forward(request, response);
//                        return;
//                    }
//
//                    lessonToUpdate.setDate(date);
//                    lessonToUpdate.setTime(time);
//                    lessonToUpdate.setLessonType(lessonType);
//                    updateFileWithLessons();
//                    request.setAttribute("message", "Lesson updated: " + lessonId);
//                } else {
//                    request.setAttribute("message", "Lesson not found.");
//                }
//                request.getRequestDispatcher("/lessonQueue.jsp").forward(request, response);
//            } catch (DateTimeParseException e) {
//                request.setAttribute("errorMessage", "Invalid date or time format. Please use the correct format.");
//                request.setAttribute("lessonId", request.getParameter("lessonId"));
//                request.setAttribute("date", request.getParameter("date"));
//                request.setAttribute("time", request.getParameter("time"));
//                request.setAttribute("lessonType", request.getParameter("lessonType"));
//                request.getRequestDispatcher("/lessonQueue.jsp").forward(request, response);
//            } catch (Exception e) {
//                request.setAttribute("errorMessage", "An error occurred while updating the lesson: " + e.getMessage());
//                request.setAttribute("lessonId", request.getParameter("lessonId"));
//                request.setAttribute("date", request.getParameter("date"));
//                request.setAttribute("time", request.getParameter("time"));
//                request.setAttribute("lessonType", request.getParameter("lessonType"));
//                request.getRequestDispatcher("/lessonQueue.jsp").forward(request, response);
//            }
//        }
//    }
//
//    private Lesson findLessonById(String lessonId) {
//        for (Lesson lesson : queueManager.getLessonQueue()) {
//            if (lesson.getLessonId().equals(lessonId)) {
//                return lesson;
//            }
//        }
//        return null;
//    }
//
//    private void updateFileWithLessons() throws IOException {
//        List<String> allLessons = new ArrayList<>();
//        List<String> fileLessons = FileHandler.readFromFile(LESSONS_FILE_PATH);
//        for (String lessonData : fileLessons) {
//            String[] parts = lessonData.split(",");
//            if (parts.length == 7 && !parts[5].equals("Pending")) {
//                allLessons.add(lessonData);
//            }
//        }
//        for (Lesson lesson : queueManager.getLessonQueue()) {
//            allLessons.add(lesson.toString());
//        }
//        File file = new File(LESSONS_FILE_PATH);
//        file.delete();
//        for (String lesson : allLessons) {
//            FileHandler.writeToFile(LESSONS_FILE_PATH, lesson);
//        }
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.getRequestDispatcher("/lessonQueue.jsp").forward(request, response);
//    }
//}


package com.safetylearners.drivingschoolregistrationandschedulingsystem.servlet;

import com.safetylearners.drivingschoolregistrationandschedulingsystem.model.Lesson;
import com.safetylearners.drivingschoolregistrationandschedulingsystem.model.QueueManager;
import com.safetylearners.drivingschoolregistrationandschedulingsystem.model.FileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.io.File;

@WebServlet("/lesson")
public class LessonServlet extends HttpServlet {
    private QueueManager queueManager;
    private static final String LESSONS_FILE_PATH = "/Users/sujana/IdeaProjects/Driving-School-Registration-and-Scheduling-System/data/lessons.txt";
    private static final int capacity = 10;

    @Override
    public void init() throws ServletException {
        queueManager = new QueueManager(capacity);
        System.out.println("LessonServlet: Initializing and loading lessons from file");
        File file = new File(LESSONS_FILE_PATH);
        try {
            if (!file.exists()) {
                file.getParentFile().mkdirs();
                file.createNewFile();
                System.out.println("LessonServlet: Created lessons.txt file at " + LESSONS_FILE_PATH);
            }
            java.util.List<String> lessons = FileHandler.readFromFile(LESSONS_FILE_PATH);
            System.out.println("LessonServlet: Loaded " + lessons.size() + " lessons from file");
            for (String lessonData : lessons) {
                String[] parts = lessonData.split(",");
                if (parts.length == 7) {
                    String lessonId = parts[0].trim();
                    String studentId = parts[1].trim();
                    String instructorId = parts[2].trim();
                    String date = parts[3].trim();
                    String time = parts[4].trim();
                    String status = parts[5].trim();
                    String lessonType = parts[6].trim();
                    Lesson lesson = new Lesson(lessonId, studentId, instructorId, date, time, status, lessonType);
                    queueManager.enqueue(lesson);
                }
            }
        } catch (IOException e) {
            System.err.println("LessonServlet: Failed to load lessons from file: " + e.getMessage());
        }
        getServletContext().setAttribute("queueManager", queueManager);
        System.out.println("LessonServlet: queueManager set in ServletContext");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("LessonServlet: Processing action: " + action);

        if ("request".equals(action)) {
            try {
                System.out.println("LessonServlet: Handling lesson request");
                String lessonId = java.util.UUID.randomUUID().toString().substring(0, 8);
                String studentId = request.getParameter("studentId");
                String lessonType = request.getParameter("lessonType");
                String date = request.getParameter("date");
                String time = request.getParameter("time");
                String status = "Pending";

                System.out.println("LessonServlet: Received parameters - studentId: " + studentId +
                        ", lessonType: " + lessonType +
                        ", date: " + date +
                        ", time: " + time);

                if (studentId == null || studentId.trim().isEmpty() ||
                        lessonType == null || lessonType.trim().isEmpty() ||
                        date == null || date.trim().isEmpty() ||
                        time == null || time.trim().isEmpty()) {
                    System.out.println("LessonServlet: Validation failed - missing required fields");
                    request.setAttribute("errorMessage", "All fields are required. Please fill out the form completely.");
                    request.setAttribute("studentId", studentId);
                    request.setAttribute("lessonType", lessonType);
                    request.setAttribute("date", date);
                    request.setAttribute("time", time);
                    request.getRequestDispatcher("/requestLesson.jsp").forward(request, response);
                    return;
                }

                System.out.println("LessonServlet: Validating date and time");
                LocalDate requestDate = LocalDate.parse(date);
                LocalDate today = LocalDate.now();
                LocalTime requestTime = LocalTime.parse(time, DateTimeFormatter.ofPattern("HH:mm"));
                LocalDateTime requestDateTime = LocalDateTime.of(requestDate, requestTime);
                LocalDateTime now = LocalDateTime.now();

                if (requestDate.isBefore(today)) {
                    System.out.println("LessonServlet: Validation failed - past date: " + date);
                    request.setAttribute("errorMessage", "Cannot request a lesson for a past date. Please select a date starting from today.");
                    request.setAttribute("studentId", studentId);
                    request.setAttribute("lessonType", lessonType);
                    request.setAttribute("date", date);
                    request.setAttribute("time", time);
                    request.getRequestDispatcher("/requestLesson.jsp").forward(request, response);
                    return;
                }

                if (requestDate.equals(today) && requestDateTime.isBefore(now)) {
                    System.out.println("LessonServlet: Validation failed - past time on today: " + time);
                    request.setAttribute("errorMessage", "Cannot request a lesson for a past time today. Please select a future time.");
                    request.setAttribute("studentId", studentId);
                    request.setAttribute("lessonType", lessonType);
                    request.setAttribute("date", date);
                    request.setAttribute("time", time);
                    request.getRequestDispatcher("/requestLesson.jsp").forward(request, response);
                    return;
                }

                System.out.println("LessonServlet: Creating and enqueuing lesson");
                Lesson lesson = new Lesson(lessonId, studentId, null, date, time, status, lessonType);
                queueManager.enqueue(lesson);
                updateFileWithLessons();
                request.setAttribute("message", "Lesson request queued successfully!");
                System.out.println("LessonServlet: Redirecting to lessonQueue.jsp");
                request.getRequestDispatcher("/lessonQueue.jsp").forward(request, response);
            } catch (DateTimeParseException e) {
                System.err.println("LessonServlet: DateTimeParseException - " + e.getMessage());
                request.setAttribute("errorMessage", "Invalid date or time format. Please use the correct format (e.g., YYYY-MM-DD for date, HH:MM for time).");
                request.setAttribute("studentId", request.getParameter("studentId"));
                request.setAttribute("lessonType", request.getParameter("lessonType"));
                request.setAttribute("date", request.getParameter("date"));
                request.setAttribute("time", request.getParameter("time"));
                request.getRequestDispatcher("/requestLesson.jsp").forward(request, response);
            } catch (Exception e) {
                System.err.println("LessonServlet: Unexpected error - " + e.getMessage());
                e.printStackTrace();
                request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
                request.setAttribute("studentId", request.getParameter("studentId"));
                request.setAttribute("lessonType", request.getParameter("lessonType"));
                request.setAttribute("date", request.getParameter("date"));
                request.setAttribute("time", request.getParameter("time"));
                request.getRequestDispatcher("/requestLesson.jsp").forward(request, response);
            }
        } else if ("schedule".equals(action)) {
            String lessonId = request.getParameter("lessonId");
            Lesson lessonToSchedule = findLessonById(lessonId);
            if (lessonToSchedule != null && !queueManager.isEmpty()) {
                lessonToSchedule.setStatus("Scheduled");
                queueManager.dequeue();
                updateFileWithLessons();
                request.setAttribute("message", "Lesson scheduled: " + lessonId);
            } else {
                request.setAttribute("message", "Lesson not found in queue.");
            }
            request.getRequestDispatcher("/lessonQueue.jsp").forward(request, response);
        } else if ("remove".equals(action)) {
            String lessonId = request.getParameter("lessonId");
            Lesson lessonToRemove = findLessonById(lessonId);
            if (lessonToRemove != null) {
                Lesson temp;
                QueueManager tempQueue = new QueueManager(queueManager.getSize());
                while (!queueManager.isEmpty()) {
                    temp = queueManager.dequeue();
                    if (!temp.getLessonId().equals(lessonId)) {
                        tempQueue.enqueue(temp);
                    }
                }
                while (!tempQueue.isEmpty()) {
                    queueManager.enqueue(tempQueue.dequeue());
                }
                updateFileWithLessons();
                request.setAttribute("message", "Lesson removed: " + lessonId);
            } else {
                request.setAttribute("message", "Lesson not found.");
            }
            request.getRequestDispatcher("/lessonQueue.jsp").forward(request, response);
        } else if ("update".equals(action)) {
            try {
                String lessonId = request.getParameter("lessonId");
                String date = request.getParameter("date");
                String time = request.getParameter("time");
                String lessonType = request.getParameter("lessonType");

                Lesson lessonToUpdate = findLessonById(lessonId);
                if (lessonToUpdate != null) {
                    LocalDate updateDate = LocalDate.parse(date);
                    LocalTime updateTime = LocalTime.parse(time, DateTimeFormatter.ofPattern("HH:mm"));
                    LocalDateTime updateDateTime = LocalDateTime.of(updateDate, updateTime);
                    LocalDate today = LocalDate.now();
                    LocalDateTime now = LocalDateTime.now();

                    if (updateDate.isBefore(today)) {
                        request.setAttribute("errorMessage", "Cannot update to a past date. Please select a date starting from today.");
                        request.setAttribute("lessonId", lessonId);
                        request.setAttribute("date", date);
                        request.setAttribute("time", time);
                        request.setAttribute("lessonType", lessonType);
                        request.getRequestDispatcher("/lessonQueue.jsp").forward(request, response);
                        return;
                    }

                    if (updateDate.equals(today) && updateDateTime.isBefore(now)) {
                        request.setAttribute("errorMessage", "Cannot update to a past time today. Please select a future time.");
                        request.setAttribute("lessonId", lessonId);
                        request.setAttribute("date", date);
                        request.setAttribute("time", time);
                        request.setAttribute("lessonType", lessonType);
                        request.getRequestDispatcher("/lessonQueue.jsp").forward(request, response);
                        return;
                    }

                    lessonToUpdate.setDate(date);
                    lessonToUpdate.setTime(time);
                    lessonToUpdate.setLessonType(lessonType);
                    updateFileWithLessons();
                    request.setAttribute("message", "Lesson updated: " + lessonId);
                } else {
                    request.setAttribute("message", "Lesson not found.");
                }
                request.getRequestDispatcher("/lessonQueue.jsp").forward(request, response);
            } catch (DateTimeParseException e) {
                request.setAttribute("errorMessage", "Invalid date or time format. Please use the correct format.");
                request.setAttribute("lessonId", request.getParameter("lessonId"));
                request.setAttribute("date", request.getParameter("date"));
                request.setAttribute("time", request.getParameter("time"));
                request.setAttribute("lessonType", request.getParameter("lessonType"));
                request.getRequestDispatcher("/lessonQueue.jsp").forward(request, response);
            } catch (Exception e) {
                request.setAttribute("errorMessage", "An error occurred while updating the lesson: " + e.getMessage());
                request.setAttribute("lessonId", request.getParameter("lessonId"));
                request.setAttribute("date", request.getParameter("date"));
                request.setAttribute("time", request.getParameter("time"));
                request.setAttribute("lessonType", request.getParameter("lessonType"));
                request.getRequestDispatcher("/lessonQueue.jsp").forward(request, response);
            }
        }
    }

    private Lesson findLessonById(String lessonId) {
        Lesson[] queue = queueManager.getLessonQueue();
        for (Lesson lesson : queue) {
            if (lesson != null && lesson.getLessonId().equals(lessonId)) {
                return lesson;
            }
        }
        return null;
    }

    private void updateFileWithLessons() throws IOException {
        java.util.List<String> allLessons = new java.util.ArrayList<>();
        java.util.List<String> fileLessons = FileHandler.readFromFile(LESSONS_FILE_PATH);
        for (String lessonData : fileLessons) {
            String[] parts = lessonData.split(",");
            if (parts.length == 7 && !parts[5].equals("Pending")) {
                allLessons.add(lessonData);
            }
        }
        Lesson[] queue = queueManager.getLessonQueue();
        for (Lesson lesson : queue) {
            if (lesson != null) {
                allLessons.add(lesson.toString());
            }
        }
        File file = new File(LESSONS_FILE_PATH);
        file.delete();
        for (String lesson : allLessons) {
            FileHandler.writeToFile(LESSONS_FILE_PATH, lesson);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/lessonQueue.jsp").forward(request, response);
    }
}