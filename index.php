<?php
session_start();
include 'db.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Trang Chủ Forum</title>
    <link rel="stylesheet" href="style.css"> <!-- Đảm bảo bạn đã tạo style.css -->
</head>
<body>
    <header>
        <h1>Demo Backend Function Forum!</h1>
        <?php if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true): ?>
            <p>Welcome, <?php echo htmlspecialchars($_SESSION['username']); ?>! [<a href="logout.php">Logout</a>] [<a href="create_post.html">Create Post</a>]</p>
        <?php else: ?>
            <p>[<a href="login.html">Login</a>] [<a href="register.html">Register</a>][<a href="quenmk.html">Forgot Password ?</a>]</p>
        <?php endif; ?>
    </header>
    <main>
        <h2>Last Post</h2>
        <?php
        $sql = "SELECT id, title, content, author, created_at FROM posts ORDER BY created_at DESC LIMIT 10";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<div class='post'>";
                // Cập nhật dòng dưới đây
                echo "<h3><a href='post_detail.php?id=" . $row["id"] . "'>" . htmlspecialchars($row["title"]) . "</a></h3>";
                echo "<p>" . nl2br(htmlspecialchars(substr($row["content"], 0, 200))) . "...</p>"; // Giới hạn nội dung hiển thị
                echo "<p>Posted by : " . htmlspecialchars($row["author"]) . " vào " . $row["created_at"] . "</p>";
                echo "</div>";
            }
        } else {
            echo "<p>Nothing .</p>";
        }
        $conn->close();
        ?>
    </main>
</body>
</html>
