<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Demo JavaScript PNG Viewer</title>
    <!--- this code is used in the back office. this code is provided an image name. The image is processed by javascript to discern the 
	no. of distinct groups using pre-defined color value. For each group we need to know from the user the count and size and shape. The size would be 
	given in a alphabetically named sizes and shapes. From the alphatecial name we will compute the carats. Carats will be used for the new stone selected
	the price to be charged. --->
	<style type="text/css">
		.pixel {
			width: 1px;
			height: 1px;
			overflow: hidden;
           position:absolute;
		}
		#nativeimage {
			position: absolute;
			left: 10px;
			top: 112px;
		}
		#image {
			position: absolute;
			left: 10px;
			top: 40px;
		}
		#largeimage {
			position: absolute;
			border: 1px solid #000;
			top: 40px;
			left: 200px;
		}
			#largeimage .pixel {
				width: 3px;
				height: 3px;
			}
    </style>
<cffile action="readBinary" 
	file="#application.rootfolder##urldecode(url.img)#" 
	variable="aBinaryObj" charset="utf-8"   /> 
				<cfscript>
				b = BinaryEncode(aBinaryObj, 'Base64');
				//b = toBase64(aBinaryObj,'iso-8859-1');
				</cfscript>

<script type="text/javascript" src="../imagejs/Base64.js"></script>
<script type="text/javascript" src="../imagejs/Deflate.js"></script>
<script type="text/javascript" src="../imagejs/PNG.js" ></script>
<script language="javascript1.1" type="text/javascript">
		<cfoutput>
				var gravatar = '#b#';
	</cfoutput>
	// JavaScript Document

function rgbToHsv(red, green, blue)
{
    var max = Math.max(Math.max(red, green), blue);
    var min = Math.min(Math.min(red, green), blue);
    var hue;
    var saturation;
    var value = max;
    if (min == max)
    {
        hue = 0;
        saturation = 0;
    }
    else
    {
        var delta = (max - min);
        saturation = delta / max;
        if (red == max)
        {
            hue = (green - blue) / delta;
        }
        else if (green == max)
        {
            hue = 2 + ((blue - red) / delta);
        }
        else
        {
            hue = 4 + ((red - green) / delta);
        }
        hue /= 6;
        if (hue < 0)
        {
            hue += 1;
        }
        if (hue > 1)
        {
            hue -= 1;
        }
    }
    return {
        h: hue,
        s: saturation,
        v: value
    };
}
	function hsvToRgb(hue, saturation, value)
{
    var red;
    var green;
    var blue;
    if (value == 0.0)
    {
        red = 0;
        green = 0;
        blue = 0;
    }
    else
    {
        var i = Math.floor(hue * 6);
        var f = (hue * 6) - i;
        var p = value * (1 - saturation);
        var q = value * (1 - (saturation * f));
        var t = value * (1 - (saturation * (1 - f)));
        switch (i)
        {
            case 1: red = q; green = value; blue = p; break;
            case 2: red = p; green = value; blue = t; break;
            case 3: red = p; green = q; blue = value; break;
            case 4: red = t; green = p; blue = value; break;
            case 5: red = value; green = p; blue = q; break;
            case 6: // fall through
            case 0: red = value; green = t; blue = p; break;
        }
    }
    return {r: red, g: green, b: blue};
}

String.prototype.padRight = function(c, n){
	var txt = '';
	for(var i=0;i<n-this.length;i++) txt += c;
		return txt + this;
};
function left(str, n){
	if (n <= 0)
	    return "";
	else if (n > String(str).length)
	    return str;
	else
	    return String(str).substring(0,n);
}
function right(str, n){
    if (n <= 0)
       return "";
    else if (n > String(str).length)
       return str;
    else {
       var iLen = String(str).length;
       return String(str).substring(iLen, iLen - n);
    }
}
function hlookup(b)
{
if (b == 'f')
  return 15;
 if (b == 'e')
   return 14;
 if (b == 'd')
   return 13;
 if (b == 'c')
   return 12;
 if (b == 'b')
   return 11;
 if (b == 'a')
   return 10;
   c = b*1 + 0 ;
   return c;
   
}
function h2d(a)
{
var msb = left(a,1);
var lsb = right(a,1);
 msbd = hlookup(msb)*16;
 lsbd = hlookup(lsb);
 d = msbd*1 + lsbd*1 + 0;
 return d;
}
var groups_count = 0 ;
var image_name = <cfoutput>"#urldecode(url.img)#"</cfoutput>;
var stone_col, stone_row;
var groups = Array(0,0,0,0,0,0); 

function show(data){

//document.getElementById('nativeimage').src = document.getElementById('place').firstChild.src;
	var png = new PNG(data);

while(line = png.readLine())
	{ 
	for (var x = 0; x < line.length; x++){
		  newcolor = line[x] ;
          var n = 0 ;
		  if (  newcolor < 16777100) 
			 {
		 	 var t = newcolor.toString(16).padRight('0', 6);
             if (t != n)
			    {
			     n = t;    
		    	 switch(n)
			  		{
				  	case '8d66d3':
					  	groups[1] = 1 ;
					  	break;
				 	case 2:
					 	 break;
				    }
			     }
		     }
	    }
     }

for (j=0;j<=5;j++)
   {

if (groups[j])
    groups_count++;
}

	if (groups_count)
	{
	var form_ = document.getElementById('metadata_form');	
	var image_id = document.createElement('input');
		image_id.type='hidden';
		image_id.name='image_name';
		image_id.value= image_name;
		form_.appendChild(image_id);
for (i = 0 ; i <= groups_count;i++) 
		{
var inp = document.createElement('div');
		inp.innerHTML = "Description: <input type='text' value='Selection " & i & "' name='group_" & i & "' > <br />Shape: <input type='text' name='shape_" & i &"' > <br />Size: <input type='text' name='size_" & i & "' >";

form_.appendChild(inp);
		}
	var image_id = document.createElement('input');
		image_id.type='submit';
	form_.appendChild(image_id);
	}

return true;
}
</script>



</head>
  <body 	onLoad="show(gravatar);" >
  <cfif isdefined("url.img")>
	
    <form id="metadata_form">
    
    </form>
	The image converted to binary data and shown here using base64 data:
	<cftry>
		<div id="place" style="display:none;">
        <cfimage action="writetobrowser" source="#aBinaryObj#" />
</div><cfoutput>
<div style="position:relative;top:200;left:200;">
<img id="nativeimage"  style="position:absolute;top:0;left:0;" src="data:image/png;base64,#BinaryEncode(aBinaryObj, 'Base64')#" />
	<div style="position:absolute;top:0;left:0;z-index:3;" id="image" >
	</div>
</div>
<br />2. Dumping the data in HTML Tag:#b#<br /><br />
</cfoutput>
<cfcatch type="any">
<cfoutput>#cfcatch.Detail#</cfoutput>
</cfcatch>
</cftry> 

Then using javascript to dump the data as availabel in javascript variable:
<cfoutput>
				
	<form style="background-color:gray;width:100px;position:absolute;left:500px;top:20px;" method="get" action="">
		<cfif isdefined("url.img")>
		 <input type='hidden' name="img" value="#url.img#" />
	</cfif>

<span style="background-color:white;">Red:</span><input type="text" name="red" id="red" />
<span style="background-color:white;">Green:</span><input type="text" name="green" id="green" />
<span style="background-color:white;">Blue:</span><input type="text" name="blue" id="blue" />
<input type="submit" onsubmit="javascript:return(this.form.red < 256 & this.form.green < 256 & this.form.blue < 256);">
</form>
</cfoutput>
<cfelse>

<a href="?img=customrequest/8d66d3.png">Please select image </a> 

</cfif>
</body>
</html>