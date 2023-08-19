<?php


function getUserID($token){
    global $CON;
    $sql = "select userID from personalAccessToken where token = '$token';";
    $result = mysqli_query($CON, $sql);
    $num = mysqli_num_rows($result);

    if ($num == 0) {
        return null;
    }else{
        $row = mysqli_fetch_assoc($result);
        return $row['userID'];
    }


}




function isAdmin($token)
{
    $userID = getUserID($token);
    
    if ($userID == null) {
        return false;
    }
    global $CON;

    $sql = "select * from user where userId = '$userID'";
    $result = mysqli_query($CON, $sql);
    if ($result) {
        $row = mysqli_fetch_assoc($result);
        if ($row['role'] == 'admin') {
            return true;
        }else{
            return false;
        }
    } else{
        return false;
    }

}