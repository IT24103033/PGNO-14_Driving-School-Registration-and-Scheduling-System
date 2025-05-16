//package com.drivingschool.model;
//
//
//public class Student {
//    private String id;
//    private String fullName;
//    private String email;
//    private String address;
//    private String phoneNumber;
//    private int age;
//    private String username;
//    private String password;
//
//    public Student(String id, String fullName, String email, String address, String phoneNumber, int age, String username, String password) {
//        this.id = id;
//        this.fullName = fullName;
//        this.email = email;
//        this.address = address;
//        this.phoneNumber = phoneNumber;
//        this.age = age;
//        this.username = username;
//        this.password = password;
//    }
//
//    // Getters and Setters
//    public String getId() { return id; }
//    public void setId(String id) { this.id = id; }
//    public String getFullName() { return fullName; }
//    public void setFullName(String fullName) { this.fullName = fullName; }
//    public String getEmail() { return email; }
//    public void setEmail(String email) { this.email = email; }
//    public String getAddress() { return address; }
//    public void setAddress(String address) { this.address = address; }
//    public String getPhoneNumber() { return phoneNumber; }
//    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }
//    public int getAge() { return age; }
//    public void setAge(int age) { this.age = age; }
//    public String getUsername() { return username; }
//    public void setUsername(String username) { this.username = username; }
//    public String getPassword() { return password; }
//    public void setPassword(String password) { this.password = password; }
//
//    @Override
//    public String toString() {
//        return id + "," + fullName + "," + email + "," + address + "," + phoneNumber + "," + age + "," + username + "," + password;
//    }
//}

package com.drivingschool.model;

public class Student {
    private String id;
    private String fullName;
    private String email;
    private String address;
    private String phoneNumber;
    private int age;
    private String username;
    private String password;

    public Student(String id, String fullName, String email, String address, String phoneNumber, int age, String username, String password) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.age = age;
        this.username = username;
        this.password = password;
    }

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }
    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    // toFileString method for saving to file
    public String toFileString() {
        return id + "," + fullName + "," + email + "," + address + "," + phoneNumber + "," + age + "," + username + "," + password;
    }

    @Override
    public String toString() {
        return toFileString();
    }
}
