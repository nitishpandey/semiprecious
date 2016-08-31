<html>
<head>
<title>Brief History of An Item</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<BODY  TEXT="#6633CC" LINK="#000000" VLINK="#800080" style="padding:10px;border:thin dotted #CC6600;color:#996666;">
<cfinclude template="/header.cfm" />
<h2>Semiprecious.com Administration___________________________________________</h2>
<h3> Edit Item Details</h3>
<div style="border:2px red solid;padding:6px;width:500px;"><span style="background-color:yellow;color:blue;">
Look for details for :<form action="whensold.cfm" method="get" style="display:inline;"><input type="text" name="newitem"  value=""><input type="submit"></form>
</span></div>
<br>
<cfif isdefined("url.newitem")>
<!--- approved is flag to indicate payment was made or not and is set by setpaymode service of cartcontrol component . this service i called by the reclay urls of payapl and authorzie.nt --->
<cfquery datasource="gemssql" name="w1">
select datebought,email, approved,cartstatus.cartid,quantity,optionid,rate from buyingrecordall as buyingrecord , anup.cartstatusall as cartstatus where cartstatus.cartid=buyingrecord.cartid and itemid  = #url.newitem# and cartstatus.paymode <> 'null' order  by  datebought , approved
</cfquery>Item No. : <cfoutput><a href="/jewelry_item.cfm?newitem=#url.newitem#">#url.newitem#</a>  <a href="/admin.cfm">admin page</a>   <a href="cartstatus21.cfm">Carts</a>  <a href="/">site</a> <a href="edititem.cfm?newitem=#url.newitem#">Edit This</a></cfoutput>
<cfif w1.recordcount>
<cfset totalrate = 0>
<cfset totalsold = 0>option, date, qty@rate, by, cartid
<cfoutput query="w1">
<br>
<cftry>
<cfif approved>
<cfset totalsold = totalsold + quantity>
<cfif rate neq "">
<Cfset totalrate = totalrate + quantity*rate >
</cfif>
</cfif>
<cfmodule template="../optiondetails.cfm" newitem="#url.newitem#" option="#optionid#" /> [#optionid#] | #Dateformat(datebought,'mm/dd/yy')# |#quantity# @  $ #rate#| <a href="/showuserdetails.cfm?email=#email#" class="login_link">#email#</a> |  <a class="side_link" href="/itemsell.cfm?cartid=#cartid#&paymode=">#cartid#</a><br /> 
<cfcatch type="expression">#cfcatch.Message#,#cfcatch.detail#
</cfcatch></cftry>
</cfoutput>
<br>
<cfif totalsold>
<span class="greenbutton">Avg Rate: <cfoutput>#evaluate(totalrate/totalsold)#. Total Sold : #totalsold#.</cfoutput>. </span>
</cfif>
<cfelse>
Never! Put the damn item on sale! 
</cfif>
</cfif>

</body>
</html>
