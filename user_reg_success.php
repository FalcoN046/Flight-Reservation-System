<html>
	<head>
	<?php
	session_start();
?>
<html lang="en">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
   
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
 
     <!-- Site Metas -->
    <title>VOYAGE AIR</title>  
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="style1.css">
    <!-- Colors CSS -->
    <link rel="stylesheet" href="css/colors.css">
    <!-- ALL VERSION CSS -->
    <link rel="stylesheet" href="css/versions.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">
    <!-- <link rel="stylesheet" href="nice1.css"> -->
    <link rel="stylesheet" href="nice2.css">
    <!-- Modernizer for Portfolio -->
    <script src="js/modernizer.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="text/html; charset=iso-8859-2" http-equiv="Content-Type">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<head>
		<title>
			Account Login
		</title>
		<style>
			input {
    			border: 1.5px solid #eb4034;
    			border-radius: 4px;
    			padding: 7px 30px;
			}
			input[type=submit] {
				background-color: #eb4034;
				color: white;
    			border-radius: 4px;
    			padding: 7px 45px;
    			margin: 0px 60px
			}
			.mySlides {display:none;}
		</style>
		<!-- <link rel="stylesheet" type="text/css" href="css/style.css"/> -->
		<link rel="stylesheet" href="font-awesome-4.7.0\css\font-awesome.min.css">
	</head>
	<body class="host_version">
		
		
		 <header class="header header_style_01">
        <nav class="megamenu navbar navbar-default">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html"><img src="data:image/png;base64,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"style="height: 75px;width: 150px; float: left;" alt="image"></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        
                        <li><a class="active" href="/airline-ticket-reservation/customer_homepage.php" style="color: #ff4427">Home</a></li>
                        <!-- <li><a href="pages/index.html" style="color: #ff4427">Book </a></li> -->
                        <li><a href="pages/index.html" style="color: #ff4427">Experience</a></li>
                        <li><a href="pages/index.html" style="color: #ff4427">Where We FLY</a></li>
                        <li><a href="pages/index.html" style="color: #ff4427"> Help</a></li>
                        <li><a href="pages/index.html" style="color: #ff4427">Contact</a></li>
                        <li><a href="/airline-ticket-reservation/login_page.php" style="color: #ff4427">Check-In	</a></li>
                   </ul>
                </div>
            </div>
        </nav>
    </header>
	
		<br><br>
		<br>
		<br>
		<h5></h5>
		<h3 style="text-align-last: center;color: #ff4427 ">New user successfully registered! Login into your account to book tickets.</h3>
	</body>
</html>