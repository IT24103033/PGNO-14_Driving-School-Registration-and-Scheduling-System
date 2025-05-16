<!DOCTYPE html>
<html>
<head>
    <title>Register Vehicle</title>
    <link rel="stylesheet" href="css/registerVehicle.css">
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
<div class="overlay"></div>

<h2>Register New Vehicle</h2>

<div class="form-container">
    <form action="VehicleServlet" method="post">
        <label for="make">Make:</label>
        <input type="text" name="make" id="make" required>

        <label for="model">Model:</label>
        <input type="text" name="model" id="model" required>

        <label for="plate">Plate Number:</label>
        <input type="text" name="plate" id="plate" required>

        <input type="hidden" name="action" value="add">
        <input type="submit" value="Register">
    </form>

    <form action="VehicleServlet" method="get">
        <button type="submit" class="btn-secondary">Go to Vehicle List</button>
    </form>
</div>
</body>
</html>
