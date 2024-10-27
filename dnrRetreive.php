<?php


$conn = new mysqli('localhost', 'root', '', 'blooddonation1');
if ($conn->connect_error) {
    die("Connection Failed: " . $conn->connect_error);
} else {
    $sql = "SELECT * FROM donor;";
    $result = mysqli_query($conn, $sql);
    if (mysqli_num_rows($result) > 0) {
        
        echo "<table border='3' bgcolor='lightblue'>";
        echo "<tr><th>Donor Id</th><th>Donor Name</th><th>Donor Gender</th><th>Donor Date of birth</th><th>Donor BloodType</th><th>Donor Phone No</th><th>Donor Email</th><th>Donor Address</th></tr>";
       
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . $row["Donor_id"] . "</td>";
            echo "<td>" . $row["Donor_Name"] . "</td>";
            echo "<td>" . $row["Donor_Gender"] . "</td>";
            echo "<td>" . $row["Donor_Date_of_Birth"] . "</td>";
            echo "<td>" . $row["Donor_Blood_type"] . "</td>";
            echo "<td>" . $row["Donor_Phone_No"] . "</td>";
            echo "<td>" . $row["Donor_Email"] . "</td>";
            echo "<td>" . $row["Donor_Address"] . "</td>";
            echo "</tr>";
        }
       
        echo "</table>";
    }
}
?>
