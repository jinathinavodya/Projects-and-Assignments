function loadData (name)
{
	if (name=="button1")
		{
			
			document.getElementById("para1").innerHTML= "Added to watchlist";
		}
	else if (name=="button2")
		{
			
			document.getElementById("para2").innerHTML= "Added to watchlist";
		}
	else if (name=="button3")
		{
			
			document.getElementById("para3").innerHTML= "Added to watchlist";
		}
	else if (name=="button4")
		{
			
			document.getElementById("para4").innerHTML= "Added to watchlist";
		}
	else
		{
			alert("invalid");
		}
}