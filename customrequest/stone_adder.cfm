<cfset CurrentPage=GetFileFromPath(GetBaseTemplatePath())>
<cfset error = "" />
<cfif isdefined("url.shape_size")>
	<cfquery datasource="sptm" name="checkuse">
	select carats from custom_items_details where shape_size_id = #url.shape_size#
	</cfquery>
  <cfif checkuse.recordcount is 0>
	<cfquery datasource="sptm">   
	  delete from stone_shape_size where id = #url.shape_size#
	</cfquery>
	<cfquery datasource="sptm">   
	  delete from stone_ranges where stone_shape_size_id = #url.shape_size#
	</cfquery>
	<cfset error = 'shape in use by some item. cannot delete' />
   </cfif>
  </cfif>
<cfif isdefined("url.name_variant")>
  <cfquery datasource="sptm">   
  delete from stone_name_variants where id = #url.name_variant#
</cfquery>

  <cfquery datasource="sptm">   
  delete from stone_ranges where stone_name_variant_id  = #url.name_variant#
</cfquery>
</cfif>
<cfif IsDefined("FORM.rate_per_carat") AND FORM.MM_InsertRecord EQ "form7">
<cfif IsDefined("FORM.name_variant") AND IsDefined("FORM.shape_size") >
  <cfquery datasource="sptm">   
    INSERT INTO stone_ranges (stone_name_variant_id, stone_shape_size_id,rate_per_carat,cw)
VALUES (<cfif IsDefined("FORM.name_variant") AND #FORM.name_variant# NEQ "">
<cfqueryparam value="#FORM.name_variant#" cfsqltype="cf_sql_clob" maxlength="28">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.shape_size") AND #FORM.shape_size# NEQ "">
<cfqueryparam value="#FORM.shape_size#" cfsqltype="cf_sql_numeric">
<cfelse>
NULL
</cfif>
, 
<cfqueryparam value="#FORM.rate_per_carat#" cfsqltype="cf_sql_numeric">
, 
#FORM.cw#
)
  </cfquery>
  <cfelse>
  <cfset error = error & " Please select one item from stone type and one item from shape type">
  </cfif>
</cfif>

<cfif IsDefined("FORM.MM_InsertRecord") AND FORM.MM_InsertRecord EQ "form1">
<cfif IsDefined("FORM.name") AND #FORM.name# NEQ "">
  <cfquery name="check_" datasource="sptm">   
	  select id from stone_names where name = '#trim(form.name)#'
  </cfquery>
  <cfif check_.recordcount>
      <cfquery  datasource="sptm">   
				delete from stone_names where name = '#trim(form.name)#'
		</cfquery>
  </cfif>
  <cfquery datasource="sptm">   
    INSERT INTO stone_names (name, pic <cfif check_.recordcount>,id</cfif>)
VALUES (
<cfqueryparam value="#trim(FORM.name)#" cfsqltype="cf_sql_clob" maxlength="28">
, 
<cfif len(form.imagefile)>
	
<!--- this code was uploading and saving image represent pics as binary data. These pics need to be shown 
in client UI but IE does not easily support binary data to show pics. Hence now saving pic as it is 
		<cffile action="readBinary" file="#form.imagefile#"  variable="image">
        '#tobase64(image)#'
	--->
	<cffile action="upload" filefield="imagefile" destination="#application.rootfolder#\customrequest\images\" nameconflict="OVERWRITE">
		
	'#cffile.clientfile#'

	<cfelse>
		''
	</cfif>
	<cfif check_.recordcount>,#check_.id#</cfif>

)
  </cfquery>
<cfset error = "stone name and pic added succesfully. " />
</cfif>
</cfif>

<cfif IsDefined("FORM.MM_InsertRecord") AND FORM.MM_InsertRecord EQ "form2">
  <cfquery name="d" datasource="sptm">   
select carat_factor from stone_variants whre description = '#trim(FORM.description)#'
</cfquery>
<cfif not d.recordcount>
  <cfquery datasource="sptm">   
    INSERT INTO stone_variants (description, carat_factor)
VALUES (<cfif IsDefined("FORM.description") AND #trim(FORM.description)# NEQ "">
<cfqueryparam value="#trim(FORM.description)#" cfsqltype="cf_sql_clob" maxlength="255">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.carat_factor") AND #trim(FORM.carat_factor)# NEQ "">
<cfqueryparam value="#trim(FORM.carat_factor)#" cfsqltype="cf_sql_numeric">
<cfelse>
1
</cfif>

)
  </cfquery>
<cfset error = 'descr added.'>

<cfelse>
<cfset error = 'descr already exits.'>
</cfif>
</cfif>
<cfif IsDefined("FORM.MM_InsertRecord") AND FORM.MM_InsertRecord EQ "form3">
  <cfquery datasource="sptm">   
    INSERT INTO stone_shapes (description)
VALUES (<cfif IsDefined("FORM.description") AND #FORM.description# NEQ "">
<cfqueryparam value="#FORM.description#" cfsqltype="cf_sql_clob" maxlength="20">
<cfelse>
''
</cfif>
)
  </cfquery>
</cfif>
<cfif IsDefined("FORM.MM_InsertRecord") AND FORM.MM_InsertRecord EQ "form5">
  <cfquery datasource="sptm">   
    INSERT INTO stone_sizes (size)
VALUES (<cfif IsDefined("FORM.size") AND #FORM.size# NEQ "">
<cfqueryparam value="#FORM.size#" cfsqltype="cf_sql_clob" maxlength="10">
<cfelse>
''
</cfif>
)
  </cfquery>
</cfif>
<cfif IsDefined("FORM.MM_InsertRecord") AND FORM.MM_InsertRecord EQ "form4">
<cfloop list="#form.variants#" index="j">
  <cfquery datasource="sptm">   
    INSERT INTO stone_name_variants (stone_names_id, stone_variants_id)
VALUES (<cfif IsDefined("FORM.stone_name") AND #FORM.stone_name# NEQ "">
<cfqueryparam value="#FORM.stone_name#" cfsqltype="cf_sql_clob" maxlength="28">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.variants") AND #FORM.variants# NEQ "">

<cfqueryparam value="#j#" cfsqltype="cf_sql_numeric">

<cfelse>
NULL
</cfif>
)
  </cfquery>
</cfloop>
</cfif>

<cfif IsDefined("FORM.MM_InsertRecord") AND FORM.MM_InsertRecord EQ "form6">
<cfloop list="#form.size_id#" index="j">
<cftry>
  <cfquery datasource="sptm">   
    INSERT INTO stone_shape_size (stone_shapes_id, stone_sizes_id)
VALUES (<cfif IsDefined("FORM.shape_id") AND #FORM.shape_id# NEQ "">
<cfqueryparam value="#FORM.shape_id#" cfsqltype="cf_sql_clob" maxlength="28">
<cfelse>
''
</cfif>
, <cfif IsDefined("FORM.size_id") AND #FORM.size_id# NEQ "">

<cfqueryparam value="#j#" cfsqltype="cf_sql_numeric">

<cfelse>
NULL
</cfif>
)
  </cfquery>
<cfcatch type="any">
</cfcatch>
</cftry>
</cfloop>
</cfif>
<cfquery name="Recordset1" datasource="sptm">
SELECT name, id
FROM stone_names
ORDER BY name ASC 
</cfquery>
<cfquery name="variants" datasource="sptm">
SELECT *
FROM stone_variants
ORDER BY description ASC 
</cfquery>
<cfquery name="shapes" datasource="sptm">
SELECT *
FROM stone_shapes
ORDER BY description ASC 
</cfquery>
<cfquery name="sizes" datasource="sptm">
SELECT *
FROM stone_sizes 
</cfquery>
<cfquery name="stone_name_variants" datasource="sptm">
SELECT stone_names.name, stone_name_variants.id, stone_variants.description,stone_variants.carat_factor
FROM stone_name_variants, stone_names, stone_variants 
WHERE stone_variants.id = stone_name_variants.stone_variants_id
and stone_name_variants.stone_names_id = stone_names.id 
</cfquery>

<cfquery name="stone_shape_size" datasource="sptm">
SELECT stone_shapes.description,stone_shape_size.id, stone_sizes.size
FROM stone_shape_size, stone_shapes, stone_sizes 
WHERE stone_shapes.id = stone_shape_size.stone_shapes_id
and stone_shape_size.stone_sizes_id = stone_sizes.id 
</cfquery>
<cfquery name="stone_ranges" datasource="sptm">
SELECT stone_ranges.cw, stone_shapes.description,rate_per_carat, pic, stone_names.name,stone_sizes.size, stone_variants.description as variant
FROM stone_shape_size, stone_shapes, stone_sizes,stone_name_variants, stone_names, stone_variants, stone_ranges  
WHERE 
stone_name_variants.stone_names_id = stone_names.id  
and stone_ranges.stone_name_variant_id = stone_name_variants.id  
and stone_shapes.id = stone_shape_size.stone_shapes_id 
and stone_shape_size.stone_sizes_id = stone_sizes.id  
and stone_name_variants.stone_variants_id = stone_variants.id  
and stone_ranges.stone_name_variant_id = stone_name_variants.id 
and stone_ranges.stone_shape_size_id = stone_shape_size.id 
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<cfoutput>#error#</cfoutput>
<table width="90%" border="1">
  <tr>
    <td><form action="<cfoutput>#CurrentPage#</cfoutput>" method="post" name="form3" id="form3">
  <table align="center">
    <tr valign="baseline">
      <td nowrap="nowrap" align="right">Add  a new stone shape Here:</td>
      <td><input type="text" name="description" value="" size="32" /></td>
      <td><input type="submit" value="Insert record" /></td>
    </tr>
  </table>
  <input type="hidden" name="MM_InsertRecord" value="form3" />
</form>
</td>
    <td><form action="<cfoutput>#CurrentPage#</cfoutput>" method="post" name="form5" id="form5">
  <table align="center">
    <tr valign="baseline">
      <td nowrap="nowrap" align="right">Size Description:</td>
      <td><input type="text" name="size" value="" size="32" /></td>
      <td><input type="submit" value="Insert record" /></td>
    </tr>
  </table>
  <input type="hidden" name="MM_InsertRecord" value="form5" />
</form>&nbsp;</td>
  </tr>
  <tr>
    <td><form action="<cfoutput>#CurrentPage#</cfoutput>" enctype="multipart/form-data" method="post" name="form1" id="form1">
  <table align="center">
    <tr valign="baseline">
      <td nowrap="nowrap" align="right">Provide Stone Name:</td>
      <td><input type="text" name="name" value="" size="32" /></td>
    </tr>
    <tr valign="baseline">
      <td nowrap="nowrap" align="right">Tiny PNG Pic</td>
      <td><input type="file"  name="imagefile" /> -  <input type="submit" name="MM_InsertRecord" value="form1" />

</td>
    </tr>
  
  </table>
</form></td>
    <td>
<form action="<cfoutput>#CurrentPage#</cfoutput>" method="post" name="form2" id="form2">
  <table align="center">
    <tr valign="baseline">
      <td nowrap="nowrap" align="right">Variant Description:</td>
      <td><input type="text" name="description" value="" size="32" /></td>
    </tr>
    <tr valign="baseline">
      <td nowrap="nowrap" align="right">Carat_factor:</td>
      <td><input type="text" name="carat_factor" value="1" size="32" /> <input type="submit" value="Insert record" /></td>
    </tr>
  </table>
  <input type="hidden" name="MM_InsertRecord" value="form2" />
</form>
&nbsp;</td>
  </tr>
</table>

<table width="800" border="1">
  <tr>
    <td>
	<cfform action="#CurrentPage#" method="post" name="form4" id="form4">
  Pair Stone with Variant. Current Stones:
  <cfselect name="stone_name" size="1" query="Recordset1" value="id" display="name"></cfselect>
  <input type="hidden" name="MM_InsertRecord" value="form4" />

<table border="1">
  <tr>
<td style="background-color:gray;">Select </td>    <td>description</td>
    <td>carat_factor</td>
    
  </tr>
</table>	<table border="1" style="overflow-y:scroll;height:100px;display:block;">
  <cfoutput query="variants">
    <tr><td><input type="checkbox" name="variants" value="#variants.id#" />
      <td>#variants.description#</td>
      <td>#variants.carat_factor#</td>
    </tr>
  </cfoutput>
</table>
<table>    <tr valign="baseline">
      <td nowrap="nowrap" align="right">&nbsp;</td>
      <td><input type="submit" value="Add Variant" /></td>
      <td nowrap="nowrap" align="right">&nbsp;</td>
    </tr>
</table>
</cfform>
</td>
    <td>
<cfform action="#CurrentPage#" method="post" name="form6" id="form6">
	<input type="hidden" name="MM_InsertRecord" value="form6" />
	 Add To  Shape to one or more Size

	<table border="1" style="overflow-y:scroll;height:100px;display:block;">
	<tr>
       <td> <cfoutput query="sizes">
     <div style="float:left;padding:2px;">#sizes.size#<input name="size_id" type="checkbox" value="#sizes.id#" /> |</div>
   </cfoutput>
		</td>
     </tr>
</table>
	<table border="1" >
	  <tr>
    	<td>Shapes</td>
      <td> 
	  <cfselect name="shape_id" size="1" query="shapes" value="id" display="description"></cfselect>
       </td>
 
    <td><input type="submit" value="Insert record" /></td>
</tr>
</table>

</cfform>
</td>
  </tr>
</table>
<cfform action="#CurrentPage#" method="post" name="form7" id="form7">
	<input type="hidden" name="MM_InsertRecord" value="form7" />
<table border="1px blue dotted">
  <tr><td colspan="2" bgcolor="#CCCCCC">Select one stone type and one shape type to pair them as available</td> <td bgcolor="#CCCCCC" >Available Stones</td></tr><tr>
 </tr>
  <tr>
    <td>
<table border="0" style="height:150px;overflow-y:scroll;">
  <tr>
    <td>Stone</td>
    <td>Variant</td>
    <td> Delete</td>
    <td>select</td>
  </tr>
  <cfoutput query="stone_name_variants">
    <tr>
      <td>#stone_name_variants.name#</td>
      <td>#stone_name_variants.description#</td>
       <td>#stone_name_variants.carat_factor#<a href="?name_variant=#id#">Delete</a></td><td>
       
       <input name="name_variant" type="radio" value="#id#" /></td>
    </tr>
  </cfoutput>

</table>&nbsp;</td>
    <td>
<table border="0" style="height:150px;overflow-y:scroll;">
  <tr>
    <td>name</td>
    <td>description</td>
    <td>DEL</td>
    <td>select</td>
  </tr>
  <cfoutput query="stone_shape_size">
    <tr>
      <td>#stone_shape_size.size#</td>
      <td>#stone_shape_size.description#</td>
       <td><a href="?shape_size=#id#">Delete</a></td>
       <td>
       <input name="shape_size" type="radio" value="#id#" />
</td>
    
    </tr>
  </cfoutput>
  
</table>&nbsp;</td>
<td>
<table border="1">
     <td>name</td>
    <td>variant</td>
    <td>shape</td>
    <td>size</td>
	<td>rate_per_carat</td>
    <td>CW</td>
	<td>Pic</td>
  </tr>
  <cfoutput query="stone_ranges">
    <tr>
      <td>#stone_ranges.name#</td>
      <td>#stone_ranges.variant#</td>
      <td>#stone_ranges.description#</td>
      <td>#stone_ranges.size#</td>
      <td>#stone_ranges.rate_per_carat#</td>
      <td>#stone_ranges.cw#</td>
      <td>
      <cfif len(pic)>
		<cfif len(pic) GT 30>
			<img width="30px" src="data:image/png;base64,#pic#" />
			<cfelse>
			<img src="images/#pic#" />
			</cfif>
      </cfif></td>
    </tr>
  </cfoutput>
</table>
</td>
  </tr>
<tr>      <td > CW : <input type="text" value="12" name="cw" /></td>
<td  align="right">-</td><td>.</td></tr>

<tr>      <td > Rate Per Carat : <input type="text" value="12" name="rate_per_carat" /></td>
<td  align="right"><input type="submit" value="Insert record" /></td><td></td></tr>

</table></cfform>

</body>
</html>