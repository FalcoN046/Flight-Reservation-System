<?php
 include'mysqli_connect.php';
    $con=mysqli_connect('localhost', 'root','','airline_reservation');
      // 
     $del=$_POST['name'];
     // echo "$del
     // ";
// include 'connect.php';

// $id = $_GET['id'];

$q = " DELETE FROM ticket_details WHERE seat_no = $del ";

mysqli_query($con, $q);

header('location:tick.php');

?>