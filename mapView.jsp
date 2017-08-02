<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="css/mapViewStyle.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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

<script>

var datatext ={
            "type": "FeatureCollection",
            "features": [{
            	"type": "Feature",
                "geometry": {
                    "type": "Point",
                    "coordinates": [-118.259757,34.083329] },
                 "properties": { "title": "1"} 
                }, 
				
				{
                "type": "Feature",
                "geometry": {
                    "type": "Point",
                    "coordinates": [-118.259931,34.080014] },
                "properties": {"title": "2"} },
                
                {
                "type": "Feature",
                "geometry": {
                    "type": "Point",
                    "coordinates": [-118.260629,34.077697] }, 
                "properties": { "title": "3"} },
                
                {
                 "type": "Feature",
                 "geometry": {
                      "type": "Point",
                      "coordinates": [-118.470284,33.984910] }, 
                "properties": { "title": "4"} },
                
                {
                    "type": "Feature",
                    "geometry": {
                        "type": "Point",
                        "coordinates": [-118.467308,33.983648]
                }, "properties": { "title": "5"} },
                
                {
                    "type": "Feature",
                    "geometry": {
                        "type": "Point",
                        "coordinates": [-118.475362,33.986873]
                }, "properties": { "title": "6"} }
                
           ]
        };


var datatext2 ={
        "type": "FeatureCollection",
        "features": [{
            "type": "Feature",
            "geometry": {
                "type": "Point",
                "coordinates": [-118.259757,34.083329]
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

  
   <script src="https://hammerjs.github.io/dist/hammer.js"></script>

   
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
  
 
//////////// SETTNG TIMEOUT TO CALL FUNCTIONS ////////////
 setTimeout(showIcons, 3000);


 //////// GIVING FUNCTIONALITY TO NEXT BUTTON //////////
	var counter = 1;
 
	 function goToNextStop () {	
		counter = counter + 1;

		if (counter > 6)
			counter = 6;
		
		if (counter == 2) {
			currName = "The Semi-Tropic";
			map.getSource('test2').setData({"geometry": {"type": "Point",
				"coordinates": [-118.259931,34.080014] }, "type": "Feature", "properties": {"title":counter,}});
			
			map.flyTo({
		        "center": [-118.259931,34.080014],
		        "zoom": 14.5,
		        "speed": 0.65
		 	});
		
		} else if (counter == 3) {
			currName = "Echoplex";
			map.getSource('test2').setData({"geometry": {"type": "Point",
				"coordinates": [-118.260629,34.077697] }, "type": "Feature", "properties": {"title":counter,}});
			map.flyTo({
		        "center": [-118.260629,34.077697],
		        "zoom": 14.5,
		        "speed": 0.65
		 	});
			
		
		} else if (counter == 4) {
			currName = "Bellisimo Venice";
			map.flyTo({
		        "center": [-118.472,33.984910],
		        "zoom": 14.5,
		        "speed": 0.65
		 	});
			
			map.getSource('test2').setData({"geometry": {"type": "Point",
				"coordinates": [-118.470284,33.984910] }, "type": "Feature", "properties": {"title":counter,}});
		
		} else if (counter == 5) {	
			currName = "Venice Canals";
			map.getSource('test2').setData({"geometry": {"type": "Point",
				"coordinates": [-118.467308,33.983648] }, "type": "Feature", "properties": {"title":counter,}});
		
			map.flyTo({
		        "center": [-118.467308,33.983648],
		        "zoom": 14.5,
		        "speed": 0.65
		 	});
			
		} else if (counter == 6) {
			currName = "Venice Skate Park";
			map.getSource('test2').setData({"geometry": {"type": "Point",
				"coordinates": [-118.475362,33.986873] }, "type": "Feature", "properties": {"title":counter,}});
			
			map.flyTo({
		        "center": [-118.475362,33.986873],
		        "zoom": 14.5,
		        "speed": 0.65
		 	});
		} 
		
		document.getElementById('place-box').innerHTML = currName;
	}
	 
	 function goToLastStop() {	
			counter = counter - 1;
			if (counter <= 1)
				counter = 1;
			
	 		if (counter == 1) {
	 			currName = "Mayas' Tacos Restaurant";
				map.getSource('test2').setData({"geometry": {"type": "Point",
					"coordinates": [-118.259757,34.083329] }, "type": "Feature", "properties": {"title":counter,}});
				
				map.flyTo({
			        "center": [-118.259757,34.083329],
			        "zoom": 14.5,
			        "speed": 0.65
			 	});
	 	
	 			
	 		} else if (counter == 2) {
				currName = "The Semi-Tropic";
				map.getSource('test2').setData({"geometry": {"type": "Point",
					"coordinates": [-118.259931,34.080014] }, "type": "Feature", "properties": {"title":counter,}});
				
				map.flyTo({
			        "center": [-118.259931,34.080014],
			        "zoom": 14.5,
			        "speed": 0.65
			 	});
			
			} else if (counter == 3) {
				currName = "Echoplex";
				map.getSource('test2').setData({"geometry": {"type": "Point",
					"coordinates": [-118.260629,34.077697] }, "type": "Feature", "properties": {"title":counter,}});
				map.flyTo({
			        "center": [-118.260629,34.077697],
			        "zoom": 14.5,
			        "speed": 0.65
			 	});
				
			
			} else if (counter == 4) {
				currName = "Bellisimo Venice";
				map.flyTo({
			        "center": [-118.472,33.984910],
			        "zoom": 14.5,
			        "speed": 0.65
			 	});
				
				map.getSource('test2').setData({"geometry": {"type": "Point",
					"coordinates": [-118.470284,33.984910] }, "type": "Feature", "properties": {"title":counter,}});
			
			} else if (counter == 5) {	
				currName = "Venice Canals";
				map.getSource('test2').setData({"geometry": {"type": "Point",
					"coordinates": [-118.467308,33.983648] }, "type": "Feature", "properties": {"title":counter,}});
			
				map.flyTo({
			        "center": [-118.467308,33.983648],
			        "zoom": 14.5,
			        "speed": 0.65
			 	});
				
			} else if (counter == 6) {
				currName = "Venice Skate Park";
				map.getSource('test2').setData({"geometry": {"type": "Point",
					"coordinates": [-118.475362,33.986873] }, "type": "Feature", "properties": {"title":counter,}});
				
				map.flyTo({
			        "center": [-118.475362,33.986873],
			        "zoom": 14.5,
			        "speed": 0.65
			 	});
			} 
			
			document.getElementById('place-box').innerHTML = currName;
		}
		
		mc.on("swipeleft", goToNextStop);
		mc.on("swiperight", goToLastStop);
	//document.getElementById('nextStop').addEventListener('click', goToNextStop);
	//document.getElementById('next-stop-btn').addEventListener('click', goToNextStop);

  

		
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