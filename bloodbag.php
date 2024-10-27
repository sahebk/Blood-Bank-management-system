<?php

$conn = new mysqli('localhost', 'root', '', 'blooddonation1');
if ($conn->connect_error) {
    die("Connection Failed: " . $conn->connect_error);
} else {
    
    $sql = "SELECT * FROM bloodbag;";
    $result = mysqli_query($conn, $sql);
    if (mysqli_num_rows($result) > 0) {
        
        echo "<center><table border='3' bgcolor='lightgreen'>";
        echo "<tr>
                <th>Bag Id</th>
                <th>Donor Id</th>
                <th>Donor BloodType</th>
                <th>Donation Date</th>
                <th>Expiry Date</th>
                <th>Location</th>
              </tr>";
        
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . $row["Bag_id"] . "</td>";
            echo "<td>" . $row["Donor_id"] . "</td>";
            echo "<td>" . $row["Donor_Blood_type"] . "</td>";
            echo "<td>" . $row["Donation_date"] . "</td>";
            echo "<td>" . $row["Expiray_Date"] . "</td>";
            echo "<td>" . $row["Location"] . "</td>";
            echo "</tr>";
        }
       
        echo "</table></center>";
    }
}
?>
