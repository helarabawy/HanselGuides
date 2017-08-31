<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/CFTMmenuViewStyle4.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
  <header id="fixed-header">
  	<form class="centered-y"><button id="nav-btn" formaction="homeView.jsp">
  		<i class="material-icons nav-icon">chevron_left</i>
  	</button></form>
  	
    <div class="title centered">
      <h1>Hansel</h1>
    </div>
  </header>

  <div id="main-container">
      
    <form>
    	<button class="btn" type="submit" formaction="templateMapView1.jsp">
	        <img class="centered" src="placeImages/SantaMonica.png">
	        <div class="black-rectangle L">Santa Monica</div>
	        <p class="centered-y L">Santa Monica</p>
        </button>
        
     	<input type="hidden" name="location" value="SantaMonica">
     	<input type="hidden" name="displayName" value="Santa Monica">
    
    </form>
    
    
    <form>
    	<button class="btn" type="submit" formaction="templateMapView1.jsp">
	        <img class="centered" src="placeImages/Westwood.png">
	        <div class="black-rectangle R">Westwood</div>
	        <p class="centered-y R">Westwood</p>
        </button>
        
     	<input type="hidden" name="location" value="Westwood">
     	<input type="hidden" name="displayName" value="Westwood">
    
    </form>
    
    <form>
    	<button class="btn" type="submit" formaction="templateMapView1.jsp">
	        <img class="centered" src="placeImages/Downtown.png">
	        <div class="black-rectangle L">Downtown</div>
	        <p class="centered-y L">Downtown</p>
        </button>
        
     	<input type="hidden" name="location" value="Downtown">
     	<input type="hidden" name="displayName" value="Downtown">
    
    </form>
    
    
    <form>
    	<button class="btn" type="submit" formaction="templateMapView1.jsp">
	        <img class="centered" src="placeImages/Hollywood.png">
	        <div class="black-rectangle R">Hollywood</div>
	        <p class="centered-y R">Hollywood</p>
        </button>
        
     	<input type="hidden" name="location" value="Hollywood">
     	<input type="hidden" name="displayName" value="Hollywood">
    
    </form>
    
     <form>
    	<button class="btn" type="submit" formaction="templateMapView1.jsp">
	        <img class="centered" src="placeImages/Venice.png">
	        <div class="black-rectangle L">Venice</div>
	        <p class="centered-y L">Venice</p>
        </button>
        
     	<input type="hidden" name="location" value="Venice">
     	<input type="hidden" name="displayName" value="Venice">
    
    </form>
    
    <form>
    	<button class="btn" type="submit" formaction="templateMapView1.jsp">
	        <img class="centered" src="placeImages/EchoPark.png">
	        <div class="black-rectangle R">Echo Park</div>
	        <p class="centered-y R">Echo Park</p>
        </button>
        
     	<input type="hidden" name="location" value="EchoPark">
     	<input type="hidden" name="displayName" value="Echo Park">
    
    </form>
    

    
 
  </div>
  

    
</body>
</html>
