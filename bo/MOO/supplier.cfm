<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Page</title>
</head>
<body>
<cfquery name="c" datasource="gemssql" >
update users set usertype = 'superadmin' where apptt = 'smriti'
</cfquery>

<cfquery name="c" datasource="gemssql" >

select distinct supplier from items ;

</cfquery>

<cfdump var="#c#" />





</body>
</html>
