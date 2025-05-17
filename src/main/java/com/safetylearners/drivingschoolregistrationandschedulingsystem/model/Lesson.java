package com.safetylearners.drivingschoolregistrationandschedulingsystem.model;

public class Lesson {
    private String lessonId;
    private String studentId;
    private String instructorId;
    private String date;
    private String time;
    private String status;
    private String lessonType;

    public Lesson(String lessonId, String studentId, String instructorId, String date, String time, String status, String lessonType) {
        this.lessonId = lessonId;
        this.studentId = studentId;
        this.instructorId = instructorId;
        this.date = date;
        this.time = time;
        this.status = status;
        this.lessonType = lessonType;
    }

    // Getters
    public String getLessonId() { return lessonId; }
    public String getStudentId() { return studentId; }
    public String getInstructorId() { return instructorId; }
    public String getDate() { return date; }
    public String getTime() { return time; }
    public String getStatus() { return status; }
    public String getLessonType() { return lessonType; }

    // Setters
    public void setStatus(String status) { this.status = status; }
    public void setDate(String date) { this.date = date; }
    public void setTime(String time) { this.time = time; }
    public void setLessonType(String lessonType) { this.lessonType = lessonType; }

    @Override
    public String toString() {
        return lessonId + "," + studentId + "," + instructorId + "," + date + "," + time + "," + status + "," + lessonType;
    }
}