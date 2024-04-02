<?php
include 'db.php'; // Sử dụng file kết nối cơ sở dữ liệu đã thiết lập

if (!file_exists('uploads')) {
    mkdir('uploads');
}

// Kiểm tra xem dữ liệu gửi đến từ form có hợp lệ không
if(isset($_POST['post_id'], $_POST['author'], $_POST['content']) && is_numeric($_POST['post_id'])) {
    $post_id = $_POST['post_id'];
    $author = $conn->real_escape_string(trim($_POST['author']));
    $content = $conn->real_escape_string(trim($_POST['content']));

    $image_name = ""; // Khởi tạo tên tập tin ảnh mặc định

    // Kiểm tra xem người dùng đã tải lên ảnh hay chưa
    if(isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
        // Lưu trữ tên tập tin ảnh
        $image_name = $_FILES['image']['name'];
        // Di chuyển tập tin ảnh vào thư mục lưu trữ của bạn
        $target_dir = "uploads/";
        $target_file = $target_dir . basename($image_name);
        move_uploaded_file($_FILES['image']['tmp_name'], $target_file);
    }

    // Tạo truy vấn để chèn bình luận mới vào cơ sở dữ liệu
    $sql = "INSERT INTO comments (post_id, author, content, image, created_at) VALUES ('$post_id', '$author', '$content', '$image_name', NOW())";

    // Thực hiện truy vấn
    if($conn->query($sql) === TRUE) {
        echo "Bình luận đã được gửi thành công.";
    } else {
        echo "Có lỗi xảy ra: " . $conn->error;
    }
} else {
    echo "Dữ liệu gửi đến không hợp lệ.";
}

// Đóng kết nối cơ sở dữ liệu
$conn->close();

// Chuyển hướng người dùng trở lại bài viết
header("Location: post_detail.php?id=" . $post_id);
exit();

?>