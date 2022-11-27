<?php
require_once '../includes/DbOperations.php';
$response = array();

if($_SERVER['REQUEST_METHOD']=='POST') {
    if(isset($_POST['login']) and isset($_POST['password'])) {
        $db = new DbOperation();
        if($db->userLogin($_POST['login'], $_POST['password'])) {
            $user = $db->getUserByLogin($_POST['login']);
            $response['error'] = false;
            $response['id'] = $user['id'];
            $response['login'] = $user['login'];
            $response['password'] = $user['password'];
            $response['user_name'] = $user['user_name'];
            $response['name_organization'] = $user['name_organization'];
            $response['name_role'] = $user['name_role'];
        } else {
            $response['error'] = true;
            $response['message'] = "Неверный логин или пароль";
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
?>