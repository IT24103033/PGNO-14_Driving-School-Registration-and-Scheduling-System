package model;
public class Instructor {
    private String id;
    private String name;
    private int experience;
    private String phone;

    public Instructor(String id, String name, int experience, String phone) {
        this.id = id;
        this.name = name;
        this.experience = experience;
        this.phone = phone;
    }

    public String getId() { return id; }
    public String getName() { return name; }
    public int getExperience() { return experience; }
    public String getPhone() { return phone; }

    public void setName(String name) { this.name = name; }
    public void setExperience(int experience) { this.experience = experience; }
    public void setPhone(String phone) { this.phone = phone; }

    public String toFileString() {
        return id + "," + name + "," + experience + "," + phone;
    }

    public static Instructor fromFileString(String line) {
        String[] parts = line.split(",");
        return new Instructor(parts[0], parts[1], Integer.parseInt(parts[2]), parts[3]);
    }
}
