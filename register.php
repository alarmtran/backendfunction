<?php
include 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $conn->real_escape_string($_POST['username']);
    $password = $_POST['password'];
    $check = "SELECT * FROM users WHERE username = '$username'";
    $result = $conn->query($check);
    $sql = "INSERT INTO users (username, password) VALUES ('$username', '$password')";
    if($result->num_rows > 0){
        echo "Username is already used in web <a href = 'register.html'> Register Again </a>";
    }else if ($conn->query($sql) === TRUE) {
        echo "Successful. <a href='login.html'>Login</a>";
    } else {
        echo "Lỗi: " . $sql . "<br>" . $conn->error;
    }

    $conn->close();
}
?>
