<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="map-styles.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  
  <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.39.1/mapbox-gl.js'></script>
    <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.39.1/mapbox-gl.css' rel='stylesheet' />
    <style>
        body { margin:0; padding:0; }
        #map { position:absolute; top:0; bottom:0; width:100%; }
    </style>

</head>
<body>
  <header class="fixed-header">
    <button id="nav-btn">
      <i class="material-icons nav-icon">chevron_left</i>
    </button>
    <div class="title">
      <h1>Travel Guides</h1>
    </div>

    <button id="menu-btn">
      <i class="material-icons nav-icon">menu</i>
    </button>
  </header>


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

<script>

var datatext ={
            "type": "FeatureCollection",
            "features": [{
                "type": "Feature",
                "geometry": {
                    "type": "Point",
                    "coordinates": [-118.369427, 34.036543]
                },
		"properties": {
                        "title": "1"
		}
            }, {
                "type": "Feature",
                "geometry": {
                    "type": "Point",
                    "coordinates": [-118.479528, 34.037444]
                },
		"properties": {
                        "title": "2"
		}
            }, {
                "type": "Feature",
                "geometry": {
                    "type": "Point",
                    "coordinates": [-118.289626, 34.035645]
                },
		"properties": {
                        "title": "3"
		}
            }]
        };

</script>

<script>

map.on('load', function () {

    map.addSource("test", {
        "type": "geojson",
        "data": datatext
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
	    "circle-stroke-opacity": 0.4
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

});
</script>


    <div class="map-nav-container">
    <button class="map-nav-btn" type="button">
	<i class="material-icons map-nav-btn-icon centered-y">navigation</i>
	<span>Take me there</span>
    </button>
    <button class="map-nav-btn" type="button">
	<i class="material-icons map-nav-btn-icon centered-y">place</i>
	<span>Ok, I'm here</span>
    </button>
    <button class="map-nav-btn" type="button">
	<i class="material-icons map-nav-btn-icon centered-y">check</i>
	<span>Done</span>
    </button>
    <button class="map-nav-btn" type="button">
	<i class="material-icons map-nav-btn-icon centered-y">chevron_right</i>
	<span>Next Stop</span>
    </button>
  </div>
  

</body>
</html>