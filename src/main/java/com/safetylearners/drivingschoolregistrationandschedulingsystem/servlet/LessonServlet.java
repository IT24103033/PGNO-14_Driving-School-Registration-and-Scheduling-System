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
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.io.File;

@WebServlet("/lesson")
public class LessonServlet extends HttpServlet {
    private QueueManager queueManager;
    private static final String LESSONS_FILE_PATH = "/Users/sujana/IdeaProjects/Driving-School-Registration-and-Scheduling-System/data/lessons.txt";

    @Override
    public void init() throws ServletException {
        queueManager = new QueueManager();
        System.out.println("LessonServlet: Initializing and loading lessons from file");
        // Ensure the file exists
        File file = new File(LESSONS_FILE_PATH);
        try {
            if (!file.exists()) {
                file.getParentFile().mkdirs();
                file.createNewFile();
                System.out.println("LessonServlet: Created lessons.txt file at " + LESSONS_FILE_PATH);
            }
            List<String> lessons = FileHandler.readFromFile(LESSONS_FILE_PATH);
            System.out.println("LessonServlet: Loaded " + lessons.size() + " lessons from file");
            for (String lessonData : lessons) {
                queueManager.loadLessonFromString(lessonData);
            }
        } catch (IOException e) {
            System.err.println("LessonServlet: Failed to load lessons from file: " + e.getMessage());
            // Log the error but don't throw, so initialization can continue
        }
        getServletContext().setAttribute("queueManager", queueManager);
        System.out.println("LessonServlet: queueManager set in ServletContext");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("request".equals(action)) {
            String lessonId = UUID.randomUUID().toString().substring(0, 8);
            String studentId = request.getParameter("studentId");
            String lessonType = request.getParameter("lessonType");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String status = "Pending";

            Lesson lesson = new Lesson(lessonId, studentId, null, date, time, status, lessonType);
            queueManager.enqueueLesson(lesson);
            updateFileWithLessons();
            request.setAttribute("message", "Lesson request queued successfully!");
            request.getRequestDispatcher("lessonQueue.jsp").forward(request, response);
        } else if ("schedule".equals(action)) {
            String lessonId = request.getParameter("lessonId");
            Lesson lessonToSchedule = findLessonById(lessonId);
            if (lessonToSchedule != null && queueManager.getLessonQueue().contains(lessonToSchedule)) {
                lessonToSchedule.setStatus("Scheduled");
                queueManager.dequeueLesson();
                updateFileWithLessons();
                request.setAttribute("message", "Lesson scheduled: " + lessonId);
            } else {
                request.setAttribute("message", "Lesson not found in queue.");
            }
            request.getRequestDispatcher("lessonQueue.jsp").forward(request, response);
        } else if ("remove".equals(action)) {
            String lessonId = request.getParameter("lessonId");
            Lesson lessonToRemove = findLessonById(lessonId);
            if (lessonToRemove != null) {
                queueManager.getLessonQueue().remove(lessonToRemove);
                updateFileWithLessons();
                request.setAttribute("message", "Lesson removed: " + lessonId);
            } else {
                request.setAttribute("message", "Lesson not found.");
            }
            request.getRequestDispatcher("lessonQueue.jsp").forward(request, response);
        } else if ("update".equals(action)) {
            String lessonId = request.getParameter("lessonId");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String lessonType = request.getParameter("lessonType");

            Lesson lessonToUpdate = findLessonById(lessonId);
            if (lessonToUpdate != null) {
                lessonToUpdate.setDate(date);
                lessonToUpdate.setTime(time);
                lessonToUpdate.setLessonType(lessonType);
                updateFileWithLessons();
                request.setAttribute("message", "Lesson updated: " + lessonId);
            } else {
                request.setAttribute("message", "Lesson not found.");
            }
            request.getRequestDispatcher("lessonQueue.jsp").forward(request, response);
        }
    }

    private Lesson findLessonById(String lessonId) {
        for (Lesson lesson : queueManager.getLessonQueue()) {
            if (lesson.getLessonId().equals(lessonId)) {
                return lesson;
            }
        }
        return null;
    }

    private void updateFileWithLessons() throws IOException {
        List<String> allLessons = new ArrayList<>();
        List<String> fileLessons = FileHandler.readFromFile(LESSONS_FILE_PATH);
        for (String lessonData : fileLessons) {
            String[] parts = lessonData.split(",");
            if (parts.length == 7 && !parts[5].equals("Pending")) {
                allLessons.add(lessonData);
            }
        }
        for (Lesson lesson : queueManager.getLessonQueue()) {
            allLessons.add(lesson.toString());
        }
        File file = new File(LESSONS_FILE_PATH);
        file.delete();
        for (String lesson : allLessons) {
            FileHandler.writeToFile(LESSONS_FILE_PATH, lesson);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("lessonQueue.jsp").forward(request, response);
    }
}