<cfif (not IsUserInRole("admin")) and (not IsUserInRole("superadmin"))>
Not enough privileges
<cfelse>
<cfparam name="grouping" default="">
<cfparam name="grouping2" default="">
<cftry>
<cfparam name="url.newitem" default="#form.url_newitem#" />
<cfparam name="url.cat" default="#form.existing_cat#" />
<cfset k = structdelete(form,"existing_cat","false") />
<cfset k = structdelete(form,"url_newitem","false") />
<cfparam name="grouping3" default="">
<cftry>


 <CFQUERY datasource="gemssql" name="detailsinmemory" >
		  Select   material,grouping, itemnumber, size, weight, style, color, storage, imagelink, inventory,
			 orderonrequest, price, status, saleprice,clustercount,basecost, wholesaleprice, newitem, itemnumber as optcount,description,
			  NameID, newitem, subcat, subcat2, cat, morepics from
		  items where cat<>'ornaments' and cat <>'bags' and (status =0 or status=3)
	  </cfquery>
		<cfcatch type="database">
<h2>DB error, email sent to cs@semiprecious.com with this error</h2>
	<cfscript>
			mailer = createobject("component", "backing_beans.mailer");
			mailer.sendmail(mailto: 'anup@semiprecious.com,nitishpandey@gmail.com',

			subject: 'Error at item update',
			mailcontent: 'SQL:#cfcatch.SQL#, Detail: #cfcatch.Detail#,Message: #cfcatch.Message#');
		</cfscript>
</cfcatch>
</cftry>

<!---
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
<cfif url.cat neq form.cat>
       <cfset filename ="d:\inetpub\semiprecious\images\#url.cat#\#url.newitem#.jpg" >
 <cffile action="move" nameconflict="overwrite" source="#filename#" file="#newitem#.jpg" destination="d:\inetpub\semiprecious\images\#form.cat#\#form.newitem#.jpg" >
       <cfset filename ="d:\inetpub\semiprecious\images\#url.cat#\thumb\#url.newitem#.jpg" >
 <cffile action="move" nameconflict="overwrite" source="#filename#" file="#newitem#.jpg" destination="d:\inetpub\semiprecious\images\#form.cat#\thumb\#form.newitem#.jpg" >
</cfif>
--->
<cfif url.cat neq form.cat>
       <cfset filename ="d:\inetpub\semiprecious\images\#url.cat#\#url.newitem#.jpg" >
 <cffile action="move" nameconflict="overwrite" source="#filename#" file="#newitem#.jpg" destination="d:\inetpub\semiprecious\images\#form.cat#\#form.newitem#.jpg" >
       <cfset filename ="d:\inetpub\semiprecious\images\#url.cat#\thumb\#url.newitem#.jpg" >
 <cffile action="move" nameconflict="overwrite" source="#filename#" file="#newitem#.jpg" destination="d:\inetpub\semiprecious\images\#form.cat#\thumb\#form.newitem#.jpg" >
</cfif>

<cfset form.newitem = url.newitem >

<cftry>
<cfquery datasource="gemssql" name="currentinventory">
Select inventory as inventoryusa, inventory+inventoryindia as inventory from items where newitem=#form.newitem#
</cfquery>


<CFUPDATE DATASOURCE='gemssql' TABLENAME="Items">

<cfif form.inventory LT 1>
<Font color="red" size=32>WARNING INVENTORY IS 0!!!!</font><p>
</cfif>
<cfquery datasource="gemssql" name="updateuser">
insert into itemsUpdateLog (itemid, updateuser) select #newitem#, '#getAuthUser()#'
</cfquery>

<cfcatch type="database">
<h2>DB error, email cs@semiprecious.com with this error</h2>
<cfoutput>#cfcatch.detail##cfcatch.message#</cfoutput>
	<cfscript>
			mailer = createobject("component", "backing_beans.mailer");
			mailer.sendmail(mailto: 'anup@semiprecious.com,nitishpandey@gmail.com',

			subject: 'Error at item update',
			mailcontent: 'SQL:#cfcatch.SQL#, Detail: #cfcatch.Detail#,Message: #cfcatch.Message#, itemid:#form.newitem#');
		</cfscript>
</cfcatch>
</cftry>


<cfif grouping neq "">
<cftry>
<cfquery datasource="gemssql" name=addtogroup>
insert into ItemsbyGroup (itemid, category, groupname) select #form.newitem#,'#form.cat#','#grouping#' where (select count(*) from itemsbygroup where
itemid=#form.newitem# and groupname ='#grouping#')=0
</cfquery>
<cfcatch type="database">
<h2>DB error, email sent to cs@semiprecious.com with this error</h2>
	<cfscript>
			 mailer = createobject("component", "backing_beans.mailer");
			mailer.sendmail(mailto: 'anup@semiprecious.com,nitishpandey@gmail.com',

			subject: 'Error at item update',
			mailcontent: 'SQL:#cfcatch.SQL#, Detail: #cfcatch.Detail#,Message: #cfcatch.Message#, itemid:#form.newitem#,grouping: #grouping#');
		</cfscript>
</cfcatch>
</cftry>
</cfif>
 	   <!---
<cfif form.inventory LT  currentinventory.inventoryusa>
<cfmail   to="stacyanup@gmail.com"  from = "service@semiprecious.com"  subject = "inventory reduced manually"  replyto = "cs@semiprecious.com" >

USA Inventory reduced for: http://www.semiprecious.com/detail.cfm?newitem=<cfoutput>#form.newitem# by #getAuthUser()#</cfoutput>

</cfmail>
</cfif>--->

<cfif form.inventory GT 0 and currentinventory.inventory LT 1>\
<cftry>
<cfquery name="wishlist" datasource="gemssql">

Select email from wish where newitem = #form.newitem#
</cfquery>

		<cfcatch type="database">
<h2>DB error, email cs@semiprecious.com with this error</h2>
<cfscript>
			 mailer = createobject("component", "backing_beans.mailer");
			mailer.sendmail(mailto: 'anup@semiprecious.com,nitishpandey@gmail.com',
			subject: 'Error at item update',
			mailcontent: 'SQL:#cfcatch.SQL#, Detail: #cfcatch.Detail#,Message: #cfcatch.Message#, itemid:#form.newitem#');
		</cfscript>
</cfcatch>
</cftry>
<cfloop query = "wishlist">

Reminder emails NOT sent to: <cfoutput>#email#,</cfoutput>
<!--- DAILY EMAIL GOING NOW FROM STASKS/ACTVEDAYS.CFM--- BELOW CODE REDUNDANT--->
<!---<cfmail   to="#wishlist.email#"  from = "service@semiprecious.com"  subject = "Your wish-list Jewelry in stock now"   replyto = "cs@semiprecious.com"
   failto = "stacyanup@gmail.com" >

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

--->

</cfloop>
</cfif>

<HTML>
<HEAD>
<cfoutput>
<TITLE>Item #newitem# updated</TITLE>
</cfoutput>
</HEAD>
<BODY BGCOLOR="#FFFFFF"  alink="#FFFF99" TEXT="#000000" LINK="#0000FF" VLINK="#800080" onLoad="javascript:document.forms[0].newitem.focus();">
<!--Don't forget to add your FREE HitBOX statistics to your web page. To
do so, click on Tools\Online Services\Add statistics...-->
<h1>Thank you!</h1>

<cfoutput>
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
<a href="/np/match/cluster.cfm?list=0&category=#url.cat#&target=#newitem#">Add to Clusters</a>
        <a href="/options/optionsoptions.cfm?itemid=#newitem#">Work
        On Options</a></span>
<hr />
<a href="/detail.cfm?newitem=#newitem#&testing=yes">View On Site</a> ||  <a href="/">Home</a>
</cfoutput>
<cfcatch type="any">
	<cfdump var="#cfcatch.tagcontext#">

<cfoutput>#cfcatch.message#,#cfcatch.detail#
</cfoutput>

</cfcatch>
</cftry>
<!---<cfcatch type="any">
<cfoutput>#cfcatch.detail#,.. #cfcatch.message#, </cfoutput>

</cfcatch>
</cftry>--->
<cftry>
IMAGE EDITED:<p>
<cfoutput>
	<cfimage action="info" source="#application.rootfolder#\images\#form.cat#\thumb\#form.newitem#.jpg" structname="gim" />
<div style="float:left;position:relative;border:1px gray groove">
	<span style="background-color:yellow;position:absolute;top:-10px;left:20px;">
		#gim.height# by #gim.width#
	</span>
	<img src=http://www.semiprecious.com/images/#form.cat#/thumb/#form.newitem#.jpg>
</div>
<div style="float:left;position:relative;border:1px gray groove">
	<cfimage action="info" source="#application.rootfolder#\images\#form.cat#\#form.newitem#.jpg" structname="gim" />
	<span style="border:1px blue solid;position:absolute;top:-10px;left:20px;background-color:pink;">
		#gim.height# by #gim.width#
	</span>
	<img src="http://www.semiprecious.com/images/#form.cat#/#form.newitem#.jpg">
</div>
</cfoutput>
<cfcatch type="any">
	<cfscript>
			 mailer = createobject("component", "backing_beans.mailer");
			mailer.sendmail(mailto: 'anup@semiprecious.com,nitishpandey@gmail.com',

			subject: 'Error at item update',
			mailcontent: ' Detail: #cfcatch.Detail#,Message: #cfcatch.Message#, itemid:#form.newitem#');
		</cfscript>
</cfcatch>
</cftry>
</BODY>
</HTML>
</cfif>