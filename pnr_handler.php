<html>
	<head>
		
	</head>
	<body>
		<?php
			session_start();
			session_destroy();
			session_start();
			if(isset($_POST['pnr']))
			{
				$data_missing=array();
				if(empty($_POST['Pnr']))
				{
					$data_missing[]='Pnr';
				}
				else
				{
					$user_name=trim($_POST['Pnr']);
				}
				


				if(empty($data_missing))
				{
					if($user_type=='Customer')
					{
						require_once('Database Connection file/mysqli_connect.php');
						$query="SELECT pnr FROM ticket_details where pnr=?";
						$stmt=mysqli_prepare($dbc,$query);
						mysqli_stmt_bind_param($stmt,"ss",$user_name,$pass_word);
						mysqli_stmt_execute($stmt);
						mysqli_stmt_bind_result($stmt,$cnt);
						mysqli_stmt_fetch($stmt);
						//echo $cnt;
						mysqli_stmt_close($stmt);
						mysqli_close($dbc);
						/*$affected_rows=mysqli_stmt_affected_rows($stmt);
						$response=@mysqli_query($dbc,$query);
						echo $affected_rows;
						*/
						if($cnt==1)
						{
							echo "Logged in <br>";
							$_SESSION['login_user']=$user_name;
							echo $_SESSION['login_user']." is logged in";
							header("location: customer_homepage.php");
						}
						else
						{
							echo "Login Error";
							session_destroy();
							header('location:login_page.php?msg=failed');
						}
					}
					
				}
				else
				{
					echo "The following data fields were empty<br>";
					foreach($data_missing as $missing)
					{
						echo $missing ."<br>";
					}
				}
			}
			else
			{
				echo "Submit request not received";
			}
		?>
	</body>
</html>