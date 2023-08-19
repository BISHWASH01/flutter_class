<?php

include './Helpers/DatabaseConfig.php';
include './Helpers/Authentication.php';



if(
    isset($_POST['title']) &&
    isset($_POST['token'])


){
    global $CON; 
    $title = $_POST['title'];
    $token = $_POST['token'];

    if (isAdmin($token)) {  

        $sql = "select * from category where title = '$title'";
    $result = mysqli_query($CON, $sql);
    $num = mysqli_num_rows($result);

    if($num > 0){
        echo json_encode(
            array(
                "success" => false,
                "message" => "Category title already exists!!!"
            )
            );
            return;
    }else{

        $insertQuery = "INSERT INTO category (title) VALUES ('$title')";
        $insertResult = mysqli_query($CON,$insertQuery);
        

        if($insertResult){
            echo json_encode(
                array(
                    "success"=> true,
                    "message" => "Category added successfully!!"
                )
                );
        }else {
            echo json_encode(
                array(
                    "success"=> false,
                    "message" => "Category title not added!!"
                )
                );
        }

    }
    } else {
        echo json_encode(
            array(
                "success" => false,
                "message" => "Access denied"
            )
        );
        
    }
    

    


    


}else{
    echo json_encode(
        array(
            "success" => false,
            "message" => "please fill all the form",
            "required feilds" => "title,token"
        )
    );

}