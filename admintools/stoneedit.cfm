<cfif (not IsUserInRole("admin")) and (not IsUserInRole("superadmin"))>
Not enough privileges
<cfabort />
</cfif>
<cfparam name=updategroup default="">
<cfparam name=cat default="">
<cfparam name=grouping default="">
<cfparam name=sequence default="0">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Edit Stones</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfparam name="category" default="">
<cfparam name="subcat" default="">

<cfif category eq "" and subcat neq "">
<h2><font color="red">No category selected</font></h2></cfif>
<cftry>
<cfquery name="stoneitems" datasource="gemssql">
SELECT cat, stone, style, inventory, description FROM catsubcatinstock 
WHERE cat='#category#' 
AND stone='#subcat#'

</cfquery>

  <cfcatch type="database">
    <b>Sorry, there has been a database error, please email us at cs@semiprecious.com to inform us.</b>
  </cfcatch>
</cftry>
<!--- If we got here after an edit --->
<cfif updategroup neq "">

<cfquery name=x datasource="gemssql">
UPDATE catsubcatinstock SET  description='#description#' WHERE cat='#category#' AND stone='#subcat#'

</cfquery>

<cfquery name="stoneitems" datasource="gemssql">
SELECT  cat, stone, style, inventory, description  FROM catsubcatinstock 
WHERE cat='#category#' 
AND stone='#subcat#'

</cfquery>
<h3><cfoutput>#stoneitems.cat# - #stoneitems.stone#</cfoutput> updated!</h3>
</cfif>


<p>
Edit THIS STONE
<p>
<form name="stoneupdate" action="stoneedit.cfm" method="post" onSubmit="return false">
<cfoutput> Category: <input type="text" name="category" value="#category#" >
<br>Stone: <input type="text" name="subcat" value="#subcat#"  >
<br>
Inventory: <input type="text" name="inventory" value="#stoneitems.inventory#"  ><br>
Description:<br>
<textarea name="description" cols="30" rows="4" >#stoneitems.description#</textarea><br><br>
<input type="hidden" name="updategroup" value="yes">
<input type="button" value="UPDATE STONE" onClick="document.stoneupdate.submit()"><br>
</cfoutput>
</form>

<a href="http://www.semiprecious.com">Return to main page</a>
</body>
</html>
