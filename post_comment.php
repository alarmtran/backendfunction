<?php
include 'db.php';
session_start();

if (isset($_POST['post_id'], $_POST['content']) && is_numeric($_POST['post_id']) && isset($_SESSION['username'])) {
    $post_id = $_POST['post_id'];
    $author = $conn->real_escape_string(trim($_SESSION['username']));
    $content = $conn->real_escape_string(trim($_POST['content']));

    // Kiểm tra tải lên hình ảnh
    if (isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
        $imagePath = "uploads/" . basename($_FILES["image"]["name"]);
        move_uploaded_file($_FILES['image']['tmp_name'], $imagePath);
    }

    $sql = "INSERT INTO comments (post_id, author, content, image_path, created_at) VALUES (?, ?, ?, ?, NOW())";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("isss", $post_id, $author, $content, $imagePath);

    if ($stmt->execute()) {
        echo "Bình luận đã được gửi thành công.";
    } else {
        echo "Có lỗi xảy ra: " . $conn->error;
    }

    $stmt->close();
} else {
    echo "Dữ liệu gửi đến không hợp lệ hoặc bạn chưa đăng nhập.";
}

$conn->close();

if (isset($post_id)) {
    header("Location: post_detail.php?id=" . $post_id);
} else {
    header("Location: index.php");
}
exit();
?>
