<?php
include 'db.php';
session_start();

if(isset($_POST['comment_id'], $_POST['content'], $_POST['post_id']) && is_numeric($_POST['post_id']) && is_numeric($_POST['comment_id']) && isset($_SESSION['username'])) {
    $comment_id = $_POST['comment_id'];
    $post_id = $_POST['post_id'];
    $author = $conn->real_escape_string(trim($_SESSION['username']));
    $content = $conn->real_escape_string(trim($_POST['content']));
    $parent_id = isset($_POST['parent_id']) && $_POST['parent_id'] !== '' ? $_POST['parent_id'] : NULL;
    $imagePath = null;

    if (isset($_FILES['image']) && $_FILES['image']['error'] == UPLOAD_ERR_OK) {
        $imagePath = "uploads/" . basename($_FILES["image"]["name"]);
        move_uploaded_file($_FILES['image']['tmp_name'], $imagePath);
    }

    $sql = "INSERT INTO replies (comment_id, author, content, created_at, parent_id, image_path) VALUES (?, ?, ?, NOW(), ?, ?)";
    $stmt = $conn->prepare($sql);

    $stmt->bind_param("issis", $comment_id, $author, $content, $parent_id, $imagePath);

    if($stmt->execute()) {
        header("Location: post_detail.php?id=" . $post_id);
        exit();
    } else {
        echo "An error occurred: " . $conn->error;
    }

    $stmt->close();
} else {
    echo "Invalid data submitted.";
}

$conn->close();
?>
