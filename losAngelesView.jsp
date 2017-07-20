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
	}
	
	setTimeout(screenFly, 2000);



	
	map.on('load', () => {
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
	                            "coordinates": [-118.259757,34.083329]
	                        }
	                    }]
	                }
	            },
	            "layout": {
	                "icon-image": "cat",
	                "icon-size": 0.25
	            }
	        });
	    });
	});
	
	

	</script>
</body>
</html>
