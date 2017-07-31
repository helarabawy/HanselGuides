<!DOCTYPE html>
<html>
	<head>
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <link rel="stylesheet" href="css/homeViewStyle.css">
	  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	  <title>Home View</title>
	</head>
<body>

	<img class="logo centered-x" src="/Hansel_Test/views/Hansel-logo.png" alt="Hansel Logo">
	<button id='travelGuides' class="btn-light-color centered-x" type="button"><span>Travel Guides</span></button>
  
    <script>
		document.getElementById('travelGuides').addEventListener('click', function () {
			location.href = "/Hansel_Test/views/menuView.jsp";
		});
	</script>
	
</body>
</html>