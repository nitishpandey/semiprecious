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
We would like to inform you that you are successfully registered as a Whole Sale buyer with Semiprecious.com! 

You are now entitled to upto 45 % discount on every purchase more than $#minamt# (value after discount). Please login to the Semiprecious.com 'Bulk buyer Login screen' before you begin shopping, in order to avail this discount
 To avail the discount please login using the bulk buyer login screen before shopping.
  
Your Whole Seller ID: nitish2
Your password: nitish2

We are also giving you the privilege to use the semiprecious.com online store for sale to your customers and increase your revenue! Your customers can purchase items directly from semiprecious.com at a discount by using the following coupons:

<br>
1. Coupon 1 code is #r2.value[1]# for a discount of #r2.discount[1]#%<br>

2. Coupon 2 code is #r2['value'][2]# for a discount of #r2['discount'][2]#%<br>

3. Coupon 3 code is #r2['value'][3]# for a discount of #r2['discount'][3]#%
  
The profit incurred from sales on these three coupon codes will be credited to your account (For details, visit www.semiprecious.com). As per your choice you can ask your customers to use any one of the above coupons to get the discounts. Please note that the discount will apply only on non-sale items.
 <br>You may change the value of discount and the ID of each coupon from the Coupon Administration page. You can access the Coupon Administration page from the bulk buyer login page after successfully logging in.

If you have any queries, please do write in to us at nitish@semiprecious.com

Thank you for doing business with Semiprecious.com

Best Regards,
Nitish Pandey
For semiprecious.com

Wishing you all the best.
Regards,
Nitish Pandey
For semiprecious.com 
  </cfmail>
  Mail Sent!
   
</cfif>
</body>
</html>
