<cfparam name="grouping" default="">
<cfparam name="grouping2" default="">
<cfparam name="grouping3" default="">

<cfif url.newitem neq form.newitem>
        <cfset filename ="d:\inetpub\semiprecious\images\#form.cat#\#form.newitem#.jpg" >
 <cffile action="move" nameconflict="overwrite" source="#filename#"  destination="d:\inetpub\semiprecious\images\#form.cat#\#url.newitem#.jpg" >
       <cfset filename ="d:\inetpub\semiprecious\images\#form.cat#\thumb\#form.newitem#.jpg" >
 <cffile action="move" nameconflict="overwrite" source="#filename#" destination="d:\inetpub\semiprecious\images\#form.cat#\thumb\#url.newitem#.jpg" >
<cfif url.cat neq form.cat>
<cftry>
     <cfset filename ="d:\inetpub\semiprecious\images\#url.cat#\#url.newitem#.jpg" >
    <cffile action="delete"    file="#filename#" >
       <cfset filename ="d:\inetpub\semiprecious\images\#url.cat#\thumb\#url.newitem#.jpg" >
 <cffile action="delete"  file="#filename#"  > 
<cfcatch>While attempting to update the category, could not reomve images from previous category folder. </cfcatch></cftry>
</cfif>
<cfquery  datasource="gemssql"  >
delete from items where newitem = #form.newitem#
</cfquery>
<cfelseif url.cat neq form.cat>
       <cfset filename ="d:\inetpub\semiprecious\images\#url.cat#\#url.newitem#.jpg" >
 <cffile action="move" nameconflict="overwrite" source="#filename#" file="#newitem#.jpg" destination="d:\inetpub\semiprecious\images\#form.cat#\#form.newitem#.jpg" >
       <cfset filename ="d:\inetpub\semiprecious\images\#url.cat#\thumb\#url.newitem#.jpg" >
 <cffile action="move" nameconflict="overwrite" source="#filename#" file="#newitem#.jpg" destination="d:\inetpub\semiprecious\images\#form.cat#\thumb\#form.newitem#.jpg" >
</cfif>

<cfset form.newitem = url.newitem >


<cfquery datasource="gemssql" name="currentinventory">
Select inventory from items where newitem=#form.newitem#
</cfquery>
	
<cfif form.status is 2>
<cfquery datasource="gemssql">
delete from items where newitem = #form.newitem#</cfquery>
<cffile  action="delete"  file="d:\inetpub\semiprecious\images\#form.cat#\#form.newitem#.jpg">
<cffile  action="delete"  file="d:\inetpub\semiprecious\images\#form.cat#\thumb\#form.newitem#.jpg">
<cfelse>

<CFUPDATE DATASOURCE='gemssql' TABLENAME="Items">

</cfif>
<cfif grouping neq "">
<cfquery datasource="gemssql" name=addtogroup>
insert into ItemsbyGroup (itemid, category, groupname) select #form.newitem#,'#form.cat#','#grouping#' where (select count(*) from itemsbygroup where 
itemid=#form.newitem# and groupname ='#grouping#')=0
</cfquery>
</cfif>

<cfif form.inventory GT 0 and currentinventory.inventory LT 1>
<cfquery name="wishlist" datasource="gemssql">
Select email from wish where newitem = #form.newitem#
</cfquery>

<cfloop query = "wishlist"> 

Reminder emails sent to: <cfoutput>#email#,</cfoutput>
<cfmail   to="#wishlist.email#"  from = "service@semiprecious.com"  subject = "Your wish-list Jewelry in stock now"   replyto = "cs@semiprecious.com" server="mail23.webcontrolcenter.com"
   failto = "acemat@vsnl.com" >

Dear Semiprecious.com visitor/customer,

We are emailing you to inform you that an item you had put in your wish list has just been restocked.

The item link is below:

http://www.semiprecious.com/detail.cfm?newitem=<cfoutput>#form.newitem#</cfoutput>

Or you can enter the item number  <cfoutput>#form.newitem#</cfoutput> in the search box in http://www.semiprecious.com home page

If you wish to be not reminded of items from your wish list when they get in stock, please remove the item from the wish list.

Thank you

Anup Pandey
Semiprecious.com

</cfmail>



</cfloop>
</cfif>	 
<HTML>
<HEAD>
<cfoutput>
<TITLE>Item #newitem# updated</TITLE>

</HEAD>
<BODY BGCOLOR="##FFFFFF"  alink="##FFFF99" TEXT="##000000" LINK="##0000FF" VLINK="##800080" onLoad="javascript:document.forms[0].newitem.focus();">
<!--Don't forget to add your FREE HitBOX statistics to your web page. To
do so, click on Tools\Online Services\Add statistics...-->
<h1>Thank you Ravi and Team!</h1>

<h2>Item #newitem# updated</h2>

<cfif form.status is 1><h2><font color=red>WARNING: #newitem# IS INACTIVE</h2></cfif>
<FORM name="edititem" action="edititem.cfm" method="get">

Item ID: <INPUT TYPE="text" NAME="newitem" VALUE=""> <input type="submit">

</FORM>
OR
<a href="edititem.cfm?newitem=#evaluate(newitem + 1)#">Edit Next</a>
Or
<a href="edititem.cfm?newitem=#evaluate(newitem - 1)#">Edit Previous</a>
<span style="border:2px dashed white;width:180px;display:block;hieght:40px;background-color:##9977BB">
<a href="np/match/cluster.cfm?list=0&category=#url.cat#&target=#newitem#">Add to Clusters</a> 
        <a href="options/optionsoptions.cfm?itemid=#newitem#">Work 
        On Options</a></span>
<hr />	
<a href="detail.cfm?newitem=#newitem#">View On Site</a> ||  <a href="/">Home</a>

IMAGE EDITED:<p>

<table><tr><td><img src=http://www.semiprecious.com/images/#form.cat#/thumb/#form.newitem#.jpg></td><td>
<img src=http://www.semiprecious.com/images/#form.cat#/#form.newitem#.jpg></td></tr></table> 

 </cfoutput>
</BODY>
</HTML>
