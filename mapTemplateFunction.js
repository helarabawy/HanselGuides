<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1, maximum-scale=1">
	  <link rel="stylesheet" href="css/homeViewStyle.css">
	  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	  <title>Home View</title>
	</head>
<body>

	<img class="logo centered-x" src="/Hansel_Test/views/Hansel-logo.png" alt="Hansel Logo">
	<button id='travelGuides' class="btn-light-color centered-x" type="button"><span>Travel Guides > </span></button>
  

    <script>
    /// Travel Guides Button Functionality
		document.getElementById('travelGuides').addEventListener('click', function () {
			location.href = "/Hansel_Test/views/CFTMmenuView.jsp";
		});
    </script>
    
    <script src="https://hammerjs.github.io/dist/hammer.js"></script>

	<div id="myElement"></div>
	
	<style>
		#myElement {
		  background: white;
		  height: 100%;
		  text-align: center;
		}
	</style>
   
   <script> 
		var myElement = document.getElementById('myElement');
		
		// create a simple instance
		// by default, it only adds horizontal recognizers
		var mc = new Hammer(myElement);
		
		// let the pan gesture support all directions.
		// this will block the vertical scrolling on a touch-device while on the element
		
		// listen to events...
		mc.on("panleft", function(ev) {
			location.href = "/Hansel_Test/views/CFTMmenuView.jsp";
		});
	</script>
	
</body>
</html>
