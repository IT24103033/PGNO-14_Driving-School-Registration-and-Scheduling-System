package model;
import java.io.*;
import java.util.*;

public class InstructorManager {
    private static final String FILE_PATH = "instructors.txt";

    public List<Instructor> getAllInstructors() {
        List<Instructor> instructors = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                instructors.add(Instructor.fromFileString(line));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return instructors;
    }

    public void saveAllInstructors(List<Instructor> instructors) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Instructor i : instructors) {
                bw.write(i.toFileString());
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void addInstructor(Instructor instructor) {
        List<Instructor> instructors = getAllInstructors();
        instructors.add(instructor);
        saveAllInstructors(instructors);
    }

    public void updateInstructor(String id, Instructor updated) {
        List<Instructor> instructors = getAllInstructors();
        for (int i = 0; i < instructors.size(); i++) {
            if (instructors.get(i).getId().equals(id)) {
                instructors.set(i, updated);
                break;
            }
        }
        saveAllInstructors(instructors);
    }

    public void deleteInstructor(String id) {
        List<Instructor> instructors = getAllInstructors();
        instructors.removeIf(i -> i.getId().equals(id));
        saveAllInstructors(instructors);
    }

    public List<Instructor> getSortedByExperience() {
        List<Instructor> instructors = getAllInstructors();
        for (int i = 0; i < instructors.size() - 1; i++) {
            for (int j = 0; j < instructors.size() - i - 1; j++) {
                if (instructors.get(j).getExperience() < instructors.get(j + 1).getExperience()) {
                    Instructor temp = instructors.get(j);
                    instructors.set(j, instructors.get(j + 1));
                    instructors.set(j + 1, temp);
                }
            }
        }
        return instructors;
    }
}
