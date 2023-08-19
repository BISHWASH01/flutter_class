<?php

include './Helpers/DatabaseConfig.php';
include './Helpers/Authentication.php';




    global $CON; 


    // if (isAdmin($token)) {  

    //     $productList = getProductList();

    //     if ($productList != null) {

    //         echo json_encode(
    //             array(
    //                 "Success" => true,
    //                 "message" => "",
    //                 "products"=>$productList

    //             )
                
    //             );
        
        
    //     }
    // }else {
    //     echo json_encode(
    //         array(
    //             "success" => false,
    //             "message" => "Access denied"
    //         )
    //     );
        
    // }
    $productList = getProductList();

        if ($productList != null) {

            echo json_encode(
                array(
                    "Success" => true,
                    "message" => "product retrival complete",
                    "products"=>$productList

                )
                
                );
        
        
        }
    



function getProductList(){
    global $CON;
    $sql = "select * from product p  join category c on p.category = c.catID";
    $result = mysqli_query($CON, $sql);
    $num = mysqli_num_rows($result);

    if ($num == 0) {
        return null;
    }else{
        while ($row = mysqli_fetch_assoc($result)) {
            
            
            $productList[] = $row;


        }

        

        return $productList;
    }




}