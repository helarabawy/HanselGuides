<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.hansel.test.conn.MySQLConn,java.sql.Connection,java.sql.DriverManager,java.sql.SQLException,java.sql.Statement,java.sql.PreparedStatement,java.sql.ResultSet"%>
	<!DOCTYPE html>
<html>
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	  <link rel="stylesheet" href="css/mapViewStyle11.css">
	  
	  <script src="https://hammerjs.github.io/dist/hammer.js"></script>
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	  <script src="https://hammerjs.github.io/dist/hammer.js"></script>
	  <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.39.1/mapbox-gl.js'></script>
	  <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.39.1/mapbox-gl.css' rel='stylesheet' />
	  
	  
	    <style>
	        body { margin:0; padding:0; }
	        #map { position:absolute; top:0; bottom:0; width:100%; }
	    </style>

<body>
<script>
	var LocationName = "${param.location}";
	var DisplayName = "${param.location}";
</script>

<% 

String LocationName = "Downtown";

	//////////////////////////////////////////////////////////////////////////
	//////////////////////// PULLING DATA FROM MYSQL /////////////////////////
	//////////////////////////////////////////////////////////////////////////
		Statement statement = null;
		Statement statement2 = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		ResultSet resultSet2 = null;

		//this is where you get your connection from the MySQLConn class(you will need to do this in every jsp that needs stuff from Database)
		MySQLConn conn = new MySQLConn();
		Connection connect = conn.makeConnect();
		Connection connect2 = conn.makeConnect();
		
		statement = connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,  
	            ResultSet.CONCUR_UPDATABLE);
		statement2 = connect2.createStatement();

		//the next line is where the SQL query/command is putx
		resultSet = statement.executeQuery("SELECT * FROM " + LocationName);
		resultSet2 = statement2.executeQuery("SELECT count(*) FROM " + LocationName);
	
		//obtaining number of rows from query and storing it in rowCount
		String rowCount = "";
		while(resultSet2.next()){
		rowCount = resultSet2.getString("count(*)");
		} resultSet2.close();
	
	//////////////////////////////////////////////////////////////////////////
%>	

<script>

var index = 0;
var hasStarted = false;
	//////////////////////////////////////////////////////////////////////////
	////////////////////// STORING RESULTSET IN ARRAYS ///////////////////////
	//////////////////////////////////////////////////////////////////////////
	var totalSpotCount = <%=rowCount%>; // pull data # of rows

	// Array Declarations
	var xValues = new Array(totalSpotCount);
	var yValues = new Array(totalSpotCount);
	var placeIDs = new Array(totalSpotCount);
	var placeNames = new Array(totalSpotCount);
	var placeDescriptions = new Array(totalSpotCount);
	var emojis = new Array(totalSpotCount);
	var placeActivities = new Array(totalSpotCount);
	var images = new Array(totalSpotCount);
	
	// Running count
	var count = 0;
	
	<%
	while (resultSet.next()){
	%>
		xValues[count] = <%=resultSet.getString("x")%>;
		yValues[count] = <%=resultSet.getString("y")%>;
		placeIDs[count] = <%=resultSet.getString("place_id")%>;
		placeNames[count] = "<%=resultSet.getString("place_name")%>";
		placeDescriptions[count] = "<%=resultSet.getString("place_description")%>";
		emojis[count] = "<%=resultSet.getString("place_emoji")%>";
		placeActivities[count] = "<%=resultSet.getString("place_activity")%>";
		images[count] = "<%=resultSet.getString("place_image")%>";
	
		count++;  
	<%
	}
	resultSet.close();
	%>
</script>

<!-- ////////////// HEADER \\\\\\\\\\\\\\-->
	<header id="fixed-header">
	  <div id="playlist-container" class="hidden">
          <div id="playlist-title"></div>
          <button id="close-btn" class="material-icons" onclick="collapse()">close</button>
          <div id="playlist">
              <div class="playlist-line"></div>
              <div class="playlist-dot"></div>
             
           <script>
           //// Fixing playlist-line
           var height = totalSpotCount * 70;
           var top = height - 13;
           document.getElementsByClassName("playlist-line")[0].style.height = height + "px";
           document.getElementsByClassName("playlist-dot")[0].style.top = height + "px";
           
           
           //////// CREATING PLAYLIST ON LOOP ///////
           		var toAdd = document.createDocumentFragment();
				for (var i = 1; i <= totalSpotCount; i++) {
				  	// Mother div
					var item = document.createElement('div');
				   item.id = 'p'+i;
			
			       item.className = 'playlist-item';
					  
				  item.onclick = function() {
					  onClick(this);
				  };
				  
				   var playlistCircle = document.createElement('div');
				   playlistCircle.className = 'playlist-circle';
				   
				   var playlistEmoji = document.createElement('div');
				   playlistEmoji.className = 'playlist-emoji';
				   playlistEmoji.innerHTML = emojis[i - 1];
				   
				   var text = document.createElement('p');
				   text.innerHTML = placeActivities[i - 1];
				   
				   item.appendChild(text);
				   item.appendChild(playlistCircle);
				   item.appendChild(playlistEmoji);
				   
				   toAdd.appendChild(item);
				}
				document.getElementById('playlist').appendChild(toAdd);
		        document.getElementById('playlist-title').innerHTML = DisplayName;

           </script>  
              
          </div>
          
          <div id="start-btn" onclick="startGuide()"> <p>START EXPLORING!</p></div>         
      </div>
      
      
	    <div id="title-container" onclick="expand()">
	        <h1 id="activity" class="title"></h1>
	        <button id="menu-btn" class=" centered-x material-icons">remove</button>
	        <div id="title-emoji"></div>
	    </div>
	</header>


<div id='map'></div>
<script>

////////////////////////////////////////////////////////////////////////
////////////////////////////LOADING MAP ///////////////////////////////
////////////////////////////////////////////////////////////////////////

mapboxgl.accessToken = 'pk.eyJ1IjoiaGFuc2VsbWFwcyIsImEiOiJjajQ2bW15eWYwM2FtMnFsZGZranBhemNhIn0.97DqglQK1egBqDvKHYN94A';
var map = new mapboxgl.Map({
    container: 'map', // container id
    style: 'mapbox://styles/hanselmaps/cj6i2oir54y382rs7r9ahn5lo', //stylesheet location
    center: [-118.369427, 34.036543], // starting position
    zoom: 9 // starting zoom
});
map.on('load', () => {});

//////////////////////////////////////////////////////////////////////////
////////////////////////// PLOTTING ALL POINTS ///////////////////////////
//////////////////////////////////////////////////////////////////////////
	var datatext = {};
	datatext['type'] = "FeatureCollection";
	datatext['features'] = [];
	for (var i = 0; i < totalSpotCount; i++) {
		var xVal = xValues[i];
		var yVal =  yValues[i];
		var place_id = placeIDs[i];
		
		var newFeature = {
			"type": "Feature",
			"geometry": {
				"type": "Point",
				"coordinates": [xVal,yVal]
			},
			"properties": {
				"title": place_id,
			}
		}
		datatext['features'].push(newFeature);
	}

//////////////////////////////////////////////////////////////////////////
////////////////////////// CURRENT LOCATION PT ///////////////////////////
//////////////////////////////////////////////////////////////////////////
	var datatext2 ={
	        "type": "FeatureCollection",
	        "features": [{
	            "type": "Feature",
	            "geometry": {
	                "type": "Point",
	                "coordinates": [xValues[0],yValues[0]]
	            }, "properties": {"title": "1"}}]
	    };
	


//////////////////////////////////////////////////////////////////////////
////////////////////// LOADING ALL ATTRACTIONS ///////////////////////////
//////////////////////////////////////////////////////////////////////////
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

<!--------------- CARD DECLARATION --------------->

 <div id="place-box">
 	<div id="touchable-area">
        <div id="place-box-border">
            <button id="place-drag-icon" class=" centered-x material-icons">remove</button>
        </div>
        <div id="place-title" class="centered-x"></div>
          
        <div id="place-dots-container">
          <script> //////// CREATING DOTS ON LOOP ///////
           	var toAddDot = document.createDocumentFragment();
			for (var i = 1; i <= totalSpotCount; i++) {
				  	// Mother div
				   var dotItem = document.createElement('div');
				   dotItem.id = 'd'+i;
				   dotItem.className = 'place-dot hidden';
					  
				   toAddDot.appendChild(dotItem);
				}
				document.getElementById('place-dots-container').appendChild(toAddDot);
         </script>    
      </div>    
   
        <div id="place-line" class="centered-x"></div>
        <div id="place-info"></div>
        <div id="go-btn" onclick="navigate()">
            <div id="go-icon" class="material-icons centered-x">navigation</div>
            <div class="icon-text centered-x">GO!</div>
        </div>
   
		
     </div>
        <div id="place-image" onclick="imagePopUp()">
			    <img id="image-link">        	
        </div>
 </div>
  
  
  
 <script> 
 
	////////////////////////////////////////////////////////////////////////
	//////////////////// SETTING UP DOTS /////////////////////////
	////////////////////////////////////////////////////////////////////////
	
	 var centerDot = 1;
	 var activeDot = 0;
	 function moveDots(){
	     var dots = document.getElementsByClassName("place-dot");
	     
	     for (var i = 0; i < totalSpotCount; i++)
	    	 dots[i].className = "place-dot hidden";
	     
	     activeDot = index ;
	     
	     if (activeDot > 0 && activeDot < totalSpotCount - 1)
	         centerDot = activeDot;
	     else if (activeDot == 0)
	         centerDot = activeDot + 1;
	     else if (activeDot == totalSpotCount - 1)
	         centerDot = activeDot - 1;
	     
	     try{dots[centerDot-3].className = "place-dot show smaller";} catch(err){}
	     try{dots[centerDot-2].className = "place-dot show small";} catch(err){}
	     try{dots[centerDot-1].className = "place-dot show";} catch(err){}
	     try{dots[centerDot].className = "place-dot show";} catch(err){}
	     try{dots[centerDot+1].className = "place-dot show";} catch(err){}
	     try{dots[centerDot+2].className = "place-dot show small";} catch(err){}
	     try{dots[centerDot+3].className = "place-dot show smaller";} catch(err){}    
	
	     try{dots[activeDot].className = "place-dot show active";} catch(err){}
	 }
	 
	////////////////////////////////////////////////////////////////////////
	//////////////////// SETTING UP TOUCH RESPONSE /////////////////////////
	////////////////////////////////////////////////////////////////////////
		var myElement = document.getElementById('touchable-area');
		var mc = new Hammer(myElement);
		mc.get('swipe').set({ threshold: 10});
		

	var index = 0;
	var delta = 0.002;
	var isMaximized = false;
	
 	function goToIndex() {


 		if (!hasStarted) {
 			loadIcons();
			document.getElementById("close-btn").style.display = "block";
			screenFly();
			hasStarted = true;
 		} else {
	 		map.flyTo({
		        "center": [xValues[index], yValues[index] - isMaximized*delta],
		        "zoom": 15.3,
		        "speed": 1
		 	});
 		}
 		
 		map.getSource('test2').setData({"geometry": {"type": "Point",
			"coordinates": [xValues[index], yValues[index]] }, "type": "Feature", "properties": {"title":placeIDs[index],}});
		
		document.getElementById('place-title').innerHTML = placeNames[index];
		document.getElementById('place-info').innerHTML = placeDescriptions[index];
		document.getElementById('title-emoji').innerHTML = emojis[index];
		document.getElementById('activity').innerHTML = placeActivities[index];
		document.getElementById('image-link').src = "/Hansel_Test/placeImages/" + LocationName + "/" + images[index] + ".png";
		document.getElementById('img-popup-link').src = "/Hansel_Test/placeImages/" + LocationName + "/" + images[index] + ".png";

		
		var newIDValue = index + 1;
		var newID = "p" + newIDValue;
		try {document.getElementsByClassName("active")[0].classList.remove("active");} catch(err){}
		document.getElementById(newID).classList.add("active");
		
		moveDots();
 	}
	
 	// going to next stop
 	function goToNextStop() {
 		if (index < totalSpotCount - 1) {
	 		index++;
			goToIndex();
 		} else
 			return;
 	}
 	
 	function goToPrevStop() {	
 		if (index > 0) {
			index--; 
			goToIndex();
 		} else
 			return;
 	}

		
		mc.on("swipeleft", goToNextStop);
		mc.on("swiperight", goToPrevStop);
		
	function screenFly() {	
		map.flyTo({
	        "center": [xValues[index], yValues[index]],
	        "zoom": 14.75,
	        "speed": 0.65
	 	});
	}
	
	//SWIPE UP/DOWN
	
	var card = document.getElementById('place-box');
	//create a simple instance
	//by default, it only adds horizontal recognizers
	var cardVerticalSwipe = new Hammer(card);
	
	//let the pan gesture support all directions.
	//this will block the vertical scrolling on a touch-device while on the element
	cardVerticalSwipe.get('pan').set({direction: Hammer.DIRECTION_ALL });
	
	
	
	// MAXIMIZE/MINIMIZE WINDOW
	   $(document).ready(function() {
			$('#place-box').animate({height: '85px'}); 

			mc.on("panup", function(ev) {
	  			   $('#place-box').animate({height: '60%'});
		  			 map.flyTo({
		  		        "center": [xValues[index], yValues[index] - delta],
		  		        "zoom": 15.3,
		  		        "speed": 1
		  		 	});
		  			 isMaximized = true;
		    	});
		   mc.on("pandown", function(ev) {
	    		   $('#place-box').animate({height: '85px'}); 
	    		   map.flyTo({
		  		        "center": [xValues[index], yValues[index]],
		  		        "zoom": 15.3,
		  		        "speed": 1
		  		 	});
	    		   isMaximized = false;
		    	});
		   mc.on("tap", function(ev) {
			   
			   if (isMaximized) {
		    		   $('#place-box').animate({height: '85px'}); 
		    		   map.flyTo({
			  		        "center": [xValues[index], yValues[index]],
			  		        "zoom": 15.3,
			  		        "speed": 1
			  		 	});
			   } else {
					   $('#place-box').animate({height: '60%'});
			  			 map.flyTo({
			  		        "center": [xValues[index], yValues[index] - delta],
			  		        "zoom": 15.3,
			  		        "speed": 1
			  		 	});
			   }
			   isMaximized = !isMaximized;
	    	});
	    	    
	});


	
	
	
//////////////////////////////////////////////////////////////////////////
////////////////////////////JS FUNCTIONS ////////////////////////////
//////////////////////////////////////////////////////////////////////////
function expand() {
	document.getElementById("fixed-header").style.height = "100%";
	document.getElementById("fixed-header").style.overflow = "auto";
	document.getElementById("playlist-container").style.display = "block";
	document.getElementById("title-container").style.display = "none";
}

function collapse(){
	document.getElementById("fixed-header").style.height = "10%";
	document.getElementById("fixed-header").style.overflow = "hidden";
	document.getElementById("title-container").style.display = "block";
	document.getElementById("playlist-container").style.display = "none";
}

function onClick(place) {
	updateIndex(place);
	goToIndex(); 
  	collapse();
}

function updateIndex(place) {
	index = place.id.substring(1) - 1;
}

function imagePopUp(){
    document.getElementById("img-popup").style.display = "block";
    document.getElementById("image-link").style.display = "none";
}
function imagePopDown(){
    document.getElementById("img-popup").style.display = "none";
    document.getElementById("image-link").style.display = "block";   
}

function startGuide() {
	index = 0;
	document.getElementById("start-btn").style.display = "none";
	goToIndex();
	collapse();
}

function navigate() {
	// Forming link
	var link = "https://www.google.com/maps?saddr=My+Location&daddr=" + yValues[index] + "," + xValues[index] + "&dirflg=w";
	
	if( (navigator.platform.indexOf("iPhone") != -1) 
        || (navigator.platform.indexOf("iPod") != -1)
        || (navigator.platform.indexOf("iPad") != -1))
         window.open(link);
    else
         window.open(link);
	
}

//////////////////////////////////////////////////////////////////////////
////////////////// CLICKING ON VARIOUS LOCATIONS /////////////////////////
//////////////////////////////////////////////////////////////////////////
map.on('click', function (e) {
    var features = map.queryRenderedFeatures(e.point, {layers: ['points']});
     if (!features.length) {
		   $('#place-box').animate({height: '85px'}); 
		   map.flyTo({
  		        "center": [xValues[index], yValues[index]],
  		        "zoom": 15.3,
  		        "speed": 1
  		 	});
		   isMaximized = false;
     } else {
    		index = features[0].properties.title - 1;
    		goToIndex();
    		 $('#place-box').animate({height: '60%'});
  			 map.flyTo({
  		        "center": [xValues[index], yValues[index] - delta],
  		        "zoom": 15.3,
  		        "speed": 1
  		 	});
  			 isMaximized = true;   
  	}
});
</script> 

<div id="img-popup" onclick="imagePopDown()">
        <button id="img-close-btn" class="material-icons" onclick="imagePopDown()">close</button>
        <img id="img-popup-link" class="centered">
</div>
  
</body>
</html>
