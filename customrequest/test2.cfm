<!--- <cfimage   name = "cfimage" source = "/images/"    action = "read"    isBase64 = "no" /> --->
<html xmlns="http://www.w3.org/1999/xhtml"><head>
    <title>Demo JavaScript PNG Viewer</title>
    <style type="text/css">
		.pixel {
			width: 3px;
			height: 3px;
			float: left;
			overflow: hidden;
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

<script type="text/javascript" src="../imagejs/Base64.js"></script>
<script type="text/javascript" src="../imagejs/Deflate.js"></script>
<script type="text/javascript" src="../imagejs/PNG.js"></script>
<script type="text/javascript">
	<cftry>
		<cfoutput>
<cffile action = "readBinary" file = "#application.rootfolder##urldecode(url.img)#" variable = "aBinaryObj" charset="utf-8"   > 
				<cfscript>
				b = BinaryEncode(aBinaryObj, 'Base64');
				//b = toBase64(aBinaryObj,'iso-8859-1');
				</cfscript>
		<!--- 		<cfhttp url="http://www.semiprecious.com/customrequest/png.php" />
				<cfset b = trim(cfhttp.filecontent) /> --->
			var gravatar = '#b#';
	</cfoutput>
		
	<cfcatch type="any">
		var gravatar = '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';	
</cfcatch>
	</cftry>

<!--- 	<cfimage  source="http://www.semiprecious.com/#url.img#" name="myLogo"> --->

<!--- <cfquery datasource="gemssql" name="opts">
                select * from options where itemid = 1707    
                </cfquery>
 --->			<!--- <cfdump var="#aBinaryObj#"> --->
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
function show(data){

		document.getElementById('nativeimage').src = 'data:image/png;base64,' + data;
	
	var png = new PNG(data);
	
	var simg = document.getElementById('image');
	var limg = document.getElementById('largeimage');
	simg.innerHTML = '';
		limg.innerHTML = '';
	simg.style.width = png.width*3 + 'px';
	simg.style.height = png.height*3 + 'px';
	limg.style.width = (png.width * 3) + 'px';
	limg.style.height = (png.height * 3) + 'px';
	var line;
	kd = 1;
	var min_ = 1010010;
			var max_ = 0;
<cfif isdefined("url.red")>
<cfoutput>	 rtogd = #url.red#/#url.green# ;
	 rtobd = #url.red#/#url.blue#;
	 gtobd = #url.green#/#url.blue#;
	 btogd = #url.blue#/#url.green#;
	hsv = rgbToHsv(#url.red#,#url.green#,#url.blue#);
    
</cfoutput>
<Cfelse>
<cfset url.red = 255 />
<cfset url.blue = 255 />
<cfset url.green = 255 />
/*
	while(line = png.readLine())
	{
		for (var x = 0; x < line.length; x++){
			if (line[x] > max_ & line[x] < 15000000)
			   max_ = line[x];
			if (line[x] < max_ & line[x] > 3500)
			   min_ = line[x];
			   
			}
		}
			 var t = max_.toString(16).padRight('0', 6);
			 var red = left(t,2);
			 var blue = right(t,2);
			 var green = right(left(t,4),2);
			
		   	 rd_  = h2d(red);
			 gd_ = h2d(green);
			 bd_ = h2d(blue);
			
			 t = min_.toString(16).padRight('0', 6);
			  red = left(t,2);
			  blue = right(t,2);
			 green = right(left(t,4),2);
			
		   	 rd  = h2d(red);
			 gd = h2d(green);
			 bd = h2d(blue);
			 
	    rtogd = ((rd_/gd_) + (rd/gd))/2;
	    rtobd = ((rd_/bd_) + (rd/bd))/2;
	    gtobd = ((gd/bd)+(gd_/bd_))/2;
	    btogd = ((bd/gd)+(bd_/gd_))/2;
	     
	  
	  
	var png2 = new PNG(data);
	   */    </cfif>
	while(line = png.readLine())
	{
		for (var x = 0; x < line.length; x++){
			var px = document.createElement('div'), px2 = document.createElement('div');
			px.className = px2.className = 'pixel';
			px.id = x;
			px2.id = x;
			newcolor = line[x] ;
			   
		 var t = newcolor.toString(16).padRight('0', 6);
		 var red = left(t,2);
		 var blue = right(t,2);
		 var green = right(left(t,4),2);
		 if (red < green)
			   min = red;
		   else
			   min = green;
		  if ( blue < min )
			    min = blue;
		 if (red > green)
			   max = red;
		   else
			   max = green;
		  if ( blue > min )
			    max = blue;
			       
			// red = green = blue = min;
		   	 rd  = h2d(red);
			 gd = h2d(green);
			 bd = h2d(blue);
			 oldhsv = rgbToHsv(rd,gd,bd);
			 
			 if (oldhsv.h > 150){
		//	 bd = h2d(min) + Math.floor((h2d(max)-h2d(min))); 
			 v = 1*(rd*rd + gd*gd + bd*bd);
			  rdn = 1*(Math.sqrt(v*rtogd*rtobd*rtogd*rtobd/(rtogd*rtogd*rtobd*rtobd+rtobd*rtobd+rtogd*rtogd)));
		     gdn = Math.floor(rdn/rtogd);
		     bdn = Math.floor(rdn/rtobd);
		     rdn = Math.floor(rdn);
		     
		     //alert(newhsv.h);
		     newrgb = hsvToRgb(hsv.h,oldhsv.s,oldhsv.v);
		     //alert(newrgb.r);
		     rdn = Math.floor(newrgb.r);
		     bdn = Math.floor(newrgb.b);
		     gdn = Math.floor(newrgb.g);
		     }else {
		     rdn = rd;
		     bdn = bd;
		     gdn = gd;
		     }	      
			px2.style.backgroundColor  = 'rgb(' + rdn +','+ gdn +','+ bdn+')';
			// bd = rd;
			// rd = h2d(min) + Math.floor((h2d(max)-h2d(min))); 
			
				
			px.style.backgroundColor  = 'rgb(' + rd +','+ gd +','+ bd+')';
		
			/*alert(line[x]);
			alert(line[x].toString(16));
		
			alert(line[x].toString(16).padRight('0',6));
				*/
			limg.appendChild(px);
			simg.appendChild(px2);
			}
		}
 }

</script>
</head>
<body onload="show(gravatar);">
	The image converted to binary data and shown here using base64 data:
	<cftry>
 <br />	Using writetobrowser CFMX COmmand: <br /><cfimage action="writetobrowser" source="#aBinaryObj#" />
<cfoutput><br />Dumping the data in HTML Tag:<img src="data:image/png;base64,#b#" /></cfoutput>
<cfcatch type="any">
</cfcatch>
</cftry> 
	<div id="image" ></div>
<div id="largeimage" ></div><br />
Then using javascript to dump the data as availabel in javascript variable:
<img id="nativeimage" src="" /> 
<cfoutput>
				
<form style="background-color:rgb(#url.red#,#url.green#,#url.blue#);width:100px;position:absolute;left:500px;top:20px;" method="get" action="">
	<cfif isdefined("url.img")>
		<input type='hidden' name="img" value="#url.img#">
	</cfif>
<span style="background-color:white;">Red:</span><input type="text" name="red" id="red" >
<span style="background-color:white;">Green:</span><input type="text" name="green" id="green">
<span style="background-color:white;">Blue:</span><input type="text" name="blue" id="blue">
<input type="submit" onsubmit="javascript:return(this.form.red < 256 & this.form.green < 256 & this.form.blue < 256);">
</form>
</cfoutput>
</body></html>