<?php




//connecting database


//connecting database
$conn = new mysqli('localhost', 'root', '', 'blooddonation1');
if ($conn->connect_error) {
    die("Connection Failed: " . $conn->connect_error);
} else {
    $sql = "SELECT * FROM recepient;";
    $result = mysqli_query($conn, $sql);
    if (mysqli_num_rows($result) > 0) {
        // Start the table
        echo "<table border='3'>";
        echo "<tr><th>Recipient Id</th><th>Recipient Name</th><th>Recipient Gender</th><th>Recipient Date of birth</th><th>Recipient BloodType</th><th>Recipient Phone No</th><th>Recipient Email</th><th>Recipient Address</th></tr>";
        // Loop through the result set
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . $row["Recepient_id"] . "</td>";
            echo "<td>" . $row["Recepient_name"] . "</td>";
            echo "<td>" . $row["Recip_Gender"] . "</td>";
            echo "<td>" . $row["Recip_Date_of_Birth"] . "</td>";
            echo "<td>" . $row["Recip_Blood_type"] . "</td>";
            echo "<td>" . $row["Recip_PhoneNo"] . "</td>";
            echo "<td>" . $row["Recip_Email"] . "</td>";
            echo "<td>" . $row["Recip_Address"] . "</td>";
            echo "</tr>";
        }
        // Close the table
        echo "</table>";
    }
}
?>

