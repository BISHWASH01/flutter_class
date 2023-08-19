<?php

$HOST = "localhost";
$USER = "root";
$PASS = "";
$DB = "flutter";
$CON = mysqli_connect($HOST,$USER, $PASS, $DB);

if(!$CON){
    die("Connection Failed: ");
}

