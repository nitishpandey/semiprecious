<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Third Party Sales</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>
<cfparam default="1.95" name="shipping">
<cfparam default="pending" name="creditstatus">
<!--- new is pending, calculated is due and then comes done --->
<body>
Click on cart id to calculate credit for the affiliate
<!--- infor cartshipped field is updated by itemsell.cfm which calls cartmonitor.cfc --->
<Cfquery datasource="sptm" username="nitish" password="rangeela" name="lr">
select * from thirdpartysales where cartshipped = 'n' and creditstatus = '#creditstatus#' order by id
</Cfquery>
<table border="1"><tr><td>Cartid</td><td>Coupon</td><td>Value</td><td>Discount</td><td>WSvalue</td><td>Shipped?</td><td>Creditstatus</td><td>Credit</td></tr>
<cfoutput  query="lr">
<tr><td colspan="8"><a href="showbulkbuyerdetails.cfm?id=#id#">#id#</a></td></tr>
<cfoutput group="id">
<tr><td><a href="creditcalculator.cfm?cartid=#cartid#&id=#Id#&amtrcvd=#amtrcvd#&shipping=#shipping#">#cartid#</a></td><td>#coupon#</td><td>#amtrcvd#</td><td>#discount#</td><td>#wholesalevalue#</td><td>#cartshipped#</td><td>#creditstatus#</td><td>#creditvalue#</td></tr>
</cfoutput>
</cfoutput></table>
<Cfdump var="#lr#" label="Jawe" expand="yes">
</body>
</html>
