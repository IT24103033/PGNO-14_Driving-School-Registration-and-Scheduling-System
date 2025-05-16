package model;

public class Vehicle {
    private Integer id;
    private String make;
    private String model;
    private String plateNumber;

    public Vehicle(Integer id, String make, String model, String plateNumber) {
        this.id = id;
        this.make = make;
        this.model = model;
        this.plateNumber = plateNumber;
    }

    // Getters and setters
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getMake() { return make; }
    public void setMake(String make) { this.make = make; }

    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }

    public String getPlateNumber() { return plateNumber; }
    public void setPlateNumber(String plateNumber) { this.plateNumber = plateNumber; }

    @Override
    public String toString() {
        return id + "," + make + "," + model + "," + plateNumber;
    }

    public static Vehicle fromString(String line) {
        String[] parts = line.split(",");
        if (parts.length == 4) {
            try {
                Integer id = Integer.parseInt(parts[0]);
                return new Vehicle(id, parts[1], parts[2], parts[3]);
            } catch (NumberFormatException e) {
                System.out.println("Invalid ID format: " + parts[0]);
            }
        }
        return null;
    }
}

