<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Search Results on ${location}</title>
</head>
<body>
	<h1>Results on ${location}</h1>
	<h3>Tweets</h3>
	<table>
		<c:forEach var="tweet" items="${tweets}">
			<tr>
				<td>
					<div style="font-size:small; color:blue">
						${tweet.name} posted a tweet at ${tweet.time}:
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div style="padding-left:10px;">
						${tweet.content}
					</div>
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
		</c:forEach>
	</table>
	<h3>Flickrs</h3>
</body>
</html>