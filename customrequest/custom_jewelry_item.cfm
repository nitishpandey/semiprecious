<cfparam name="image" default="14312" />
<cfinvoke component="customrequest.custom" method="get_color_codes" returnvariable="color_codes" />
		<cfset dest_dir1 = "#Application.rootfolder#/customrequest" />
		<cffile action="read" file="#dest_dir1#\textures\textur_#image#.txt" variable="divtex" />
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
	<title>Design your own Jewelry at semiprecious.com</title>

  <link href="custom.css" type="text/css" rel="stylesheet" />
<link href="/styles/style_semiprecious.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/js/global.js"></script>
<script type="text/javascript" src="/imagejs/color.js"></script>
<script type="text/javascript" src="/imagejs/custom.js"></script>
</head>
<body  style="margin-top:0px;text-align:center;">

	<div id="container1" align="center">

	<cfinclude template="/header#session.country#.cfm" />
	   <div style="width:930px;padding-top:4px;display:block;">

 	<cfinclude template="/leftmenus.cfm" />
	<cfquery datasource="gemssql" name="layers">
		select category from custom_items, custom_items_details  where custom_item_id  = #image#  and custom_item_id = imageid
</cfquery>
<cfset c = layers.recordcount />
	<cfquery datasource="gemssql" name="stone_shapes">
		select stone_shape_size.id as id , stone_shapes.description as d, stone_sizes.size as s from stone_shape_size, stone_shapes, stone_sizes where stone_shapes_id = stone_shapes.id and stone_sizes_id  = stone_sizes.id
	</cfquery>
	<cfif c>
		<cfset category = layers.category />
		<cfquery datasource="gemssql" name="dk" >
			select zone_code,  stone_layer,carats,count, shape_size_id from custom_items_details where custom_item_id  = #image#
		</cfquery>
<div style="float:right">
<cfinclude template="/includes/right_menu.cfm" />
</div>
	<div style="margin-left:30px;display:block;width:500px;float:left;">
		<div style="display:block;width:500px;position:relative;left:10px;top:10px;">
		<div id="curtain" style="position:absolute;float:left;background-color:white;z-index:30;width:600px;height:400px;">
			Processing image
		</div>
			<div id="place" style="float:left;z-index:0;position:relative;top:0;left:0;;width:500px;height:300px;">
			<cfoutput>
				<img style="position:absolute;left:1;top:1;z-index:1;" src="/images/#category#/#image#.jpg" />
#divtex#
<!---
<div id="p1"></div>
				<div id="p2"></div>
				<div id="p3"></div>
				<div id="p4"></div>

				<div id="p5"></div>
				<div id="p6"></div>			 --->
</cfoutput>

		</div>
	 </div>
	<cfset select_box = '<div style="margin-left:20px;float:left;">' />
		 <cfoutput query="dk">
			<cfquery datasource="gemssql" name="avst" >
				select stone_name_variants.rgbhex, stone_name_variants.opacity, stone_ranges.stone_name_variant_id,stone_names.pic as pic, stone_names.name as snd,stone_variants.description as svd, stone_sizes.size as ssd, stone_ranges.stone_shape_size_id
	,stone_ranges.id as sri
		   from stone_names, stone_variants, stone_shape_size, stone_name_variants,stone_shapes ,stone_ranges,stone_sizes
	where
	        stone_ranges.stone_name_variant_id = stone_name_variants.id
		and stone_ranges.stone_shape_size_id = stone_shape_size.id
		and	stone_name_variants.stone_names_id = stone_names.id
		and stone_name_variants.stone_variants_id = stone_variants.id
		and stone_shape_size.stone_sizes_id = stone_sizes.id
		and stone_shapes.id = stone_shape_size.stone_shapes_id
		and stone_ranges.stone_shape_size_id = #dk.shape_size_id#
	</cfquery>
   <cfif avst.recordcount >
     <cfset select_box = select_box & '<DIV class="green_bg side_hd" style="width:500px;clear:both;" onclick="flipDisplay(''stone_selector_#currentrow#'');" align="center" border="0px"><span class="stone_pixel#currentrow#">&nbsp;</span> &nbsp;Stone Set #currentrow# &nbsp;<IMG src="/images/down.gif">
		</div>	<DIV style="DISPLAY:none;width:450px;border:1px; gray solid;" id="stone_selector_#currentrow#">' />
        <cfloop query="avst">
     	   <cfset select_box = select_box & '<span style="float:left;"><img style="display:inline;" width="30px" src="images/#pic#" />	<a href="javascript:egnahc(' & "'#avst.rgbhex#', #dk.currentrow#);" & '" >			#snd# 			</a></span> ' />
		</cfloop>
		<cfset select_box = select_box & '</DIV>' />
	</cfif>
</cfoutput>

<cfoutput>
	<cfset layer_count = 1 />

<!---
				<cfset tex1 = listgetat(texture_layer,layer_count,'|') />
<cfif listlen(tex1)>
	<cfloop list="#tex1#" index="tex" delimiters="+"  >

				<div style="position:absolute;left:#listfirst(texture_layer,1)#px <cfset p = listdeleteat(texture_layer,1)/>
;top:#listfirst(texture_layer,1)#px <cfset p = listdeleteat(texture_layer,1)/>;background-color:rgb(#listfirst(texture_layer,1)# <cfset p = listdeleteat(texture_layer,1)/>
,#listfirst(texture_layer,1)# <cfset p = listdeleteat(texture_layer,1)/>
,#listfirst(texture_layer,1)#) <cfset p = listdeleteat(texture_layer,1)/>
;width:#listfirst(texture_layer,1)#px <cfset p = listdeleteat(texture_layer,1)/>
;height:1px;z-index:2;" class="texture_pixel#currentrow#"></div>
#tex#=

 <cfset w = listgetat(tex,step_+2) />
	<div style="position:absolute;left:#listfirst(tex,step_)#px;top:#listgetat(tex,step_+1)#px;background-color:rgb(#listgetat(tex,step_+2)#,#listgetat(tex,step_+3)#,#listgetat(tex,step_+4)#);width:#listgetat(tex,step_+5)#px;height:1px;z-index:2;" class="texture_pixel#layer_count#"></div>

		</cfloop>
		</cfif>
	<cfset layer_count = layer_count + 1 />
				<cfset tex1 = listgetat(texture_layer,layer_count,'|') />
<cfif listlen(tex1)>
	<cfloop list="#tex1#" index="tex" delimiters="+"  >
<!---				<div style="position:absolute;left:#listfirst(texture_layer,1)#px <cfset p = listdeleteat(texture_layer,1)/>
;top:#listfirst(texture_layer,1)#px <cfset p = listdeleteat(texture_layer,1)/>;background-color:rgb(#listfirst(texture_layer,1)# <cfset p = listdeleteat(texture_layer,1)/>
,#listfirst(texture_layer,1)# <cfset p = listdeleteat(texture_layer,1)/>
,#listfirst(texture_layer,1)#) <cfset p = listdeleteat(texture_layer,1)/>
;width:#listfirst(texture_layer,1)#px <cfset p = listdeleteat(texture_layer,1)/>
;height:1px;z-index:2;" class="texture_pixel#currentrow#"></div>
#tex#=

 <cfset w = listgetat(tex,step_+2) />
 		--->
	<div style="position:absolute;left:#listgetat(tex,step_)#px;top:#listgetat(tex,step_+1)#px;background-color:rgb(#listgetat(tex,step_+2)#,#listgetat(tex,step_+3)#,#listgetat(tex,step_+4)#);width:#listgetat(tex,step_+5)#px;height:1px;z-index:2;" class="texture_pixel#layer_count#"></div>

		</cfloop>

		</cfif>
<cfabort />
 		--->
<div style="display:block;">
<form  method="post" action="?#cgi.QUERY_STRING#">
<div style="text-align:center">
Select the stones from below options. When you have what you like click here<br /> <input type="submit" value="Save To Cart" class="greenbutton" >
</div>

		#select_box#

</div>


</form>
</div>
</div>
</div>
</cfoutput>


<cfelse>
This jewelry is not available<cfoutput>
	<cfif isdefined("session.apptt") >
		To process for layers <a href="build_layers.cfm?image=#image#&amp;category=#category#">click here</a>
	</cfif>
		</cfoutput>
</cfif>

	<div style="clear:both;width:930px;margin-top:3px;"><cfinclude template="/mainfooter.cfm" />
	</div>
</div>
	</div>
		<cfoutput>
			<script src="js/#image#.js" type="text/javascript" ></script>

			</cfoutput>
			<script language="javascript">
			document.getElementById('curtain').style.display = 'none';
						document.getElementById('curtain').style.height = 1;
			</script
</body>

</html>