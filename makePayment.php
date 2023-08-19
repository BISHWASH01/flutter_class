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
// ||!isset($_POST['total'])

if (!isset($_POST['orderID'])) {
    echo json_encode(
        array(
            "success" => false,
            "message" => "incorrect order id",
        )
    );
    die();
}
global $CON;

$token = $_POST['token'];
$orderID = $_POST['orderID'];
$total = getTotal($orderID);
$userID = getUserID($token);

checkPaymentStatus($orderID);




$sql = "INSERT INTO paymet (userID, orderID,amount) VALUES ('$userID','$orderID','$total')";
$result = mysqli_query($CON,$sql);
if ($result) {
    $paymentID = mysqli_insert_id($CON);
    $sql = "UPDATE ordersmade SET status='paid' WHERE orderID = '$orderID'";
    $result = mysqli_query($CON, $sql);
    // $num = mysqli_num_rows($result);

    // if ($num == 0) {
    //     return null;
    // }else{
    //     $row = mysqli_fetch_assoc($result);
    //     return $row['total'];
    // }

   echo json_encode(
        array(
            "success" => true,
            "message" => "payment made",
            "data" => $orderID
        )
    );
}

function checkPaymentStatus($orderID){
global $CON;

    $sql = "SELECT * FROM ordersmade where orderID = '$orderID'";
$result = mysqli_query($CON,$sql);
$num = mysqli_num_rows($result);


if ($num != 0) {
    $row = mysqli_fetch_assoc($result);
    if ($row['status'] == 'paid') {
        echo json_encode(
            array(
                "success" => false,
                "message" => "payment already made",
                "data" => $orderID
            )
        );
        die();
        }
}else{
    echo json_encode(
        array(
            "success" => false,
            "message" => "no order of that ID found",
            "data" => $orderID
        )
    );
    die();

}

}




function getTotal($orderID){
    global $CON;
    $sql = "SELECT * from ordersmade where orderID = '$orderID'";
    $result = mysqli_query($CON, $sql);
    $num = mysqli_num_rows($result);

    if ($num == 0) {
        return null;
    }else{
        $row = mysqli_fetch_assoc($result);
        return $row['total'];
    }


}