

function gradient(id, level)
{
	var box = document.getElementById(id);
	box.style.opacity = level;
	box.style.MozOpacity = level;
	box.style.KhtmlOpacity = level;
	box.style.filter = "alpha(opacity=" + level * 100 + ")";
	box.style.display="block";
	
	
	
x = document.documentElement.scrollTop + document.body.scrollTop + 
box.offsetHeight / 4;
box.style.top = x + "px";

	return;
}


function fadein(id) 
{
	var level = 0;
	while(level <= 1)
	{
		setTimeout( "gradient('" + id + "'," + level + ")", (level* 1000) + 10);
		level += 0.01;
	}
}


// Open the lightbox


function openbox(formtitle, fadin,box1,filter1,boxtitle1)
{//alert('hi');
  var box = document.getElementById(box1); 
  document.getElementById(filter1).style.display='block';
  var filter=document.getElementById(filter1);
 
  var btitle = document.getElementById(boxtitle1);
  btitle.innerHTML = formtitle;
  //+" <a id='lnkClose' onclick='closebox("+box+","+filter1+")'  class='styleCloseX'>X</a>";
  
  if(fadin)
  {
	 gradient(box1, 0);
	 fadein(box1);
  }
  else
  { 	
    box.style.display='block';
  }
    	
}


// Close the lightbox

function closebox(box1,filter1)
{
   document.getElementById(box1).style.display='none';
   document.getElementById(filter1).style.display='none';
}



