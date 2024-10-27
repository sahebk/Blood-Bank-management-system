<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $email = $_POST["email"];
    $password = $_POST["password"];
    $login = $_POST["login"];

    // Connecting to database
    $conn = new mysqli('localhost', 'root', '', 'blooddonation1');
    if ($conn->connect_error) {
        die("Connection Failed: " . $conn->connect_error);
    }

    // Prepared statement to prevent SQL injection
    $stmt = $conn->prepare("INSERT INTO registration (Username,Email,Password) VALUES (?, ?,?)");
    $stmt->bind_param("sss", $username,$email, $password);

    if ($stmt->execute()) {
        echo "<script>alert('Registered successfully');</script>";
        // Redirect using JavaScript
        echo "<script>window.location.href = 'home.html';</script>";
        // OR Redirect using PHP header (comment out JavaScript redirect if using this)
        // header("Location: about.html");
        exit; // Ensure script stops execution after redirection
    } else {
        echo "Error: " . $conn->error;
    }

    $stmt->close();
    $conn->close();
}
?>