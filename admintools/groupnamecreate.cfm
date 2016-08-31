<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Add Groups</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfparam name="cat" default="">
<cfparam name="grouping" default="">

<cfif cat eq "" and grouping	 neq "">
<h2><font color="red">YOU DID NOT SELECT THE CATEGORY! SMOKING WEED??</font></h2></cfif>

<!--- Create new items in database and create new file ---->
<cfif cat neq "">
    <cfquery name=x datasource="gemssql">
    insert into groupings (Cat, Groupname, description) Select '#cat#', '#grouping#', '#description#'
    </cfquery>
    <!--- Start create new file --->
    <cfset filecontent = "
       <cfset category='" & lcase(cat) & "'>
    <cfset groupname='" & grouping & "'>
    <cfinclude template='/gemstone_jewelry_gallery.cfm'>">
    
    <cfset filename = grouping & "-gemstone-" & lcase(cat) & ".cfm">
       
       <cffile action = "write" 
       file = "d:\inetpub\semiprecious\shaped\#filename#"    
       output = "#filecontent#">
    <!--- End create new file --->
    <!--- Start create jewellery (sic) file --->
    <cfset filecontent = "
    <cfset groupname='" & grouping & "'>
    <cfinclude template='/gemstone_jewelry_gallery.cfm'>">
    
    <cfset filename = grouping & "-gemstone-jewellery.cfm">
       
       <cffile action = "write" 
       file = "d:\inetpub\semiprecious\shaped\#filename#"    
       output = "#filecontent#">
    <!--- End create new file --->
</cfif>


<h3><cfoutput>#Cat# - #grouping#</cfoutput> added!</h3>

<p>
ADD A GROUPNAME.  To edit a group name click here.
<p>
<form name=grouping action="groupnamecreate.cfm" method="post">
SELECT CATEGORY:
<Select NAME="cat">
	           <option value="">Select Category</option>
	           <option value="Necklaces">Necklaces</option>
	           <option value="Earrings">Earrings</option>
				<option value="bracelets">Bracelets</option>
					<option value="Rings">Rings</option>
				<option value="Pendants">Pendants</option>
				<option value="brooches">Brooches</option>
					<option value="cufflinks">Cufflinks</option>
			<option value="chains">Chains</option>
			<option value="brooches">Brooches</option>
<option value="Healing">Healing</option>
<option value="Beads">Beads</option>
      </select>
	   
<br>Groupname: (CAN NOT HAVE SPACES IN THE NAME, USE "-" if needed):<input type="text" size=30 name="grouping">
<br>

Content for the groupname-category:
<br><textarea name="description" cols=30 rows=4></textarea>

<p><input type="submit" value="ADD GROUPING"><br></form>
</body>
</html>
