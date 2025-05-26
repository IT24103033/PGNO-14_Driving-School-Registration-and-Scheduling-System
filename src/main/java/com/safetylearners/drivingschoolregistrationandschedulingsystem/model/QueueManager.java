package com.safetylearners.drivingschoolregistrationandschedulingsystem.model;
//
//import java.util.LinkedList;
//import java.util.Queue;
//
//public class QueueManager {
//    private Queue<Lesson> lessonQueue;
//
//    public QueueManager() {
//        this.lessonQueue = new LinkedList<>();
//    }
//
//    public void enqueueLesson(Lesson lesson) {
//        lessonQueue.offer(lesson);
//    }
//
//    public Lesson dequeueLesson() {
//        return lessonQueue.poll();
//    }
//
//    public boolean isEmpty() {
//        return lessonQueue.isEmpty();
//    }
//
//    public int size() {
//        return lessonQueue.size();
//    }
//
//    public Lesson peek() {
//        return lessonQueue.peek();
//    }
//
//    public Queue<Lesson> getLessonQueue() {
//        return lessonQueue;
//    }
//
//    // Method to parse a lesson from a string and add to queue if pending
//    public void loadLessonFromString(String lessonData) {
//        String[] parts = lessonData.split(",");
//        if (parts.length == 7) { // Expecting 7 fields: lessonId, studentId, instructorId, date, time, status, lessonType
//            Lesson lesson = new Lesson(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5], parts[6]);
//            if (lesson.getStatus().equals("Pending")) {
//                lessonQueue.offer(lesson);
//            }
//        }
//    }
//}

//code from the strach

public class QueueManager {
    private Lesson[] queueArray;
    private int front;
    private int rear;
    private int size;
    private int capacity;

    public QueueManager(int capacity) {
        this.queueArray = new Lesson[capacity];
        this.front = 0;
        this.rear = -1;
        this.size = 0;
        this.capacity = capacity;
    }

    public void enqueue(Lesson lesson) {
        if (size == capacity) {
            resize();
        }
        rear = (rear + 1) % capacity;
        queueArray[rear] = lesson;
        size++;

    }

    public Lesson dequeue() {
        if (isEmpty()){
            return null;
        }
        Lesson lesson = queueArray[front];
        front = (front + 1) % capacity;
        size--;
        return lesson;

    }

    public Lesson peek() {
        if (isEmpty()){
            return null;
        }else{
            return queueArray[front];
        }
    }

    public boolean isEmpty(){
        return size == 0;
    }

    private void resize() {
        int newCapacity = capacity * 2;
        Lesson[] newArray = new Lesson[newCapacity];
        for (int i = 0; i < size; i++) {
            newArray[i] = queueArray[(front + i) % capacity];
        }
        front = 0;
        rear = size - 1;
        capacity = newCapacity;
        queueArray = newArray;
    }

    public Lesson[] getLessonQueue() {
        Lesson[] result = new Lesson[size];
        for (int i = 0; i < size; i++) {
            result[i] = queueArray[(front + i) % capacity];
        }
        return result;
    }

    public int getSize() {
        return size;
    }

}