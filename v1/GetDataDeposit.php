<?php
require_once '../includes/DbOperations.php';
$response = [];
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $db = new DbOperation();
    $stmt = $db->getDataDeposit();
    
    while ($row = $stmt->fetch_assoc()) {
        $response[] = [
            'name_deposit' => $row["name_deposit"],
        ];
    }
} else {
    $response['error'] = true;
    $response['message'] = "Неверный запрос";
}

echo json_encode($response);
?>