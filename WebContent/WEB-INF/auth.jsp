<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>zSpot - Share the Collage</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<!-- Custom Google Web Font -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic'
	rel='stylesheet' type='text/css'>

<!-- Add custom CSS here -->
<style>
body {
	background-color: #0B0B3B;
	color: #CEECF5;
	font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
	color: #CEECF5;
}
</style>

</head>

<body>
	<div class="intro-header">
		<div class="container">
			<div class="row">
				<form class="form-signin" method="post" action="${auth.authUrl}" target="_blank">
					<div align="center">
						<input class="btn btn-primary-lg" type="submit" name="share"
							value="Get the Verifier">
					</div>
				</form>
			</div>
			
			<div class="row">
				<form class="form-signin" method="post" action="auth.do">
					<div align="center">
						<input type="hidden" name="hasauth" value="true">
						<input type="text" class="input-large search-query" name="verify" placeholder="Enter the verifier">
						<input class="btn btn-primary" type="submit" name="authbutton" value="Confirm the Verifier">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- /.intro-header -->

	<!-- JavaScript -->
	<script src="js/jquery-1.10.2.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>