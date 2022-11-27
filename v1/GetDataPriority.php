<?php
require_once '../includes/DbOperations.php';
$response = [];
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $db = new DbOperation();
    $stmt = $db->getDataPriority();
    
    while ($row = $stmt->fetch_assoc()) {
        $response[] = [
            'name_priority' => $row["name_priority"],
        ];
    }
} else {
    $response['error'] = true;
    $response['message'] = "Неверный запрос";
}

echo json_encode($response);
?>