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
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript" src="http://word-cumulus-goog-vis.googlecode.com/svn/trunk/wordcumulus.js"></script>
    <script type="text/javascript" src="http://word-cumulus-goog-vis.googlecode.com/svn/trunk/swfobject.js"></script>
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
        data.addRows(10);
       <%
       ArrayList<Mapping> pops = (ArrayList<Mapping>) request.getAttribute("popular");
       %>

        data.setCell(0, 0, '<%=pops.get(0).getKey()%>');
        data.setCell(0, 1, 'http://en.wikipedia.org/wiki/+ <%=pops.get(0).getKey().replace(" ", "_")%>');
        <%--data.setCell(0, 2, '<%=pops.get(0).getValue()%>');--%>
        
        data.setCell(1, 0, '<%=pops.get(1).getKey()%>');  
        data.setCell(1, 1, 'http://en.wikipedia.org/wiki/+ <%=pops.get(1).getKey().replace(" ", "_")%>');
        <%--
                data.setCell(1, 2, '<%=pops.get(1).getValue()%>');
        --%>
        
        
        data.setCell(2, 0, '<%=pops.get(2).getKey()%>');
        data.setCell(2, 1, 'http://en.wikipedia.org/wiki/+ <%=pops.get(2).getKey().replace(" ", "_")%>');
        <%---
                data.setCell(2, 2, '<%=pops.get(2).getValue()%>');
        
        --%>
		data.setCell(3, 0, '<%=pops.get(3).getKey()%>');
        data.setCell(3, 1, 'http://en.wikipedia.org/wiki/+ <%=pops.get(3).getKey().replace(" ", "_")%>');
        <%---
                data.setCell(3, 2, '<%=pops.get(3).getKey()%>');
        
        --%>
        data.setCell(4, 0, '<%=pops.get(4).getKey()%>');
        data.setCell(4, 1, 'http://en.wikipedia.org/wiki/+ <%=pops.get(4).getKey().replace(" ", "_")%>');
        <%---
                data.setCell(4, 2, '<%=pops.get(4).getValue()%>');
        
        --%>
        data.setCell(5, 0, '<%=pops.get(5).getKey()%>');
        data.setCell(5, 1, 'http://en.wikipedia.org/wiki/+ <%=pops.get(5).getKey().replace(" ", "_")%>');
        <%---
                data.setCell(5, 2, '<%=pops.get(5).getValue()%>');
        
        --%>
        data.setCell(6, 0, '<%=pops.get(6).getKey()%>');
        data.setCell(6, 1, 'http://en.wikipedia.org/wiki/+ <%=pops.get(6).getKey().replace(" ", "_")%>');
        <%---
                data.setCell(6, 2, '<%=pops.get(6).getValue()%>');
        
        --%>
        data.setCell(7, 0, '<%=pops.get(7).getKey()%>');
        data.setCell(7, 1, 'http://en.wikipedia.org/wiki/+ <%=pops.get(7).getKey().replace(" ", "_")%>');
        <%---
                data.setCell(7, 2, '<%=pops.get(7).getValue()%>');
        
        --%>
        data.setCell(8, 0, '<%=pops.get(8).getKey()%>');
        data.setCell(8, 1, 'http://en.wikipedia.org/wiki/+ <%=pops.get(8).getKey().replace(" ", "_")%>');
        <%---
                data.setCell(8, 2, '<%=pops.get(8).getValue()%>');
        
        --%>
        data.setCell(9, 0, '<%=pops.get(9).getKey()%>');
        data.setCell(9, 1, 'http://en.wikipedia.org/wiki/+ <%=pops.get(9).getKey().replace(" ", "_")%>');
        <%---
                data.setCell(9, 2, '<%=pops.get(9).getValue()%>');
        
        --%>
        
       
       var options = {
   			'title' : '10 Most Popular Words about <%=request.getParameter("location")%>',
   			'width' : 1280,
   			'height' : 480,
   			'hover_text_color' : '#EFFBFB',
   			'speed': 100,
   			
   		};
        // Instantiate our table object.
        var vis = new gviz_word_cumulus.WordCumulus(document.getElementById('mydiv'));

        // Draw our table with the data we created locally.
        vis.draw(data, {text_color: '#00ff00', speed: 50, width:600, height:600});
       }
   </script>
</head>
<body>
	
	<h3 align="center">zSpot</h3>
	<h1 align="center">Results on ${location}</h1>
	<h3>Hot Words In Tweets About ${location}</h3>	
	<div id="mydiv" style="width:100%" align="center"></div>
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