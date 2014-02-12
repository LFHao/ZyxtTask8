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
	<h3 align="center">zSpot</h3>
	<h1 align="center">Results on ${location}</h1>
	<h3>Hot words in tweets about ${location}</h3>
	<div align="center">
		<table style="width: 90%">
			<tr>
			<c:forEach var="p" items="${popular}">
				<td align="center">${p}</td>
			</c:forEach>
			</tr>
		</table>
	</div>
	<h3>Tweets</h3>
	<div align="center">
		<table style="width: 90%" align="center">
			<c:forEach var="tweet" items="${tweets}">
				<tr>
					<td align="center">
						<blockquote class="twitter-tweet" lang="en">
							<a href="${tweet.url}"></a>
						</blockquote>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<h3>Flickrs</h3>
	<div align="center">
		<table style="width: 90%" align="center">
			<c:forEach var="pic" items="${photos}" varStatus="status">
				<c:if test="${status.index % 4 == 0}">
					<tr>
				</c:if>
				<td align="center">
					<img src="${pic}" width="320px">
				</td>
				<c:if test="${status.index % 4 == 3}">
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
</body>
</html>