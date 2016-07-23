<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>Page title</title>
</head>
<body>
<cfquery datasource="sptm" name="purchaserinfo">
				              SELECT city, state, address2, address as address1, name as firstname, phoneno as phonenumber,country,zip FROM bulkbuyers  WHERE email='anup@semiprecious.com' 
				</cfquery>	
				
				<cfoutput query="purchaserinfo">#firstname#</cfoutput>


</body>
</html>
