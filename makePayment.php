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

if (!isset($_POST['orderID']) || !isset($_POST['total'])|| !isset($_POST['otherData'])) {
    echo json_encode(
        array(
            "success" => false,
            "message" => "no order id/total/otherData",
        )
    );
    die();
}
global $CON;

$token = $_POST['token'];
$orderID = $_POST['orderID'];
$total = $_POST['total'];
$otherData = $_POST['otherData'];

// $total = getTotal($orderID);
$userID = getUserID($token);

checkPaymentStatus($orderID);




$sql = "INSERT INTO paymet (userID, orderID,amount,otherData) VALUES ('$userID','$orderID','$total','$otherData')";
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

    if ($result){
        echo json_encode(
            array(
                "success" => true,
                "message" => "payment made successfully"
            )
        );
    }else{
        echo json_encode(
            array(
                "success" => false,
                "message" => "payment update failed"
            )
        );

    }
}else{
    echo json_encode(
        array(
            "success" => false,
            "message" => "Payment creation failed"
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
                "message" => "payment already made"
            )
        );
        die();
        }
}else{
    echo json_encode(
        array(
            "success" => false,
            "message" => "no order of that ID found"
        )
    );
    die();

}

}


// function getTotal($orderID){
//     global $CON;
//     $sql = "SELECT * from ordersmade where orderID = '$orderID'";
//     $result = mysqli_query($CON, $sql);
//     $num = mysqli_num_rows($result);

//     if ($num == 0) {
//         return null;
//     }else{
//         $row = mysqli_fetch_assoc($result);
//         return $row['total'];
//     }


// }