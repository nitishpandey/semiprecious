<html>
<head>
<title>Email Informer to BUlk Buyer</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfif isdefined("url.bbid")>
<cfquery datasource="sptm" username="nitish" password="rangeela" name="r1">
select * from bulkbuyers where bbid = '#url.bbid#'
</cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela" name="r2">
select * from bulkbuyercoupons where bbid = '#url.bbid#'
</cfquery>
<cfmail  to="#r1.email#" server="mail23.webcontrolcenter.com" cc="nitish@semiprecious.com"
 from="service@semiprecious.com"
  subject="Jewelry Whole Seller Registration">
  Dear #r1.name#,
  With regard to your request for whole seller account with semiprecious.com, we would like to inform you that you 
  have been successfully registered as a bulk buyer or a whole sale buyer.
  
  As stated earlier, you are now entitled to the near about 50 % discounted on all purchases that you make subject to the minimum of
  $ #r1.minamt#. To avail the discount please login using the bulk buyer login screen before shopping. Your id is #r1.bbid# and password is #r1.password#.
  
To use our store for sale to your customers directly the following coupons have been generated:
<br>
1. Coupon 1 is #r2.value[1]# for a discount of #r2.discount[1]<br>

2. Coupon 2 is #r2.value[2]# for a discount of #r2.discount[2]<br>

3. Coupon 3 is #r2.value[3]# for a discount of #r2.discount[3]
  
 You can ask your customers to use any one of the above coupons to get the discounts (on non-sale items).
 The value of discount and the coupon code itself can be set by you from the coupon administration page.
 You can access the administration page from the bulk buyer login page after logging in.
 <br>
Wishing you all the best.
Regards,
Nitish Pandey
For semiprecious.com 
  </cfmail>
  
   
</cfif>
</body>
</html>
