<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $center_name = $_POST["center_name"];
    $bloodtype = $_POST["bloodtype"];

    
    $conn = new mysqli('localhost', 'root', '', 'blooddonation1');
    if ($conn->connect_error) {
        die("Connection Failed: " . $conn->connect_error);
    } else {
        
        $stmt = $conn->prepare("SELECT * FROM blood_availability WHERE Center_name=? AND Donor_Blood_type=?;");
        $stmt->bind_param("ss", $center_name, $bloodtype);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
           
            echo "<table border='3'>";
            echo "<tr><th>Center Name</th><th>Center Location</th><th>Blood Bag Count</th></tr>";

            
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["Center_name"] . "</td>";
                echo "<td>" . $row["Center_location"] . "</td>";
                echo "<td>" . $row["Blood_Bag_Count"] . "</td>";
                echo "</tr>";
            }
            echo "</table>";
        } else {
            echo "No results found.";
        }
    }
}
?>
