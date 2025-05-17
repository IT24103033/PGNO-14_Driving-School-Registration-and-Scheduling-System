package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.FileHandler;
import model.Vehicle;

import java.io.IOException;
import java.util.List;
@WebServlet("/DrivingSchool_war")
public class VehicleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            List<Vehicle> vehicles = FileHandler.readVehicles();
            Integer idTemp =vehicles.stream().reduce((first, second) -> second).get().getId();
            String make = request.getParameter("make");
            String model = request.getParameter("model");
            String plate = request.getParameter("plate");
            Vehicle v = new Vehicle(idTemp+1, make, model, plate);
            FileHandler.saveVehicle(v);
        } else if ("update".equals(action)) {
            Integer id = Integer.valueOf(request.getParameter("id"));
            String make = request.getParameter("make");
            String model = request.getParameter("model");
            String plate = request.getParameter("plate");
            Vehicle updated = new Vehicle(id, make, model, plate);
            FileHandler.updateVehicle(updated);
        } else if ("delete".equals(action)) {
            Integer id = Integer.valueOf(request.getParameter("id"));
            FileHandler.deleteVehicle(id);
        }

        response.sendRedirect("DrivingSchool_war");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Vehicle> vehicles = FileHandler.readVehicles();
        request.setAttribute("vehicles", vehicles);
        RequestDispatcher dispatcher = request.getRequestDispatcher("vehicleList.jsp");
        dispatcher.forward(request, response);
    }
}

