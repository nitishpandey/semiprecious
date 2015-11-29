
<cfif session.mail neq application.admin_email><br>
...
<cfoutput>#application.admin_email#, #session.mail#</cfoutput>
<cfabort>
</cfif>
  <CFQUERY datasource="gemssql" name="stonelist">
  Select stone, cat from ltbStones order by stone, cat
  </cfquery>
<html>
<head>
<title>New image adder</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfparam name="root" default="d:\inetpub\semiprecious">
<cfparam name="form.totalqtysold" default="0">
<cfparam name="inputfolder" default="2process">
<cfparam name="ht" default="400">
<cfparam name="width" default="400">

<cfif isdefined("url.folder")>
<cfif isdefined("form.inputfolder") or isdefined("url.folder")>
<cfset form.inputfolder = url.folder>
</cfif>
<cfset inputfolder = form.inputfolder>

</cfif>
<cfform action="addnewimage.cfm" method="post">
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
    <cfform  action="addnewimage.cfm" method="post">
<table><tr><td colspan="4"> if you change the item number then this photo will be processed (no details added) and will replace the number entered by you.</td></tr><tr>
      <td colspan="4"><input type="hidden" name="imagename" value="#url.name#">
 Size :  <input type="text" name="size" value="" size="5">
            Add to Clusters (comma separated list): 
            <input type="text" name="cluster" value="0">
</td></tr>
<tr><td colspan="4" bgcolor="##CCCCCC">
	
      <input type="hidden" name="inputfolder" value="#url.folder#">
      Item number: 
      <INPUT TYPE="hidden" SIZE="10" NAME="newitem" value="#newitem#">
      <input type="text" name="oldnewitem" value="#newitem#"> 
      <INPUT type="hidden" size="10" name="noofitems" value="1">
      Color: 
      <cfINPUT TYPE="text" SIZE="10" NAME="color" required="yes" >
      Category: 
      <cfselect name="cat" required="yes" >
	  <option></option>
        <option value="necklaces">Neck</option>
        <option value="pendants">Pend</option>
        <option value="bracelets">Brac</option>
        <option value="earrings">Earr</option>
        <option value="rings">Ring</option>
        <option value="anklets">Anklet</option>
  <option value="brooches">Brooches</option>
	<option value="beads">beads</option>
	<option value="healing">heal & deco</option>
	<option value="Gems">Gems</option>
	<option value="bags">Bags</option>
		<option value="Cabochon">Cabochon</option>
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
<tr><td colspan="4">      &nbsp; <img src="/#url.folder#/#url.name#"> 
      Inv: 
      <INPUT NAME="inventory" TYPE="text" value="1" SIZE="3">

      Description: 
      <textarea cols="40" rows="3" name="description"  wrap="virtual"></textarea> </td></tr>   <br>
<tr>
<td colspan="4" bgcolor="##CCCCCC">    Active: 
      <Select NAME="status">
        <option value="0" selected >Active</option>
        <option value="1" >Inactive</option>
        <option  value="2">Discontinued</option>
        <option value="3">On Sale</option>
        <option value="4">Free</option>
      </select>
      Where stored ? 
      <input name="storage" type="text" id="storage" size="12" maxlength="20">
	 Supplier? 
      <input name="supplier" type="text" id="supplier" size="12" maxlength="20">

            Display Priority: 
            <input name="disporder" type="text" id="disporder" value="0" size="3"> 
          </td>
        </tr>
<tr>
          <td colspan="4"> g2i : 
            <input name="g2i" type="text" id="g2i" value="0" size="1">
      (0 or 1) Shipping: 
      <INPUT NAME="shipping" TYPE="text" value="1.95" SIZE="3">
            Remove existing item? <input type="checkbox" name="overwrite" ><br>
      Stone1: 
       <Select NAME="subcat">
	   <cfloop query="stonelist">
        <option value="#Stone#"  selected >#stone# #cat#</option>
		</cfloop>
      </select>
	        Stone2: 
       <Select NAME="subcat2">
        <option value="" selected >None</option>
	   <cfloop query="stonelist">
        <option value="#Stone#"  >#stone# #cat#</option>
		</cfloop>
      </select>
      <br>Stone3: 
       <Select NAME="subcat3">
	           <option value=""  selected>None</option>
	   <cfloop query="stonelist">
        <option value="#Stone#" >#stone# #cat#</option>
		</cfloop>
      </select>
	  
	  <br>Style: 
       <Select NAME="style">
	           <option value="Silver Setting"  selected>Silver Setting</option>
        <option value="Beaded" >Beaded (no silver)</option>
        <option value="Bali Silver Beaded" >Beaded with Silver</option>
		        <option value="Other Metal" >Other Metal</option>

      </select>

	  </td></tr>
	  <input type="hidden" name="reorder" value="0">
 <input type="hidden" name="pass" value="ravi">
		  	  	  <input type="hidden" name="itemnumber" value="0">
 <input type="hidden" name="needsbetterpic" value="0">      <tr>
      <td  colspan="4"><INPUT TYPE="SUBMIT" VALUE="Add"></td></tr></table>
    </cfFORM>
  </cfoutput> 
  <p style="border:thin gray dashed;">USE SUB-CAT FROM THESE<cfoutput >#application.allstones#</p>
  <a href="addnewimage.cfm?folder=#url.folder#">Back to FIle listings.</a> </cfoutput>
  <cfelse>
  <cfif isdefined("form.newitem")>
    <cfset filename = "#root#\#form.inputfolder#\#form.imagename#">
    <cfoutput>Working on #filename#</cfoutput> <br>
<cfimage action="info" source="#filename#" structname="imageinfo" > 

    <cfif imageinfo.width eq "">
<Cfoutput>#ImageInfoError#</Cfoutput>

      FIle not found 
      <cfabort />
    </cfif>
    <cfset width = imageinfo.width>
    <cfset ht = imageinfo.height>
    <cfset refht = 1.5*ht>
    <cfif width LT refht>
      <cfset newht = 120>
      <cfset newwidth = width*120/ht>
      <cfelse>
      <cfset newwidth = 180>
      <cfset newht = ht*180/width>
    </cfif>
	    <cftry>
		<cfif form.oldnewitem eq form.newitem>
		<cfif  len(form.cluster) >
		<cfquery datasource="gemssql" name="whattype">
		select distinct(matchtype) as mt from styleslist where styleid in (#form.cluster#)
		</cfquery>
		<cfif whattype.recordcount >
		<cfset  mtlist = arraytolist(whattype['mt'])>
		<cfif  listfind(mtlist,'set') and listfind(mtlist,'look')>
		<cfset form.clustercount =  3>
		<cfelseif listfind(mtlist,'set')>
		<cfset form.clustercount = 2>
		<cfelseif listfind(mtlist,'look')>
		<cfset form.clustercount = 1>
		</cfif>
		</cfif>
		<cfelse>
		<cfset form.clustercount = 0>
		</cfif>
		<cftry>
<!--- have to check here that the subcats are from the allowed list --->
<!--- have to check that the subcat has existed in this category earlier, if not create the required three pages --->

<CFINSERT datasource="gemssql" tablename="items" formfields="newitem,itemnumber,needsbetterpic,color,cat,reorder,price,basecost,saleprice,wholesaleprice,inventory,description,shipping,status,subcat,subcat2,subcat3,style,disporder,g2i,storage,supplier,totalqtysold,size,clustercount">
<cfcatch type="database">
<cfif  isdefined("overwrite")>
<cfquery datasource="gemssql">delete from items where newitem = #form.newitem#</cfquery>      
<CFINSERT datasource="gemssql" tablename="items" formfields="newitem,color,cat,price,basecost,saleprice,wholesaleprice,inventory,description,shipping,status,subcat,disporder,g2i,storage,supplier,totalqtysold,size,clustercount">
<cfelse>
In case it is an existing item's number then use "Remove item" check box if you know what you are doing here.<br>
<cfoutput>#cfcatch.Message#, #cfcatch.Detail#</cfoutput>
<cfabort />
</cfif>
</cfcatch></cftry>
	  <cfelse>
        <strong> NEW ITEM NOT APPENDED BUT <cfoutput>#oldnewitem#</cfoutput> replaced with the below images .</strong> 
      </cfif>
	
	
	  <cfcatch type="database">
        <cfoutput>#cfcatch.Detail#</cfoutput> 
		<cfabort />
      </cfcatch>
    </cftry>
	
	  <cfif  len(form.cluster) >
	  
	  <cfquery datasource="gemssql" name="q1">
select cat from items where newitem = #oldnewitem#
</cfquery>
<cfloop list="#form.cluster#" index="j">
<cfif isnumeric(j)>
<cfquery datasource="gemssql" name="q2">
select matchtype from styleslist where styleid= #j#
</cfquery>
<cfquery  datasource="gemssql" >
insert into styles (styleid,itemid, cat,matchtype) values (#j#, #oldnewitem#,'#q1.cat#','#q2.matchtype#')
</cfquery></cfif>
</cfloop>
	  </cfif>

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
   --------------  <a href=edititem.cfm?newitem=#oldnewitem#>EDIT FURTHER</a> </div>  </cfoutput> <br>
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
      <div style="border:1px gray inset;margin:2px;display:inline;"><a href="addnewimage.cfm?name=#name#&folder=#inputfolder#&pass=ravi"><img src="/#inputfolder#/#name#">
          #Name#</a>
<a href="http://www.semiprecious.com/#inputfolder#/#name#" target="picture" >Zoom</a> <a href="delete2processpicture.cfm?picid=#root#\#inputfolder#\#name#">Delete</a> 
</div>
</cfoutput>
  </div>
  <cfform action="addnewimage.cfm" method="post">
    <cfoutput>New Input image folder : 
      <input type="text" name="inputfolder" value="#inputfolder#">
	   <input type="hidden" name="pass" value="ravi">
      <input type="submit">
    </cfoutput> 
  </cfform>	
</cfif>
</body>
</html>
