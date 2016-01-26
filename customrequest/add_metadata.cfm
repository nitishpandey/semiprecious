<cfinvoke component="custom" method="get_color_codes" returnvariable="color_codes" />
	<cfset dest_dir1 = "#Application.rootfolder#customrequest" />

<cfscript>
/**
 * Converts from decimal(base10) to hexadecimal (base16).
 * 
 * @param str    Decimal number to convert to hexadecimal. 
 * @return Returns a string. 
 * @author Rob Brooks-Bilson ([EMAIL PROTECTED]) 
 * @version 1, November 6, 2001 
 */
function DecToHex(str){
  p = Ucase(FormatBaseN(str, 16));
  if (len(p) LT 6)
     p = "00" & p;
     return p;
    
}
</cfscript>

<html>
<head>
	<link href="custom.css" type="text/css" rel="stylesheet" />
	<style type="text/css">
<cfoutput>
   <cfloop from="1" to="#listlen(color_codes)#" index="counter">
	 .texture_pixel#counter# {
	     background-color: ###DecToHex(listgetat(color_codes,counter))#;
	  }

	</cfloop>

</cfoutput>
  </style>
<script type="text/javascript" src="../imagejs/color.js"></script>
<script type="text/javascript" language="javascript"  >
        var hsv, s, v;	 
 function hsvtorgb2(a,b)
{
if (hsv.s < 0.2)
      if (a < 0.15)
          {
          	 s = (a+0.1)*hsv.s + (0.9-a)*a ;
          	 v = b;
          	return 	hsvToRgb(hsv.h ,  (a+0.1)*hsv.s + (0.9-a)*a   ,b);
          }
			
		else
		  {
		  	s = hsv.s;
		  	v = b;
		  	return 	hsvToRgb(hsv.h , hsv.s,b);
		  }
			
	else
	  if (a < 0.15)
	  {
	  	 s = (a+0.15)*hsv.s + (1-a-0.15)*a;
	  	 v  = b;
	  		return 	hsvToRgb(hsv.h ,  (a+0.15)*hsv.s + (1-a-0.15)*a   ,b);
	  }
		
		else
		 {
		 	 s =  ((1-0.15*a)*a + hsv.s)/(2-0.15*a) - (1-a)/4;
		 	 v = b;
		 	return 	hsvToRgb(hsv.h ,  ((1-0.15*a)*a + hsv.s)/(2-0.15*a) - (1-a)/4 ,b);
		 }
			
	}
    
 function egnahc(roloc,reyal)
         {		
	        t1 = roloc.toString(16).padRight('0', 6);;
					   	 rd  = h2d(left_(t1,2));
						 gd = h2d(right(left_(t1,4),2));
						 bd = h2d(right(t1,2));
						
	 hsv = rgbToHsv(rd,gd,bd);
  
      var i = reyal - 1;
         	  (simg2 =	document.getElementById('p'+reyal)).innerHTML = '';              
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
						px2.style.backgroundColor  = 'hsv(' + hsv.h +','+ s +','+ v*10 +'%)';
						px2.className = 'texture_pixel'+reyal;
						simg2.appendChild(px2);
						}
						
         }
</script>
</head>
<body style="padding-top:30px;">
	
<cfif isdefined("form.textures")><!--- updating info --->
	<cfquery datasource="sptm">
		delete from custom_items_details where custom_item_id = #url.image#
	</cfquery>
	<cfset k = 1 />

	<cfloop to="#form.group_count#" from="1" index="p"   >
		<!--- this zone code till this insert is only ordinal and has an equal number as lable in overlay layer. The immutable linking of layer region with metadata is established on 
		submitting of metadata form. The form has fields that take in value as per this ordinal number while displaying the layer with color. The fields in form
		and overlay are shown to be related by having same color. The color is same as it is picked up from color_code list in the same sequence for this instance of page 
		opening. Thus color sequence can change later and it would not matter. Later if color sequence changes as more colors are added, the link of layer label and zone number and zone info as per zone number remains immutable.
		(example: overlay with label 1 <> zone number 1 <>  metadata for zone  number 1) --->
		<cfquery datasource="sptm">
			insert into custom_items_details (`custom_item_id`,`zone_code`,`stone_layer`) values (#image#,#k#,'infile') 
		</cfquery>
		<cfset k = k + 1 />
	</cfloop>
<cfset c = k -1 />

	<cfset div1 = '' />
	<cfset div2 = '' />
	<cfset div3 = '' />
	<cfset div4 = '' />
	<cfset div5 = '' />
	<cfset div6 = '' />
<cfset divs = ArrayNew(1) />
<cfloop from=1 to=#listlen(color_codes)# index=t>
<cfset divs[t] = '' />
</cfloop>	 
	 <cftry>
		 <cfloop list="#form.textures#" delimiters="|" index="prop" >
			 <cfswitch expression="#listgetat(prop,2)#">
				 <cfcase value="0">

			  	</cfcase>
<cfdefaultcase >
<cfset divs[#listgetat(prop,1)#] = divs[#listgetat(prop,1)#] & ' <div style="width:#listgetat(prop,6)#;top:#listgetat(prop,3)#;left:#listgetat(prop,2)#;"
			  	class="texture_pixel#listgetat(prop,1)#"></div>' />

</cfdefaultcase >
<!---				 <cfcase value="1">
			  	</cfcase>
			  	 <cfcase value="2">
			 	<cfset div2 = div2 & ' <div style="width:#listgetat(prop,6)#;top:#listgetat(prop,3)#;left:#listgetat(prop,2)#;background-color:hsl(80,#100*listgetat(prop,4)#%,#listgetat(prop,5)/3.60#%);"
			  	class="texture_pixel#listgetat(prop,1)#"></div>' />
			  	</cfcase>
			  	 <cfcase value="3">
			 	<cfset div3 = div3 & ' <div style="width:#listgetat(prop,6)#;top:#listgetat(prop,3)#;left:#listgetat(prop,2)#;background-color:hsl(80,#100*listgetat(prop,4)#%,#listgetat(prop,5)/3.60#%);"
			  	class="texture_pixel#listgetat(prop,1)#"></div>' />
			  	</cfcase>
			  	 <cfcase value="4">
			 	<cfset div4 = div4 & ' <div style="width:#listgetat(prop,6)#;top:#listgetat(prop,3)#;left:#listgetat(prop,2)#;background-color:hsl(80,#100*listgetat(prop,4)#%,#listgetat(prop,5)/3.60#%);"
			  	class="texture_pixel#listgetat(prop,1)#"></div>' />
			  	</cfcase>
			  	 <cfcase value="5">
			 	<cfset div5 = div5 & ' <div style="width:#listgetat(prop,6)#;top:#listgetat(prop,3)#;left:#listgetat(prop,2)#;background-color:hsl(80,#100*listgetat(prop,4)#%,#listgetat(prop,5)/3.60#%);"
			  	class="texture_pixel#listgetat(prop,1)#"></div>' />
			  	</cfcase>
			  	 <cfcase value="6">
			 	<cfset div6 = div6 & ' <div style="width:#listgetat(prop,6)#;top:#listgetat(prop,3)#;left:#listgetat(prop,2)#;background-color:hsl(80,#100*listgetat(prop,4)#%,#listgetat(prop,5)/3.60#%);"
			  	class="texture_pixel#listgetat(prop,1)#"></div>' />
			  	</cfcase>
	--->
	  	</cfswitch>
		  	
		</cfloop>
		<cfcatch type="any">
<Cfoutput>#cfcatch.message#</cfoutput>
		</cfcatch>
</cftry>
<cfset divtex = '' />
 <cfloop from=1 to=#listlen(color_codes)# index=t>
		<cfif len(divs[t])>
				<cfset divtex = divtex & '<div id="p#t#">' & divs[t] & '</div>' />
		</cfif>
</cfloop>

			<cffile action="write" output="#divtex#" file="#dest_dir1#\textures\textur_#image#.txt"  />

		<cfquery datasource="sptm">
			update custom_items set status='layered' where imageid  = #image# 
		</cfquery>

Layer Information  added. 
<cfelse>
<cfquery datasource="sptm" name="layers">
	select category from custom_items, custom_items_details  where custom_item_id  = #image#  and custom_item_id = imageid
</cfquery>

<cfset c = layers.recordcount />
		<cfif isdefined("form.add_metadata")>
		   <cfloop from="1" to="6"  index="k">
				<cfif isdefined("form.carat_#k#") >
					<cfif evaluate("form.count_"& k ) GT 0 and evaluate("form.shape_"& k ) GT 0 >
						<cfquery datasource="sptm">
							update custom_items_details set carats = 1 , `count` = #evaluate("form.count_"& k )#, shape_size_id = #evaluate("form.shape_"& k )# where custom_item_id  = #image# and zone_code = #k# 
						</cfquery>		
	                  updated zone <cfoutput>#k#</cfoutput>
                 </cfif>

				</cfif>
		   </cfloop>
		<cfif form.silverwt GT 0>
			<cfquery datasource="gemssql">
				update items set metalwt = #form.silverwt#  where newitem  = #image#
			</cfquery>		
		</cfif>	
					Added data.	    
		<cfquery datasource="sptm">
			update custom_items set status='metadata' where imageid  = #image# 
		</cfquery>
	Item info ready for customer 
	 </cfif>

		<cffile action="read" file="#dest_dir1#\textures\textur_#image#.txt" variable="divtex" />

</cfif>

		<a href=".">Back to main menu</a>
			<cfquery datasource="sptm" name="stone_shapes">
				select stone_shape_size.id as id , stone_shapes.description as d, stone_sizes.size as s from stone_shape_size, stone_shapes, stone_sizes where stone_shapes_id = stone_shapes.id and stone_sizes_id  = stone_sizes.id 
			</cfquery>
	<cfif c>
Or
Add metadata for this item below:
<cfquery datasource="sptm" name="dk" >
	select zone_code, stone_layer,carats,count, shape_size_id from custom_items_details where custom_item_id  = #image# 
</cfquery>
<cfquery datasource="gemssql" name="sw" >
	select metalwt from items where newitem   = #image# 
</cfquery>
<!---
      		textu = textu + t_index + ","+ (px2.style.left = texture[i][j]) + ',' +	(px2.style.top = texture[i][j+1])
				+ ',' +	texture[i][j+2] + ',' +	 texture[i][j+3]+',' +( px2.style.width = texture[i][j+4]) +"|" ;
--->
<div style="display:block;width:600px;">
<div id="curtain" style="float:left;background-color:white;float:left;z-index:30;position:relative;width:590px;height:400px;">
&nbsp;</div>
<div id="place" style="float:left;z-index:0;position:relative;width:450px;height:300px;">
	<cfoutput>
		<img style="position:absolute;left:1;top:1;z-index:1;" src="/images/#category#/#image#.jpg" />
#divtex#
	</cfoutput>
	
</div>
</div><br />
<cfoutput>
<form style="border:1px;opacity:1;" method="post" action="?#cgi.QUERY_STRING#">
	<input type="hidden" name="add_metadata" value="y" />
	<input type="hidden" name="image" value="#image#">
	Silver Wt: <input type="text" name="silverwt" value="#sw.metalwt#" />
	<br />
</cfoutput>

<cfoutput query="dk">
<span style="background:###dectohex(listgetat(color_codes,zone_code))#">&nbsp;&nbsp;&nbsp;&nbsp;	</span>
<cfif carats><!--- we have an earlier value in the table --->
Stone Count: <input type="text" name="count_#zone_CODE#" value="#count#">
 <input type="hidden" name="carat_#zone_code#" value="#carats#">
Shape: <select name="shape_#zone_code#"  >
	<option value="0">Stone Shape Descr</option>
	<cfloop query="stone_shapes">
	<cfif dk.shape_size_id is stone_shapes.id>
			<option selected="true"  value="#id#">#s# #d#</option>
		<cfelse>
		<option value="#id#">#s# #d#</option>
	</cfif>
	</cfloop>
	</select>
	<cfelse>
Count: <input type="text" name="count_#zone_code#" value="1">
Carat: <input type="hidden" name="carat_#zone_code#" value="1">
Stone Shape:<select name="shape_#zone_code#"  >
	<option value="0">Stone Shape and Size</option>
<cfloop query="stone_shapes">
	<option value="#id#">#s# #d#</option>
	</cfloop>
	</select>
			<cfquery datasource="gemssql" name="sw">
          select metalwt from items where newitem = #image#
		</cfquery>
	</cfif>
<span class="texture_pixel#zone_code#" style="height:12px;"> 	
	<a href="javascript:egnahc('#dectohex(listgetat(color_codes,zone_code))#',#zone_code#)">detect</a>
&nbsp;&nbsp;&nbsp;&nbsp;	</span>
<br /></cfoutput>


	<a href="stone_adder.cfm">Add new stone shape and size combination (then reload this page)</a>
<br />
<input type="submit" value="update meta data" >
</form>

		
<cfelse>
no layers yet!<cfoutput>
To process for layers <a href="build_layers.cfm?image=#image#&amp;category=#category#">click here</a>
</cfoutput>
</cfif>
<a href="." >Custom Main Menu</a>
<cfif isdefined('form.textures')>
<cfsavecontent variable="jsfile">

    <cfoutput>
	  
	  var texture  =  new Array(#listlen(color_codes)#);
		  <cfloop from="0" to="#evaluate(listlen(color_codes)-1)#" index="p">
 				texture[#p#] =  new Array();
		</cfloop>
	</cfoutput>
	
	   	<cfoutput>
	<cftry>
		<cfloop list="#form.textures#" delimiters="|" index="prop" >
			<cfset layer = listgetat(prop,1) - 1 />
			texture[#layer#][texture[#layer#].length] = #listgetat(prop,4)# ;
			texture[#layer#][texture[#layer#].length] = #listgetat(prop,5)# ;
		</cfloop>
       <cfcatch type="any">
<cfoutput>#cfcatch.message#</cfoutput>
	</cfcatch>
	</cftry>
       
        </cfoutput> 
						
</cfsavecontent>
		<cffile action="write" output="#jsfile#" file="#dest_dir1#\js\#image#.js"  />
</cfif>
			<cfoutput>
			<script src="js/#image#.js" type="text/javascript" ></script>
			
			</cfoutput>
			<script language="javascript">
			document.getElementById('curtain').style.display = 'none';
			</script>
</body>

</html>