<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home View</title>
</head>
<body>
	<center>
		
		<img src="https://preview.ibb.co/doFdXv/Screen_Shot_2017_07_05_at_2_25_18_PM.png" alt="Hansel Logo" 
		height="488" width="750" style="position: absolute; left: 13%; top: 24%" >
	</center>
</body>

<style>
	
	#travelGuides {
        display: block;
        position: absolute;
        margin: 0px auto;
        width: 50%;
        height: 100px;
        top: 70%;
        left: 25%;
        padding: 10px;
        border: none;
        border-radius: 10px;
        font-size: 40px;
        text-align: center;
        font-family: 'Helvetica';
        color: #fff;
        background: #58C3B7;
    }
    
    @media (orientation: portrait) {
	.playfield { display: block; }
	.overlay { display: none; }
}
	
</style>
	
	
	<button id='travelGuides' type="submit">TRAVEL GUIDES ></button>
	
	<script>
		document.getElementById('travelGuides').addEventListener('click', function () {
			location.href = "/Hansel_Test/views/menuView.jsp";
		});
	</script>
	
	
</html>

   