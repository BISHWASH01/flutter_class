<?php

include '../Helpers/DatabaseConfig.php';

if(isset($_POST['fullName']) && isset($_POST['email']) && isset($_POST['password'])){
    global $CON; 
    $email = $_POST['email'];
    $fName = $_POST['fullName'];
    $password = $_POST['password'];
    


    $sql = "select * from user where email = '$email'";
    $result = mysqli_query($CON, $sql);
    $num = mysqli_num_rows($result);

    if($num > 0){
        echo json_encode(
            array(
                "succes" => false,
                "message" => "email already exists!!!"
            )
            );
            return;
    }else{

        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        $insertQuery = "INSERT INTO user (fullName, email, password, role, address) VALUES ('$fName','$email','$hashed_password','user','ghar')";
        $insertResult = mysqli_query($CON,$insertQuery);
        

        if($insertResult){
            echo json_encode(
                array(
                    "success"=> true,
                    "message" => "user registered!!"
                )
                );
        }else {
            echo json_encode(
                array(
                    "success"=> false,
                    "message" => "user  not registered!!"
                )
                );
        }

    }


}else{
    echo json_encode(
        array(
            "success" => false,
            "message" => "please fill all the form",
            "required feilds" => "fullname, email, password"
        )
    );

}