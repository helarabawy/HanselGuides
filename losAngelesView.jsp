
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.hansel.test.conn.MySQLConn,java.sql.Connection,java.sql.DriverManager,java.sql.SQLException,java.sql.Statement,java.sql.PreparedStatement,java.sql.ResultSet"%>
	<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="css/mapViewStyle.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <script src="https://hammerjs.github.io/dist/hammer.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://hammerjs.github.io/dist/hammer.js"></script>
  <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.39.1/mapbox-gl.js'></script>
    <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.39.1/mapbox-gl.css' rel='stylesheet' />
    <style>
        body { margin:0; padding:0; }
        #map { position:absolute; top:0; bottom:0; width:100%; }
    </style>

</head>
<body>
  

<div id='map'></div>
<script>
mapboxgl.accessToken = 'pk.eyJ1IjoiaGFuc2VsbWFwcyIsImEiOiJjajQ2bW15eWYwM2FtMnFsZGZranBhemNhIn0.97DqglQK1egBqDvKHYN94A';
var map = new mapboxgl.Map({
    container: 'map', // container id
    style: 'mapbox://styles/mapbox/streets-v9', //stylesheet location
    center: [-118.369427, 34.036543], // starting position
    zoom: 9 // starting zoom
});
</script>

<% 
	//setting up variables (will need to do this in every jsp that needs stuff from Database)
	Statement statement = null;
	Statement statement1 = null;
	Statement statement2 = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	ResultSet resultSet1 = null;
	ResultSet resultSet2 = null;
	
	//variables
	int k = 1;
	String rowCount = "0";
	String firstX = "0";
	String firstY = "0";
	String x;
	String y;
	String place_description;
	
	//this is where you get your connection from the MySQLConn class(you will need to do this in every jsp that needs stuff from Database)
	MySQLConn conn = new MySQLConn();
	Connection connect = conn.makeConnect();
	Connection connect1 = conn.makeConnect();
	Connection connect2 = conn.makeConnect();
	statement = connect.createStatement();
	statement1 = connect1.createStatement();
	statement2 = connect2.createStatement();
	
	//the next line is where the SQL query/command is putx
	resultSet = statement.executeQuery("SELECT * FROM LosAngeles");
	resultSet1 = statement1.executeQuery("SELECT count(*) FROM LosAngeles");
	resultSet2 = statement2.executeQuery("SELECT * FROM LosAngeles WHERE id=1");
	
	//obtaining number of rows from query and storing it in rowCount
	while(resultSet1.next()){
		rowCount = resultSet1.getString("count(*)");
	} resultSet1.close();
	
	//obtaining first coordinates from query for dataText2 and storing it in firstX and firstY
	while(resultSet2.next()){
		firstX = resultSet2.getString("x");
		firstY = resultSet2.getString("y");
	} resultSet2.close();
	
	
	//this is where you retrieve the values from the table and store them in variables
	//btw,the condition for this while loop 'resultSet.next()' basically means that while there is a row that I can read, do the following:
	//if there were multiple rows selected(which isn't the case rn since I only selected one row), then the loop would loop for the amount of rows that are selected, and the values would change based on what row is selected
    while(resultSet.next()){
		//the stuff in quotes is the name of the column in the table
		x = resultSet.getString("x");
		y = resultSet.getString("y");
		place_description = resultSet.getString("place_description");
	}
%>

<script>
var totalSpotCount = <%=rowCount%>; // pull data # of rows

var datatext = {};
datatext['type'] = 'FeatureCollection';
datatext['features'] = [];

<%
while (resultSet.next()){
%>
	var newFeature = {
		"type": "Feature",
		"geometry": {
			"type": "Point",
			"coordinates": [-118.259757,34.083329]
		},
		"properties": {
			"title": "2",
		}
	}
	datatext['features'].push(newFeature);
<%
}
resultSet.close();
%>

var datatext2 ={
        "type": "FeatureCollection",
        "features": [{
            "type": "Feature",
            "geometry": {
                "type": "Point",
                "coordinates": [<%=firstX%>,<%=firstY%>]
            }, "properties": {"title": "1"}}]
    };
</script>

<script>
//////////// LOADING ALL ATTRACTIONS ////////////
function loadIcons() {
    map.addSource("test", {
        "type": "geojson",
        "data": datatext
    });
    map.addSource("test2", {
        "type": "geojson",
        "data": datatext2
    });
    
    map.addLayer({
        "id": "location",
        "type": "circle",
        "source": "test2",
        "paint": {
            "circle-radius": 17,
            "circle-color": "#58C3B7",
            "circle-opacity": 0.8,
	    "circle-stroke-width": 8,
	    "circle-stroke-color": "white",
	    "circle-stroke-opacity": 0.4
        }
    });
    
    map.addLayer({
        "id": "points",
        "type": "circle",
        "source": "test",
        "paint": {
            "circle-radius": 12,
            "circle-color": "#2D3A4B",
	    "circle-stroke-width": 5,
	    "circle-stroke-color": "#58C3B7",
	    "circle-stroke-opacity": 0
        }
    });
    map.addLayer({
        id: "seq-id",
        type: "symbol",
        source: "test",
        layout: {
            "text-field": "{title}",
            "text-font": ["Open Sans Semibold", "Arial Unicode MS Bold"],
            "text-size": 16,
        },
	paint: {
	    "text-color": "#fff"
        },
    });
    
}
</script>

    
	<div id="place-box" align=center>
	    <span>Mayas' Tacos Restaurant</span>
    </div>

  

   
   <script> 
		var myElement = document.getElementById('place-box');
		
		// create a simple instance
		// by default, it only adds horizontal recognizers
		var mc = new Hammer(myElement);
		
		// let the pan gesture support all directions.
		// this will block the vertical scrolling on a touch-device while on the element
		mc.get('swipe').set({ threshold: 10});
		// listen to events...
		
	</script>
  
  
  <script>
    
//////////// SHOWING ALL ATTRACTIONS ////////////
  function showIcons(){
	  map.on('load', loadIcons());
  }
  
 
//////////// SETTNG TIMEOUT TO CALL FUNCTIONS //////////
 setTimeout(showIcons, 3000);
 
 //////// GIVING FUNCTIONALITY TO NEXT BUTTON //////////
	var counter = 1;
 /*
 	goTo(int counter) {
 		
 		document.getElementById('place-box').innerHTML = text, do something similar for description; 		
 		
 		map.getSource('test2').setData({"geometry": {"type": "Point",
			"coordinates": [here ill put the coordinates I pulled] }, "type": "Feature", "properties": {"title":counter,}});
		
		map.flyTo({
	        "center": [here ill put the coordinates I pulled],
	        "zoom": 14.5,
	        "speed": 0.65
	 	});
 	}
	
 	// going to next stop
 	function goToNextStop() {	
		if (counter >= totalSpotCount) {
			return;
		} else {
			counter = counter + 1;	
		}
		goTo(counter);
	 }
	 
 	// going to last stop
	 function goToLastStop() {	
		 if (counter =< 1) {
				return;
			} else {
				counter = counter - 1;	
			}
			goTo(counter);
		}
		
		mc.on("swipeleft", goToNextStop);
		mc.on("swiperight", goToLastStop);
*/
		
	function screenFly() {	
		map.flyTo({
	        "center": [-118.259757,34.083329],
	        "zoom": 14.75,
	        "speed": 0.65
	 	});	 
	}
	
	setTimeout(screenFly, 2500);
	
	//SWIPE UP/DOWN
	
	var card = document.getElementById('place-box');
	//create a simple instance
	//by default, it only adds horizontal recognizers
	var cardVerticalSwipe = new Hammer(card);
	
	//let the pan gesture support all directions.
	//this will block the vertical scrolling on a touch-device while on the element
	cardVerticalSwipe.get('pan').set({ direction: Hammer.DIRECTION_ALL });
	
	
	
	
	// MAXIMIZE/MINIMIZE WINDOW
	var x = true;
	   $(document).ready(function() {
			$('#place-box').animate({height: '50px'}); 
	    
	    mc.on("panup", function(ev) {
  			   $('#place-box').animate({height: '75%'});
	    	});
	    
	    mc.on("pandown", function(ev) {
    		   $('#place-box').animate({height: '50px'}); 
	    	});
	    
	    
	});
	</script>
	
	

<script>
	
	///////////////////// LOADING MAP ////////////////////////////
	map.on('load', () => {});
</script>




    
</body>
</html>