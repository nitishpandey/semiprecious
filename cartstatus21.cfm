<cftry>
<cfparam name="url.show" default="">
<cfparam name="username" default="">
<cfparam name="next" default="1">


<cfparam default="15" name="url.no_of_days" />
<cfparam name="no_of_days" default="5" />

<cfif url.show is "abandoned">
<cfset url.no_of_days = 7 />
<cfif isdefined("url.buyer")>
	<cfif len(url.buyer)>
<!--- replace application.admin_email with url.buyer --->
 <cfmail to="#application.admin_email#" from="Semiprecious.com <cs@semiprecious.com>" subject="Jewelry Purchase Follow Up " server="mail23.webcontrolcenter.com" type="html">
<div align="center" style="border:solid 2px gray;padding:4px;margin-top:10px;width:600px">
<img src="http://www.semiprecious.com/images/header.gif" height="70px" />
<div align="left" style="width:100%;margin:10px;font-size:16px;">
Hi,<br />
Please refer to your shopping at our online jewelry store semiprecious.com. <br />

Some items in your order (Invoice no. <strong>#url.cartid#</strong>) are in transit from our India sourcing office. You would be aware that due to volcanic eruption in Iceland flight schedules are disturbed. This has  delayed our deliveries as well.

<br />We do expect that the situation will improve this week. We will inform you when we ship your order. 
 
<br /><br /><br />

  Best Regards and assuring you of the best service,<br />
	Customer Service Team Semiprecious.com
</div>
</div>
  </cfmail>
  <div class="form_heading" style="position:fixed;top:1px;left:20px;"><cfoutput>#left(buyer,20)#</cfoutput></div>
  </cfif>
  </cfif>
</cfif>
	<html>
<head>
<title>Shopping Carts Status and Processing</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css">

<cfparam default="indate" name="url.orderby" />
<script language="JavaScript1.1" type="text/javascript">
   acknowledged = 1;
  lastcartid = 0;
  function sendmail(k,d){
  if (String(d).length == 0)
    	document.getElementById(k).innerHTML="";
	else
  		document.getElementById(k).innerHTML = "<div class='look1' style='padding:3px;border:1px yellow solid;'><a href='"+ d + "#" +k +"'>Send mail?</a>&nbsp;<a href='javascript:' onClick='sendmail("+k+',"");'+"'>Forget it</a></div>";
	
	return;
  }
</script>
<script language="JavaScript1.1" type="text/javascript" src="javascript/xmlhttp.js" ></script>
<script language="JavaScript1.1"  type="text/javascript" src="javascript/cartstatus.js" ></script>
<script language="JavaScript1.1" type="text/javascript">
 //alert(lastcartid);
setInterval("localLoadXMLDoc()",500000);
</script>
<style>
<!-- 

 .look1 ,.look1 td, .look1 td a{
background-color:#98449A;
color:#FFFFFF;
}
.look1 a:visited {
color:#4D4;

}

-->
</style>

</head>

<body  style="font:12px arial blue;background-color:white;">
<cfoutput><a title="click to list 1000 then 1500 then 2000 carts" href="?next=#evaluate(next+1)#">Next</a></cfoutput><span class="hidden" id="updatingmsg"><div style="text-align:center;padding:10px;position:absolute;top:200px;left:220px;z-index:3;border:3px gray inset;background-color:#698;color:black;">
Looking for New Orders ...
</div></span>

<CFIF session.mail eq application.admin_email> 
<cfset upsindia = "yellow" />

  <cfquery datasource="gemssql" name="s">
	  select cartstatus.*  from cartstatus  where  
     <cfif url.show is 'mine'>
     cartid not in (select distinct cartid from cartforothers where (shipdate is null or shipdate > #createodbcdate(dateadd('d',-url.no_of_days,createdate(datepart('yyyy',Now()),datepart('m',Now()),datepart('d',Now()))))#) and supplier like 'Ace%' or supplier in ('harish', 'vijay', 'arpit', 'GR', 'anup', 'kashish', 'royal')   )  and 
	  <cfelseif url.show is "abandoned"> status = 'new'  and <cfelseif url.show is "backoffice"> status = 'new' and paymode <>  'null' and 
	  </cfif> 
	  (indate > #createodbcdate(dateadd('d',-1*url.no_of_days,createdate(datepart('yyyy',Now()),datepart('m',Now()),datepart('d',Now()))))#  or (paymode in ('authphone','auth.net','pp','chck','ichck','goog','ccavenu','arb1','arb2')) and
		 (indate > #createodbcdate(dateadd('d',-2*url.no_of_days,createdate(datepart('yyyy',Now()),datepart('m',Now()),datepart('d',Now()))))# )) order by
  <cfif url.show is "abandoned">
  buyer desc, 
  <cfelse> 
indate desc, outdate desc,

</cfif>
cartstatus.cartid desc
	</cfquery>
<cfset topcartid = s.cartid />
<span class="grayplacard">
<a href="cartstatus21.cfm?no_of_days=0">Pending</a>| 
<a href="cartstatus21.cfm?show=mine">Carts with NO India items</a>|<span id="busy">|</span> <a href="/" >Go 
  To Site</a> | <a href="admintools/CartIssues.cfm">Issues/Tracking</a> |<a href="Admin.cfm">admin page</a> | <span class="done">Shipped</span>,
  <span>Abandoned</span>,<span class="topnavigator">Day Change</span>
  </span><span class="paid">Pending</span>
<cfoutput><span style="background-color:#upsindia#">UPS India</span> | <h3> <font color=green>  <a href="cartstatus21.cfm?no_of_days=#url.no_of_days#">Refresh!</a> done at <strong>#timeformat(now(),'HH:mm')#</strong> </font></h3>
</Cfoutput><a href="cartstatus21.cfm?show=abandoned">Whom to Mail?</a>,
 <a href="cartstatus21.cfm?show=backoffice">Back Office</a>
  <table width="100%"  border="0" cellspacing="0"  id="thetable" >
    <tr  style="background-color:#456;color:white;"> 
      <td width="30px">Cart</td>
      <td width="5%">Value/<br> 
View</td>
      <td  style="font-size:11;" width="7%">Bas:NonUS:Sp:GW</td>
      <td width="5%">Cost</td>
      <td>(Total<br>
|sale)</td>

      <td>Coupon</td>
      
      <td width="30%">Visit Info (Click on email)</td>
<td>Mode
        </td>      
<td>Delvry</td>
    </tr>
	<cfset date = 0>
	<cfset dt = 0>
	<cfset et = 0>
	<cfif session.apptt neq 'ravi' and session.apptt neq 'nitish' and session.apptt neq 'anup'>
<cfset et = 1000>
</cfif>
<cfset ordercount = 0>
<cfset ko = 32 />
<cfset wsale =  0 />
<cfoutput query="s">

<cfif date neq datepart('d',indate) >
<cfset dey = dayofweekasstring(dayofweek(indate)) />
<tr><td colspan="4"  align="center" class="gray_url" ><a href="##total_#date#" class="reg_price">$?</a> & &nbsp;#date# <a name="total_#ko#">Total</a>  #Dollarformat(dt)# Cost: #Dollarformat(dt-et)# Count: #ordercount#(#wsale#) 
</td>
<cfset wsale = 0 >
<cfset ko = date />
<cfset date = datepart('d',indate) />
<td  colspan="5"  class="topnavigator" align="left" <cfif listfindnocase('sunday,saturday',dey)> style="background-ccolor:red;"</cfif> >#dey# :#date#</td></tr>
  <cfset ordercount = 0>
  <cfset dt = 0>
  <cfset et = 0>
</cfif>
<cfswitch expression="#paymode#">
<cfcase value="arb1,arb2,eebeess,pp,auth.net,googchck,goog,chck,ichck,authphone,ccavenu" delimiters=",">

<tr 
 <cfif tracking is 'UPS-india'> 
      style="background-color:#upsindia#"
       <cfelse> 
	  class="look1" 
 </cfif>
 <cfif couponcode is 'regwsale'> style="color:red"
<cfset wsale = wsale + 1 ></cfif>>
  <cfif not len(trim(cost))>
     <cfset cost=0>
  </cfif>
   <cfif not len(trim(inrcost))>
    <cfset cost=0>
  </cfif>
 <cfif not len(trim(et))>
  <cfset cost=0>
 </cfif>
<cfif not len(trim(dt))>
<cfset cost=0>
</cfif>
<cfif not len(trim(ordercount))>
<cfset cost=0>
</cfif>
<cftry>
<cfset dt = dt*1 + cost*1 >
<cfset et = et*1 + inrcost*1 >
<cfset ordercount = ordercount + 1 />
<cfcatch type="any">

</cfcatch>
</cftry>
</cfcase>
<cfcase value="ebs,ichk,paypal,wellscc,wellsphone,check,google,ccav">
<tr class="done">
<cftry>
   <cfset ordercount = ordercount + 1 />
   <cfset dt = dt + cost >
   <cfset et = et + inrcost >
   <cfcatch type="any">
   </cfcatch>
   </cftry>
</cfcase>
<cfcase value="emptied">
<tr style="background:##FEEaEa">
</cfcase>
<cfdefaultcase >
<tr <cfif couponcode is 'regwsale' or couponcode is 'saved'> style="color:red"</cfif>>
</cfdefaultcase>
</cfswitch>
        <td  class="row2">
        <a name="#cartid#">#cartid#&nbsp;</a>
		</td>
        <td ><a href="itemsell.cfm?cartid=#cartid#&amp;couponcode=#couponcode#&paymode=&amp;" title="see list"  >#decimalformat(cost)#</a></td><td>#shippingdetails#</td>
        <td><a href=".cfm?cid=#cartid#&&paymode=#paymode#&couponcode=#couponcode#" title="delete on next click">#decimalformat(inrcost)#</a></td>
        <td>#totalqty#|#noofsaleitems# </td>
		<cfif tps eq 'y'>
		<td background="images/bottom_bg.gif"><a href="creditcalculator.cfm?cartid=#cartid#">@</a>
		<cfelse>
		<td>
		</cfif>
		 #couponcode#&nbsp;</td>        
		<td   	  style="font-size:12;" ><div style="position:relative;">
		<a href="showorigin.cfm?cartid=#cartid#">
<span ><!--- on being 'done' itemsell.cfm makes the cartid negative
		in the visitrecord table . just a trick to save on a column,
		since as it is we plan to keep only succesful visits in 
		visitrecord table --->





&nbsp;
<a href="crm/viewmessages.cfm?customerid=28914&email=#buyer#"  >
	#buyer#
</a>&nbsp;<div id="#cartid#" style="z-index:2;position:absolute;top:-10;"></div>
<a style="font-size:100%" onClick="sendmail(#cartid#,'http://www.semiprecious.com/cartstatus21.cfm?show=abandoned&amp;buyer=#buyer#&amp;cartid=#cartid#');" href="javascript:" >
	#timeformat(indate,"HH:MM")#&rarr;</a>
	</div></td>
<td >#paymode#</td>

<td style="font-size:10;">
<cfif status is "done">#outdate#<cfelse>#status#</cfif></td>
</tr>
</cfoutput>
</table>
<script language="JavaScript1.1" type="text/javascript">
<cfoutput>setLastCartid(#topcartid#);</cfoutput>
//localLoadXMLDoc();
</script>

<cfelse>
<cflogout />
<cflocation url="/tm-tm/" addtoken="no" />
</cfif>

</body>
</html>
<cfcatch type="any">
<cfoutput>#cfcatch.Detail#,#cfcatch.message#</cfoutput>
</cfcatch>
</cftry>