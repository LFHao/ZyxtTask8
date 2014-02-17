<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
	background-color: #424242;
}
</style>

</head>

<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="homepage.do">zSpot</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-right navbar-ex1-collapse">
			<ul class="nav navbar-nav">
				<li><a href="#about">About</a></li>
				<li><a href="#services">Services</a></li>
				<li><a href="#contact">Contact</a></li>
			</ul>
		</div>
	</div>
	</nav>
	
	<br>
	<br>
	
	<div class="row" align="center" style="padding-top:40px">
		<jsp:include page="error-list.jsp" />
	</div>

	<div class="row" style="padding-top:20px">
		<form class="form-signin" method="post" action="${auth.authUrl}"
			target="_blank">
			<div align="center">
				<input class="btn btn-primary-lg" type="submit" name="share" width="200px"
					value="Get the Verifier">
			</div>
		</form>
	</div>

	<div class="row" style="padding-top:20px; padding-bottom:40px">
		<form class="form-signin" method="post" action="auth.do">
			<div align="center">
				<textarea name="status" rows="3" cols="50">I created a collage of hot words and pictures about ${location} using zSpot!</textarea>
				<br>&nbsp;<br>				
				<input type="hidden" name="hasauth" value="true"> 
				<input type="text" class="input-large search-query" name="verify"
					placeholder="Enter the verifier">
				<input class="btn btn-primary" type="submit" name="authbutton"
					value="Confirm the Verifier">
			</div>
		</form>
	</div>
	
	<footer>
		<div class="container" align='center'>
			<div class="row">
				<div class="col-lg-12">
					<p class="copyright text-muted small">Copyright &copy; Team
						Zyxt 2014. All Rights Reserved</p>
				</div>
			</div>
		</div>
	</footer>

	<!-- JavaScript -->
	<script src="js/jquery-1.10.2.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>