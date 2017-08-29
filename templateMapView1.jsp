<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.hansel.test.conn.MySQLConn,java.sql.Connection,java.sql.DriverManager,java.sql.SQLException,java.sql.Statement,java.sql.PreparedStatement,java.sql.ResultSet"%>
	<!DOCTYPE html>
<html>
	<head>
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	  <link rel="stylesheet" href="css/mapViewStyle25.css">	  
	  <script src="https://hammerjs.github.io/dist/hammer.js"></script>
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	  <script type="text/javascript" src="mapTemplateFunction6.js"></script>
	  <script src="https://hammerjs.github.io/dist/hammer.js"></script>
	  <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.39.1/mapbox-gl.js'></script>
	  <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.39.1/mapbox-gl.css' rel='stylesheet' />
	  <link rel="stylesheet" type="text/css" href="slick-1.6.0/slick/slick.css"/>
	  
	    <style>
	        body { margin:0; padding:0; }
	        #map { position:absolute; top:0; bottom:0; width:100%; }
	    </style>
	  
<body>
<script>

	//////////////////////////////////////////////////////////////////////////
	///////////////// CHANGING LOCATION BASED ON FILE INPUT //////////////////
	//////////////////////////////////////////////////////////////////////////
	var LocationName = "${param.location}";
	var DisplayName = "${param.displayName}";
	var xAverage = 0;
	var yAverage = 0;
	
	
	
</script>
	
	<%@ page import = "java.util.*" import="java.io.*" %>
	<%
	String LocationName = (String)request.getParameter("location");

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
	var seqIDs = new Array(totalSpotCount);
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
		seqIDs[count] = <%=resultSet.getString("seq_id")%>;
		placeIDs[count] = <%=resultSet.getString("place_id")%>;
		placeNames[count] = "<%=resultSet.getString("place_name")%>";
		placeDescriptions[count] = "<%=resultSet.getString("place_description")%>";
		emojis[count] = "<%=resultSet.getString("place_emoji")%>";
		placeActivities[count] = "<%=resultSet.getString("place_activity")%>";
		images[count] = "<%=resultSet.getString("img_url")%>";
	
		xAverage += xValues[count];
		yAverage += yValues[count];
		
		count++;  
	<%
	}
	resultSet.close();
	%>
	
	xAverage = xAverage/totalSpotCount;
	yAverage = yAverage/totalSpotCount;
</script>

<!-- ////////////// HEADER \\\\\\\\\\\\\\-->
	<header id="fixed-header">
	  <div id="playlist-container" class="hidden">
          <div id="playlist-title"></div>
          <button id="close-btn" class="material-icons" onclick="collapse()">close</button>
          <div id="playlist">
              <div class="playlist-dot"></div>
             
           <script>
           //// Fixing playlist-line
           var height = totalSpotCount * 70;
           document.getElementsByClassName("playlist-dot")[0].style.top = height + "px";
	        document.getElementById('playlist-title').innerHTML = DisplayName;

           //////// CREATING PLAYLIST ON LOOP ///////
           		var toAdd = document.createDocumentFragment();
           		var currentSeqID = seqIDs[0];
           		var lineLength = 0;
           		var firstDotId;
				for (var i = 1; i <= totalSpotCount; i++) {
					lineLength++;
				  	// Mother div
					var item = document.createElement('div');
				   item.id = 'p'+i;
			
			       item.className = 'playlist-item';
					  
				  item.onclick = function() {
					  onClick(this);
				  };
				  
				  // Playlist circle
				   var playlistCircle = document.createElement('div');
				   playlistCircle.className = 'playlist-circle';
				   
				  // Playlist emoji
				   var playlistEmoji = document.createElement('div');
				   playlistEmoji.className = 'playlist-emoji';
				   playlistEmoji.innerHTML = emojis[i - 1];
				 
				  // Playlist activity
				   var text = document.createElement('p');
				   text.innerHTML = placeActivities[i - 1];
				   
				  // Playlist line(s)
				  
				  if (seqIDs[i - 1] != currentSeqID || i == totalSpotCount) {
					  currentSeqID = seqIDs[i - 1];
					  var playlistLine = document.createElement('div');
					  playlistLine.className = "playlist-line";
					 
					  var playlistLineHeight;
					  var playlistLinePos;
					  var diff;
					  
					  if (lineLength == i)
						  diff = 13;
					  else
						  diff = 0;
					  
					  
					  if (i == totalSpotCount) {
						  if (currentSeqID != 1) {
							  playlistLineHeight = (lineLength + 1) * 70;
							  playlistLinePos = -70 * (lineLength) + 13;
						  } else {
						 	playlistLineHeight = (lineLength) * 70;
						    playlistLinePos = -70 * (lineLength - 1) + 13;
						  }
					  } else {
						  playlistLineHeight = (lineLength - 2) * 70 ;
						  playlistLinePos = -70 * (lineLength - 1) + 13 ;
					  }
						  
					  playlistLine.style.height = playlistLineHeight + "px";
					  playlistLine.style.top = playlistLinePos + "px";
					  item.appendChild(playlistLine);
					  lineLength = 0;
				  }
				   
				   item.appendChild(text);
				   item.appendChild(playlistCircle);
				   item.appendChild(playlistEmoji);
				   
				   toAdd.appendChild(item);

				}
				document.getElementById('playlist').appendChild(toAdd);

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
	//////////////////////////// LOADING MAP ///////////////////////////////
	////////////////////////////////////////////////////////////////////////

	mapboxgl.accessToken = 'pk.eyJ1IjoiaGFuc2VsbWFwcyIsImEiOiJjajQ2bW15eWYwM2FtMnFsZGZranBhemNhIn0.97DqglQK1egBqDvKHYN94A';
	var map = new mapboxgl.Map({
	    container: 'map', // container id
	    style: 'mapbox://styles/hanselmaps/cj6i2oir54y382rs7r9ahn5lo', //stylesheet location
	    center: [xAverage, yAverage], // starting position
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
	
 <div id="place-dots-container" class="centered-x">
     <script>
 	//////////////////////////////////////////////////////////////////////////
 	//////////////////////// CREATING CARDS ON LOOP //////////////////////////
 	//////////////////////////////////////////////////////////////////////////

        var toAddDot = document.createDocumentFragment();
		for (var i = 0; i < totalSpotCount; i++) {
		  	// Mother div
		   var dotItem = document.createElement('div');
		   dotItem.id = 'd'+i;
		   dotItem.className = 'place-dot hidden';
			  
		   toAddDot.appendChild(dotItem);
		}
		document.getElementById('place-dots-container').appendChild(toAddDot);
       </script>    
 </div> 
     <script>
			var cardToAdd = document.createDocumentFragment();
			for (var i = 0; i < totalSpotCount; i++) {
			
				var placeBox = document.createElement('div');
				placeBox.className = "place-box";
				placeBox.onclick = "resizeCard()";
			
					var placeBoxBorder = document.createElement('div');
					placeBoxBorder.className = "place-box-border";
					
						var remove =  document.createElement('div');
						remove.className = "place-drag-icon centered-x material-icons";
						remove.innerHTML = 'remove';
						placeBoxBorder.appendChild(remove);
					
					var placeTitle = document.createElement('div');
					placeTitle.className = "place-title";
					placeTitle.innerHTML = placeNames[i];
					
					var placeLine = document.createElement('div');
					placeLine.className = "place-line";
					
					var placeInfo = document.createElement('div');
					placeInfo.className = "place-info";
					placeInfo.innerHTML = placeDescriptions[i];
					
					var goBtn = document.createElement('div');
					goBtn.className = "go-btn";
						
						var nav =  document.createElement('div');
						nav.className = "go-icon material-icons centered-x";
						nav.innerHTML = 'navigation';
						goBtn.appendChild(nav);
						
						var go =  document.createElement('div');
						go.className = "icon-text centered-x";
						go.innerHTML = 'GO!';
						goBtn.appendChild(go);
					
					var placeImage = document.createElement('div');
					placeImage.className = "place-image";
							
						var img =  document.createElement('img');
						img.className = "image-link";
						img.src =  images[i];
						placeImage.appendChild(img);
				
				placeBox.appendChild(placeBoxBorder);
				placeBox.appendChild(placeTitle);
				placeBox.appendChild(placeLine);
				placeBox.appendChild(placeInfo);
				placeBox.appendChild(goBtn);
				placeBox.appendChild(placeImage);
				
				cardToAdd.appendChild(placeBox);	
			}
			</script>
	<!--------------- CARD DECLARATION --------------->
		 
	<div id="place-box-container">
		<div class="place-slider">	 

		</div>
	</div>
		<script>
				document.getElementsByClassName("place-slider")[0].appendChild(cardToAdd);	
		</script>
			
	<div id="img-popup" onclick="imagePopDown()">
	        <button id="img-close-btn" class="material-icons" onclick="imagePopDown()">close</button>
	        <img id="img-popup-link" class="centered">
	</div>

		 
 <script> 

 	var index = 0;
	var delta = 0.0015;
	var isMaximized = false;
	

	////////////////////////////////////////////////////////////////////////
	//////////////////////////// CHANGING INDEX ////////////////////////////
	////////////////////////////////////////////////////////////////////////

 	function goToIndex() {

 		if (!hasStarted) {
 			loadIcons();
			document.getElementById("close-btn").style.display = "block";
			document.getElementById("start-btn").style.display = "none";
			screenFly();
			hasStarted = true;
 		} else {
	 		map.flyTo({
		        "center": [xValues[index], yValues[index] - isMaximized*delta],
		        "zoom": 15.5,
		        "speed": 1
		 	});
 		}
        $('.place-slider').slick('slickGoTo', index);

 		map.getSource('test2').setData({"geometry": {"type": "Point",
			"coordinates": [xValues[index], yValues[index]] }, "type": "Feature", "properties": {"title":placeIDs[index],}});
		
		document.getElementById('title-emoji').innerHTML = emojis[index];
		document.getElementById('activity').innerHTML = placeActivities[index];
		document.getElementById('img-popup-link').src = images[index];
		
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
 	
 	// going to previous stop
 	function goToPrevStop() {	
 		if (index > 0) {
			index--; 
			goToIndex();
 		} else
 			return;
 	}

	function screenFly() {	
		map.flyTo({
	        "center": [xValues[index], yValues[index]],
	        "zoom": 14.75,
	        "speed": 0.65
	 	});
	}
	

function placeBoxDown(){
    isMaximized = false;
    document.getElementById("place-box-container").style.height = "85px";
    document.getElementById("place-dots-container").style.bottom = "87px";
}
function placeBoxUp(){
    isMaximized = true;
    document.getElementById("place-box-container").style.height = "50%";
    document.getElementById("place-dots-container").style.bottom = "calc(50% + 2px)";
    map.flyTo({
	        "center": [xValues[index], yValues[index] - delta],
	        "zoom": 15.5,
	        "speed": 1
	});
}

function resizeCard() {
	if (isMaximized) {
			placeBoxDown();
		    map.flyTo({
		        "center": [xValues[index], yValues[index]],
		        "zoom": 15.5,
		        "speed": 1
		});
	} else
		placeBoxUp();
}	

	
	//////////////////////////////////////////////////////////////////////////
	////////////////// CLICKING ON VARIOUS LOCATIONS /////////////////////////
	//////////////////////////////////////////////////////////////////////////
	map.on('click', function (e) {
	    var features = map.queryRenderedFeatures(e.point, {layers: ['points']});
	     if (!features.length) {
	   	 	   placeBoxDown();
	     } else {
	    		index = features[0].properties.title - 1;
	            $('.place-slider').slick('slickGoTo', index);
	            placeBoxUp();
	    			goToIndex();
	 
	  	}
	});
	
	//////////////////////////////////////////////////////////////////////////
	///////////////////////////// LOCATING USER //////////////////////////////
	//////////////////////////////////////////////////////////////////////////

	map.addControl(new mapboxgl.GeolocateControl({
	    positionOptions: {
	        enableHighAccuracy: true
	    },
	    trackUserLocation: true
	}));

	//////////////////////////////////////////////////////////////////////////
	////////////////////////// CLICKING PLAYLIST /////////////////////////////
	//////////////////////////////////////////////////////////////////////////
	
	function onClick(place) {
		updateIndex(place);
		goToIndex(); 
		collapse();
	}

	function updateIndex(place) {
		index = place.id.substring(1) - 1;
	}

	function startGuide() {
		index = 0;
		document.getElementById("start-btn").style.display = "none";
		goToIndex();
		collapse();
	}
	
</script> 


    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
    <script type="text/javascript" src="slick-1.6.0/slick/slick.min.js"></script>
    
    <script type="text/javascript">
    
	//////////////////////////////////////////////////////////////////////////
	////////////////////////// SWIPE SLICK CARDS /////////////////////////////
	//////////////////////////////////////////////////////////////////////////
	
        $('.place-slider').slick({
            centerMode: true,
            centerPadding: '5vw',
            slidesToShow: 1,
            arrows: false,
            infinite: false,
        });
                
        $('.place-slider').on('beforeChange', function(event, slick, currentSlide, nextSlide){   
            index = nextSlide;
            goToIndex();
        });
        
        $('.slick-slider').on('click', '.slick-slide', function (e) {
	        	e.stopPropagation();
	        	resizeCard();
	     });
        
        $('.slick-slider').on('click', '.go-btn', function (e) {
	        	e.stopPropagation();
	        	navigate();
    		 });
        
        $('.slick-slider').on('click', '.place-image', function (e) {
        	e.stopPropagation();
        	imagePopUp();
		 });
    </script>
   
  
</body>
</html>
