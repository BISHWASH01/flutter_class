<?php

include './Helpers/DatabaseConfig.php';
include './Helpers/Authentication.php';


if (!isset($_POST['token'])) {
    echo json_encode(
        array(
            "success" => false,
            "message" => "not authorized"
        )
    );
    die();
}

if (!isset($_POST['cart'])||!isset($_POST['total'])) {
    echo json_encode(
        array(
            "success" => false,
            "message" => "not authorized"
        )
    );
    die();
}
global $CON;

$token = $_POST['token'];
$cart = $_POST['cart'];
$total = $_POST['total'];
$userID = getUserID($token);

$sql = "INSERT INTO ordersmade (userID, total) VALUES ('$userID','$total')";

$result = mysqli_query($CON,$sql);

if ($result) {
    $orderID = mysqli_insert_id($CON);
    
    $cartList = json_decode($cart);

    foreach($cartList as $cartItem){
        $product = $cartItem->product;

        $quantity = $cartItem->quantity;

        $price = $product-> price;

        $linetotal = $quantity * $price;

        $productID = $product->productId;

        $sql = "INSERT INTO orderdetails (orderID,productID,quantity,lineTotal) VALUES('$orderID','$productID','$quantity','$linetotal')";
        $result=mysqli_query($CON,$sql);
    }
    echo json_encode(
        array(
            "success" => true,
            "message" => "order creation success",
            "data" => $orderID
        )
    );


}

