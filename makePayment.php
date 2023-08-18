<?php


include './Helpers/DatabaseConfig.php';

if (!isset($_POST['token'])) {
    echo json_encode(
        array(
            "success" => false,
            "message" => "not authorized",
        )
    );
    die();
}

if (!isset($_POST['orderID'])||!isset($_POST['total'])) {
    echo json_encode(
        array(
            "success" => false,
            "message" => "not authorized",
        )
    );
    die();
}
global $CON;

$token = $_POST['token'];
$orderID = $_POST['orderID'];
$total = $_POST['total'];
$userID = getUserID($token);

