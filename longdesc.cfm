<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Jewelry Item Description</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta content="" name="expires" http-equiv="reply-to" />
</head>

<body>
<cfquery datasource="gemssql" name="d">
select description from items where newitem=#url.newitem#
</cfquery>
<cfoutput>#d.description#</cfoutput>

</body>
</html>
