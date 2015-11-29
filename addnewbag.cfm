<cfparam name=cluster default="">
  <CFQUERY datasource="gemssql" name="stonelist">
  Select stone, cat from ltbStones  where cat='bags'
  </cfquery>
<html>
<head>
<title>New image adder</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfparam name="root" default="d:\inetpub\semiprecious">
<cfparam name="form.totalqtysold" default="0">
<cfparam name="inputfolder" default="2process\india">
<cfif isdefined("form.inputfolder") or isdefined("url.folder")>
<cfif isdefined("url.folder")>
<cfset form.inputfolder = url.folder>
</cfif>
<cfset inputfolder = form.inputfolder>

</cfif>
<cfform action="addnewbag.cfm" method="post">
<cfoutput>New Input image folder : <input type="text" name="inputfolder" value="#inputfolder#">
 <input type="hidden" name="pass" value="ravi">
<input type="submit"></cfoutput>
</cfform>
<cfif isdefined("url.name")>
  <CFPARAM NAME="CAT" DEFAULT="Necklaces">
  <CFINCLUDE TEMPLATE="setup.cfm">
  <CFQUERY datasource="gemssql" name="itemadded">
  SELECT TOP 1 Items.newitem FROM Items ORDER BY Items.newitem DESC 
  </cfquery>
  <CFSET #newitem#=#evaluate(itemadded.newitem + 1)#> 
  <hr>
  <cfoutput> 
    <cfform  action="addnewbag.cfm" method="post">
<table>
      <td colspan="4"><input type="hidden" name="imagename" value="#url.name#">
 Size :  <input type="text" name="size" value="" size="5">
</td></tr>
<tr><td colspan="4" bgcolor="##CCCCCC">
	 <input type="hidden" name="form" value="" size="5">
      <input type="hidden" name="inputfolder" value="#url.folder#">
      Item number: 
      <INPUT TYPE="hidden" SIZE="10" NAME="newitem" value="#newitem#">
      <input type="text" name="oldnewitem" value="#newitem#"> 
      <INPUT type="hidden" size="10" name="noofitems" value="1">
      Color: 
      <cfINPUT TYPE="text" SIZE="10" NAME="color" required="yes" >
      Category: 
      <cfselect name="cat" required="yes" >
	  <option></option>	<option value="healing">decorative</option>
	<option value="bags" selected>Bags</option>
	      </cfselect></td></tr>
<tr>
          <td colspan="4"> Price : Cost: Rs 
            <cfINPUT TYPE="text" SIZE="5" NAME="BaseCost"  required="yes" validate="integer">
            &nbsp; &nbsp;Retail : $ 
            <INPUT TYPE="text" SIZE="5" NAME="price" required="yes" validate="integer">
            &nbsp; Sale : $ 
            <cfINPUT TYPE="text" SIZE="5" NAME="saleprice" required="yes" validate="integer">
            &nbsp; WholeSale: $ 
            <cfINPUT TYPE="text" SIZE="5" NAME="WholeSalePrice" required="yes" validate="integer"></td></tr>
<tr><td colspan="4">      &nbsp; <img src="/#url.folder#/#url.name#" width="60" height="60"> 
      Inventory: 
      <INPUT NAME="inventory" TYPE="text" value="1" SIZE="3">

      Description: 
      <textarea cols="80" rows="3" name="description"  wrap="virtual"></textarea> </td></tr>   <br>
<tr>
<td colspan="4" bgcolor="##CCCCCC">    Active: 
      <Select NAME="status">
        <option value="0" selected >Active</option>
        <option value="1" >Inactive</option>
        <option  value="2">Remove/Delete</option>
        <option value="3">On Sale</option>
        <option value="4">Free</option>
      </select>
      Where stored? 
      <input name="storage" type="text" id="storage" size="12" maxlength="20">
	 Supplier? 
      <input name="supplier" type="text" id="supplier" size="12" maxlength="20">

            Display Priority: 
            <input name="disporder" type="text" id="disporder" value="0" size="3"> 
          </td>
        </tr>
<tr>
          <td colspan="4">
      Bag Type: 
       <Select NAME="subcat">
	   <cfloop query="stonelist">
        <option value="#Stone#"  selected >#stone# #cat#</option>
		</cfloop>
      </select>
	 Type 2: 
       <Select NAME="subcat2">
        <option value="" selected >None</option>
	   <cfloop query="stonelist">
        <option value="#Stone#"  >#stone# #cat#</option>
		</cfloop>
      </select>
        &nbsp;&nbsp;&nbsp; Type 3: 
       <Select NAME="subcat3">
	           <option value=""  selected>None</option>
	   <cfloop query="stonelist">
        <option value="#Stone#" >#stone# #cat#</option>
		</cfloop>
      </select>
	  
	  <br>Material: 
       <Select NAME="style">
	           <option value="Fabric"  selected>Fabric</option>
        <option value=Leather" >Leather (Cow)</option>
        <option value="Snake Skin" >Snake Skin</option>
       <option value="Canvas" >Canvas</option>

      </select>

	  </td></tr>
	  <input type="hidden" name="reorder" value="0">
 <input type="hidden" name="pass" value="ravi">
		  	  	  <input type="hidden" name="itemnumber" value="0">
		  	  	  <input type="hidden" name="needsbetterpic" value="0">
      <tr>
      <td  colspan="4"><INPUT TYPE="SUBMIT" VALUE="Add"></td></tr></table>
    </cfFORM>
  </cfoutput> 
  <cfoutput>
  <a href="addnewbag.cfm?folder=#url.folder#">Back to FIle listings.</a> </cfoutput>
  <cfelse>
  <cfif isdefined("form.newitem")>
    <cfset filename = "#root#\#form.inputfolder#\#form.imagename#">
    <cfoutput>Working on #filename#</cfoutput> <br>
<cfx_imageinfo file="#filename#"> 

    <cfif imageinfo.width eq "">
<!---	<Cfoutput>#ImageInfoError#</Cfoutput>--->

      FIle not found 
      <cfabort />
    </cfif>
    <cfset width = imageinfo.width>
    <cfset ht = imageinfo.height>
    <cfset refht = 1.5*ht>
    <cfif width LT refht>
      <cfset newht = 150>
      <cfset newwidth = width*150/ht>
      <cfelse>
      <cfset newwidth = 200>
      <cfset newht = ht*200/width>
    </cfif>

<!--- have to check here that the subcats are from the allowed list --->
<!--- have to check that the subcat has existed in this category earlier, if not create the required three pages --->
<CFINSERT datasource="gemssql" tablename="items" formfields="newitem,itemnumber,color,cat,price,basecost,saleprice,wholesaleprice,inventory,description,shipping,status,subcat,subcat2,subcat3,style,storage,supplier,size">

<!---<CFINSERT datasource="gemssql" tablename="items" formfields="newitem,itemnumber,needsbetterpic,color,cat,reorder,price,basecost,saleprice,wholesaleprice,inventory,description,shipping,status,subcat,subcat2,subcat3,style,disporder,g2i,storage,supplier,totalqtysold,size,clustercount">--->
	

    <cffile action="move" nameconflict="overwrite" source="#filename#" file="#oldnewitem#.jpg" destination="#root#\images\#form.cat#\#oldnewitem#.jpg" >
    <cfset filename ="#root#\images\#form.cat#\#oldnewitem#.jpg" >
	<cfif  (ht GT 600 or width GT 600)>
	<cfif width GT ht>
	<cfset ht =  (ht * 600)/width>
	<cfset width = 600>
	<cfelse>
	<cfset width =  (width * 600)/ht>
	<cfset ht = 600>
	</cfif>
    <CFX_IMAGE ACTION="IML"
 FILE="#filename#"
 JPEG_DPI number="72"
 JPEG_SMOOTH="0"
JPEG_QUALITY="100"
JPEG_OPTIMIZE="OFF"
JPEG_PROGRESSIVE="ON"
 COMMANDS="
 ## thumbnail sizes
 setvar y= #ht#
 setvar x= #width#
 ## Resizing to thumbnail
 ## use the variable thumbnail in place of smallimage to get a raised frame around the new image
 resize <x>,<y>,smallimage
 write #root#\images\#form.cat#\#oldnewitem#.jpg
 " ><br>
 <cfelse>
 Picking and moving file ...no resizing
 </cfif>

Your main image resized for blow up .<br>
checking if thumb nail exists (prepared manually under 'thumb' folder)....
  <cfset outputfile ="#root#\images\#form.cat#\thumb\#oldnewitem#.jpg" >
	 <cfset inputfile = "#root#\#form.inputfolder#\thumb\#form.imagename#">
 <cftry>
  <cffile action="move" nameconflict="overwrite" source="#inputfile#" file="#outputfile#.jpg" destination="#root#\images\#form.cat#\thumb\#oldnewitem#.jpg" >
   <cfcatch type="any">
  <CFX_IMAGE ACTION="IML"
 FILE="#filename#"
 JPEG_DPI number="72"
 JPEG_SMOOTH="0"
JPEG_QUALITY="100"
JPEG_OPTIMIZE="OFF"
JPEG_PROGRESSIVE="ON"
 COMMANDS="
 ## thumbnail sizes
 setvar y= #newht#
 setvar x= #newwidth#
 ## Resizing to thumbnail
 ## use the variable thumbnail in place of smallimage to get a raised frame around the new image
 resize <x>,<y>,smallimage
 write #root#\images\#form.cat#\thumb\#oldnewitem#.jpg
 " > 
   </cfcatch>
   </cftry>
Your image thumbed. 

    <cfoutput> Imagery #filename# made to #form.cat# in the respective folder with number #newitem#.<br>
 <div style="border:4px dashed brown;">
      Big: <img src="/images/#cat#/#oldnewitem#.jpg" height="300" > 
      Thumb <img src="/images/#cat#/thumb/#oldnewitem#.jpg" >  &nbsp;<a href="undonewimageadd.cfm?category=#cat#&itemid=#Oldnewitem#&folder=#form.inputfolder#">UNDO</a>
<a href="np/match/cluster.cfm?list=0&category=#cat#&target=#oldnewitem#">Add to Clusters</a> 
 ---------------     <a href=edititem.cfm?newitem=#oldnewitem#>EDIT FURTHER</a>---------</div>  </cfoutput> <br>
<!---
   <FORM name="edititem" action="edititem.cfm?olditem=<cfoutput>#newitem#&cat=#form.cat#</cfoutput>" method="get">
Want to put this image (and category) to an old number
ImageID: <INPUT TYPE="text" NAME="newitem" VALUE="">
<input type="submit">
</FORM>.<br>--->
     <hr />
  </cfif>
  <cfdirectory directory="#root#/#inputfolder#" sort="datelastmodified DESC" action="list" name="inputlist" filter="*.jpg">
  Click on an image to process/add: (If you have a thumbnail ready put it in a 
  thumb subfolder with same name as parent file. That will be used else one will 
  be generated on fly) 
<div   style="width:1000px;">
    <cfoutput query="inputlist">
      <div style="border:1px gray inset;margin:2px;display:inline;"><a href="addnewbag.cfm?name=#name#&folder=#inputfolder#&pass=ravi"><img src="/#inputfolder#/#name#" width="100" height="100">
          #Name#</a>
<a href="http://www.semiprecious.com/#inputfolder#/#name#" target="picture" >Zoom</a> <a href="delete2processpicture.cfm?picid=#root#\#inputfolder#\#name#">Delete</a> 
</div>
</cfoutput>
  </div>
  <cfform action="addnewbag.cfm" method="post">
    <cfoutput>New Input image folder : 
      <input type="text" name="inputfolder" value="#inputfolder#">
	   <input type="hidden" name="pass" value="ravi">
      <input type="submit">
    </cfoutput> 
  </cfform>	
</cfif>
</body>
</html>
