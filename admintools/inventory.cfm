<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Items by Location</title>
</head>

<body>
<cfparam name="s" default=0>
<h3>Locating Items in a certain location</h3>
Put in first few characters to get all locations in same area<p>
<form name=getinventory method=post action=inventory.cfm>

<<<<<<< HEAD
Put in <b>first few characters</b> or all words of a storage location: <input type=text name=s value="<CFOUTPUT>#S#</CFOUTPUT>">
=======
Put in <b>first few characters</b> or all words of a storage location: <input type=text name=s value="">
>>>>>>> 517cdd0b57a55d33c250fd80a427d5856e5c669c
<input type=submit value=submit>
</form>
<cfif s neq 0>
<cfquery datasource="gemssql" name="USitems">

Select newitem, storage, inventory,   weight, cat, subcat, status, subcat2 from items where storage not like 'CM%' and storage not like 'OC%' and storage not like 'Angela%' and storage not like 'IN-%' and supplier <> 'OC' and storage like '#s#%' order by storage, newitem
</cfquery>

<table><tr><td>Location</td><td>itemid</td><td>Name</td><td>Image</td><td>Qty</td></tr>
<cfoutput query=usitems>
<<<<<<< HEAD
<tr><td>#storage#</td><td>#newitem#</td><td>#subcat# #subcat2# #cat# <font color=red>#status# #weight# gm</font></td><td><a href=edititem.cfm?newitem=#newitem#><img src=/images/#cat#/thumb/#newitem#.jpg width=100></a></td><td>#newitem#</td><td>#inventory#</td>	 </tr>
=======
<tr><td>#storage#</td><td>#newitem#</td><td>#subcat# #subcat2# #cat# <font color=red>#status# #weight# gm</font></td><td><a href=/edititem.cfm?newitem=#newitem#><img src=/images/#cat#/thumb/#newitem#.jpg width=100></a></td><td>#newitem#</td><td>#inventory#</td>	 </tr>
>>>>>>> 517cdd0b57a55d33c250fd80a427d5856e5c669c
</cfoutput>
</table>
</cfif>
</body>
</html>
