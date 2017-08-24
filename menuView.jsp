<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="css/menuViewStyle.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
  <header class="fixed-header">
		<button id="nav-btn">
		      <i class="material-icons nav-icon">chevron_left</i>
	    </button>
	    
	    <script>
		document.getElementById('nav-btn').addEventListener('click', function () {
			location.href = "/Hansel_Test/views/homeView.jsp";
		});
		</script>
	
	
    <div class="title">
      <h1>Travel Guides</h1>
    </div>
    
    
    <button id="menu-btn">
      <i class="material-icons nav-icon">menu</i>
    </button>
    
    
  </header>
  
 </body>
 
  <script>
  var currLoc = "";
  
     	function goToWestwood() { 
     		if (currLoc != "Westwood") {
     			<%session.setAttribute("Location", "Westwood");%>;
     			currLoc = "Westwood";
     		}
     	}
     	
     	function goToDowntown() {
     		if (currLoc != "Downtown") {
	     		<%session.setAttribute("Location", "Downtown");%>;
	 			currLoc = "Downtown";
     		}
     	}
     	
     	function goToEchoPark() { 
     		if (currLoc != "EchoPark") {
	     		<%session.setAttribute("Location", "EchoPark");%>;
	 			currLoc = "EchoPark";
     		}
     	}
     	
     	function goToVeniceBeach() { 
     	}
  </script>
    
	<div class="main-container">

		<form> <button id="Westwood" class="btn" type="submit" formaction="templateMapView1.jsp" 
		onclick="goToWestwood()">
		<span>Westwood</span></button></form>	

		<form> <button id="Downtown" class="btn" type="submit" formaction="templateMapView1.jsp" 
		onclick="goToDowntown()">
		<span>Downtown</span></button></form>	
		
		<form> <button id="EchoPark" class="btn" type="submit" formaction="templateMapView1.jsp" 
		onclick="goToEchoPark()">
		<span>Echo Park</span></button></form>	

		<form> <button id="Venice Beach" class="btn" type="submit" formaction="templateMapView1.jsp" 
		onclick="goToVeniceBeach()">
		<span>Venice Beach</span></button></form>	

    </div>
    
   
 
</html>
