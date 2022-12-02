<?php
require_once '../includes/DbOperations.php';
$response = array();

if($_SERVER['REQUEST_METHOD']=='POST') {
    if(isset($_POST['id_request'])) {
        $db = new DbOperation();
            $db->deleteRequest($_POST['id_request']);
            $response['error'] = false;
            $response['message'] = "Запрос удалён";
    } else {
        $response['error'] = true;
        $response['message'] = "Нет id для удаления";
    }
} else {
    $response['error'] = true;
    $response['message'] = "Неверный запрос";
}
echo json_encode($response);