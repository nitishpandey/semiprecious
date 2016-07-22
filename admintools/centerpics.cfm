<html lang="en-US"> 

<head>

</head>
<body >
<cfinclude template="/header.cfm">
<!--- processing begin --->
<!--- processing end --->
<!--- information begin --->
<cfif isdefined('url.delete')>
	<cfquery datasource="sptm" name="centerpics">
		delete  from centerpics where picid = #url.id#  
	</cfquery>
</cfif>
<CFPARAM NAME="_location" dEFAULT="/IMAGES/CENTER_PICS" />

	<cfif isdefined("form._location") or isdefined("url._location")>
		<cfif  isdefined("url._location")>
			<cfset _location='#replace(url._location,"\","/","All")#' />
		</cfif>
		<cfif isdefined("form._location") >
			<cfset _location='#replace(form._location,"\","/","All")#' />
		</cfif>
<cfdirectory  action="list" directory="#APPLICATION.ROOTFOLDER##_location#" name="centerpics"  >

Add Pics more than once from <cfoutput>#_location#</cfoutput><br />
<div style="width:900px;height:180px;overflow-y:scroll;width:800px;">

<cfoutput query="centerpics">
	<div >
<div style="border:1px gray  dotted;padding:2px;"><img src="#_location#/#name#" width="80px" /><a href="?_location=#_location#&amp;rowno=#currentrow#">CLick to Add #name#</a></div>
</div>	
	</cfoutput>
</div></cfif>
<form action="" method="get">
Type Other _location to fetch images:<input type="text" name="_location">
<input type="submit">
</form>
<cfif isdefined("form.picid")>
	<!--- <cfupdate  datasource="sptm" tablename="centerpics" formfields="" /> --->
 <cfquery datasource="sptm" name="centerp">
	update `centerpics` set 
collection_id = '#form.collection#', link_to_page= '#form.link_to_page#',	text = '#form.text#', status=  '#form.status#',font_color='#form.font_color#',location='#form._location#',opacity='#form.opacity#',border='#form.border#',bgcolor = '#form.bgcolor#' where picid = #form.picid#  
</cfquery> 

<cfelseif isdefined("url.rowno")>

<cftransaction action="begin"   >
<cfquery datasource="sptm" name="centerpics">
	insert into `centerpics`  (`location`, `name`, `status`, `text`) values ("#replace(url._location,'\','/','All')#",'#centerpics["name"][url.rowno]#','active','Silver Jewelry') 
</cfquery>
<cfquery datasource="sptm" name="centerpics">
	select max(picid) as p from `centerpics`  
</cfquery>
<cfset url.id = centerpics.p />
</cftransaction>
	</cfif>
<cfquery datasource="sptm" name="centerpics">
	select collection, picid, location, name, centerpics.status, collection_id_map.link_to_page as cl, centerpics.link_to_page, text from centerpics left join collection_id_map ON collection_id_map.collection_id = centerpics.collection_id order by centerpics.status 

</cfquery>
<cfquery datasource="sptm" name="collections">
select * from collection_id_map
</cfquery>
<div style="height:80px;overflow-y:scroll;width:800px;">

	<cftable  query="collections" colheaders  >
	<cfcol header="name" text='#collection#' />
	<cfcol header="status" text="#status#" />
	<cfcol header="To Page"  text="#link_to_page#" />
	<cfcol header="Starts" text="#dateformat(start_date,'dd-MMM')#" >
	<cfcol header="Ends" text="#dateformat(end_date,'dd-MMM')#" >

	</cftable>
</div>
Select Image to Edit Here:<br />

<cfoutput query="centerpics">
	 <img src="#location#/#name#" width="100px" />#name# at  #location#, #collection# #link_to_page# (#cl#),  #status#, "#text#" ---- <a href="?_location=#_location#&amp;id=#picid#&amp;k=1##edit">Edit</a>&nbsp;<a href="?_location=#_location#&amp;id=#picid#&amp;delete=d##edit">Delete</a> <br />
	</cfoutput>
	<hr />
<cfif isdefined("url.id")>
<a name="edit">	Edit</a> Image Details Here:<br />
<cfform action="" method="post">
	<cfquery datasource="sptm" name="centerpics">
	select  * from centerpics where picid = #url.id# 
</cfquery>
<cfoutput><input type="hidden" name="picid" value="#centerpics.picid#">
Name : #centerpics.name#<br />
Font COlor: <input type="text" name="font_color" value="#centerpics.font_color#" />
BG COlor: <input type="text" name="bgcolor" value="#centerpics.bgcolor#" />
Border: <input type="text" name="border" value="#centerpics.border#" />
<br />
<!--- <cftextarea id="content" richtext="true" name="content" cols="52" sourcefortooltip="centerpicshelp.htm"  >
</cftextarea>
 --->
Current Collection = #centerpics.collection_id# 
Collection:<cfselect query="collections" value="collection_id"  display="collection"  name="collection" /> 
Opacity: <input type="text" name="opacity" value="#centerpics.opacity#" />[ 0 to 1]
Text : <input type="text" name="text" value="#centerpics.text#" />
Link to URL <input value="#centerpics.link_to_page#" name="link_to_page" type="text" /> (can be blank)
Status : <input type="text" name="status" value="#centerpics.status#" /> [active/stopped]
<input type="hidden" name="_location" value="#_location#">
</cfoutput>
<input type="submit"/>
</cfform>
</cfif>
<cfif isdefined("form.collection")>
<cfset mk = form.collection />
</cfif>
<cfif isdefined("form.new_collection")>
<cfif len(form.new_collection)>

<cfset mk = form.new_collection />
<cfquery datasource="sptm" name="centerpics">
	insert into `collection_id_map`  (`collection`) values ("#trim(form.new_collection)#") 
</cfquery>
<cfquery datasource="sptm" name="centerpics">
	select max(collection_id) as p from `collection_id_map`  
</cfquery>
<cfset mk = centerpics.p />
	</cfif>

</cfif>

<cfif isdefined("mk")>
<cfquery datasource="sptm" name="centerpics">
	select * from `collection_id_map` where collection_id = #mk#  
</cfquery>
<cfoutput>#centerpics.collection#:<br />
<cfform action="" method="post">
<input type="hidden" name="_location" value="#_location#" >
<input type="hidden" name="collection_id" value="#mk#">
Start Date: <cfinput validate="date" name="start_date" type="text" value="#dateformat(centerpics.start_date,'yyyy-mm-dd')#" /> (2010-12-26)
End Date: <cfinput validate="date" name="End_date" type="text" value="#dateformat(centerpics.end_date,'yyyy-mm-dd')#"  />
Status: <cfinput  validate="regular_expression" pattern="Active|Stopped" name="status" type="text" value="#centerpics.status#"  />

Link to URL <input value="#centerpics.link_to_page#" name="link_to_page" type="text" /> (can be blank)

<input type="submit"/>
</cfform>
</cfoutput>
</cfif>
<cfif isdefined("form.collection_id")>
 <cfquery datasource="sptm" name="centerp">
	update `collection_id_map` set <cfif len(form.start_date)>start_date = "#form.start_date#" ,</cfif>  <cfif len(form.end_date)> end_date= "#form.end_date#" ,</cfif>
	link_to_page = '#form.link_to_page#', status=  '#form.status#' where collection_id = #form.collection_id#  
</cfquery> 
</cfif>

<cfform action="" method="post">
Manage collections . 
Collection:<cfselect query="collections" value="collection_id"  display="collection"  name="collection" /> 
Add new Collection <input type="text" name="new_collection" value="" />
<cfoutput><input type="hidden" name="_location" value="#_location#">
</cfoutput>
<input type="submit"/>
</cfform>
<!--- information end --->

</body></html>