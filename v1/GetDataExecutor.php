<?php
require_once '../includes/DbOperations.php';
$response = [];
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $db = new DbOperation();
    $stmt = $db->getDataExecutor();
    
    while ($row = $stmt->fetch_assoc()) {
        $response[] = [
            'id' => $row["id"],
            'user_name' => $row["user_name"],
            'name_role' => $row["name_role"],
        ];
    }
} else {
    $response['error'] = true;
    $response['message'] = "Неверный запрос";
}

echo json_encode($response);
?>