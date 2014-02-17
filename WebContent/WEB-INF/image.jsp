<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>zSpot - Collage of ${location}</title>

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
				<div style="width: 100%" align="center">
					<img src="image.do?get=true">
				</div>
			</div>

			<div class="row">
				<form class="form-signin" method="post" action="auth.do">
					<div align="center">
						<input class="btn btn-primary" type="submit" name="share" value="Share to Twitter">
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