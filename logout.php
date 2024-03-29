<?php
// Khởi động session
session_start();

// Xóa tất cả session variables
session_unset();

// Hủy session
session_destroy();

// Chuyển hướng người dùng về trang đăng nhập hoặc trang chủ
header("Location: index.php ");
exit;
?>
