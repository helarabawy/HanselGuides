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
    #goToGuide {
        display: block;
        position: relative;
        margin: 0px auto;
        width: 50%;
        height: 40px;
        padding: 10px;
        border: none;
        border-radius: 3px;
        font-size: 24px;
        text-align: center;
        color: #fff;
        background: #ee8a65;
    }
    
     #nextStop {
        display: block;
        position: absolute;
        margin: 0px auto;
        width: 20%;
        height: 40px;
        padding: 10px;
        border: none;
        border-radius: 3px;
        font-size: 24px;
        text-align: center;
        color: #fff;
        background: #ee8a65;
   		top:85%;
    }
</style>

<body>


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
		
	
	
</script>
		
		
		
	
	
    	<button id='goToGuide' type="submit">Go To Guide</button>
  		<button id='nextStop' type="submit">Next Stop</button>
		
		
	
	<script>
	nextStop.style.visibility = "hidden"
	
	document.getElementById('goToGuide').addEventListener('click', function () {
	    map.flyTo({
	        "center": [-118.262,34.080],
	        "zoom": 16
	    });
	    goToGuide.style.visibility = "hidden"
	    nextStop.style.visibility = "visible"	
	});
	
	
	document.getElementById('nextStop').addEventListener('click', function () {
	   
	});

	<%
	int id = 0;
	String current_location;
	String[] locations;
	locations = new String[3];
	locations[0] = "34.083329,-118.259757";
	locations[1] = "34.080067,-118.260056";
	locations[2] = "34.077697,-118.260629";
	
	/*
	var popup = new mapboxgl.Popup({closeOnClick: false})
	    .setLngLat([34.077697,-118.260629])
	    .setHTML('<h1>Current Spot</h1>')
	    .addTo(map);
	*/
	%>

	
	nextStop.style.visibility = "hidden"
	
	document.getElementById('nextStop').addEventListener('click', function () {
		<% 
		if (id<2){
			id = id +1;
		} if (id>=2){
			id = 0;
		} 
		current_location = locations[id];
		%>
		
		map.flyTo({
	        "center": [<%=current_location%>],
	        "zoom": 16
	    });
		
		

	    goToGuide.style.visibility = "hidden"
	    nextStop.style.visibility = "visible"	
	});
	
	
	document.getElementById('nextStop').addEventListener('click', function () {
	   
	});

    map.addControl(new mapboxgl.GeolocateControl());
    
    
    map.on('load', function () {

        map.addLayer({
            'id': 'currentLocation',
            'type': 'image',
            'url': 'http://images.clipartpanda.com/pin-clipart-qTBXEXxEc.svg',
        	'coordinates': [[34.082,-118.257],
        		[34.084,-118.257],
        		[34.084,-118.263],
        		[34.082,-118.263]]  
        });
       
    });
    

	
	</script>
</body>
</html>
