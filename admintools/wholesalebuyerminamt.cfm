<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Adjust Minimum Purchase value for Wholesale buyers</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>

<body background="images/spbg1.gif">
<cfform action="wholesalebuyerminamt.cfm" method="get">
id: <cfinput  maxlength="50" size="30"   name="id" value="">
Min amt: <cfinput type="text" name="minamt" value="125" range="50,300" required="yes" validate="float">
<input type="submit">
</cfform>

<cfif isdefined("url.id") >
<cfquery datasource="sptm" >
update bulkbuyers set status =1 and  minamt = #url.minamt# where email = '#urldecode(url.id)#'

</cfquery>
<cfquery datasource="sptm" name="res"> select minamt from  bulkbuyers 
where email = '#url.id#'
</cfquery>
Updated to<cfoutput>#res.minamt#</cfoutput> 
</cfif>
<hr />
<cfinclude template="/admintools/wholesale_list.cfm" /><br />

<a href="/admin.cfm">Admin Page</a>&nbsp;<a href="/cartstatus21.cfm">Cart Status</a>
</body>
</html>
