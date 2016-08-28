<cfset color_codes = '16851,6022893,16711935' />
<cfparam name="url.image" default="14321" />
<cfset CurrentPage=GetFileFromPath(GetBaseTemplatePath())>

<cfif IsDefined("FORM.MM_InsertRecord") AND FORM.MM_InsertRecord EQ "form4">
 <cfloop list="#form.update#" index="j">
<cfquery datasource="sptm" name="check">
select * from custom_items_details where group_code = '#j#'
</cfquery> 
<cfif check.recordcount>
<cfquery datasource="sptm" >
update custom_items_details set count = #evaluate("form.count_"&j)#, carats = #evaluate("form.carats_"&j)#, shape_size_id = #evaluate("form.shape_size_"&j)# 
where group_code = '#j#' and custom_item_id = #form.imageid#  
</cfquery> 
<cfelse>
<cfquery datasource="sptm" >
insert into custom_items_details (count,shape_size_id, carats, group_code,custom_item_id) 
values(#evaluate("form.count_"&j)#, #evaluate("form.shape_size_"&j)# , #evaluate("form.carats_"&j)#, '#j#', #form.imageid#)
</cfquery> 
</cfif>
 </cfloop>
<cfset url.image = form.imageid />
</cfif>
<cfquery name="stone_ranges" datasource="sptm">
SELECT distinct(stone_shape_size.id), concat(stone_sizes.size,' ',stone_shapes.description) as ss
FROM stone_shape_size, stone_shapes, stone_sizes,stone_name_variants, stone_names, stone_variants, stone_ranges  
WHERE 
stone_name_variants.stone_names_id = stone_names.id  
and stone_name_variants.stone_variants_id = stone_variants.id  
and stone_shapes.id = stone_shape_size.stone_shapes_id 
and stone_shape_size.stone_sizes_id = stone_sizes.id  
and stone_ranges.stone_name_variant_id = stone_name_variants.id 
and stone_ranges.stone_shape_size_id = stone_shape_size.id 
order by
stone_names.name asc, stone_sizes.size
</cfquery>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
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
		/*	position: absolute;
			*/left: 10px;
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
	  <cfloop list="#color_codes#" index="p">
	  <cfoutput>  .group_#p# {</cfoutput>
		display:none;
		}
	</cfloop>

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
		<cffile action = "readBinary" file = "#application.rootfolder#customrequest/images/#urldecode(url.image)#.png" variable = "aBinaryObj" charset="utf-8"   > 
		<cfoutput>
		<cfscript>
				b = BinaryEncode(aBinaryObj, 'Base64');
				//b = toBase64(aBinaryObj,'iso-8859-1');
				</cfscript>
		<!--- 		<cfhttp url="http://www.semiprecious.com/customrequest/png.php" />
				<cfset b = trim(cfhttp.filecontent) /> --->
			var gravatr = '#b#';
<cffile action = "readBinary" file = "#application.rootfolder#customrequest/images/custom#urldecode(url.image)#.png" variable = "aBinaryObj" charset="utf-8"   > 
				<cfscript>
				b = BinaryEncode(aBinaryObj, 'Base64');
				//b = toBase64(aBinaryObj,'iso-8859-1');
				</cfscript>
		<!--- 		<cfhttp url="http://www.semiprecious.com/customrequest/png.php" />
				<cfset b = trim(cfhttp.filecontent) /> --->
			var gravatar = '#b#';
	</cfoutput>
		
	<cfcatch type="any">
	<cfoutput>#cfcatch.Detail#,#cfcatch.Message#</cfoutput>
	Image not customizable.
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
var stone_col, stone_row;

	var various_colors = Array();
	var cols_for_class = Array();
	var class_in_row = Array();
function show(data){
<cfoutput>document.getElementById('nativeimage').src = "images/custom#url.image#.png" ;</cfoutput>
	
	var png = new PNG(data);
	
	
	var line;
//			find out how many groups from hidden variable (known from preprocessing)
	//  for that many groups find new_stone		
	// if not 'same' then get name
	// with name use an associative array to get red green blue
      var groups = [];
	  <cfloop list="#color_codes#" index="p">
<cfoutput>	    groups.splice(groups.length,0,#p#);</cfoutput>
	</cfloop>
	  	while(line = png.readLine())
		{ 
	
		for (var x = 0; x < line.length; x++){
		  	newcolor  = line[x];
			//newcolor.toString(16).padRight('0', 6);
		  if (newcolor > 0)
		    for (pr = 0 ; pr < groups.length;pr++)
		        {
				   if  (newcolor == groups[pr])
	    	   			{
					   try {
						   a  = '.group'+'_'+groups[pr];
						   c = '2px solid ' +  newcolor.toString(16).padRight('0', 6);
						changecss(a,'display','block');
						changecss(a,'border',c );
						
						   } catch (e) {
				   						}
			            groups.splice(pr,1,"");
			   			}
				}
		   }
		}
 return;
 }

//  End -->
</script>
</head>
<body onLoad="show(gravatar);">
	The image converted to binary data and shown here using base64 data:
	<cftry>
		<div id="place" style="display:none;"><cfimage action="writetobrowser" source="#aBinaryObj#" />
</div>
<table><tr><td>
<cfoutput><br />2. Dumping the data in HTML Tag:<br /><br />

<img id="nativeimage" onClick="javascript:capture_click(e);"  style="border:1px gray solid;" src="images/custom#url.image#.png" />
</cfoutput></td><td>
<cfform action="#CurrentPage#" method="post" name="form4" id="form4">
<input type="hidden" name="MM_InsertRecord" value="form4" />
 <cfloop list="#color_codes#" index="j">
 <cfquery name="p" datasource="sptm">
	select * from custom_items,custom_items_details where imageid = #url.image#  and group_code = '#j#' and custom_items.imageid = custom_items_details.custom_item_id
</cfquery>

    <cfoutput>
            <div class="group_#j#">
              Update?<input type="checkbox" value="#j#" name="update">       Count:
                 <cfif p.recordcount>
                 <input type="text" name="count_#j#" value="#p.count#" />
                 <cfelse>
                 <input type="text" name="count_#j#" value="1" />
                    </cfif>   
                        Carats:

                 <cfif p.recordcount>

                                  <input type="text" name="carats_#j#" value="#p.carats#" /> 
                 <cfelse>
                                  <input type="text" name="carats_#j#" value="1" /> 

                    </cfif>   
                     </cfoutput>
                 Shape:
                 <cfif p.recordcount>

<select name="shape_size_#j#">
<cfoutput query="stone_ranges">
<cfif p.shape_size_id eq stone_ranges.id>
<option selected="true" value="#id#">#ss#</option>
<cfelse>
<option value="#id#">#ss#</option>
</cfif>
</cfoutput>
</select>
                                  
                 <cfelse>
 <cfselect name="shape_size_#j#" size="1"  query="stone_ranges" value="id" display="ss"></cfselect>                                  

                    </cfif>   
                    

</div>
                
        </cfloop>
<cfoutput><input type="hidden" name="imageid" value="#url.image#" />                      </cfoutput>
<input type="submit" value="update" />
</cfform>
</td></tr></table>
<cfcatch type="any">
</cfcatch>
</cftry> 

Then using javascript to dump the data as availabel in javascript variable:
<cfoutput>
			<!-- blue topaz http://www.semiprecious.com/customrequest/test3.cfm?img=customrequest%2Fpic1.png&red=30&green=202&blue=202
			iolite http://www.semiprecious.com/customrequest/test3.cfm?img=customrequest%2Fpic1.png&red=30&green=102&blue=202
			garnet http://www.semiprecious.com/customrequest/test3.cfm?img=customrequest%2Fpic1.png&red=99&green=10&blue=10
			http://www.semiprecious.com/customrequest/test3.cfm?img=customrequest%2Fpic1.png&red=200&green=100&blue=100-->
            
Select Image: <a href="?image=14312"><img src="images/14312.png" width="50px" /></a> <a href="?image=14321"><img src="images/14321.png" width="50px" /></a>
</cfoutput>

</body></html>