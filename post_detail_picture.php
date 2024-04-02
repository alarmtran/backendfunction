<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Bài Viết</title>
    <link rel="stylesheet" href="style.css"> <!-- Link to style.css -->
    <script>
        function toggleReplyForm(commentId, parentId = null) {
            // Toggle the reply form visibility and set the parent_id value
            var form = document.getElementById('reply-form-' + commentId);
            if (form) {
                var parentInput = form.querySelector("input[name='parent_id']");
                parentInput.value = parentId; // If parentId is null, the value will be set to empty, which is okay for a new top-level reply
                form.style.display = form.style.display === 'none' || form.style.display === '' ? 'block' : 'none';
            }
        }
    </script>
</head>
<body>
<?php
include 'db.php'; // Include database connection

// Function to display replies recursively
function displayReplies($conn, $comment_id, $parent_id = null, $level = 0) {
    $reply_sql = "SELECT * FROM replies WHERE comment_id = $comment_id" . ($parent_id ? " AND parent_id = $parent_id" : " AND parent_id IS NULL") . " ORDER BY created_at DESC";
    $reply_result = $conn->query($reply_sql);

    if ($reply_result->num_rows > 0) {
        echo "<div class='replies level-$level'>";
        while($reply = $reply_result->fetch_assoc()) {
            echo "<div class='reply'>";
            echo "<p>" . htmlspecialchars($reply["content"]) . "</p>";
            echo "<p class='reply-meta'>Replied by: " . htmlspecialchars($reply["author"]) . " on " . $reply["created_at"];
            echo " <button onclick='toggleReplyForm(" . $comment_id . ", " . $reply['id'] . ")'>Reply</button></p>";
            displayReplies($conn, $comment_id, $reply['id'], $level + 1);
            echo "</div>"; // End of .reply
        }
        echo "</div>"; // End of .replies
    }
}

if(isset($_GET['id']) && is_numeric($_GET['id'])) {
    $post_id = $_GET['id'];
    $sql = "SELECT title, content, author, created_at FROM posts WHERE id = $post_id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo "<div class='post-detail'>";
        echo "<h1>" . htmlspecialchars($row["title"]) . "</h1>";
        echo "<p>" . nl2br(htmlspecialchars($row["content"])) . "</p>";
        echo "<p class='post-meta'>Posted by: " . htmlspecialchars($row["author"]) . " on " . $row["created_at"] . "</p>";

        echo "<div class='comment-form'>";
        echo "<h3>Leave a comment:</h3>";
        echo "<form action='post_comment.php' method='post' enctype='multipart/form-data'>";
        echo "<input type='hidden' name='post_id' value='" . $post_id . "'>";
        echo "<input type='text' name='author' placeholder='Your name' required>";
        echo "<textarea name='content' placeholder='Your comment' required></textarea>";
        echo "<input type='file' name='image'> <!-- Thêm trường tải ảnh -->";
        echo "<button type='submit'>Submit comment</button>";
        echo "</form>";
        echo "</div>"; // End of .comment-form

        $comment_sql = "SELECT * FROM comments WHERE post_id = $post_id ORDER BY created_at DESC";
        $comment_result = $conn->query($comment_sql);

        if ($comment_result->num_rows > 0) {
            echo "<div class='comments-section'>";
            while($comment = $comment_result->fetch_assoc()) {
                echo "<div class='comment'>";
                echo "<p>" . htmlspecialchars($comment["content"]) . "</p>";
                if (!empty($comment["image"])) {
                    echo "<img src='uploads/" . $comment["image"] . "' alt='Comment Image'>";
                }
                echo "<p class='comment-meta'>Commented by: " . htmlspecialchars($comment["author"]) . " on " . $comment["created_at"];
                echo "<button onclick='toggleReplyForm(" . $comment['id'] . ")'>Reply</button></p>";


                displayReplies($conn, $comment['id']);

//                echo "<div class='reply-form' id='reply-form-" . $comment['id'] . "' style='display:none;'>";
                echo "<div class='reply-form'>";
                echo "<form action='post_reply.php' method='post' enctype='multipart/form-data'>"; // Thêm 'enctype' để cho phép tải lên tập tin
                echo "<input type='hidden' name='comment_id' value='" . $comment['id'] . "'>";
                echo "<input type='hidden' name='parent_id' value='" . $post_id['id'] . "'>";
                echo "<input type='text' name='author' placeholder='Your name' required>";
                echo "<textarea name='content' placeholder='Your reply' required></textarea>";
                echo "<input type='file' name='image'> <!-- Thêm trường tải ảnh -->";
                echo "<button type='submit'>Submit reply</button>";
                echo "</form>";
                echo "</div>"; // End of .reply-form
            }
            echo "</div>"; // End of .comments-section
        } else {
            echo "<p>No comments yet.</p>";
        }
        echo "</div>"; // End of .post-detail
    } else {
        echo "<p>The post does not exist.</p>";
    }
} else {
    echo "<p>Invalid post ID.</p>";
}
$conn->close();
?>
</body>
</html>