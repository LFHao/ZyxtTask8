<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1,user-scalable=no"/>
    <title>Start to explore the world!</title>
    <link rel="stylesheet" href="http://js.arcgis.com/3.8/js/esri/css/esri.css">
    <style>
      html, body, #map {
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
          basemap: "topo",
          center: [-180, 10],
          zoom: 3
        });
        map.on("layers-add-result");
        
        var template = new InfoTemplate();
        template.setTitle("\${name_en}, \${adm}");
        template.setContent("<form action=\"map.do\" method=\"POST\"><input type=\"hidden\" name=\"location\" value=\"\${name_en}\"/><input type=\"submit\" name=\"mapbutton\" value=\"Explore\"></form>");

        //add a layer to the map
        var featureLayer = new FeatureLayer("http://services.arcgis.com/V6ZHFr6zdgNZuVG0/ArcGIS/rest/services/WorldCities/FeatureServer/0", {
          mode: FeatureLayer.MODE_ONDEMAND,
          infoTemplate:template,
          outFields: ["name_en" , "adm"],
          
        });
        map.addLayer(featureLayer);
        
        //var color1 = new Color([247, 252, 185]); // yellow
        //var color2 = new Color([173, 221, 142]); // light green
        
        //var symbol = new SimpleMarkerSymbol(SimpleMarkerSymbol.STYLE_SQUARE, 10, new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID, new Color([255,0,0]), 1), new Color([0,255,0,0.25]));
        //var renderer = new SimpleRenderer(symbol);
        //featurelayer.setRenderer(renderer);
        //map.addLayer(featureLayer);      
      });
    </script>
  </head>
  <body>
    <div id="map"></div>
  </body>
</html> 
