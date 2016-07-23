<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Adjust Minimum Purchase value for Wholesale buyers</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>

<body background="images/spbg1.gif">
<cfform action="wholesalebuyerminamt.cfm" method="get">
id: <cftextinput align="absmiddle" bgcolor="##CCCC66" font="Georgia, Times New Roman, Times, serif" height="20" maxlength="50" size="30" textcolor="##000066" hspace="4" vspace="2" width="200"  name="id" value="">
Min amt: <cfinput type="text" name="minamt" value="125" range="50,300" required="yes" validate="float">
<input type="submit">
</cfform>
[TAB DOESNT WORK WITH JAVA FORM!]

<cfif isdefined("url.__CFTEXT__CFFORM_1__id") >
<cfquery datasource="sptm" username="nitish" password="rangeela">
update bulkbuyers set minamt = #url.minamt# where email = '#url.__CFTEXT__CFFORM_1__id#'
</cfquery>
</cfif>
<hr />
<cfinclude template="wholesale_list.cfm" /><br />

<a href="admin.cfm">Admin Page</a>&nbsp;<a href="cartstatus21.cfm">Cart Status</a>
</body>
</html>
