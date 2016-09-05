<html xmlns="http://www.w3.org/1999/xhtml"><head>
<cfparam name="url.image" default="4321" />
    <title>Demo JavaScript PNG Viewer</title>
    <style type="text/css">
    .newstone2 {
            opacity:0.05;
			    			width: 1px;
			height: 1px;
			overflow: hidden;
           position:absolute;

	}
    .newstone1 {
            opacity:0.05;
			width: 1px;
			height: 1px;
			overflow: hidden;
           position:absolute;

	}
    .newstone3 {

			background-repeat: no-repeat;
            opacity:0.05;
			width: 1px;
			height: 1px;
			overflow: hidden;
           position:absolute;

	}

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

			#texture {
			display:block;
			}
			#hue {
			display:block;
			}
    </style>

<script type="text/javascript" src="../imagejs/Base64.js"></script>
<script type="text/javascript" src="../imagejs/Deflate.js"></script>
<script type="text/javascript" src="../imagejs/PNG.js"></script>
<script type="text/javascript">
		function changecss(theClass,element,value) {
	//Last Updated on June 23, 2009
	//documentation for this script at
	//http://www.shawnolson.net/a/503/altering-css-class-attributes-with-javascript.html
	 var cssRules;

	 var added = false;
	 for (var S = 0; S < document.styleSheets.length; S++){

    if (document.styleSheets[S]['rules']) {
	  cssRules = 'rules';
	 } else if (document.styleSheets[S]['cssRules']) {
	  cssRules = 'cssRules';
	 } else {
	  //no rules found... browser unknown
	 }

	  for (var R = 0; R < document.styleSheets[S][cssRules].length; R++) {
	   if (document.styleSheets[S][cssRules][R].selectorText == theClass) {
	    if(document.styleSheets[S][cssRules][R].style[element]){
	    document.styleSheets[S][cssRules][R].style[element] = value;
	    added=true;
		break;
	    }
	   }
	  }
	  if(!added){
	  if(document.styleSheets[S].insertRule){
			  document.styleSheets[S].insertRule(theClass+' { '+element+': '+value+'; }',document.styleSheets[S][cssRules].length);
			} else if (document.styleSheets[S].addRule) {
				document.styleSheets[S].addRule(theClass,element+': '+value+';');
			}
	  }
	 }
	}
 function change_stone(a,b,c) {
 	changecss(a,'opacity',c);

	if (b.length)
   {
	 	changecss(a,'background-color',b);

   }
     return;
 }
<!-- Begin
	<cftry>
		<cffile action = "readBinary" file = "#application.rootfolder#customrequest/images/#urldecode(url.image)#.png" variable = "aBinaryObj" charset="utf-8"   >

		<cfoutput>
		<cfscript>
				b = BinaryEncode(aBinaryObj, 'Base64');
				//b = toBase64(aBinaryObj,'iso-8859-1');
				</cfscript>
		<!--- 		<cfhttp url="http://www.semiprecious.com/customrequest/png.php" />
				<cfset b = trim(cfhttp.filecontent) /> --->
			var original = '#b#';
<cffile action = "readBinary" file = "#application.rootfolder#customrequest/images/custom#urldecode(url.image)#.png" variable = "aBinaryObj" charset="utf-8"   >
				<cfscript>
				b = BinaryEncode(aBinaryObj, 'Base64');
				//b = toBase64(aBinaryObj,'iso-8859-1');
				</cfscript>
		<!--- 		<cfhttp url="http://www.semiprecious.com/customrequest/png.php" />
				<cfset b = trim(cfhttp.filecontent) /> --->
			var custom = '#b#';
	</cfoutput>

	<cfcatch type="any">
	Image not customizable.
		var custom = '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';
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
        var i = Math.floor(hue * 5.8);
        var f = (hue * 5.8) - i;
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

	var various_colors = Array();
	var cols_for_class = Array();
	var class_in_row = Array();

function show(custom,original){

	//	document.getElementById('nativeimage').src = 'data:image/png;base64,' + data;
	//

//	document.getElementById('nativeimage').src = document.getElementById('place').firstChild.src;
	<cfoutput>
		document.getElementById('nativeimage').src = "images/#url.image#.png" ;</cfoutput>

	var custom = new PNG(custom);

	var original = new PNG(original);

	var texture = document.getElementById('texture');
	var hue = document.getElementById('hue');
	texture.innerHTML = '';
	hue.innerHTML = '';
	//	limg.innerHTML = '';
	texture.style.width =hue.style.width  = custom.width + 'px';
	texture.style.height = hue.style.height = custom.height + 'px';

	var line;
	kd = 1;
	var min_ = 1010010;
			var max_ = 0;
//			find out how many groups from hidden variable (known from preprocessing)
	//  for that many groups find new_stone
	// if not 'same' then get name
	// with name use an associative array to get red green blue
<cfparam name="url.red" default= 245 />
<cfparam name="url.green" default= 245 />
<cfparam name="url.blue" default= 245 />

<cfoutput>
	<!---
 rtogd = #url.red#/#url.green# ;
	 rtobd = #url.red#/#url.blue#;
	 gtobd = #url.green#/#url.blue#;
	 btogd = #url.blue#/#url.green#;
 --->
	 whitehsv = rgbToHsv(#url.red#,#url.green#,#url.blue#);
 //   yellowh = rgbToHsv(240,240,190).h;
</cfoutput>
	var br = 0;
	var top0 = -1 ;
	var col0 = 0;
	var col1 = 0;
	var change = 2;
	var rdn = 0 ;
	var pixel_count = 0;
	various_colors[0] = 0 ;
	group1_h = 0.833;
	group2_h= 0.614;
      var groups = [16851,6022893,16711935];
	var px = "";
	while(line = custom.readLine())
	{
	  line2 = original.readLine();
		   prev = false;
		for (var x = 0; x < line.length; x++){
          	pixel_count += 1;
		   	top1 = Math.floor(pixel_count/custom.width);
		   left1 = (pixel_count % custom.width)-1;
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

		     	var t = newcolor.toString(16).padRight('0', 6);
			//	t = line2[x].toString(16).padRight('0', 6);;
		   	 rd  = h2d(left(t,2));
			 gd = h2d(right(left(t,4),2));
			 bd = h2d(right(t,2));
			 // what is the hue?
			 oldhsv = rgbToHsv(rd,gd,bd);

		if (  (newcolor == groups[0]) || (newcolor == groups[1]) || (newcolor == groups[2]))

		//((newcolor > 17822064) && (newcolor < 17834064)) || ((newcolor < 16800) &&(newcolor > 16527))
		// if (   ( newcolor*1 >16421 && newcolor*1 < 17200) || ( newcolor*1 >16711900 && newcolor*1 < 16712000) )
		 //||  t1 < '0042d2' ||t1 == '0041c3' ||t1 == '0041d3' || t1 == 'ff00ff' || t1 == 'ff00fd' )
           {
		 //now get decimal values
	 _drg = Math.abs(rd-gd);
			 _drb = Math.abs(rd-bd);
			 _dgb = Math.abs(gd - bd);
			 // is it non-silver and non-background

				 px = document.createElement('div');
				  if (col0 == 0)
			    	  {
			      		col1 = col1+1;
				      	col0 = 1;
				      	k = 'pixel pix_'+col1+"_"+top1;
				      	class_in_row[top1].push(k);
				    	cols_for_class[k] = Array();

						px2 = document.createElement('div');
						px2.style.top = top1;
						px2.style.left = left1;
						px2.backgroundPosition="0 " + top1 ;
						hue.appendChild(px2);
			    	  }
			          else
					   {
						px2.style.width = eval(left(px2.style.width,px2.style.width.length-2)*1+1) + 'px';

					   }
//			    cols_for_class[k].push(left1);
				px.className = k;

				   switch(newcolor)  {
				         case  groups[0] : px2.className = 'newstone1';
                                  break;
				         case  groups[1] : px2.className = 'newstone2';
                                  break;
				         case  groups[2] : px2.className = 'newstone3';
                                  break;
				   }
			 if (top1 != top0)
		   	   {
		   	   top0 = top1;

		   	  if (change == 0)
		   	     change = 1 ;
		   	   }
			   t1 = line2[x].toString(16).padRight('0', 6);;
		   	 rd  = h2d(left(t1,2));
			 gd = h2d(right(left(t1,4),2));
			 bd = h2d(right(t1,2));
			 // what is the hue?
		     //give a pixel that color
			px.style.top = top1;
			px.style.left = left1;

			px.innerText = 	t+ ','+gd+','+bd+','+oldhsv.h + ' ' + eval(oldhsv.s*oldhsv.v);
			if (t != various_colors[various_colors.length-1])
			     various_colors.push(t);
			 oldhsv = rgbToHsv(rd,gd,bd);
			 // if it is near dark then keep whitening factor high
			 // if rd/gd is nearly rd/bd and rd is LT 20
			 whitener = 0.95;
			  if (gd != 0 && bd != 0)
			  {
			  if((rd < 50) && (((rd/gd - rd/bd) < 0.25) && (rd/gd - rd/bd) > -0.25) )
			  {
			  whitener = 0.90;

		   	  }
		   	  if((rd > 240) && (((rd/gd - rd/bd) < 0.25) && (rd/gd - rd/bd) > -0.25))
			  {
			  whitener = 0.975;

		   	  }
		   	  }
		   	 //alert(newhsv.h);
		     // create new rgb using desired hue and old s and v
//		     newrgb = hsvToRgb(whitehsv.h,oldhsv.s,oldhsv.v); // hsv.h + oldhsv.s + oldhsv.v gives okay for most colors but not for black or white.
//original
//	 	    newrgb = hsvToRgb(whitehsv.h, whitehsv.s,1.15*oldhsv.v); // hsv.h + hsv.s + oldhsv.v makes black give white (crystal)
//Makes Texture red!
//	 	    newrgb = hsvToRgb(whitehsv.h, oldhsv.s,0.95*oldhsv.v); // hsv.h + hsv.s + oldhsv.v makes black give white (crystal)

	 	    newrgb = hsvToRgb(whitehsv.h, whitehsv.s,whitener*oldhsv.v); // hsv.h + hsv.s + oldhsv.v makes black give white (crystal)
// PRETTY GOOD
// newrgb = hsvToRgb(whitehsv.h, (whitehsv.s+0.2*oldhsv.s)/1.2,0.95*oldhsv.v); // hsv.h + hsv.s + oldhsv.v makes black give white (crystal)

		     //alert(newrgb.r);
		     //convert to new decimal values
		     rdn = Math.floor(newrgb.r);
		     bdn = Math.floor(newrgb.b);
		     gdn = Math.floor(newrgb.g);

			px.style.backgroundColor  = 'rgb(' + rdn +','+ gdn +','+ bdn+')';
				texture.appendChild(px);


		}	else {

				           col0 = 0;
				     		if (top1 != top0)
		  				 	   top0 = top1;
		  				     }

			}
	if (br == 1)
	break;
	}
 }

var IE = document.all?true:false;
if (!IE) document.captureEvents(Event.MOUSEMOVE)
document.onmousemove = getMouseXY;
var tempX = 0;
var tempY = 0;
function getMouseXY(e) {
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
stone_row = tempX;
stone_col = tempY;

return true;
}
//  End -->
</script>
</head>
<body onLoad="show(custom,original);">
	The image converted to binary data and shown here using base64 data:
	<cftry>
		<div id="place" style="display:none;">
	<!--- 		<cfimage action="writetobrowser" source="#aBinaryObj#" /> --->
</div>
<cfoutput><br />2. Dumping the data in HTML Tag:<br /><br />
<div style="position:relative;top:20;left:30;">
<img id="nativeimage" onClick="javascript:capture_click(e);"  style="border:1px gray solid;position:absolute;top:0;left:0;" src="data:image/png;base64," />
	<div style="position:absolute;top:1;left:1;z-index:3;" id="texture" >
	</div>
    	<div style="position:absolute;top:1;left:1;z-index:5;" id="hue" >
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

<form style="width:400px;position:absolute;left:500px;top:20px;" method="get" action="">
<p style="background-color:rgb(#url.red#,#url.green#,#url.blue#);">&nbsp;</p>
 Stone 1: <label>
    <input onClick="javascript:change_stone('.newstone1','',0);" type="radio" name="stone1" value="-" id="stone1_">
    Clear</label>

    <input onClick="javascript:change_stone('.newstone1','magenta',0.15);" type="radio" name="stone1" value="magenta" id="stone1_0">
    Amethyst


    <input type="radio" onClick="javascript:change_stone('.newstone1','yellow',0.15);" name="stone1" value="Yellow" id="stone1_1">
    Citrine

<p>

  Stone 2:

    <input onClick="javascript:change_stone('.newstone2','',0);" type="radio" name="stone2" value="-" id="stone2_">
    Clear    <input onClick="javascript:change_stone('.newstone2','magenta',0.15);" type="radio" name="stone2" value="magenta" id="stone2_0">
    Amethyst

    <input type="radio" onClick="javascript:change_stone('.newstone2','yellow',0.15);" name="stone2" value="Yellow" id="stone2_1">
    Citrine


</p>

<p>

  Stone 3:

    <input onClick="javascript:change_stone('.newstone3','',0);" type="radio" name="stone3" value="-" id="stone3_">
    Clear    <input onClick="javascript:change_stone('.newstone3','magenta',0.15);" type="radio" name="stone3" value="magenta" id="stone3_0">
    Amethyst

    <input type="radio" onClick="javascript:change_stone('.newstone3','yellow',0.15);" name="stone3" value="Yellow" id="stone3_1">
    Citrine



</p>

Select Image: <a href="?image=14312"><img src="images/14312.png" width="50px" /></a> <a href="?image=14321"><img src="images/14321.png" width="50px" /></a>
</form>

</cfoutput>
</body></html>