<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
      
      .marker {
  background-image: url('red-pin-md.png');
  background-size: cover;
  width: 50px;
  height: 50px;
  border-radius: 50%;
  cursor: pointer;
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

	#first {
        display: block;
        position: absolute;
        visibility : hidden;
        margin: 0px auto;
        width: 5%;
        height: 50px;
        top: 12%;
        left: 52%;
        padding: 10px;
        border: none;
        border-radius: 200px;
        text-align: center;
        font-family: 'Helvetica';
        color: #fff;
        background: #58C3B7;
    }
    
    #second {
        display: block;
        position: absolute;
        margin: 0px auto;
        visibility: hidden;
        width: 5%;
        height: 50px;
        top: 48%;
        left: 48%;
        padding: 10px;
        border: none;
        border-radius: 200px;
        text-align: center;
        font-family: 'Helvetica';
        color: #fff;
        background: #58C3B7;
    }
    
    #third {
        display: block;
        position: absolute;
        visibility: hidden;
        margin: 0px auto;
        width: 5%;
        height: 50px;
        top: 75%;
        left: 39.6%;
        padding: 10px;
        border: none;
        border-radius: 200px;
        text-align: center;
        font-family: 'Helvetica';
        color: #fff;
        background: #58C3B7;
    }
</style>


<body>
<% int id = 0;
	String[] locations;
	locations = new String[3];
	locations[0] = "-118.260056,34.080067";
	locations[1] = "-118.260056,34.080067";
	locations[2] = "-118.260629,34.077697";
	String current_location = locations[0];
	%>

<br/>
<div id='map'></div>
<script>
		
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
	        "center": [<%=current_location%>],
	        "zoom": 16.5,
	        "speed": 0.65
	 	});

		 /*map.loadImage('https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Cat_silhouette.svg/400px-Cat_silhouette.svg.png', (error, image) => {
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
		                            "coordinates": [-118.259757,34.083329]
		                        }
		                    }]
		                }
		            },
		            "layout": {
		                "icon-image": "cat",
		                "icon-size": 0.20,
		                "icon-image": {
		                    "base": 1,
		                    "stops": [
		                    	[0, ""],
		                        [ 12, "cat"],
		                        [ 22, "cat"]
		                    ]
		                }
		            }
		        });
		    });*/
		 
	}
	
	setTimeout(screenFly, 2500);

	
	map.on('load', () => {


	});

	</script>
		<button id='nextStop' type="submit">Next Stop ></button>
		<button id='location' type="submit">Mayas' Tacos Restaurant</button>
		<button id='first' type="submit"></button>
		<button id='second' type="submit"></button>
		<button id='third' type="submit"></button>

		
	<script>
		function showButton() {	
			document.getElementById('nextStop').style.visibility = "visible";
			document.getElementById('location').style.visibility = "visible";
		}
		setTimeout(showButton, 3000);
		
		
		function showFirstLocation() {	document.getElementById('first').style.visibility = "visible"; }
		setTimeout(showFirstLocation, 4000);

		
		var x = "The Semi-Tropic";
		currLoc_name = String(x);
		
		
		document.getElementById('nextStop').addEventListener('click', function () {
			document.getElementById('location').innerText = currLoc_name;
			document.getElementById('first').style.visibility = "hidden";
			
			if (currLoc_name == "The Semi-Tropic")
			{
				document.getElementById('second').style.visibility = "visible";
			}

			if (currLoc_name == "Echoplex")
			{
				document.getElementById('second').style.visibility = "hidden";
				document.getElementById('third').style.visibility = "visible";
			}
			
			var x = "Echoplex";
			currLoc_name = String(x);
		});
		

	</script>
	
</body>
</html>
