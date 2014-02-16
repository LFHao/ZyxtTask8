<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@page import="java.util.*" %>
<%@page import="databeans.Mapping" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Search Results on ${location}</title>
<style>
body {
	background-color: #0B0B3B;
	color: #CEECF5;
	font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
	color: #CEECF5;
}
</style>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
<!--Load the AJAX API-->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	// Load the Visualization API and the piechart package.
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});

	// Set a callback to run when the Google Visualization API is loaded.
	google.setOnLoadCallback(drawChart);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {

		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Words');
		data.addColumn('number', 'Popularity');
		data.addRows([
<%
ArrayList<Mapping> pops = (ArrayList<Mapping>) request.getAttribute("popular");
if (pops != null) {
    for (Mapping p : pops) {
        out.println("[\'"+ p.getKey() +"\' ,"+ p.getValue() + "], ");   
    }
}
%>
		              ]);

		// Set chart options
		var options = {
			'title' : '10 Most Popular Words about <%=request.getParameter("location")%>',
			'width' : 640,
			'height' : 480
		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.BarChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>
</head>
<body>
	<h3 align="center">zSpot</h3>
	<h1 align="center">Results on ${location}</h1>
	<h3>Hot Words In Tweets About ${location}</h3>
	<div id="chart_div" style="width:100%" align="center"></div>
	<div style="width:100%" align="center"><img src="image.do?id=${pid}"></div>
	<h3>Flickrs</h3>
	<div align="center">
		<table style="width: 90%" align="center">
			<c:forEach var="pic" items="${photos}" varStatus="status">
				<c:if test="${status.index % 4 == 0}">
					<tr>
				</c:if>
				<td align="center"><img src="${pic}" width="320px"></td>
				<c:if test="${status.index % 4 == 3}">
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
	<h3>Tweets</h3>
	<div align="center">
		<table style="width: 90%" align="center">
			<c:forEach var="tweet" items="${tweets}">
				<tr>
					<td align="center">
						<blockquote class="twitter-tweet" data-link-color="#F6E3CE" data-theme="dark" lang="en">
							<a href="${tweet.url}"></a>
						</blockquote>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>