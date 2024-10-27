<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $specific_doctor_name = $_POST["doctor_name"];

    // Connecting to the database
    $conn = new mysqli('localhost', 'root', '', 'blooddonation1');
    if ($conn->connect_error) {
        die("Connection Failed: " . $conn->connect_error);
    } else {
       
        $stmt = $conn->prepare("SELECT * FROM blood_transfusion WHERE Doctor_name = ?;");
        if (!$stmt) {
            die("Prepare failed: (" . $conn->errno . ") " . $conn->error);
        }

        
        $stmt->bind_param("s", $specific_doctor_name);

        
        if (!$stmt->execute()) {
            die("Execute failed: (" . $stmt->errno . ") " . $stmt->error);
        }

        
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            
            echo "<table border='3'>";
            echo "<tr><th>Transfusion_id</th><th>Bag_id</th><th>Recipient_id</th><th>Transfusion_Date</th><th>Doctor_Name</th></tr>";
            
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["Transfusion_id"] . "</td>";
                echo "<td>" . $row["Bag_id"] . "</td>";
                echo "<td>" . $row["Recipient_id"] . "</td>";
                echo "<td>" . $row["Transfusion_date"] . "</td>";
                echo "<td>" . $row["Doctor_name"] . "</td>";
                echo "</tr>";
            }
            
            echo "</table>";
        }

        // Close the statement
        $stmt->close();
    }
}
?>
