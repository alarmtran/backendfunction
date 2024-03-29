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
            echo "Đăng nhập thành công. <a href='index.php'>Trở về trang chủ</a>";
        } else {
            echo "Mật khẩu không đúng.";
        }
    } else {
        echo "Không tìm thấy tên người dùng.";
    }

    $conn->close();
}
?>
