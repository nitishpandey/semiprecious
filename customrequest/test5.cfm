    <title>Demo JavaScript PNG Viewer</title>
    <style type="text/css">
div span {
overflow:hidden;
position:absolute;width:1px;
height:1px;
}
body {
margin:0pt;
}
		.pixel {
		border-top:1px white solid;
			width: 1px;
			height: 1px;
			overflow: hidden;
           position:absolute;
 	  display:none;
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
  <script type="text/javascript" src="http://www.shawnolson.net/scripts/public_smo_scripts.js"></script>

<script type="text/javascript">
<!-- Begin
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
		var gravatar = 'iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAMAAAAp4XiDAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAwBQTFRFJH5CveDF6vTtjMadPKFWAEcXeryQ3ejhHHM5ZLB8lc2kecSDHYtCJYJEW611YK55ZblzI5FFm8+obbWF1erbiKyUs8m6s9y8SoJcHYE+aLKBEGctZZV1Uq1lMX1KB1ciRqZeqNWyRaNhSqZlxOPLc6aEpdWvrtq2G2s2OZ1Z0+XZOZ9VKJVJSJphhMKY9fr2NXJJisWcmM6miMSabb52Np1RntGrdLiLElgqEWErWLJpeLuPoNKscbaHIopBL5JRXLFykbadqs22ksuijceeMZVSgMCVVa5pfL2SKYlJLZdNcriJ+fz6IXs+dpyD7fbwHWU12u7ehsSZabp4utPCIIU/z+fXMJhOmL6kQqJdYbVyXbJuF4Q7Vq1vTaphYrV1E3IyOIlOo9Stp9awkMqg8/n0Uapqf7+UM5pRcLaH8ffz5fPoSqlg+Pr5q9S4GXE2d7qOyeTSnNCpYbdv4/HnNZpWHXk8drqNSKdgOIBQW6trcMB9X7Vtfb6TytnPlMyjHn4+SnhZzOfSO5NVhsOaPX1SWoxsHYdALI5Nfr6TD2wub799JZNHw9TJEns2WbBtDEYgyePRG307xt7OLphLoNKrg8KXNp1UptO0UatnVKlwdbmLG1kvKIdIVbBnP6BaZrd3lMmmkMeiUq1oKo9MK4tLK5VK09/XIlk1Vq9pc7+BbLp8G3g5j8ifFmYxGY0+TqhoT6tlAD0NdrmND4Q2o9GyHW44lMujHXc7a7x6Ua1jM5tQ////EU4lhMKXgsGWhcOZkMmgebuPgcCVU69m/v7+/f79XLRrkcqhMphTLZBPT6xi/v/+br17Z7dzYq9vb7qCQKRYdcF/0erW2OTcarOCbLSEbrCEbLWDsde8gMCTJ4VG+/38f8CUQ6Vba7d3EII0E4g7/f399/v4XLNrU6tr/v//VKxsK5FMK5VNXJlwgsCVH49Dz+DVFn05pdG0m9Cn8PjyL4tOHmA1X7Jz///+iMOcZbJyhMGY3+7kHnw8GH87TqNqntCrfL6RZ7J/QrcdIgAABblJREFUeNps1nlAk3UYB/DBxhz3OBUmsrhEGcKYOOBV8ACcDCQkWKAgiIDjTgxMRQmXC0XJVAhnzCNQNPBKnPLKMaA8sNLCMoy8oKxlB1KJGT2/d4Od75/v+/u83+d5fu+7dyTc0JE43u9sampt1RPyWTF9buMnikZBIGVj9bPVh0+dNCcZJEec74Cxtu6pf7yleG7qfQsblqAtaShlITIGyXOh0O5O/7iptUtPyJZiOj1UrLBh7Ze6Z6UsfHb4lEFSYMcH4zyOCKpM6hQaalNV6+Z+5kcozhDJ7JZI+EJUmsvlemQ+H0gIDVVckya5nxmqfmaIvMGVFxFmvO5GTwh0Y+77FMyTWbOS3M5kpRggvS8xKnaev8Cu37kulYgx/6HcKSHhp2tvgnHPMkCMayp5VGVMXd4Nl/qQ4tvm2z92SmiIACN1czdAPCo7Kqny89wFdneymKmXe+qB/C0bK28Ii4i4Bkaf9F2oaY/kUTGIsRsazAND33XSPJ02tux6WBgESfVJbDinsyObJz/PFwqHbjHzUl3ol27e/oImG2h49zoy+qSCTebMiSxDMQtSKIPMPBd6fPzN2+nelsuURo/03Q0PZ6MYRKwotwaZTcnJ8fGbN7WSBj4EFBahRzJtl3SROTVQWRGXbx0Ipmll8mp6/K50maXS6JLhuIvbrkJMNzFn00AfyuDS6pVbkumXNslIlpbI6KUYmZktaWaLYM6YhGvaFujDPAZmZXLyZl8ZiTQwsKxBl0S/YhtwUVVZqWS8rS1w49m6Y02ATt2NKSGRoDhdkjtvfcC2rnBOezaPWirpF+wP3JiXWgdB1Y+NPdNikNEhoxXr59lCMzBm1My3ApYPE7YGgpY25U6RyWJiSJY65NOpB+bZmk32bxfF8pEmMSHo7NmmXNxzJzI6JDZjDRDov7O7DIgQCEWaNAgor/qPvtmFNFlJjA6xXwMkAI1MRRpra32kEMQcXB2N4z8zwGiTYSMvbSJoFKyr9UGI8iVcf40BOdokc6Z2YfxZVVGCdYAo0kAyXM9/i1FYqE3iMgiibF9eJDx6UMFqBATVCe6i6TgEe+sQDyAv1UO2S7Q6XcViPRFAUps9WvArg+GtSUahLq/5sJVrycRWCo/iBx8obABFRTW6P8KJyoJbSLp1AVE9MJjQHv/3gYWCQAq+comnK0OT9BplTHQv6ijjCW3xXrdVFhYWChubqtMFyiWOrsEkrX3MyEB1Ed2XYaUb8Hu+q8QWCCme5CrXTAnWJKMVXhnErnQRrQhhRH7bX4jFCD2wUi3K93fVII9mEp2gEHhdSkV+OJ7z54sEMUL3f5tYtcOEpPmweMGEieZhxFwYaq/xwAsnJyexeNVHxhP9emqQe1OJ50sZks0tGEZfDdL75WCc9nwzuWyRmozGHViDXq+rzWxOeyT2VyY6ObukZKwc0NN9k1N1VJPomQdAmKHeOzt4WBxxcl+aDKE9vg8nU3aryVe/KwWUVZPNNVKeXJwmk8lKxtIWqzveOjkxPy9b6AOJFe2Rkgt9qsJ30sAUpucMGyAeZirBae/GjvqpznoyaDSabOfruIEUY9sAs4tXm6Gq9m7qPxMTxaczWltphTNi1SH47gkydS1ENJPZojnd1LLnkz8e01q8W1sZizTf24mJxXUtWQsRHMjgUe3V3zP/Fm/vlhmxvRpGtS/R88Obw8kc0ZyObCqWqH6yZ78KR7BmJ/jD5ecI4rGCzGZzOmu6QVRoXHcMAvFOvtaLO40gxmQOR9RZ80t2JSZP1LzsEDQyEuSo9bXOOUQU9sF3ne0dkdllPAnPXuuO04NGgnZo/9BtNUEk8b+OyO8BUPmiDVp3zPcPOjTytZZ46HAOSI6IVwnrqZjwSKz2HaecOHTFQedvhD8iFySwniqXCAuidS47XrnytnbvvcdNgOzlYxhWVMqV79X7Ni9/78Rx3VPnTEz+F2AAjg1JNEXe4OsAAAAASUVORK5CYII=';	
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
var stone_col, stone_row;
	var cols_for_class = Array();
	var class_in_row = Array();
  	var visible_classes = Array();
	var candidate_classes = Array();
	
function process_up(processing_row,k){
 var up = 1;
 while (candidate_classes.length ) {
    nc = candidate_classes.pop();
	up = 0 ;
	//nc = candidate_classes.push(nc);
	   processing_row = processing_row - k;
	       for (_class in class_in_row[processing_row]) {
	    	    if ( cols_for_class[nc][0] <= cols_for_class[class_in_row[processing_row][_class]][1] && cols_for_class[nc][1] >= cols_for_class[class_in_row[processing_row][_class]][0])
		  	      {
			       candidate_classes.push(class_in_row[processing_row][_class]);
			       up = 1;
			       for (var i= cols_for_class[class_in_row[processing_row][_class]][0];i<=cols_for_class[class_in_row[processing_row][_class]][1];i++)
			            {
			            tid = 'p'+processing_row+"_"+i;
				            try {
				            document.getElementById(tid).style.backgroundColor = 'yellow';
				            } catch(e){
				            }
			            }
					process_up(processing_row,k)
			      	candidate_classes.push(class_in_row[processing_row][_class]);
					process_down(processing_row,k);	  	
			    //  	candidate_classes.push(class_in_row[processing_row][_class]);
					 
			      }
				  
				}
	 
	  	}
 return;}
function process_down(processing_row,k){
var down = 1;
 while (candidate_classes.length ) {
     nc = candidate_classes.pop();
	 down = 0;
	 processing_row +=k;
	           for (_class in class_in_row[processing_row]) {
			    if ( cols_for_class[nc][0] <= (cols_for_class[class_in_row[processing_row][_class]][1]) && cols_for_class[nc][1] >= (cols_for_class[class_in_row[processing_row][_class]][0] ) )
			      {
			      for (var i= cols_for_class[class_in_row[processing_row][_class]][0];i<=cols_for_class[class_in_row[processing_row][_class]][1];i++)
			            {
				            tid = 'p'+processing_row+"_"+i;
					            try {
					            document.getElementById(tid).style.backgroundColor = 'yellow';
					            } catch(e){
					            }
			           	 }
				     candidate_classes.push(class_in_row[processing_row][_class]);
				     down = 1;
			    	 process_down(processing_row,k);
			         candidate_classes.push(class_in_row[processing_row][_class]);
				  
			      }
			   
		  	}
		}      	
return;
}
function show(data,row,col){

	//	document.getElementById('nativeimage').src = 'data:image/png;base64,' + data;
	//

	document.getElementById('nativeimage').src = document.getElementById('place').firstChild.src;
	
	var png = new PNG(data);
	
	var simg = document.getElementById('image');
	simg.innerHTML = '';
	//	limg.innerHTML = '';
	simg.style.width = png.width + 'px';
	simg.style.height = png.height + 'px';
	var line;
	kd = 1;
	var min_ = 1010010;
			var max_ = 0;
<cfif isdefined("url.red")>

<Cfelse>
<cfset url.red = 155 />
<cfset url.blue = 255 />
<cfset url.green = 255 />
    </cfif>
<cfoutput>	 
rtogd = #url.red#/#url.green# ;
	 rtobd = #url.red#/#url.blue#;
	 gtobd = #url.green#/#url.blue#;
	 btogd = #url.blue#/#url.green#;
	hsv = rgbToHsv(#url.red#,#url.green#,#url.blue#);
    yellowh = rgbToHsv(240,240,190).h;
</cfoutput>
  var proximity_search = 1 ;
	var nearest_dist = 1000;
	var class_start = 0;
	var class_end = 0;
	var current_class = 'dummy';
	var br = 0;
	var top0 = -1 ;
	var col0 = 0;
	var col1 = 0;
	var change = 2;
	var rdn = 0 ;
	var pixel_count = 0;
	while(line = png.readLine())
	{ 
		for (var x = 0; x < line.length; x++){
		   pixel_count += 1;
		   	top1 = Math.floor(pixel_count/png.width);
		   left1 = (pixel_count % png.width)-1;
		   if (top1 != top0) 
		   	   	{
		   	   	if (change == 1)
		   	        	change = 0 ;
		   	         else
			   	          {
				   	          if (change != 2){
				   	          br = 1;
				   	         break;
				   	         }
			   	         }
			   	     class_in_row[top1] = Array();
			   	     }
		   	newcolor = line[x] ;
			 if (  newcolor < 16777100) 
			 {
		 	var t = newcolor.toString(16).padRight('0', 6);
		 //now get decimal values
		   	
		   	 rd  = h2d(left(t,2));
			 gd = h2d(right(left(t,4),2));
			 bd = h2d(right(t,2));
			 // what is the hue? 
			 oldhsv = rgbToHsv(rd,gd,bd);
			 _drg = Math.abs(rd-gd);
			 _drb = Math.abs(rd-bd);
			 _dgb = Math.abs(gd - bd);
			 
			 // is it non-silver and non-background
		//	 if (((oldhsv.h > 0.42) || ((oldhsv.h > 0.25) && (oldhsv.s > 0.09 || oldhsv.v < 245))) && !(_dgb < 10 &&  _drg < 10 && _drb < 10) )
			 	 if (((oldhsv.h > 0.42) || ((oldhsv.h > 0.2) && oldhsv.s > 0.1)) && !(_dgb < 10 &&  _drg < 10 && _drb < 10) )
			 	 {
			 	var px = document.createElement('span');
				  if (col0 == 0)
				      {
			    	  	col1 = col1+1;
			      		col0 = 1;
			      		current_class = 'pix_'+col1+"_"+top1;
			      		class_in_row[top1].push(current_class);
			    		cols_for_class	[current_class] = Array();
			    		cols_for_class[current_class][0] = left1;
			      	}
			    
				px.className = current_class;
			   	 if ((top1 == row) && (proximity_search == 1)) 
			 	  {
			 	  var current_dist = col - left1;
			 	  if (current_dist < 0)
                       {
			 	          visible_classes.push(current_class); 
					      candidate_classes.push(current_class);         			
						 proximity_search = 0 ;
			 	      }
			 	      
			 	  }
			 if (top1 != top0)
		   	   {
		   	   top0 = top1;
		  
		   	  if (change == 0)
		   	     change = 1 ;
		   	   }
		   	 //alert(newhsv.h);
		     // create new rgb using desired hue and old s and v
		     if (hsv.s < 0.1)
		     newrgb = hsvToRgb(hsv.h,hsv.s ,oldhsv.v);
		     else
		     newrgb = hsvToRgb(hsv.h,oldhsv.s ,oldhsv.v);
		     
		     //alert(newrgb.r);
		     //conver to new decimal values
		     rdn = Math.floor(newrgb.r);
		     bdn = Math.floor(newrgb.b);
		     gdn = Math.floor(newrgb.g);
		     //give a pixel that color
			px.style.top = top1;
			px.id = 'p'+top1+"_"+left1;
			px.style.left = left1;
			px.innerText = 	oldhsv.h + ' ' + oldhsv.s + ' '+ oldhsv.v;
			px.style.backgroundColor  = 'rgb(' + rdn +','+ gdn +','+ bdn+')';
				simg.appendChild(px);
				     }	else {
				           col0 = 0;
				          if (current_class != 'dummy')
				          	  cols_for_class[current_class][1]= left1-1;
				           current_class = 'dummy';
			      	
				     	if (top1 != top0)
		  				 	   top0 = top1;
		  				     }      
				} 
			}
	if (br == 1)
	break;	}
//process_candidates();
  up  = 1 ;
  original_class = candidate_classes[0];
  var processing_row = row;

	process_up(row,1);
	 
//candidate_classes.push(original_class);
// processing_row = row;
return;
}


var IE = document.all?true:false;
if (!IE) document.captureEvents(Event.MOUSEMOVE)
//document.onmouseclick = getMouseXY;
var tempX = 0;
var tempY = 0;
function getmousexy(e) {
if (IE) { // grab the x-y pos.s if browser is IE
tempX = event.clientX + document.body.scrollLeft;
tempY = event.clientY + document.body.scrollTop;
}
else {  // grab the x-y pos.s if browser is NS
tempX = e.pageX;
tempY = e.pageY;
}  
if (tempX < 0){tempX = 0;}
if (tempY < 0){tempY = 0;}  
stone_row = tempY -60 ;
stone_col = tempX ;
alert(stone_row + "," + stone_col);
show(gravatar, stone_row, stone_col);
return true;
}
//  End -->
</script>
</head>
<!-- <body onload="show(gravatar);">
 -->
<body style="position:relative;">

	The image converted to binary data and shown here using base64 data:
	<cftry>
		<div id="place" style="display:none;"><cfimage action="writetobrowser" source="#aBinaryObj#" />
</div>
<cfoutput><br />2. Dumping the data in HTML Tag:<br /><br />
<div style="position:relative;" >

<img id="nativeimage" onClick="javascript:getmousexy(event);"  style="border:1px blue solid;position:absolute;top:0;left:0;" src="data:image/png;base64,#b#" />
	<div style="position:absolute;top:0;left:0;z-index:3;" id="image" >
	</div>
</div>
</cfoutput>
<cfcatch type="any">
</cfcatch>
</cftry> 

Then using javascript to dump the data as availabel in javascript variable:
<cfoutput>
			<!-- blue topaz http://www.semiprecious.com/customrequest/test3.cfm?img=customrequest%2Fpic1.png&red=30&green=202&blue=202
			iolite http://www.semiprecious.com/customrequest/test3.cfm?img=customrequest%2Fpic1.png&red=30&green=102&blue=202
			garnet http://www.semiprecious.com/customrequest/test3.cfm?img=customrequest%2Fpic1.png&red=99&green=10&blue=10
			http://www.semiprecious.com/customrequest/test3.cfm?img=customrequest%2Fpic1.png&red=200&green=100&blue=100-->
				
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