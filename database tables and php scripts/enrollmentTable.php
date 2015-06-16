<?php
$servername = "localhost";
$username = "root";
$password = "password";
$dbname = "SwipeSystem";
print "first";
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "INSERT INTO enrollment(select distinct crn, studentId from temporary)";

if ($conn->query($sql) == TRUE) {
    echo "records created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>