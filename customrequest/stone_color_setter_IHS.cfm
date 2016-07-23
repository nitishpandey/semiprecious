<cfset customfolder = 'images/custom' />
<cfset customfolder = 'customrequest/images/' />
<cfparam default="1" name="old_v" />
<cfparam default="0" name="old_s" />
<cfparam default="rings" name="category" />
<cfset dest_dir1 = "#Application.rootfolder#images\#category#" />
<cfset dest_dir2 = "#Application.rootfolder#images\custom\#category#" />

<cfinvoke component="custom" method="get_color_codes" returnvariable="color_codes" />
<!--- <cfset color_codes = '16851,65535,16711935,16763904' />
--->
<cfparam name="url.image" default="14312" />
<cfparam name="PageNum_stone_ranges" default="1">
<cfset CurrentPage=GetFileFromPath(GetBaseTemplatePath())>

<cfif IsDefined("FORM.MM_InsertRecord") AND FORM.MM_InsertRecord EQ "form4">
 <cfloop list="#form.update#" index="j">
		<cfquery datasource="sptm" >
			update stone_name_variants set rgbhex = '#form.rgbhex#'
		, opacity = #form.opacity/100#	 
		where id = #j# 
		</cfquery> 
 </cfloop>
</cfif>

<cfquery name="stone_ranges" datasource="sptm">
SELECT *
FROM stone_name_variants, stone_names, stone_variants
WHERE 
stone_name_variants.stone_names_id = stone_names.id  
and stone_name_variants.stone_variants_id = stone_variants.id  
order by
stone_names.name asc
</cfquery>
<cfset MaxRows_stone_ranges=10>
<cfset StartRow_stone_ranges=Min((PageNum_stone_ranges-1)*MaxRows_stone_ranges+1,Max(stone_ranges.RecordCount,1))>
<cfset EndRow_stone_ranges=Min(StartRow_stone_ranges+MaxRows_stone_ranges-1,stone_ranges.RecordCount)>
<cfset TotalPages_stone_ranges=Ceiling(stone_ranges.RecordCount/MaxRows_stone_ranges)>
<cfset QueryString_stone_ranges=Iif(CGI.QUERY_STRING NEQ "",DE("&"&XMLFormat(CGI.QUERY_STRING)),DE(""))>
<cfset tempPos=ListContainsNoCase(QueryString_stone_ranges,"PageNum_stone_ranges=","&")>
<cfif tempPos NEQ 0>
  <cfset QueryString_stone_ranges=ListDeleteAt(QueryString_stone_ranges,tempPos,"&")>
</cfif>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
    <title>Demo JavaScript PNG Viewer</title>
<link href="custom.css" type="text/css" rel="stylesheet" />
    <style type="text/css">


.texture_pixel {
height:1px;
opacity:1;
overflow:hidden;
position:absolute;
z-index:10;
}



	  <cfloop from="1" to="#listlen(color_codes)#" index="p">
		<cfoutput>
		.stone_pixel#p# {</cfoutput>
		z-index:2;
		opacity:1;
		}
	</cfloop>

    </style>

<script type="text/javascript">
		function text()
		{
			 	changecss('.texture_pixel1','opacity',document.getElementById('opacity1').value/100);
				changecss('.texture_pixel2','opacity',document.getElementById('opacity1').value/100);
				changecss('.texture_pixel3','opacity',document.getElementById('opacity1').value/100);
				changecss('.texture_pixel4','opacity',document.getElementById('opacity1').value/100);
				return ;

		}
  function check(a)
     {document.getElementById('rgbhex').value = a;	
     process();
     return;}
		function test(t1,b)
		{
			if (!t1)
			 		t1 = document.getElementById('rgbhex').value;
				   	  
				   	  rd  = h2d(left_(t1,2));
					  gd = h2d(right(left_(t1,4),2));
					 bd = h2d(right(t1,2));
				a = 'rgb('+rd+','+gd+','+bd+')';
			if (!b )
				   b =			  document.getElementById('opacity').value/100;
				   else
				   b = b/100;
		changecss('.stone_pixel1','background-color',a );
		//		changecss('.stone_pixel1','opacity',b);
		changecss('.stone_pixel2','background-color',a);
		//		changecss('.stone_pixel2','opacity',b);
		changecss('.stone_pixel3','background-color',a);
		//		changecss('.stone_pixel3','opacity',b);
		changecss('.stone_pixel4','background-color',a);
		//		changecss('.stone_pixel4','opacity',b);
				return ;

		}
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
 if (b.length)
   {
	 	changecss(a,'opacity',c);   
		changecss(a,'background-color',b);   
	 
   }
   else
   {
	changecss(a,'opacity',c);   

   }
   return;
 }
</script>
<script type="text/javascript" src="/js/jscolor.js"></script>
<script type="text/javascript" src="../imagejs/color.js"></script>
<script type="text/javascript" src="../imagejs/Deflate.js"></script>
<script type="text/javascript" src="../imagejs/PNG.js"></script>
<script type="text/javascript" src="../imagejs/Base64.js"></script>
<script language="javascript1.2" type="text/javascript">
<!-- Begin
	<cftry>

		<cffile action = "readBinary" file = "#dest_dir1#\#urldecode(url.image)#.png" variable = "aBinaryObj" charset="utf-8"   > 
		<cfoutput>
		<cfscript>
				b = BinaryEncode(aBinaryObj, 'Base64');
				</cfscript>
		<!--- 		<cfhttp url="http://www.semiprecious.com/customrequest/png.php" />
				<cfset b = trim(cfhttp.filecontent) /> --->
			var original = '#b#';
<cffile action = "readBinary" file = "#dest_dir2#\#urldecode(url.image)#.png" variable = "aBinaryObj" charset="utf-8"   > 
				<cfscript>
				b = BinaryEncode(aBinaryObj, 'Base64');
				//b = toBase64(aBinaryObj,'iso-8859-1');
				</cfscript>
		<!--- 		<cfhttp url="http://www.semiprecious.com/customrequest/png.php" />
				<cfset b = trim(cfhttp.filecontent) /> --->
			var colored = '#b#';
			var milestone = 11;
	</cfoutput>
		
	<cfcatch type="any">
	</script><cfoutput>#cfcatch.Detail#,#cfcatch.Message#</cfoutput>
	Image not customizable.
<cfabort />
</cfcatch>
	</cftry>

<!--- 	<cfimage  source="http://www.semiprecious.com/#url.img#" name="myLogo"> ---> 

<!--- <cfquery datasource="gemssql" name="opts">
                select * from options where itemid = 1707    
                </cfquery>
 --->			<!--- <cfdump var="#aBinaryObj#"> --->

var stone_col, stone_row;

var various_colors = Array();
    var stone  = new Array(4);
	stone[0] = new Array();
	 stone[1] =  new Array();
	 stone[2] =  new Array();
	 stone[3] =  new Array();
    <cfoutput>
	  
	  var texture  =  new Array(#listlen(color_codes)#);
	  <cfloop from="0" to="#evaluate(listlen(color_codes)-1)#" index="p">

 			texture[#p#] =  new Array();
		</cfloop>
	</cfoutput>
var old_s = <cfoutput>#old_s#</cfoutput>;
var old_v = <cfoutput>#old_v#</cfoutput>;
	var hsv;

function hsvtorgb2(a,b)
{
if (hsv.s < 0.2)
      if (a < 0.15)
			return 	hsvToRgb(hsv.h ,  (a+0.1)*hsv.s + (0.9-a)*a   ,b);
		else
			return 	hsvToRgb(hsv.h , hsv.s,b);
	else
	  if (a < 0.15)
			return 	hsvToRgb(hsv.h ,  (a+0.1)*hsv.s + (1-a-0.1)*a   ,b);
		else
			return 	hsvToRgb(hsv.h ,  ((1-0.5*a)*a + hsv.s)/(2-0.5*a) - (1-a)/4 ,b);
	}
var start = 1;
function process(){
	var	t1 = document.getElementById('rgbhex').value;
        t1 = t1.toString(16).padRight('0', 6);;
					   	 rd  = h2d(left_(t1,2));
						 gd = h2d(right(left_(t1,4),2));
						 bd = h2d(right(t1,2));
						
	 hsv = rgbToHsv(rd,gd,bd);
	if (start)
	{
	var orig = new PNG(original);
	var color = new PNG(colored);
	var line;
	var groups = [];
	var groups2 = [];
	var max_h = -1;
	var min_h = 100;
	var top0 = -1 ;
	
     
	var in_zone = 0;
	

		var simg2 = document.getElementById('what');
		simg2.innerHTML = "";


	var curr_zone = -1;
	var new_zone = -1;
	var curr_RGB = -1;
	var new_RGB = 0;
	var curr_color = 0;
	var new_color = 0;
								
	<cfoutput>
		 <cfloop list="#color_codes#" index="p">
		   	groups.splice(groups.length,0,#p#);
			groups2.splice(groups2.length,0,#p#);
		</cfloop>
	</cfoutput>

    var col0 = 0;
	var col1 = 0;
	var change = 2;
	var rdn = 0 ;
	var pixel_count = 0;

	while(orig_line = orig.readLine())
		{ 
	     color_line = color.readLine();
	     for (var x = 0; x < color_line.length; x++){
			   pixel_count += 1;
			  	new_color  = color_line[x];
		    	new_RGB = orig_line[x];
		    	if (new_RGB == curr_RGB) // if texture is same then stone layer is implied
		  	      {
		  	       if (curr_zone != -1)// but are we in stone region?
		  	          {
     		  	     // stone[curr_zone][stone[curr_zone].length-1] = 		  	      stone[curr_zone][stone[curr_zone].length-1]+1;
	    	  	      texture[curr_zone][texture[curr_zone].length-1] = 		  	      texture[curr_zone][texture[curr_zone].length-1]+1;
					  continue;
		     		  	}
		  	       }
		  	        else
		  	        {
       		     	if (new_color == curr_color && curr_zone != -1)//different texture but  same zone  (further,with RGB different color would equal only in zone )
         		     	{
   			        
			           // stone[curr_zone][stone[curr_zone].length-1] = stone[curr_zone][stone[curr_zone].length-1]+1;
			    		 t1 = new_RGB.toString(16).padRight('0', 6);;
/*					   	 rd  = h2d(left_(t1,2));
						 gd = h2d(right(left_(t1,4),2));
						 bd = h2d(right(t1,2));
*/
						 oldhsv = rgbToHsv(h2d(left_(t1,2)), h2d(right(left_(t1,4),2)), h2d(right(t1,2)));
 // hsv.h + hsv.s + oldhsv.v makes black give white (crystal) 

			   top1 = Math.floor(pixel_count/color.width)+1; //y value
			   left1 = (pixel_count % color.width) ;   // x value
        	
					  	      texture[curr_zone][texture[curr_zone].length] = left1;
					  	      texture[curr_zone][texture[curr_zone].length] = top1;
//					  	      texture[curr_zone][texture[curr_zone].length] = oldhsv.h;
					  	      texture[curr_zone][texture[curr_zone].length] = oldhsv.s;
					  	      texture[curr_zone][texture[curr_zone].length] = oldhsv.v;
					  	      texture[curr_zone][texture[curr_zone].length] = 1;
							  curr_RGB = new_RGB;
							  continue;
					}else
						{ // niether rgb nor color are same. find new zone	  	  
			           new_zone = -1;
			            switch(new_color)  {
				         case  groups2[0] : new_zone = 0;
                                  break;
				         case  groups2[1] : new_zone = 1;
                                  break;
				         case  groups2[2] : new_zone = 2;
                                  break;
						   case  groups2[3] : new_zone = 2;
                                  break;
									   }
				            curr_zone = new_zone;
							curr_RGB = new_RGB;
							curr_color = new_color;
			       if (new_zone != -1)
					   {
/*                      stone[curr_zone][stone[curr_zone].length] = left1;
			  	      stone[curr_zone][stone[curr_zone].length] = top1;
			  	      stone[curr_zone][stone[curr_zone].length] = 1;
*/
			   		     t1 = new_RGB.toString(16).padRight('0', 6);;
/*					   	 rd  = h2d(left_(t1,2));
						 gd = h2d(right(left_(t1,4),2));
						 bd = h2d(right(t1,2));
						 oldhsv = rgbToHsv(rd,gd,bd); */
	 					 oldhsv = rgbToHsv(h2d(left_(t1,2)), h2d(right(left_(t1,4),2)), h2d(right(t1,2)));
					     
			   top1 = Math.floor(pixel_count/color.width)+1; //y value
			   left1 = (pixel_count % color.width) ;   // x value
        			  	      texture[curr_zone][texture[curr_zone].length] = left1;
					  	      texture[curr_zone][texture[curr_zone].length] = top1;
					  	      texture[curr_zone][texture[curr_zone].length] = oldhsv.s;
					  	      texture[curr_zone][texture[curr_zone].length] = oldhsv.v;
					  	  //    texture[curr_zone][texture[curr_zone].length] = oldhsv.v;
					  	      texture[curr_zone][texture[curr_zone].length] = 1;

							  continue;
					          }
		  		     	   }
		        	    }
			       }     /* start of layer formation */
			/* end of layer formation */				
			}

		start = 0;	}else
			{
		    	(simg2 =	document.getElementById('what')).innerHTML = '';              
				for (i = 0; i < texture.length;i++)
                   for (j = 0; j < texture[i].length;j = j+5) {
						px2 = document.createElement('div');
						px2.style.width = texture[i][j+4];
						px2.style.left = texture[i][j];
						px2.style.top = texture[i][j+1];
						temp = Math.round((texture[i][j+2]));
						newrgb = hsvtorgb2(texture[i][j+2],texture[i][j+3]);
					     rdn = Math.floor(newrgb.r);
					     bdn = Math.floor(newrgb.b);
					     gdn = Math.floor(newrgb.g);
						px2.style.backgroundColor  = 'rgb(' + rdn +','+ gdn +','+ bdn+')';
						px2.className = 'texture_pixel';
						simg2.appendChild(px2);
						}
						

			  }
		 return;
	 }

//  End -->
</script>
</head>

<body onLoad="process();">


<a href="." >Custom Main Menu</a> 
	<cftry>
  <!--- working fine but not required. IE does not support this <cfimage action="writetobrowser" source="#aBinaryObj#" /> --->

<div style="width:850px;">
<div id="place" style="postion:relative;width:400px;"><cfoutput>
    <img id="nativeimage" onClick="javascript:capture_click(e);"  style="border:1px gray solid;top:0;left:0;position:absolute;" src="/images/rings/#url.image#.jpg" />
	</cfoutput>
	<div id="what" ></div>
</div>
<div id="place2" style="postion:relative;float:right;">
<form action="#CurrentPage#" method="post" name="form4" id="form4">

<input type="hidden" name="MM_InsertRecord" value="form4" />
<div style="display:block;">

Discover Color: <input id="rgbhex" name="rgbhex" nchange="javascript:process();" class="color {pickerMode:'HSV'}">
<input id="opacity" name="opacity" type="hidden" value="50" > 
<input id="opacity1" name="opacity1" type="hidden" value="50" >Then click 'test' <a href="javascript:process();">Test</a>

</div>
<table border="0" style="height:150px;overflow-y:scroll;">
<tr><td>Stone Name</td><td>Variant</td><td>Feel</td><td>Select</td><td>Check</td></tr>
<cfoutput  query="stone_ranges">
	<tr><td>#name#</td><td>#description#</td>
	<td style="border:1px black solid;background-color:###rgbhex#;">&nbsp;</td>
	<td><input type="checkbox" name="update" value="#id#" /></td><td><a href="javascript:check('#rgbhex#');">Check</a></td>
	</tr>
</cfoutput>
</table><cfif session.mail is application.admin_email>
<input type="submit" value="Update Selected" />
</cfif>
</form>
</div> <a href="/" class="greenbutton">Customisation Menu</a>


</div>
<cfcatch type="any">
</cfcatch>
</cftry>             
Select Image: <a href="?image=14312"><img src="images/14312.png" width="50px" /></a> <a href="?image=14321"><img src="images/14321.png" width="50px" /></a>

<br>
<cfoutput>
<table border="0">
  <tr>
    <td><cfif PageNum_stone_ranges GT 1>
      <a href="#CurrentPage#?PageNum_stone_ranges=1#QueryString_stone_ranges#">First</a>
    </cfif></td>
    <td><cfif PageNum_stone_ranges GT 1>
      <a href="#CurrentPage#?PageNum_stone_ranges=#Max(DecrementValue(PageNum_stone_ranges),1)##QueryString_stone_ranges#">Previous</a>
    </cfif></td>
    <td><cfif PageNum_stone_ranges LT TotalPages_stone_ranges>
      <a href="#CurrentPage#?PageNum_stone_ranges=#Min(IncrementValue(PageNum_stone_ranges),TotalPages_stone_ranges)##QueryString_stone_ranges#">Next</a>
    </cfif></td>
    <td><cfif PageNum_stone_ranges LT TotalPages_stone_ranges>
      <a href="#CurrentPage#?PageNum_stone_ranges=#TotalPages_stone_ranges##QueryString_stone_ranges#">Last</a>
    </cfif></td>
  </tr>
</table>
Records #StartRow_stone_ranges# to #EndRow_stone_ranges# of #stone_ranges.RecordCount#</cfoutput>
</body></html>