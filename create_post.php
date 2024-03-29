<?php
session_start();

// Kiểm tra xem người dùng đã đăng nhập chưa
if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header("Location: login.html");
    exit;
}

include 'db.php'; // Đảm bảo bạn đã tạo kết nối cơ sở dữ liệu trong db.php

$title = $content = "";

// Xử lý dữ liệu gửi lên từ form
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $title = $conn->real_escape_string(trim($_POST["title"]));
    $content = $conn->real_escape_string(trim($_POST["content"]));
    $author = $_SESSION['username']; // Giả sử bạn lưu tên người dùng trong $_SESSION khi đăng nhập

    // Kiểm tra dữ liệu nhập vào
    if (empty($title) || empty($content)) {
        echo "Tiêu đề và nội dung không được để trống!";
    } else {
        // Câu lệnh SQL để thêm bài viết mới vào cơ sở dữ liệu
        $sql = "INSERT INTO posts (title, content, author) VALUES ('$title', '$content', '$author')";

        // Thực thi câu lệnh
        if ($conn->query($sql) === TRUE) {
            echo "Bài viết mới đã được thêm thành công.";
            header("Location: index.php"); // Chuyển hướng người dùng về trang chủ sau khi đăng bài thành công
            exit;
        } else {
            echo "Lỗi: " . $sql . "<br>" . $conn->error;
        }
    }
}

$conn->close();
?>
