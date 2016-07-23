<cfset customfolder = 'images/custom' />
<cfparam default="1.05" name="old_v" />
<cfparam default="0" name="old_s" />

<cfinvoke component="custom" method="get_color_codes" returnvariable="color_codes" />
<!--- <cfset color_codes = '16851,65535,16711935,16763904' />
--->
<cfparam name="url.image" default="14321" />
<cfparam name="PageNum_stone_ranges" default="1">
<cfset CurrentPage=GetFileFromPath(GetBaseTemplatePath())>

<cfif IsDefined("FORM.MM_InsertRecord") AND FORM.MM_InsertRecord EQ "form4">
 <cfloop list="#form.update#" index="j">
		<cfquery datasource="sptm" >
			update stone_name_variants set rgbhex = '#form.rgbhex#'	, opacity = #form.opacity#	 
		where id = #j# 
		</cfquery> 
 </cfloop>
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


    </style>


<script type="text/javascript" src="/js/jscolor.js"></script>
<script type="text/javascript" src="../imagejs/color.js"></script>
<script type="text/javascript" src="../imagejs/Deflate.js"></script>
<script type="text/javascript" src="../imagejs/PNG.js"></script>
<script type="text/javascript" src="../imagejs/Base64.js"></script>
	<script type="text/javascript" src="wddx.js"></script>
<script type="text/javascript">
		function texture_off()
		{
			 	changecss('.texture_pixel1','opacity',0);
				changecss('.texture_pixel2','opacity',0);
				changecss('.texture_pixel3','opacity',0);
				changecss('.texture_pixel4','opacity',0);
				return ;

		}

		function texture_on()
		{
			 	changecss('.texture_pixel1','opacity',1);
				changecss('.texture_pixel2','opacity',1);
				changecss('.texture_pixel3','opacity',1);
				changecss('.texture_pixel4','opacity',1);
				return false;

		}
		function stone_off()
		{
			 	changecss('.stone_pixel1','opacity',0);
				changecss('.stone_pixel2','opacity',0);
				changecss('.stone_pixel3','opacity',0);
				changecss('.stone_pixel4','opacity',0);
				return ;

		}
	function stone_on()
		{
			 	changecss('.stone_pixel1','opacity',1);
				changecss('.stone_pixel2','opacity',1);
				changecss('.stone_pixel3','opacity',1);
				changecss('.stone_pixel4','opacity',1);
				return ;

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
<!-- Begin

	<cftry>
	
<cfset dest_dir1 = "#Application.rootfolder#images\#category#" />
<cfset dest_dir2 = "#Application.rootfolder#images\custom\#category#" />
		<cffile action = "readBinary" file = "#dest_dir1#\#urldecode(image)#.png" variable = "aBinaryObj" charset="utf-8"   > 
	
	 	<cfscript>
				b = BinaryEncode(aBinaryObj, 'Base64');
				</cfscript>
		<!--- 		<cfhttp url="http://www.semiprecious.com/customrequest/png.php" />
				<cfset b = trim(cfhttp.filecontent) /> --->
<cfoutput>			var original = '#b#';
		<cffile action = "readBinary" file = "#dest_dir2#/#urldecode(image)#.png" variable = "aBinaryObj" charset="utf-8"   > 
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
  // --></script></head><body>	<cfoutput>#cfcatch.Detail#,#cfcatch.Message#</cfoutput>
	Image not customizable.
</body></html><cfabort />
</cfcatch>
	</cftry>

<!--- 	<cfimage  source="http://www.semiprecious.com/#url.img#" name="myLogo"> ---> 

<!--- <cfquery datasource="gemssql" name="opts">
                select * from options where itemid = 1707    
                </cfquery>
 --->			<!--- <cfdump var="#aBinaryObj#"> --->

var stone_col, stone_row;

    var stone  = new Array(4);
	stone[0] = new Array();
	 stone[1] =  new Array();
	 stone[2] =  new Array();
	 stone[3] =  new Array();
    var texture  =  new Array(4);
	 texture[0] =  new Array();
 texture[1] =  new Array();
 texture[2] =  new Array();
 texture[3] =  new Array();
var old_s = <cfoutput>#old_s#</cfoutput>;
var old_v = <cfoutput>#old_v#</cfoutput>;

function process(data1,data2){

<!--- working fine but not required at the moment <cfoutput>
document.getElementById('nativeimage').src = "images/custom#url.image#.png" ;</cfoutput> --->
	
	var orig = new PNG(data1);
	var color = new PNG(data2);
	var line;
	var groups = [];
	var groups2 = [];
	  
	var top0 = -1 ;
	var hsv = rgbToHsv(255,255,20);
    
	
	
		var simg2 = document.createElement('div');
		var simg3 = document.createElement('div');
		var simg1 = document.createElement('div');

	

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
			   top1 = Math.floor(pixel_count/color.width)+1; //y value
			   left1 = (pixel_count % color.width) ;   // x value
        	  	new_color  = color_line[x];
		    	new_RGB = orig_line[x];
		    	if (new_RGB == curr_RGB) // if texture is same then stone layer is implied
		  	      {
		  	       if (curr_zone != -1)// but are we in stone region?
		  	          {
     //		  	      stone[curr_zone][stone[curr_zone].length-1] = 	     stone[curr_zone][stone[curr_zone].length-1]+1;
	    	  	      texture[curr_zone][texture[curr_zone].length-1] =  	      texture[curr_zone][texture[curr_zone].length-1]+1;
					  continue;
		     		  	}
		  	       }
		  	        else
		  	        {
       		     	if (new_color == curr_color && curr_zone != -1)//different texture but  same zone  (further,with RGB different color would equal only in zone )
         		     	{
   			        
	//		            stone[curr_zone][stone[curr_zone].length-1] = stone[curr_zone][stone[curr_zone].length-1]+1;
			    		t1 = new_RGB.toString(16).padRight('0', 6);
					   	 rd  = h2d(left_(t1,2));
						 gd = h2d(right(left_(t1,4),2));
						 bd = h2d(right(t1,2));
						 oldhsv = rgbToHsv(rd,gd,bd);
					/*     newrgb = hsvToRgb(hsv.h, (2*hsv.s + old_s*oldhsv.s)/(2+old_s),old_v*oldhsv.v); // hsv.h + hsv.s + oldhsv.v makes black give white (crystal) 
					     rdn = Math.floor(newrgb.r);
					     bdn = Math.floor(newrgb.b);
					     gdn = Math.floor(newrgb.g);
					  */	      
					  		texture[curr_zone][texture[curr_zone].length] = left1;
					  	      texture[curr_zone][texture[curr_zone].length] = top1;
					  	      texture[curr_zone][texture[curr_zone].length] = (Math.round(oldhsv.s*1000))/1000;
					  	      texture[curr_zone][texture[curr_zone].length] = oldhsv.v;
					  	      texture[curr_zone][texture[curr_zone].length] = 1;
							  curr_RGB = new_RGB;
							  continue;
				                    		
					}else
						{ // niether rgb nor color are same. find new zone	  	  
			           new_zone = -1;
	
			           for (i = 0; i< groups2.length; i++)
			                  if (groups2[i] == new_color)
			                              new_zone = i;
	
/*			            switch(new_color)  {
				         case  groups2[0] : new_zone = 0;
                                  break;
				         case  groups2[1] : new_zone = 1;
                                  break;
				         case  groups2[2] : new_zone = 2;
                                  break;
						   case  groups2[3] : new_zone = 2;
                                  break;
							   }
	
	*/
				            curr_zone = new_zone;
							curr_RGB = new_RGB;
							curr_color = new_color;
				    
			       if (new_zone != -1)
					   {
                /*      stone[curr_zone][stone[curr_zone].length] = left1;
			  	      stone[curr_zone][stone[curr_zone].length] = top1;
			  	      stone[curr_zone][stone[curr_zone].length] = 1;
*/
			   		     t1 = new_RGB.toString(16).padRight('0', 6);;
					   	 rd  = h2d(left_(t1,2));
						 gd = h2d(right(left_(t1,4),2));
						 bd = h2d(right(t1,2));
						 oldhsv = rgbToHsv(rd,gd,bd);
						 /*
					     newrgb = hsvToRgb(hsv.h, hsv.s,1.15*oldhsv.v); // hsv.h + hsv.s + oldhsv.v makes black give white (crystal) 
					     rdn = Math.floor(newrgb.r);
					     bdn = Math.floor(newrgb.b);
					     gdn = Math.floor(newrgb.g);
					     */
					  	      texture[curr_zone][texture[curr_zone].length] = left1;
					  	      texture[curr_zone][texture[curr_zone].length] = top1;
					  	      texture[curr_zone][texture[curr_zone].length] = (Math.round(oldhsv.s*1000))/1000;
					  	      texture[curr_zone][texture[curr_zone].length] = oldhsv.v;
					  	      texture[curr_zone][texture[curr_zone].length] = 1;
							  continue;
					          }
		  		     	   }
		        	    }
			       }     /* start of layer formation */
			/* end of layer formation */				
			}
				document.getElementById('place').appendChild(simg3);
				document.getElementById('place').appendChild(simg1);

//				stone_agg = "";
//				texture_agg = "";
	//			s_index = 0;
				t_index = 0;
					var textu = '1,0,0,0,0,0';
				for (i = 0; i < stone.length;i++)
				{
                /*   if (stone[i].length > 0)
				        s_index += 1;
                   for (j = 0; j < stone[i].length;j = j+3) {
						px2 = document.createElement('div');
						px2.style.left = stone[i][j];
						px2.style.top = stone[i][j+1];
						px2.style.width = stone[i][j+2];
						px2.style.height = 1;
						px2.className = 'stone_pixel'+s_index;
						simg3.appendChild(px2);
				       }
               */
		
                   if (texture[i].length > 0 )
				           t_index += 1;
					for (j = 0; j < texture[i].length;j = j+5) {
				px2 = document.createElement('div');
	      		textu = textu +"|" + t_index + ","+ (px2.style.left = texture[i][j]) + ',' +	(px2.style.top = texture[i][j+1])
				+ ',' +	texture[i][j+2] + ',' +	 texture[i][j+3]+',' +( px2.style.width = texture[i][j+4]) ;
							px2.className = 'texture_pixel'+t_index;
						simg1.appendChild(px2);
				  
				
				    }
					}
						
//  		    document.getElementById('stones').value = simg3.innerHTML; //stone_agg;
		    document.getElementById('textures').value = textu;//texture_agg;
		    document.getElementById('group_count').value = t_index;
//		    alert(texture[1].length);
        
		 return;
	 }

//  End -->
</script>
</head>

<body onLoad="process(original,colored);">


<a href="." >Custom Main Menu</a>
	<cftry>
  <!--- working fine but not required. IE does not support this <cfimage action="writetobrowser" source="#aBinaryObj#" /> --->

<div style="width:800px;">
<cfoutput>
<div id="place" style="postion:relative;z-index:20;">
	    <img id="nativeimage" onClick="javascript:capture_click(e);"  style="border:1px gray solid;top:0;left:0;position:absolute;" src="/images/rings/#url.image#.jpg" />
</div>
<div id="place2" style="postion:relative;float:right;z-index:20;">
Texture <a href="javascript:texture_off();">off</a>   <a href="javascript:texture_on();">ON</a> Check Stone <a href="javascript:stone_on();">ON</a> <a href="javascript:stone_off();">OFF</a>
<form action="add_metadata.cfm?#CGI.QUERY_STRING#" method="post" enctype="multipart/form-data" >
	<input type="hidden" value="" name="stones"  id="stones" />
	<input type="hidden" value="" name="textures"  id="textures" />
	<input type="hidden" value="0" name="group_count"  id="group_count" />

	<input type="submit" value="Record Layers Data">
</form>
	</cfoutput>

</div>
</div>
<cfcatch type="any">
</cfcatch>
</cftry>             

<br>
</body></html>