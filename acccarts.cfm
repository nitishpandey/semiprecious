<html>
<head>
<title>Your Business : Is it Growing ?</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/npstyles11.css" rel="stylesheet" type="text/css">
<cfparam default="indate" name="url.orderby" />
<cfinclude template="udfinclude.cfm" />
<script language="JavaScript1.1" type="text/javascript">
   acknowledged = 1;
  lastcartid = 0;
</script>
<script language="JavaScript1.1" type="text/javascript" src="javascript/xmlhttp.js" ></script>
<script language="JavaScript1.1"  type="text/javascript" src="javascript/cartstatus.js" ></script>
<script language="JavaScript1.1" type="text/javascript">
 //alert(lastcartid);
setInterval("localLoadXMLDoc()",600000);
</script>
<style>
<!-- 
a:visited {
color:blue;

}
--></style>

</head>

<body  style="font:12px arial blue;" vlink="#FF33FF">
<span class="hidden" id="updatingmsg"><div style="text-align:center;padding:10px;position:absolute;top:200px;left:200px;z-index:3;border:3px red inset;background-color:#FFBBBB;color:blue;">
Looking for New Orders ...
</div></span>
<cfparam default="7" name="url.no_of_days" />
<cfif isdefined("cookie.permanentadmin")>
<cfset session.passcode = 'shaurya'>
<cfset session.mail = 'nitishpandey@indiatimes.com' />
</cfif>

  <Cfoutput> 
    <!--- Practically Unique cartid = #session.cartid2#, --->
    #timeformat(now(),'HH:mm')# <a href="cartstatus21.cfm?no_of_days=#url.no_of_days#">Refresh!</a></Cfoutput>
  <cfquery datasource="gemssql" name="s">
  select * from cartstatus where paymode is not null and couponcode = 'acc' order by 
cartid desc,   <cfif isdefined("url.orderby")> 
#url.orderby# desc
</cfif> 
</cfquery>
<cfset topcartid = s.cartid /><span class="grayplacard">
<a href="cartstatus21.cfm?no_of_days=0">Only Pending</a>|<span id="busy">|</span> <a href="/" >Go 
  To Site</a> | <a href="Admin.cfm">admin page</a> | Email customer? Click on 
  email id! | <span class="done">Shipped</span>,<span>Abandoned</span>,<span class="topnavigator">Day Change</span></span><span class="paid">Pending</span></span>
  <table width="100%"  border="0" cellspacing="0"  id="thetable" >
    <tr  class="graysilverfilter"> 
      <td>CartId</td>
      <td>Value/<br>
View</td>
      <td  style="font-size:11;">Bas:NonUS<br>
        :Sp:GW</td>
      
      <td>(Total<br>
/sale)</td>
      <td><a href="cartstatus21.cfm" class="noline">In Time</a></td>
      <td>Out</td>
      <td>Coupon</td>
      <td>Payment By<br />
        </td>
      <td width="6%">Visit Info</td>
    </tr>
	<cfset date = 0>
	<cfset dt = 0>
	<cfset et = 0>
<cfset ordercount = 0>
<cfoutput query="s">
<cfif date neq datepart('d',indate) >
<cfset dey = dayofweekasstring(dayofweek(indate)) />

<tr><td colspan="4"  align="center" class="greenbutton" > #Dollarformat(dt)# (#Dollarformat(dt-et)#) for #date# from #ordercount# orders</td><cfset date = datepart('d',indate) /><td background="/images/diagonalgreen.gif" >&nbsp;</td><td colspan="5"  class="topnavigator" align="left" <cfif listfindnocase('sunday,saturday',dey)> style="color:red;"</cfif> >#dey# :#date#</td></tr>
<cfset ordercount = 0>
<cfset dt = 0>
<cfset et = 0>
</cfif>
<cfswitch expression="#paymode#">
<cfcase value="pp,auth.net,2co,goog," delimiters=",">

<tr  class="paid" <cfif couponcode is 'regwsale'>style="color:yellow"</cfif>>
<cfset dt = dt + cost >
<cfset et = et + inrcost >
<cfset ordercount = ordercount + 1 />
</cfcase>
<cfcase value="chck,ichck" delimiters=",">
<cfset ordercount = ordercount + 1 />

<tr  class="paid" style="color:red">
<cfset dt = dt + cost >
<cfset et = et + inrcost >
</cfcase>

<cfcase value="paypal,wellscc,wellsphone,check,google">
<tr class="done"><cfset ordercount = ordercount + 1 />

<cfset dt = dt + cost >
<cfset et = et + inrcost >
</cfcase>
<cfdefaultcase >
<tr <cfif couponcode is 'regwsale' or couponcode is 'saved'> style="color:red"</cfif>>
</cfdefaultcase>
</cfswitch>
        <td  class="row2">#cartid#</td>
        <td><a href="itemsell.cfm?cartid=#cartid#&couponcode=#couponcode#&pay=#paymode#" title="see list"  >#decimalformat(cost)#</a></td><td>#shippingdetails#</td>
        <td>#totalqty#/#noofsaleitems# </td><td style="font-size:10;">#indate#</td><td style="font-size:10;">#outdate#&nbsp;</td>
		<cfif tps eq 'y'>
		<td background="images/bottom_bg.gif"><a href="creditcalculator.cfm?cartid=#cartid#">@</a>
		<cfelse>
		<td>
		</cfif>
		 #couponcode#&nbsp;</td>        
<td >#paymode#</td>
		<td   width="4%"	 style="font-size:10;">
			<cfif status is 'done'>
		<a href="showorigin.cfm?cartid=#cartid#"><span ><!--- on being 'done' itemsell.cfm makes the cartid negative
		in the visitrecord table . just a trick to save on a column,
		since as it is we plan to keep only succesful visits in 
		visitrecord table --->
		<cfquery datasource="gemssql" name="s">
select * from visitrecord where cartid = -1*#cartid#
</cfquery>
(#s.comingfrom#)</span></a>
<cfelseif status is 'new'>
		<cfquery datasource="gemssql" name="s">
select * from visitrecord where cartid = #cartid#
</cfquery>
#s.comingfrom#</a>/<a href="#s.firstpage#">#s.firstpage#</a>|</span>
<cfelse>
#status#
		</cfif>&nbsp;<a href="showuserdetails.cfm?email=#buyer#"  >#buyer#</a>
	</td></tr>
</cfoutput>
</table>
<script language="JavaScript1.1" type="text/javascript">
<cfoutput>setLastCartid(#topcartid#);</cfoutput>
//localLoadXMLDoc();
</script>



<cfquery datasource="gemssql" name="s">
  select sum(cost) as totalsales from cartstatus where paymode is not null and couponcode = 'acc' 
 </cfquery>
 <p>
 Total Sales $<cfoutput>#s.totalsales#<p>
 Earned by Austin Civic Chorus: $#evaluate(0.2*s.totalsales)#</cfoutput> (20% of revenue)<p>
 <font color=red>For every $1000 total, $100 extra will be added to the above earnings! Any one from any where in the world can show their yearning for the arts by using acc code to increase this earning for the arts.</font><p>
 
 Any one can watch the earning progress live using this web page. (some paypal orders and Google payments are manually updated within 12 hrs of payment, so use standard checkout preferably).<br>
 The first one to call us at 5125899009 when the sales hit $2000 will get a $50 credit from semiprecious.com!
</body>
</html>
