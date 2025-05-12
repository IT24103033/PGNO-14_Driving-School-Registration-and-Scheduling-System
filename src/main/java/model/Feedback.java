package model;

public class Feedback {
    private String name;
    private String email;
    private String instructor;
    private int rating;
    private String comments;

    public Feedback(String name, String email, String instructor, int rating, String comments) {
        this.name = name;
        this.email = email;
        this.instructor = instructor;
        this.rating = rating;
        this.comments = comments;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getInstructor() {
        return instructor;
    }

    public int getRating() {
        return rating;
    }

    public String getComments() {
        return comments;
    }

    // Save stars instead of numbers
    public String toFileString() {
        StringBuilder stars = new StringBuilder();
        for (int i = 0; i < rating; i++) stars.append("★");
        for (int i = rating; i < 5; i++) stars.append("☆");
        return name + ";" + email + ";" + instructor + ";" + stars + ";" + comments;
    }

    // Parse stars back into numeric rating
    public static Feedback fromFileString(String line) {
        String[] parts = line.split(";");
        if (parts.length == 5) {
            int rating = (int) parts[3].chars().filter(c -> c == '★').count();
            return new Feedback(parts[0], parts[1], parts[2], rating, parts[4]);
        }
        return null;
    }
}
