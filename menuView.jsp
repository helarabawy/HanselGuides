<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu View</title>
</head>
	<body text= #4c4c4c>
	<p style="font-size:200px;">
		<h1></h1>
</body>

<style>
	#arrow{
		display: block;
        position: absolute;
        margin: 0px auto;
        width: 10%;
        height:  60px;
        top: 5%;
        left:  5%;
        padding: 10px;
        border: none;
        border-radius: 10px;
        font-size: 50px;
        text-align: center;
        font-family: 'Verdana';
        background: #fff;
        color: #808080;
	
	}
	
	#losangeles{
        display: block;
        position: absolute;
        margin: 0px auto;
        width: 90%;
        height:  120px;
        top: 20%;
        left:  5%;
        padding: 10px;
        border: none;
        border-radius: 10px;
        font-size: 50px;
        text-align: center;
        font-family: 'Verdana';
        color: #fff;
        background: #58C3B7;
        box-shadow: 10px 10px 5px #888888;
    }
    
    #neworleans{
        display: block;
        position: absolute;
        margin: 0px auto;
        width: 90%;
        height:  120px;
        top: 30%;
        left:  5%;
        padding: 10px;
        border: none;
        border-radius: 10px;
        font-size: 50px;
        text-align: center;
        font-family: 'Verdana';
        color: #fff;
        background: #58C3B7;
        box-shadow: 10px 10px 5px #888888;
    }
    
        #santabarbara{
        display: block;
        position: absolute;
        margin: 0px auto;
        width: 90%;
        height:  120px;
        top: 40%;
        left:  5%;
        padding: 10px;
        border: none;
        border-radius: 10px;
        font-size: 50px;
        text-align: center;
        font-family: 'Verdana';
        color: #fff;
        background: #58C3B7;
        box-shadow: 10px 10px 5px #888888;
    }
    

    
     #sandiego{
        display: block;
        position: absolute;
        margin: 0px auto;
        width: 90%;
        height:  120px;
        top: 50%;
        left:  5%;
        padding: 10px;
        border: none;
        border-radius: 10px;
        font-size: 50px;
        text-align: center;
        font-family: 'Verdana';
        color: #fff;
        background: #58C3B7;
        box-shadow: 10px 10px 5px #888888;
    }
    
     #kauai{
        display: block;
        position: absolute;
        margin: 0px auto;
        width: 90%;
        height:  120px;
        top: 60%;
        left:  5%;
        padding: 10px;
        border: none;
        border-radius: 10px;
        font-size: 50px;
        text-align: center;
        font-family: 'Verdana';
        color: #fff;
        background: #58C3B7;
        box-shadow: 10px 10px 5px #888888;
    }
	
	 #santiago{
        display: block;
        position: absolute;
        margin: 0px auto;
        width: 90%;
        height: 120px;
        top: 70%;
        left:  5%;
        padding: 10px;
        border: none;
        border-radius: 10px;
        font-size: 50px;
        text-align: center;
        font-family: 'Verdana';
        color: #fff;
        background: #58C3B7;
        box-shadow: 10px 10px 5px #888888;
    }
    
     #cairo{
        display: block;
        position: absolute;
        margin: 0px auto;
        width: 90%;
        height:  120px;
        top: 80%;
        left: 5%;
        padding: 10px;
        border: none;
        border-radius: 10px;
        font-size: 50px;
        text-align: center;
        font-family: 'Verdana';
        color: #fff;
        background: #58C3B7;
        box-shadow: 10px 10px 5px #888888;
    }
    
     #seattle{
        display: block;
        position: absolute;
        margin: 0px auto;
        width: 90%;
        height:  120px;
        top: 90%;
        left: 5%;
        padding: 10px;
        border: none;
        border-radius: 10px;
        font-size: 50px;
        text-align: center;
        font-family: 'Verdana';
        color: #fff;
        background: #58C3B7;
        box-shadow: 10px 10px 5px #888888;
    }
    
    #sanfrancisco{
        display: block;
        position: absolute;
        margin: 0px auto;
        width: 90%;
        height:  120px;
        top: 100%;
        left: 5%;
        padding: 10px;
        border: none;
        border-radius: 10px;
        font-size: 50px;
        text-align: center;
        font-family: 'Verdana';
        color: #fff;
        background: #58C3B7;
        box-shadow: 10px 10px 5px #888888;
    }
    
      #louisville{
        display: block;
        position: absolute;
        margin: 0px auto;
        width: 90%;
        height:  120px;
        top: 110%;
        left: 5%;
        padding: 10px;
        border: none;
        border-radius: 10px;
        font-size: 50px;
        text-align: center;
        font-family: 'Verdana';
        color: #fff;
        background: #58C3B7;
        box-shadow: 10px 10px 5px #888888;
    }
</style>


	<button id='arrow' type="submit">< </button>
	<button id='losangeles' type="submit">Los Angeles ></button>
	<button id='neworleans' type="submit">New Orleans ></button>
	<button id='santabarbara' type="submit">Santa Barbara ></button>
	<button id='sandiego' type="submit">San Diego ></button>
	<button id='kauai' type="submit">Kauai ></button>
	<button id='santiago' type="submit">Santiago ></button>
	<button id='cairo' type="submit">Cairo ></button>
	<button id='seattle' type="submit">Seattle ></button>
	<button id='sanfrancisco' type="submit">San Francisco ></button>
	<button id='louisville' type="submit">Louisville ></button>
	
	
	<script>
		document.getElementById('losangeles').addEventListener('click', function () {
			location.href = "/Hansel_Test/views/losAngelesView.jsp";
		});
		
		document.getElementById('arrow').addEventListener('click', function () {
			location.href = "/Hansel_Test/views/homeView.jsp";
		});
	</script>

	
	
</html>
