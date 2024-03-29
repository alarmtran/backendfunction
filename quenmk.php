<?php
// Kết nối cơ sở dữ liệu
$servername = "localhost";
$username = "root"; // Thay thế bằng tên người dùng cơ sở dữ liệu của bạn
$password = ""; // Thay thế bằng mật khẩu cơ sở dữ liệu của bạn
$database = "forum";

// Tạo kết nối
$conn = new mysqli($servername, $username, $password, $database);

// Kiểm tra kết nối
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Kiểm tra xem 'username' đã được gửi qua form không
if (isset($_POST['username'])) {
    $username = $_POST['username'];

    // Truy vấn cơ sở dữ liệu để lấy mật khẩu
    $sql = "SELECT password FROM users WHERE username = ?";
    
    // Chuẩn bị truy vấn
    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        die("Lỗi khi chuẩn bị truy vấn: " . $conn->error);
    }
    
    // Gán giá trị và thực thi
    $stmt->bind_param("s", $username);
    $stmt->execute();
    
    // Lấy kết quả
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo "Mật khẩu của bạn là: " . $row['password']; // Lưu ý về bảo mật ở đây
    } else {
        echo "Không tìm thấy tài khoản.";
    }
    
    $stmt->close();
} else {
    echo "Vui lòng nhập tên tài khoản.";
}

$conn->close();
?>
