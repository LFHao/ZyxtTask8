<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@page import="java.util.*"%>
<%@page import="databeans.Mapping"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bottom.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<style type="text/css"></style>
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
<%ArrayList<Mapping> pops = (ArrayList<Mapping>) request.getAttribute("popular");
if (pops != null) {
    for (Mapping p : pops) {
        out.println("[\'"+ p.getKey() +"\' ,"+ p.getValue() + "], ");   
    }
}%>
		              ]);

		// Set chart options
		var options = {
			'title' : '10 Most Popular Words about <%=request.getParameter("location")%>',
			titleTextStyle:{color: 'white'},
			'width' : 600,
			'height' : 500,
			'backgroundColor':'0B0B3B',
			'legend': {position:'none'},
			vAxis: {
					title: 'Hot Topics',
					baseline:{color:'white'},
					gridlines:{color:'white'},
					titleTextStyle: {color: 'white', fontName: 'Time New Roman', italic: 'false', bold:'true'},
					textStyle: {color: 'white', fontName: 'Time New Roman', italic: 'false', bold:'true'}},
			hAxis: {
					title: 'Frequrency in 100 Searches',  
					titleTextStyle: {color: 'white', fontName: 'Time New Roman', italic: 'false', bold:'true'},
					textStyle: {color: 'white', fontName: 'Time New Roman', italic: 'false', bold:'true'}},
			'backgroundColor.stroke': '#E0F8F7', 
			'backgroundColor.strokeWidth': 2,
			'backgroundColor.fill': 'white',


		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.BarChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
<!--Load the AJAX API-->
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript"
	src="http://word-cumulus-goog-vis.googlecode.com/svn/trunk/wordcumulus.js"></script>
<script type="text/javascript"
	src="http://word-cumulus-goog-vis.googlecode.com/svn/trunk/swfobject.js"></script>
<script type="text/javascript">
      google.load("visualization", "1");

      // Set callback to run when API is loaded
      google.setOnLoadCallback(drawVisualization);

      // Called when the Visualization API is loaded.
      function drawVisualization() {

        // Create and populate a data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Words');
        data.addColumn('string', 'URL');
        data.addColumn('number', 'Font size');
        data.addRows(10);

        data.setCell(0, 0, '<%=pops.get(0).getKey()%>');
        data.setCell(0, 1, 'http://en.wikipedia.org/wiki/+ <%=pops.get(0).getKey().replace(" ", "_")%>');
        data.setCell(0, 2, 2+<%=pops.get(0).getValue()/3%>);
        
        data.setCell(1, 0, '<%=pops.get(1).getKey()%>');  
        data.setCell(1, 1, 'http://en.wikipedia.org/wiki/+ <%=pops.get(1).getKey().replace(" ", "_")%>');
        data.setCell(1, 2, 2+<%=pops.get(1).getValue()/3%>);      
        
        data.setCell(2, 0, '<%=pops.get(2).getKey()%>');
        data.setCell(2, 1, 'http://en.wikipedia.org/wiki/+ <%=pops.get(2).getKey().replace(" ", "_")%>');
        data.setCell(2, 2, 2+<%=pops.get(2).getValue()/3%>);       
        
		data.setCell(3, 0, '<%=pops.get(3).getKey()%>');
        data.setCell(3, 1, 'http://en.wikipedia.org/wiki/+ <%=pops.get(3).getKey().replace(" ", "_")%>');
        data.setCell(3, 2, 2+<%=pops.get(3).getValue()/3%>);
        
        data.setCell(4, 0, '<%=pops.get(4).getKey()%>');
        data.setCell(4, 1, 'http://en.wikipedia.org/wiki/+ <%=pops.get(4).getKey().replace(" ", "_")%>');
        data.setCell(4, 2, 2+<%=pops.get(4).getValue()/3%>);
        
        data.setCell(5, 0, '<%=pops.get(5).getKey()%>');
        data.setCell(5, 1, 'http://en.wikipedia.org/wiki/+ <%=pops.get(5).getKey().replace(" ", "_")%>');
        data.setCell(5, 2, 2+<%=pops.get(5).getValue()/3%>);
        
        data.setCell(6, 0, '<%=pops.get(6).getKey()%>');
        data.setCell(6, 1, 'http://en.wikipedia.org/wiki/+ <%=pops.get(6).getKey().replace(" ", "_")%>');
        data.setCell(6, 2, 2+<%=pops.get(6).getValue()/3%>);
       
        data.setCell(7, 0, '<%=pops.get(7).getKey()%>');
        data.setCell(7, 1, 'http://en.wikipedia.org/wiki/+ <%=pops.get(7).getKey().replace(" ", "_")%>');
        data.setCell(7, 2, 2+<%=pops.get(7).getValue()/2%>);
        
        data.setCell(8, 0, '<%=pops.get(8).getKey()%>');
        data.setCell(8, 1, 'http://en.wikipedia.org/wiki/+ <%=pops.get(8).getKey().replace(" ", "_")%>');
        data.setCell(8, 2, 2+<%=pops.get(8).getValue()/2%>);
        
        data.setCell(9, 0, '<%=pops.get(9).getKey()%>');
        data.setCell(9, 1, 'http://en.wikipedia.org/wiki/+ <%=pops.get(9).getKey().replace(" ", "_")%>');
        data.setCell(9, 2, 2+<%=pops.get(9).getValue()/2%>);

        
       
       var options = {
    		'text_color': '#E0F8F7',
   			'title' : '10 Most Popular Words about <%=request.getParameter("location")%>',
			'width' : 500,
			'height' : 500,
			'hover_text_color' : '#E0F8F7',
			'speed' : 100,

		};
		// Instantiate our table object.
		var vis = new gviz_word_cumulus.WordCumulus(document
				.getElementById('mydiv'));

		// Draw our table with the data we created locally.
		vis.draw(data, options);
	}
</script>
</head>
<body>
	<h2 align="center">Results on ${location}</h2>
	<h3 align="center">Hot Words In Tweets About ${location}</h3>

	<div class="col-md-5" id="chart_div"></div>
	<div class="col-md-5" id="mydiv"></div>
	<div class="row">
		<div class="col-md-6">
			<h3 align="center">Flickrs</h3>
			<table style="width: 100%">
				<c:forEach var="pic" items="${photos}" varStatus="status">
					<c:if test="${status.index % 2 == 0}">
						<tr>
					</c:if>
					<td align="center"><img src="${pic}" height="225px"
						width="300px"></td>
					<c:if test="${status.index % 2 == 1}">
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
		<div class="col-md-6">
			<h3 align="center">Tweets</h3>
			<table style="width: 90%" align="center">
				<c:forEach var="tweet" items="${tweets}">
					<tr>
						<td align="center">
							<blockquote class="twitter-tweet" data-link-color="#F6E3CE"
								data-theme="dark" lang="en">
								<a href="${tweet.url}"></a>
							</blockquote>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

	<div align="center">
		<form method="post" action="image.do">
			<input type="hidden" name="pid" value="${pid}" />
			<div id="tag-suggest-pop" style="display:block;" align="center">					
				<div class = "relative"></div>
					<div class="content">
					<button type="submit" name="button" class="btn btn-default btn-lg"
					name="collage">Click To Get Your Souvenir</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>