<?php
session_start();

if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header("Location: login.html");
    exit;
}

include 'db.php';

$title = $content = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $title = $conn->real_escape_string(trim($_POST["title"]));
    $content = $conn->real_escape_string(trim($_POST["content"]));
    $author = $_SESSION['username']; 
    if (empty($title) || empty($content)) {
        echo "Tiêu đề và nội dung không được để trống!";
    } else {
        $sql = "INSERT INTO posts (title, content, author) VALUES ('$title', '$content', '$author')";

        if ($conn->query($sql) === TRUE) {
            echo "Create post successfully.";
            header("Location: index.php"); // Chuyển hướng người dùng về trang chủ sau khi đăng bài thành công
            exit;
        } else {
            echo "Lỗi: " . $sql . "<br>" . $conn->error;
        }
    }
}

$conn->close();
?>
