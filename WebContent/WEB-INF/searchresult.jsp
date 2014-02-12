<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Search Results on ${location}</title>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
</head>
<body>
	<h1>Results on ${location}</h1>
	<h3>Tweets</h3>
	<div align="center">
		<table style="width:60%">
			<c:forEach var="tweet" items="${tweets}">
				<tr>
					<td>
						<blockquote class="twitter-tweet" lang="en">
							<a href="${tweet.url}"></a>
						</blockquote>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<h3>Flickrs</h3>
</body>
</html>