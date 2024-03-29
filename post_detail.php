<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Bài Viết</title>
    <link rel="stylesheet" href="style.css"> <!-- Liên kết tới style.css -->
</head>
<body>
    <?php
    include 'db.php'; // Sử dụng kết nối cơ sở dữ liệu đã thiết lập

    if(isset($_GET['id']) && is_numeric($_GET['id'])) {
        $post_id = $_GET['id'];

        // Truy vấn cơ sở dữ liệu để lấy thông tin bài viết
        $sql = "SELECT title, content, author, created_at FROM posts WHERE id = $post_id";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            echo "<div class='post-detail'>";
            echo "<h1>" . htmlspecialchars($row["title"]) . "</h1>";
            echo "<p>" . nl2br(htmlspecialchars($row["content"])) . "</p>";
            echo "<p class='post-meta'>Đăng bởi: " . htmlspecialchars($row["author"]) . " vào " . $row["created_at"] . "</p>";
            echo "</div>";
        } else {
            echo "<p>Bài viết không tồn tại.</p>";
        }
    } else {
        echo "<p>ID bài viết không hợp lệ.</p>";
    }
    $conn->close();
    ?>
</body>
</html>
    