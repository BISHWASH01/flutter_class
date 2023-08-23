<?php

include './Helpers/DatabaseConfig.php';
include './Helpers/Authentication.php';





if (!isset($_POST['token'])) {
    echo json_encode(
        array(
            "success" => false,
            "message" => "not authorized",
        )
    );
    die();
}
if (!isset($_POST['orderID'])) {
    echo json_encode(
        array(
            "success" => false,
            "message" => "not ordered anything in this session",
        )
    );
    die();
}

global $CON; 
$token = $_POST['token'];
$orderID = $_POST['orderID'];
$userID = getUserID($token);


$orderList = getOrderList($orderID,$userID);

if ($orderList != null) {

    echo json_encode(
        array(
            "success" => true,
            "message" => "order retrival complete",
            "orders"=>$orderList

        )
        
        );


}




function getOrderList($orderID,$userID){
    global $CON;
    $sql = "SELECT * from ordersmade where orderID = '$orderID' AND userID = '$userID'";
    $result = mysqli_query($CON, $sql);
    $num = mysqli_num_rows($result);

    if ($num == 0) {
        return null;
    }else{
        while ($row = mysqli_fetch_assoc($result)) {
            
            
            $orderList[] = $row;


        }

        

        return $orderList;
    }




}