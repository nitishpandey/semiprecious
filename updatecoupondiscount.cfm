<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Update Coupon Discounts</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>

<body>
<cfif form.coupon1 LTE 35 >
<cfquery datasource="sptm" username="nitish" password="rangeela" >
update bulkbuyercoupons set discount = '#form.coupon1#' where name ='coupon1' and id = '#session.bulkbuyer.id#'
</cfquery>
</cfif>
<cfif form.coupon2 LTE 35 >
<cfquery datasource="sptm" username="nitish" password="rangeela" >
update bulkbuyercoupons set discount = '#form.coupon2#' where name ='coupon2' and id = '#session.bulkbuyer.id#'
</cfquery>
</cfif>
<cfif form.coupon3 LTE 35 >
<cfquery datasource="sptm" username="nitish" password="rangeela" >
update bulkbuyercoupons set discount = '#form.coupon3#' where name ='coupon3' and id = '#session.bulkbuyer.id#'
</cfquery>
</cfif>
Updated! 
<script language="JavaScript1.1">
window.location.href='couponcodeadminstration.cfm';
</script>
</body>
</html>
