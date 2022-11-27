<?php
require_once '../includes/DbOperations.php';
$response = [];
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $db = new DbOperation();
    $user = $db->getDataRequests();
    
    while ($row = $user->fetch_assoc()) {
        $response[] = [
            'error' => false,
            'id_request' => $row["id_request"],
            'name_request' => $row["name_request"],
            'deposit' => $row["deposit"],
            'service' => $row["service"],
            'executor' => $row["executor"],
            'name_status' => $row["name_status"],
            'name_priority' => $row["name_priority"],
            'date_creation' => $row["date_creation"],
            'date_begine' => $row["date_begine"],
            'date_end' => $row["date_end"],
            'author' => $row["author"],
        ];
    }
} else {
    $response['error'] = true;
    $response['message'] = "Неверный запрос";
}

echo json_encode($response);
?>