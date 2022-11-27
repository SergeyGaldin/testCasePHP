<?php
require_once '../includes/DbOperations.php';
$response = [];
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $db = new DbOperation();
    $stmt = $db->getDataService();
    
    while ($row = $stmt->fetch_assoc()) {
        $response[] = [
            'name_service' => $row["name_service"],
        ];
    }
} else {
    $response['error'] = true;
    $response['message'] = "Неверный запрос";
}

echo json_encode($response);
?>