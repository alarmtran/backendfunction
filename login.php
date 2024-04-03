<?php
session_start();
include 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $conn->real_escape_string($_POST['username']);
    $password = $_POST['password'];

    $sql = "SELECT id, password FROM users WHERE username = '$username'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if ($password==$row['password']) {
            $_SESSION['loggedin'] = TRUE;
            $_SESSION['username'] = $username;
            $_SESSION['user_id'] = $row['id'];
            echo "Successful. <a href='index.php'>Go To Page</a>";
        } else {
            echo "Incorrect password.";
        }
    } else {
        echo "Can't find this user.";
    }

    $conn->close();
}
?>
