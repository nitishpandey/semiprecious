<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>

<body>
<!--- <cfquery datasource="sptm" username="nitish" password="rangeela">
create table customercare (email varchar(50), remarks varchar(200))
</cfquery>
 --->
 <cfif isdefined("form.email") and isdefined("form.remarks")>
 <cfquery datasource="sptm" name="" username="nitish" password="rangeela">
 update customercare set remarks = concat ('#form.remarks#',remarks) where email = '#form.email#'
 </cfquery>
 </cfif>
 <cflocation addtoken="no" url="wholesale_list.cfm">
 </body>
</html>
