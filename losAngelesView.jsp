<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="map-styles.css">
  	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  
	
	<title>Los Angeles Guide View</title>
	<script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.38.0/mapbox-gl.js'></script>
    <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.38.0/mapbox-gl.css' rel='stylesheet' />
    <style>
        body { margin:0; padding:0; }
        #map { position:absolute; top:0; bottom:0; width:100%; }
    </style> 
</head>

<style>	
		body {
		        margin: 0;
		        padding: 0;
		      }
		
		#map {
		        position: absolute;
		        top: 0;
		        bottom: 0;
		        width: 100%;
		      }
		      
	
		 #nextStop{
	        display: block;
	        position: absolute;
	        margin: 0px auto;
	        visibility: hidden;
	        width: 20%;
	        height:  60px;
	        top: 90%;
	        left:  5%;
	        padding: 10px;
	        border: none;
	        border-radius: 5px;
	        font-size: 25px;
	        text-align: center;
	        font-family: 'Verdana';
	        color: #fff;
	        background: #2D3A4B;
	        box-shadow: 10px 10px 5px #888888;
	      }
	      
	      	#location{
	        display: block;
	        position: absolute;
	        margin: 0px auto;
	        visibility: hidden;
	        width: 70%;
	        height:  200px;
	        top: 85%;
	        left:  28%;
	        padding: 10px;
	        border: none;
	        border-radius: 5px;
	        font-size: 40px;
	        text-align: center;
	        font-family: 'Verdana';
	        color: #2D3A4B;
	        background: #fff;
	        box-shadow: 10px 10px 5px #888888;
	    }

</style>


<body>



<%

//// STORING ALL THE LOCATIONS ////

	int id = 1;

	String[] locNames;
	locNames = new String[22];
	locNames[1] = "Mayas' Tacos Restaurant";
	locNames[2] = "The Semi-Tropic";
	locNames[3] = "Echoplex";
	locNames[4] = "Bellisimo Venice";
	locNames[5] = "Venice Canals";
	locNames[6] = "Venice Skate Park";
	locNames[7] = "Hotel Erwin";
	locNames[8] = "Salt & Straw";
	locNames[9] = "Burro";
	locNames[10] = "Gjelina";
	locNames[11] = "Bodega Wine Bar";
	locNames[12] = "The Room Santa Monica";
	locNames[13] = "Grand Central Market";
	locNames[14] = "Hauser & Wirth";
	locNames[15] = "Poketo";
	locNames[16] = "Street Art on Hewitt";
	locNames[17] = "Street Art on 4th";
	locNames[18] = "Street Art on Seaton";
	locNames[19] = "Arts District Park";
	locNames[20] = "Resident DTLA";
	locNames[21] = "Arts District Brewing Co.";


	String[] locCoord;
	locCoord = new String[22];
	locCoord[1] = "-118.259757,34.083329";
	locCoord[2] = "-118.259931,34.080014";
	locCoord[3] = "-118.260629,34.077697";
	locCoord[4] = "-118.470284,33.984910";
	locCoord[5] = "-118.467308,33.983648";
	locCoord[6] = "-118.475362,33.986873";
	locCoord[7] = "-118.472369,33.986830";
	locCoord[8] = "-118.465916,33.990774";
	locCoord[9] = "-118.465542,33.990550";
	locCoord[10] = "-118.464989,33.990390";
	locCoord[11] = "-118.489408,34.018466";
	locCoord[12] = "-118.234753,34.046342";
	locCoord[13] = "-118.248789,34.050691";
	locCoord[14] = "-118.234753,34.046342";
	locCoord[15] = "-118.465916,33.990774";
	locCoord[16] = "-118.465916,33.990774";
	locCoord[17] = "-118.237244,34.045002";
	locCoord[18] = "-118.237645,34.043009";
	locCoord[19] = "-118.235331,34.044591";
	locCoord[20] = "-118.234974,34.042719";
	locCoord[21] = "-118.235331,34.044591";
	
	String currLoc = locCoord[id];
	String currName = locNames[id];
%>

<br/>
<div id='map'></div>
<script>
	
//////////////////////////////////////////// EMBEDDING MAP //////////////////////////////////////////////

	mapboxgl.accessToken = 'pk.eyJ1IjoiaGFuc2VsbWFwcyIsImEiOiJjajQ2bW15eWYwM2FtMnFsZGZranBhemNhIn0.97DqglQK1egBqDvKHYN94A';
	
	// Set bounds to Los Angeles, CA
	var bounds = [
	    [-119, 33.4], // Southwest coordinates
	    [-117.5, 34.5]  // Northeast coordinates
	];
	
	var map = new mapboxgl.Map({
 	   	container: 'map', // container id
	    style: 'mapbox://styles/hanselmaps/cj4rqg8jr36572rmy9mzrb4ve', //hosted style id
		center: [-118.27, 34],
		zoom: 9.7,
		maxBounds: bounds // Sets bounds as max
	});
	
	// code from the next step will go here!
	var geojson = {
	  type: 'FeatureCollection',
	  features: [{
	    type: 'Feature',
	    geometry: {
	      type: 'Point',
	      coordinates: [-118.262,34.080]
	    },
	    properties: {
	      title: 'Mapbox',
	      description: 'California, Los Angeles'
	    }
	  }]
	};


		

</script>

<script>
		
	function screenFly() {	
		map.flyTo({
	        "center": [-118.259931,34.080014],
	        "zoom": 16.5,
	        "speed": 0.65
	 	});	 
	}
	
	setTimeout(screenFly, 2500);
	
	///////////////////// LOADING MAP ////////////////////////////
	map.on('load', () => {});

	</script>
		<button id='nextStop' type="submit">Next Stop ></button>
		<button id='location' type="submit">Mayas' Tacos Restaurant</button>			
	<script>
	
    //////////// SHOWING MAP BUTTONS ///////////////
		
		function showButton() {	
			document.getElementById('nextStop').style.visibility = "visible";
			document.getElementById('location').style.visibility = "visible";
			
			//////////////// CURRENT LOCATION MARKER ////////////////
			map.loadImage('https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Cat_silhouette.svg/400px-Cat_silhouette.svg.png', (error, image) => {
		        if (error) throw error;
		        map.addImage('cat', image);
		        map.addLayer({
		            "id": "points",
		            "type": "symbol",
		            "source": {
		                "type": "geojson",
		                "data": {
		                    "type": "FeatureCollection",
		                    "features": [{
		                        "type": "Feature",
		                        "geometry": {
		                            "type": "Point",
		                            "coordinates": [<%=currLoc%>]
		                        },
		                        "properties": {
		                        	"title": <%=id%>,
		                        }
		                    }]
		                }
		            },
		            "layout": {
		                "icon-image": "cat",
		                "icon-size": 0.25,
		                "text-field": "{title}",
		                "text-anchor": "top",
		            },
		           "paint": {
		                 "text-color": "#ffffff",
		            },
		            
		        });
		    });
		}
		setTimeout(showButton, 3000);
		
		
		
		
		//////// GIVING FUNCTIONALITY TO NEXT BUTTON
		var counter = 1;
		
		
		document.getElementById('nextStop').addEventListener('click', function () {
			counter = counter + 1;

			if (counter == 2) {
				currLoc_name = "The Semi-Tropic";
				
				map.getSource('points').setData({"geometry": {"type": "Point",
					"coordinates": [-118.259931,34.080014] }, "type": "Feature", "properties": {"title":counter,}});
			
			} else if (counter == 3) {
				currLoc_name = "Echoplex";
				
				map.getSource('points').setData({"geometry": {"type": "Point",
					"coordinates": [-118.260629,34.077697] }, "type": "Feature", "properties": {"title":counter,}});
			
			} else if (counter == 4) {
				currLoc_name = "Bellisimo Venice";
				
				map.flyTo({
			        "center": [-118.470284,33.984910],
			        "zoom": 15.65,
			        "speed": 0.65
			 	});
				
				map.getSource('points').setData({"geometry": {"type": "Point",
					"coordinates": [-118.470284,33.984910] }, "type": "Feature", "properties": {"title":counter-3,}});
			
			} else if (counter == 5) {
				currLoc_name = "Venice Canals";
				
				map.getSource('points').setData({"geometry": {"type": "Point",
					"coordinates": [-118.467308,33.983648] }, "type": "Feature", "properties": {"title":counter-3,}});
			} else if (counter == 6) {
				currLoc_name = "Venice Skate Park";
				
				map.getSource('points').setData({"geometry": {"type": "Point",
					"coordinates": [-118.475362,33.986873] }, "type": "Feature", "properties": {"title":counter-3,}});
			} else {
				counter = counter - 1;
			}
			
			
			document.getElementById('location').innerText = currLoc_name ;

			
		});
		

		

	</script>
	
</body>
</html>
