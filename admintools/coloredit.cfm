<cfparam name=updategroup default="">
<cfparam name=cat default="">
<cfparam name=grouping default="">
<cfparam name=sequence default="0">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Edit Colors</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfparam name="category" default="">
<cfparam name="color" default="">

<cfif category eq "" and color neq "">
<h2><font color="red">No category selected</font></h2></cfif>

<cfquery name="coloritems" datasource="gemssql">
SELECT cat, color, style, description FROM ltbcolorcatstyle 
WHERE cat='#category#' 
AND color='#color#'

</cfquery>


<!--- If we got here after an edit --->
<cfif updategroup neq "">

<cfquery name=x datasource="gemssql">
UPDATE ltbcolorcatstyle SET  description='#description#' WHERE cat='#category#' AND color='#color#'

</cfquery>

<cfquery name="coloritems" datasource="gemssql">
SELECT  cat, color, style, description  FROM ltbcolorcatstyle 
WHERE cat='#category#' 
AND color='#color#'

</cfquery>
<h3><cfoutput>#coloritems.cat# - #coloritems.color#</cfoutput> updated!</h3>
</cfif>


<p>
Edit THIS COLOR
<p>
<form name="colorupdate" action="coloredit.cfm" method="post" onSubmit="return false">
<cfoutput> Category: <input type="hidden" name="category" value="#category#" >#category#
<br>Color: <input type="hidden" name="color" value="#color#"  >#color#
<br>
Description:<br>
<textarea name="description" cols="30" rows="4" >#coloritems.description#</textarea><br><br>
<input type="hidden" name="updategroup" value="yes">
<input type="button" value="UPDATE COLOR" onClick="document.colorupdate.submit()"><br>
</cfoutput>
</form>

<a href="http://www.semiprecious.com">Return to main page</a>
</body>
</html>
