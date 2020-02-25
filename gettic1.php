
<!DOCTYPE html>
<html>
<head>
	<title></title>
	


	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

 <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
   <script type="text/javascript" charset="utf8" src="https://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
</head>
<body>
 	 <div class="container">
 	 <div class="col-lg-12">
 	 <br><br>
 	 <h1 class="text-warning text-center" > Display Table Data </h1>
 	 <br>
  	 <table  id="tabledata" class=" table table-striped table-hover table-bordered">
 
 	 <tr class="bg-dark text-white text-center">
 
 	 <th> PNR </th>
 	 <th> Date of Reservation </th>
 	 <th> Flight No. </th>
 	 <th> Journey Date </th>
 	 <th> Class </th>
 	 <th> Booking Status </th>
 	 <th> No. of Passengers </th>
 	 <th> Payment ID </th>
 	 <th> Ticket </th>
 	 <!-- <th> Update </th> -->

  	 </tr >

   <?php
$con=mysqli_connect('localhost', 'root','','airline_reservation');
  require_once('Database Connection file/mysqli_connect.php'); 
 $q = "SELECT * from ticket_details ";

  // $query = mysqli_query($con,$q) or die(mysqli_error($con));
  $query = mysqli_query($con,$q);

  while($res = mysqli_fetch_array($query)){
 ?>
 <tr class="text-center bg-dark text-white">
 <td> <?php echo $res['pnr'];  ?> </td>
 <td> <?php echo $res['date_of_reservation'];  ?> </td>
 <td> <?php echo $res['flight_no'];  ?> </td>
 <td> <?php echo $res['journey_date'];  ?> </td>
 <td> <?php echo $res['class'];  ?> </td>
 <td> <?php echo $res['booking_status'];  ?> </td>
 <td> <?php echo $res['no_of_passengers'];  ?> </td>
 <td> <?php echo $res['payment_id'];  ?> </td>
 <td> <button class="btn-danger btn"> <a href="delete.php?id=<?php echo $res['id']; ?>" style="color:white;"> Ticket-It </a>  </button> </td>
 <!-- <td> <button  class="btn-primary btn"> <a href="update.php?id=<?php echo $res['id']; ?>" style="color: white;"> Update </a> </button> </td> -->

  </tr>

  <?php 
 }
  ?>
 
 </table>  

  </div>
 </div>

  
<input type="button" value="Back" type="submit" clas="btn" style="color: #0091FF;margin-left: 325px;"onclick="window.location.href='/gamma/home.php'" />

</body>
</html>