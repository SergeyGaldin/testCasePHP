<?php
require_once '../includes/DbOperations.php';
$response = array();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset(
        $_POST['id_request'],
        $_POST['name_request'],
        $_POST['deposit'],
        $_POST['service'],
        $_POST['executor'],
        $_POST['priority'],
        $_POST['date_begine']
    )) {
        $db = new DbOperation();
        $db->updateDataRequest(
            $_POST['id_request'],
            $_POST['name_request'],
            $_POST['deposit'],
            $_POST['service'],
            $_POST['executor'],
            $_POST['priority'],
            $_POST['date_begine']
        );
        $response['error'] = false;
        $response['message'] = "Запрос удалён";
    } else {
        $response['error'] = true;
        $response['message'] = "Нет id для обновления";
    }
} else {
    $response['error'] = true;
    $response['message'] = "Неверный запрос";
}
echo json_encode($response);
