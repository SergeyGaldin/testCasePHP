<?php
require_once '../includes/DbOperations.php';
$response = array();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset(
        $_POST['name_request'],
        $_POST['deposit'],
        $_POST['service'],
        $_POST['executor'],
        $_POST['priority'],
        $_POST['date_creation'],
        $_POST['date_begine'],
        $_POST['author']
    )) {
        $db = new DbOperation();
        $result = $db->setDataRequest(
            $_POST['name_request'],
            $_POST['deposit'],
            $_POST['service'],
            $_POST['executor'],
            $_POST['priority'],
            $_POST['date_creation'],
            $_POST['date_begine'],
            $_POST['author']
        );
        if ($result == 1) {
            $response['error'] = false;
            $response['message'] = "Регистрация прошла успешно";
        } else {
            $response['error'] = true;
            $response['message'] = $result;
        }
    } else {
        $response['error'] = true;
        $response['message'] = "Заполнены не все поля";
    }
} else {
    $response['error'] = true;
    $response['message'] = "Неверный запрос";
}
echo json_encode($response);