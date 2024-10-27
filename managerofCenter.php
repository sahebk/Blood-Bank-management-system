<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $center_name = $_POST["center_name"];

    // Connecting to the database
    $conn = new mysqli('localhost', 'root', '', 'blooddonation1');
    if ($conn->connect_error) {
        die("Connection Failed: " . $conn->connect_error);
    } else {
       
        $stmt = $conn->prepare("SELECT Staff_id, Center_location
                FROM blood_donation_center
                WHERE Center_name = ?;");
        $stmt->bind_param("s", $center_name);
        $stmt->execute();
        $result = $stmt->get_result();

     
        if ($result->num_rows > 0) {
           
            echo "<table border='3'>
                <tr>
                    <th>Manager Id</th>
                    <th>Center Location</th>
                </tr>";

          
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["Staff_id"] . "</td>";
                echo "<td>" . $row["Center_location"] . "</td>";
                echo "</tr>";
            }
            echo "</table>"; 
        } else {
            echo "No results found.";
        }
    }
}
?>
