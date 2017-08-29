
////////////////////////////////////////////////////////////////////////
/////////////////////////// SETTING UP DOTS ////////////////////////////
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


function imagePopUp(){
	document.getElementById("img-popup").style.display = "block";
	document.getElementById("image-link").style.display = "none";
}
function imagePopDown(){
	document.getElementById("img-popup").style.display = "none";
	document.getElementById("image-link").style.display = "block";   
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
