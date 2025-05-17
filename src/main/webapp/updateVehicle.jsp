<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Vehicle</title>
    <link rel="stylesheet" href="css/updateVehicle.css">
</head>
<body>

<div class="overlay"></div>

<nav>
    <h1>Vehicle Management</h1>
    <div>
        <a href="registerVehicle.jsp">Register</a>
        <a href="VehicleServlet">Vehicle List</a>
        <a href="about.jsp">About</a>
    </div>
</nav>

<h2>Update Vehicle</h2>

<div class="form-container">
    <form action="VehicleServlet" method="post">
        <input type="hidden" name="action" value="update">
        <label for="id">ID:</label>
        <input type="text" name="id" id="id" value="<%= request.getParameter("id") %>" readonly>

        <label for="make">Make:</label>
        <input type="text" name="make" id="make" value="<%= request.getParameter("make") %>">

        <label for="model">Model:</label>
        <input type="text" name="model" id="model" value="<%= request.getParameter("model") %>">

        <label for="plate">Plate Number:</label>
        <input type="text" name="plate" id="plate" value="<%= request.getParameter("plate") %>">

        <input type="submit" value="Update Vehicle">
    </form>

    <form action="VehicleServlet" method="get">
        <button type="submit" class="btn-secondary">Go to Vehicle List</button>
    </form>
</div>

</body>
</html>
