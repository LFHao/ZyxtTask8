<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1,user-scalable=no" />
<title>Start to explore the world!</title>
<link rel="stylesheet"
	href="http://js.arcgis.com/3.8/js/esri/css/esri.css">
<link href="css/bootstrap.css" rel="stylesheet">

   
<style>
html,body,#map {
	height: 100%;
	margin: 0;
}

#info {
	position: absolute;
	right: 0;
	top: 0;
	padding: 10px;
	background-color: #999;
	font: 14px Segoe UI;
	width: 200px;
	text-align: center;
	border-radius: 0 0 0 10px;
}
</style>
<script src="http://js.arcgis.com/3.8/"></script>
<script>
    var map, calculateSquareMiles;
      require([
        "esri/map", "esri/layers/FeatureLayer", "esri/InfoTemplate", 
        "esri/symbols/SimpleFillSymbol", "esri/symbols/SimpleLineSymbol", "esri/renderers/ClassBreaksRenderer",
        "esri/dijit/Legend", "esri/symbols/SimpleMarkerSymbol", "esri/renderers/SimpleRenderer", 
        "dojo/_base/Color", "dojo/number", "dojo/domReady!"
      ], function(
        Map, FeatureLayer, InfoTemplate, 
        SimpleFillSymbol, SimpleLineSymbol, ClassBreaksRenderer,
        Legend, SimpleMarkerSymbol, SimpleRenderer, 
        Color, number
      ) {
        map = new Map("map", {
          basemap: "hybrid",
          center: [-180, 10],
          zoom: 3
        });
        map.on("layers-add-result");
        
        var template = new InfoTemplate();
        template.setTitle("\${name_en}, \${adm}"); 
        //template.setContent("<form action=\"map.do\" method=\"POST\"><input type=\"hidden\" name=\"location\" value=\"\${name_en}\"/><input type=\"submit\" name=\"mapbutton\" value=\"Explore\"></form>");
		template.setContent(getInfoContent("\${name_en}", "\${pop}", "\${lng}", "\${lat}", "\${rank}"));
        //add a layer to the map
        var featureLayer = new FeatureLayer("http://services.arcgis.com/V6ZHFr6zdgNZuVG0/ArcGIS/rest/services/WorldCities/FeatureServer/0", {
          mode: FeatureLayer.MODE_ONDEMAND,
          infoTemplate:template,
          outFields: ["name_en" , "adm", "pop", "lng", "lat", "rank"],
          
        });
        map.addLayer(featureLayer);  
      });
      
      function getInfoContent(name, population, lng, lat, rank, wiki) {
    	  var str = "";
    	  str += "<form action=\"map.do\" method=\"POST\">";
    	  str += "<table>";
    	  str += "<tr>";
    	  str += "<td>Population:</td><td>" + population + "</td>";
    	  str += "</tr>";
    	  str += "<tr>";
    	  str += "<td>Population Rank:</td><td>" + rank + "</td>";
    	  str += "</tr>";
    	  str += "<tr>";
    	  str += "<td>Longitude:</td><td>" + lng +"</td>";
    	  str += "</tr>";
    	  str += "<tr>";
    	  str += "<td>Latitude:</td><td>" + lat +"</td>";
    	  str += "</tr>";
    	  str += "<tr>";
    	  str += "<td>Wikipedia:</td><td><a href=\"http://en.wikipedia.org/wiki/" + name.replace(" ", "_") + "\" target=\"_blank\">Click Here</a></td>";
    	  str += "</tr>";
    	  str += "<tr><td colspan=\"2\" align=\"center\">";
    	  str += "<input type=\"hidden\" name=\"location\" value=\""+ name +"\"/>";
    	  str += "<input type=\"submit\" name=\"mapbutton\" value=\"Explore in zSpot\">";
    	  str += "</td></tr>";
    	  str += "</table>";
    	  str += "</form>";
    	  return str;
      }
    </script>
</head>
<body>
	<div id="searchBar" style="height: 50px; padding-bottom: 5px; padding-top: 5px;">
		<form class="form-signin" method="post" action="map.do">
			<center><input type="text" class="input-large search-query"  name ="search" placeholder="Enter a search Keyword">
			<input class="btn btn-primary" type="submit" name="btnSubmit" Value="search"></center>
		</form>
	</div>
	<div id="map"></div>
</body>
</html>
