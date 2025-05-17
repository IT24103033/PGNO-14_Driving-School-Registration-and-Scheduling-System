package com.safetylearners.drivingschoolregistrationandschedulingsystem.model;

import java.util.LinkedList;
import java.util.Queue;

public class QueueManager {
    private Queue<Lesson> lessonQueue;

    public QueueManager() {
        this.lessonQueue = new LinkedList<>();
    }

    public void enqueueLesson(Lesson lesson) {
        lessonQueue.offer(lesson);
    }

    public Lesson dequeueLesson() {
        return lessonQueue.poll();
    }

    public boolean isEmpty() {
        return lessonQueue.isEmpty();
    }

    public int size() {
        return lessonQueue.size();
    }

    public Lesson peek() {
        return lessonQueue.peek();
    }

    public Queue<Lesson> getLessonQueue() {
        return lessonQueue;
    }

    // Method to parse a lesson from a string and add to queue if pending
    public void loadLessonFromString(String lessonData) {
        String[] parts = lessonData.split(",");
        if (parts.length == 7) { // Expecting 7 fields: lessonId, studentId, instructorId, date, time, status, lessonType
            Lesson lesson = new Lesson(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5], parts[6]);
            if (lesson.getStatus().equals("Pending")) {
                lessonQueue.offer(lesson);
            }
        }
    }
}