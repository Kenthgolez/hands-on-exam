<?php

$conn = mysqli_connect("localhost","root","","product_info");

if (!$conn){
    die("connection failed");
}

$mobile = $_POST["mobile"];
$password = $_POST["password"];

$sql = "SELECT * FROM costumer Where mobile='$mobile' AND password='$password'";
$result = mysqli_query($conn,$sql);

if (mysqli_num_rows($result)>0){
    header("Location:home.html");
    
}else{
    echo"login failed";
}
mysqli_close($conn);
?>