
<cfparam name="cat" default="">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Add Stone</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="javascript">
function selectAllStones()
{
	if (document.stoneadd.cat[0].checked) 
	{
      for (counter = 0; counter < document.stoneadd.cat.length; counter++)
      {  document.stoneadd.cat[counter].checked = true; }
	    
	}
}
function deselectAllStones()
{
	if (document.stoneadd.cat[0].checked) 
	{
      for (counter = 0; counter < document.stoneadd.cat.length; counter++)
      {  
	    if (!(document.stoneadd.cat[counter].checked))
	       { document.stoneadd.cat[0].checked = false; }
	  }
	}
}
</script>
</head>

<body>
<cfparam name="stone" default="">

<cfif stone neq "">

    <cfif listContains(cat,"all")>
       <cfset jewelryList = ListAppend(ListDeleteAt(cat,1),"jewelry") >
    <cfelse>
       <cfset jewelryList = ListAppend(cat,"jewelry") >
    </cfif>

<!--- Create new items in database and create new file ---->
    <cfloop index="currentItem" list="#jewelryList#" >
       <cfif currentItem neq "jewelry">
          <cfquery name=x datasource="gemssql">
       insert into ltbstones (cat, stone) select '#currentItem#', '#stone#'
        </cfquery>
       </cfif>
    </cfloop>
  
<!--- Start create new files, one for each jewelry type --->
    <cfloop index="currentItem" list="#jewelryList#" >
		<cfset filecontent = "
           <cfset category='" & lcase(currentItem) & "'>
        <cfset subcat='" & stone & "'>
        <cfinclude template='/list.cfm'>">
        <cfset filename = lcase(stone) & "_" & lcase(currentItem) & ".cfm">
      <cffile action = "write" 
       file = "d:\inetpub\semiprecious\#filename#"    
       output = "#filecontent#">
    </cfloop>
    		<cfset filecontent = "
        <cfset subcat='" & stone & "'>
        <cfinclude template='/list.cfm'>">
        <cfset filename = lcase(stone) & "_jewelry.cfm">
      <cffile action = "write" 
       file = "d:\inetpub\semiprecious\#filename#"    
       output = "#filecontent#">

           		<cfset filecontent = "
        <cfset subcat='" & stone & "'>
        <cfinclude template='/stones.cfm'>">
        <cfset filename = lcase(stone) & ".cfm">
      <cffile action = "write" 
       file = "d:\inetpub\semiprecious\#filename#"    
       output = "#filecontent#">

     <!--- End create new files --->


    <cfloop index="currentItem" list="#jewelryList#" >

<strong><cfoutput>#stone# #currentItem#</cfoutput> added!</strong><br>
</cfloop>
<br>
<cfelse>

<h3>No stone added.</h3>
</cfif>


<p>
ADD A STONE<br> 

<form name="stoneadd" action="stonecreate.cfm" method="post">

	   
<br>Stone Name:<input type="text" size=15 name="stone"><br>

Select categories for stone:<br>
All categories:<input type="checkbox" name="cat" value="all" checked="checked" onClick="javascript:selectAllStones()" /><br>
<input type="checkbox" name="cat" value="necklaces" checked="checked" onClick="javascript:deselectAllStones()" />&nbsp;Necklaces<br>
<input type="checkbox" name="cat" value="earrings"  checked="checked" onClick="javascript:deselectAllStones()" />&nbsp;Earrings<br>
<input type="checkbox" name="cat" value="pendants" checked="checked" onClick="javascript:deselectAllStones()" />&nbsp;Pendants<br>
<input type="checkbox" name="cat" value="bracelets" checked="checked" onClick="javascript:deselectAllStones()" />&nbsp;Bracelets<br>
<input type="checkbox" name="cat" value="rings" checked="checked" onClick="javascript:deselectAllStones()" />&nbsp;Rings<br>

<input type="submit" value="ADD STONE TO CATEGORIES"><br>

</form>
</body>
</html>
