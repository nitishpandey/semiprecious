<html>
<head>
<title>Thank you for shopping with Semiprecious.com</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
<SCRIPT language="JavaScript" type="text/javascript">
<!-- Yahoo! Inc.
var ysm_accountid  = "10CC04QGR59A2PT01M2RHEVOJN0";
document.write("<SCR" + "IPT language='JavaScript' type='text/javascript' " 
+ "SRC=//" + "srv3.wa.marketingsolutions.yahoo.com" + "/script/ScriptServlet" + "?aid=" + ysm_accountid 
+ "></SCR" + "IPT>");
// -->
</SCRIPT>
</head>

<body>
<cfinclude template="header.cfm">
<p>&nbsp;</p>
<p>Your payment through secure authorize.net has been successfully completed, our cart status updated and a confirmation emailed to you (in case you did
  provide your email address). </p>

<cfquery datasource="gemssql" >
  update cartstatus set paymode='auth' where cartid = #session.cartid#
  </cfquery>

You can use this url any time to know the status of your cart : <cfoutput><font color="##800000">http://www.semiprecious.com/cartview.cfm?cartid=#session.cartid#</font></cfoutput> 
<p>&nbsp;</p>

  <cfinclude template="footer.htm">
  
   <CFQUERY DATASOURCE="gemssql" NAME="solditems">
  SELECT  internalnote, email, itemid, CAT, storage, thumblink, buyingrecord.optionid, quantity, status,rate, price, saleprice, wholesaleprice, datebought, storage, 
  affiliateID, description,inventory FROM buyingrecord, items where items.newitem=buyingrecord.itemid*1 
  and quantity>0     and cartid=#session.cartid# 
  </cfquery>
    <cfset totalamount=0>
  <cfset totalqty = 0> 
  <cfoutput query="solditems">      
  <cftry>
   <cfset totalqty = totalqty + quantity />
    <cfset totalamount=rate*quantity + totalamount>
	  <cfcatch type="expression">	<!--- we are now using rate column to compute point of purchase cost  --->
      <cfif affiliateid neq 'regwsale'>
        <cfif status is 3>
          <cfset totalamount=saleprice*quantity + totalamount>
          <cfelse>
          <cfset totalamount=price*quantity+ totalamount>
        </cfif>
        <cfelse>
        <cfif wholesaleprice eq "" or  wholesaleprice eq 0>
          <cfset wholeprice = 0.5*price>
          <cfelse>
          <cfset wholeprice = wholesaleprice>
        </cfif>
        <cfset totalamount=wholeprice*quantity + totalamount>
      </cfif>
</cfcatch></cftry>
    </cfoutput>
	<!---
  <script language="javascript" src="http://scripts.affiliatefuture.com/AFFunctions.js"></script>
<script language="javascript">

	var merchantID = 2858;
	var orderValue = <cfoutput>'#totalamount#'</cfoutput>;
	var orderRef = <cfoutput>'#session.cartid#'</cfoutput>;
	var payoutCodes = '';
	var offlineCode = '';

	AFProcessSaleV2(merchantID, orderValue, orderRef,payoutCodes,offlineCode);
</script>
<cfset session.cartid = 0>
--->


<!-- Google Code for purchase Conversion Page -->
<script language="JavaScript" type="text/javascript">
<!--
var google_conversion_id = 1072681239;
var google_conversion_language = "en_US";
var google_conversion_format = "2";
var google_conversion_color = "CCCC00";
if (1) {
  var google_conversion_value = 1;
}
var google_conversion_label = "purchase";
//-->
</script>
<script language="JavaScript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<img height=1 width=1 border=0 src="http://www.googleadservices.com/pagead/conversion/1072681239/imp.gif?value=1&label=purchase&script=0">
</noscript>

		   
 <img src="https://shareasale.com/sale.cfm?amount=<cfoutput>#totalamount#&tracking=#session.cartid#</cfoutput>&transtype=TYPEOFTRANSACTION&merchantID=24548" width="1" height="1">


</body>
</html>
