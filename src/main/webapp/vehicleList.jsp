<%@ page import="model.Vehicle" %>
<%@ page import="java.util.*" %>
<%
    List<Vehicle> vehicles = (List<Vehicle>) request.getAttribute("vehicles");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle List</title>
    <link rel="stylesheet" href="css/vehicleList.css">
</head>
<body>

<!-- Navigation Bar -->
<nav>
    <h1>Vehicle Management</h1>
    <div>
        <a href="registerVehicle.jsp">Register</a>
        <a href="VehicleServlet">Vehicle List</a>
        <a href="about.jsp">About</a>
    </div>
</nav>

<header>
    <h1>Vehicle List</h1>
</header>

<div class="container">
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Make</th>
            <th>Model</th>
            <th>Plate</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% if (vehicles != null && !vehicles.isEmpty()) {
            for (Vehicle v : vehicles) { %>
        <tr>
            <td><%= v.getId() %></td>
            <td><%= v.getMake() %></td>
            <td><%= v.getModel() %></td>
            <td><%= v.getPlateNumber() %></td>
            <td>
                <form action="VehicleServlet" method="post">
                    <input type="hidden" name="id" value="<%= v.getId() %>">
                    <input type="hidden" name="action" value="delete">
                    <input type="submit" value="Delete">
                </form>
                <form action="updateVehicle.jsp" method="get">
                    <input type="hidden" name="id" value="<%= v.getId() %>">
                    <input type="hidden" name="make" value="<%= v.getMake() %>">
                    <input type="hidden" name="model" value="<%= v.getModel() %>">
                    <input type="hidden" name="plate" value="<%= v.getPlateNumber() %>">
                    <input type="submit" value="Update">
                </form>
            </td>
        </tr>
        <%  }
        } else { %>
        <tr><td colspan="5" style="text-align:center;">No vehicle data found.</td></tr>
        <% } %>
        </tbody>
    </table>
</div>

<div class="register-button-container">
    <a href="registerVehicle.jsp" class="register-button">Register New Vehicle</a>
</div>

</body>
</html>
