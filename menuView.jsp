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
  

	<div class="main-container">
		<form>
			<button class="btn" type="submit" formaction="losAngelesView.jsp"><span>Los Angeles</span></button>
		</form>
		
		<form>
			<button class="btn" type="submit" formaction="swipetest.jsp"><span>New Orleans</span></button>
		</form>	
	    <button class="btn" type="submit"><span>Brooklyn</span></button>
	    <button class="btn btn-disabled" type="submit"><span>Santa Barbara</span></button>
	    <button class="btn btn-disabled" type="submit"><span>San Diego</span></button>
	    <button class="btn btn-disabled" type="button"><span>Kauai</span></button>
	    <button class="btn btn-disabled" type="button"><span>Seattle</span></button>
	    <button class="btn btn-disabled" type="button"><span>Cairo</span></button>
	    <button class="btn btn-disabled" type="button"><span>Santiago</span></button>
    
    </div>
   
   
   
	  	
	  	
</html>