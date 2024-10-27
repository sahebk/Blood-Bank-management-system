<?php
echo "<table border='3'>
<tr>
    <th>Staff Name</th>
    <th>Staff Phone No</th>
    <th>Staff Email</th>
</tr>";

   

    // Connecting to the database
    $conn = new mysqli('localhost', 'root', '', 'blooddonation1');
    if ($conn->connect_error) {
        die("Connection Failed: " . $conn->connect_error);
    } else {
        
        $stmt = $conn->prepare("SELECT Staff_name, Staff_phone_no, Staff_Email
        FROM staff");
        
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["Staff_name"] . "</td>";
                echo "<td>" . $row["Staff_phone_no"] . "</td>";
                echo "<td>" . $row["Staff_Email"] . "</td>";
                echo "</tr>";
            }
        }
    }

echo "</table>";
?>
