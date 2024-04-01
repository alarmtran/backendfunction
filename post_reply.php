<?php
include 'db.php'; // Include the database connection file

// Check if the necessary POST data is set and sanitize the input
if(isset($_POST['comment_id'], $_POST['author'], $_POST['content'])) {
    // Assign POST data to variables
    $comment_id = $_POST['comment_id'];
    $author = $conn->real_escape_string(trim($_POST['author']));
    $content = $conn->real_escape_string(trim($_POST['content']));
    $parent_id = isset($_POST['parent_id']) && $_POST['parent_id'] !== '' ? $_POST['parent_id'] : NULL;

    // Check if comment_id is a number
    if(is_numeric($comment_id)) {
        // Prepare the INSERT statement to add the reply
        $sql = "INSERT INTO replies (comment_id, author, content, created_at, parent_id) VALUES (?, ?, ?, NOW(), ?)";
        $stmt = $conn->prepare($sql);

        // Bind parameters to the prepared statement
        $stmt->bind_param("issi", $comment_id, $author, $content, $parent_id);

        // Execute the prepared statement
        if($stmt->execute()) {
            // Redirect to the post detail page
            header("Location: index.php");
            exit();
        } else {
            // If an error occurs, display it
            echo "An error occurred: " . $conn->error;
        }

        // Close the statement
        $stmt->close();
    } else {
        // If comment_id is not a number, display an error message
        echo "comment_id is not a valid number.";
    }
} else {
    // If required data is not set, display an error message
    echo "Invalid data submitted.";
}

// Close the database connection
$conn->close();
?>
