<?php

include './Helpers/DatabaseConfig.php';
include './Helpers/Authentication.php';



// if(
//     isset($_POST['token'])


// ){
    global $CON; 
    // $token = $_POST['token'];

    // if (isAdmin($token)) {  

    //     $categoryList = getCategoryList();

    //     if ($categoryList != null) {

    //         echo json_encode(
    //             array(
    //                 "Success" => true,
    //                 "message" => "",
    //                 "categories"=>$categoryList

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
    $categoryList = getCategoryList();

        if ($categoryList != null) {

            echo json_encode(
                array(
                    "success" => true,
                    "message" => "list retrival succesfull",
                    "categories"=>$categoryList

                )
                
                );
        
        
        }
    


// }else{
//     echo json_encode(
//         array(
//             "success" => false,
//             "message" => "please fill all the form",
//             "required feilds" => "title,token"
//         )
//     );

// }


function getCategoryList(){
    global $CON;
    $sql = "select * from category ";
    $result = mysqli_query($CON, $sql);
    $num = mysqli_num_rows($result);

    if ($num == 0) {
        return null;
    }else{
        while ($row = mysqli_fetch_assoc($result)) {
            
            
            $categoryList[] = $row;


        }

        

        return $categoryList;
    }




}