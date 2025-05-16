package model;

import java.io.*;
import java.util.*;

public class FileHandler {
    private static final String VEHICLE_FILE = "/Users/jiruththisiva/Desktop/PGNO-14_Driving-School-Registration-and-Scheduling-System/data/vehicles.txt";

    public static List<Vehicle> readVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(VEHICLE_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                Vehicle vehicle = Vehicle.fromString(line);
                if (vehicle != null) vehicles.add(vehicle);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return vehicles;
    }

    public static void saveVehicle(Vehicle vehicle) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(VEHICLE_FILE, true))) {
            bw.write(vehicle.toString());
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void updateVehicle(Vehicle updatedVehicle) {
        List<Vehicle> vehicles = readVehicles();
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(VEHICLE_FILE))) {
            for (Vehicle v : vehicles) {
                if (v.getId().equals(updatedVehicle.getId())) {
                    bw.write(updatedVehicle.toString());
                } else {
                    bw.write(v.toString());
                }
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void deleteVehicle(Integer id) {
        List<Vehicle> vehicles = readVehicles();
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(VEHICLE_FILE))) {
            for (Vehicle v : vehicles) {
                if (!v.getId().equals(id)) {
                    bw.write(v.toString());
                    bw.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
