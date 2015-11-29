<cfparam name=cartid default="">
<cfif cartid is "">
<form name=cartinfo" acion=itemsell.cfm method=get>
ENTER INVOICE Number/CARTID (5 digit number starting with 5 or 6): <input name=cartid value="" size=5>
<input type=submit value="View">
</form>
<cfabort>
</cfif>

<cfparam name=newitem default="">
<cfparam name="StatusToNew" default="">
<cfparam name="note" default="">

<cfif newitem neq "">
<cfif session.mail eq 'acemat@vsnl.com'>
 <Cfquery datasource="gemssql" name="updateitem">
	update items set inventory=#newinv#, storage='#store#' where newitem=#newitem#
  </cfquery>

<cflocation URL="http://www.semiprecious.com/itemsell.cfm?cartid=#cartid#">
<cfabort>
</cfif>
</cfif>

	<cfquery name="openissues"  datasource="gemssql">
	Select cartissues.* from cartissues where cartid=#cartid#
	</cfquery>
<cfif session.mail eq 'acemat@vsnl.com'>
<cfif StatusToNew eq 1>
	<cfquery datasource="gemssql" name="status">
	update cartstatus set status='new' from cartstatus where cartid=#cartid#
	</cfquery>
<cfelseif StatusToNew eq 0>
	<cfquery datasource="gemssql" name="status">
	update cartstatus set status='done' from cartstatus where cartid=#cartid#
	</cfquery>

</cfif>
</cfif>

<cfif note neq "">
<cfquery datasource="gemssql" name="assign">
update buyingrecord set note='#note#' from buyingrecord where cartid=#cartid# and itemid='#item#'
</cfquery>
</cfif>

<html><cfparam name="optionid" default="0">
 <CFPARAM name="cartid" default="-">
 <CFPARAM name="showimage" default="">
  <CFPARAM name="gift" default="no">
 <CFPARAM name="form.paymode" default="">
<CFPARAM name="categ" default="">
<CFPARAM name="pay" default="">
<CFPARAM name="fraction" default="1">
<cfinclude template="udfinclude.cfm" />
<cfparam default="" name="url.paymode">
<cfparam default="" name="url.couponcode">
<cfif url.paymode eq 'null'  >
<cfset url.paymode = "">
<cfset form.paymode = "">
</cfif>
<cfif isdefined("url.cartid")>
<cfset form.cartid = url.cartid>
</cfif>

<cfswitch expression="#url.paymode#">
<cfcase value="auth.net">
<cfset url.paymode = 'WellsCC'>
</cfcase>
<cfcase value="2co">
<cfset url.paymode = 'secure2'>
</cfcase>
<cfcase value="chck">
<cfset url.paymode = 'check'>
</cfcase>
<cfcase value="pp">
<cfset url.paymode = 'PayPal'>
</cfcase>
<cfcase value="Goog">
<cfset url.paymode = 'Google'>
</cfcase>

</cfswitch>

<!--- added by Anup--->
<cfif Url.paymode neq "">
	  <Cfquery datasource="gemssql" name="updatePayment">
    	update cartstatus set paymode=<cfoutput>'#url.paymode#'</cfoutput> from cartstatus where cartid = <cfoutput>#cartid#</cfoutput>
	   </Cfquery>
  </cfif>
	   
	   <!--- manually update payment status for google or paypal and address and inventory--->
<cfif form.paymode is "p" or form.paymode is 'goo'> 

<cfinvoke component="inventory" method="updatepercart" returnvariable="flag" >
<cfinvokeargument name="cartid" value="#cartid#">
</cfinvoke> 

	<cfif form.paymode is "p"><cfset url.paymode='pp'><cfelse><cfset url.paymode='goog'></cfif>
	  <Cfquery datasource="gemssql" name="updatePayment">
    	update cartstatus set paymode=<cfoutput>'#url.paymode#'</cfoutput> from cartstatus where cartid = <cfoutput>#cartid#</cfoutput>
	   </Cfquery>
	   
	   <Cfquery datasource="gemssql" name="checkpurchase">
		Select cartid from purchase where cartid = '#form.cartid#'
	   </Cfquery>
      <cfif checkpurchase.recordcount is 0>
		   <Cfquery datasource="gemssql" name="updatePurchase">
			insert into purchase(cartid, address1) values(<cfoutput>'#cartid#', '#form.address#'</cfoutput>)
		   </Cfquery>
	   </cfif>
   
	   
Updated payment status for paypal order. PLease go back and pack order.
<cfabort>
</cfif>

<!--- CLOSED added by Anup--->


<CFPARAM name=updateinventory default="no">
<cfif cartid neq "">
  <Cfquery datasource="gemssql" name="q_ship">
    Select shippingdetails, paymode,tps,status from cartstatus where cartid = <cfoutput>#cartid#</cfoutput>
    </Cfquery>
    <CFQUERY DATASOURCE="gemssql" NAME="solditems">
  SELECT  internalnote, email, itemid, CAT, supplier, thumblink, note, buyingrecord.optionid, quantity, status,buyingrecord.rate, price, saleprice, wholesaleprice, datebought, storage, 
  affiliateID, left(description, 150) as description,inventory FROM buyingrecord, items where items.newitem=buyingrecord.itemid*1 
  and quantity>0    and buyingrecord.rate is not null  and cartid=#cartid# order by storage
  </cfquery>
</cfif> 
<cfif updateinventory is "rev">
  <!--- this was yes previously . first update cartstatus--->
  <cfinvoke  component="cartcontrol.cartmonitor" method="rupdatecart" returnvariable="rupdateresult">
    <cfinvokeargument name="cartid" value="#url.cartid#" />
	  <cfinvokeargument name="indate" value="#urldecode(odbcindate)#" /> 
  </cfinvoke>
  <!--- then the inventory --->
  <cfif rupdateresult>
  <cfinvoke component="inventory" method="rupdatepercart" returnvariable="flag" >
<cfinvokeargument name="cartid" value="#cartid#">
</cfinvoke>
 

    <script >alert("INVENTORY REVERSED! ");</script>
  <cfelse>
    <script >alert("INVENTORY NOT REVERSED BECAUSE THE CART WAS  'EITHER NEW OR EXPIRED'!");</script>
  
  </cfif>
</cfif>
<CFQUERY DATASOURCE="gemssql" NAME="purchaser">
Select firstname, address1,city,state,zip,country,phonenumber, email from purchase where email='#cartid#'  or cartid = '#cartid#'
</cfquery>
<head>
<style type="text/css" media="screen">
.inventory0 {
color:red ;
}
</style>
<cfif findnocase('g',q_ship.shippingdetails)>

<cfquery datasource="gemssql" name="giftq" >
select message from giftmsg where cartid = #cartid#
</cfquery>
<cfif giftq.recordcount >
<cfset giftmsg = giftq.message />
</cfif>
</cfif>
<link rel="shortcut icon" href="/favicon.ico" />

<title>Items Bill: The Jewelry Store</title>
 <link href="styles/npstyles1.css" rel="stylesheet" type="text/css"> 
 <cfif solditems.affiliateid  eq 'regwsale' >
 <style type="text/css" media="screen">
.error { 
 color: white;
 background-color:white;
 }
 </style>
 </cfif>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}
//-->
</script>
</head>
<body bgcolor='white' >
<cfif isdefined("cartid")> 
 <cfif  url.couponcode eq 'young'>
   <cfinclude template="youngheader.cfm">
   <cfset store = 'youngultd.com' />
    <cfelseif url.couponcode eq 'jandj'>
    <cfinclude template="jandjheader.cfm">
	<cfset store = 'jewelsandjewels.com' />
    <cfelseif url.couponcode eq 'jng'>
    <cfinclude template="jngheader.cfm">
	<cfset store = 'jewelsandgems.com' />
    <cfelse>
	<cfset store = 'semiprecious.com' />
	
	<cfquery name="track"  datasource="gemssql">
Select * from cartissues where cartid = #cartid# 
</cfquery>
   <Table cellpadding='0' cellspacing='0' bgcolor='white' width=80%  border=0>
  <tr> 
    <td align='left' bgcolor='white' colspan=3><a href=index.cfm><img src='images/header.gif'></a></td></tr></table>

<table><tr>	<td>
	<cfif track.recordcount gt 0>
	
	<cfif track.tracking1 neq "" and track.tracking2 eq ""><br><b>SHIPPING STATUS:</b> COMING FROM JEWELER TO AUSTIN <a href=http://wwwapps.ups.com/WebTracking/processInputRequest?HTMLVersion=5.0&loc=en_IN&Requester=UPSHome&tracknum=<cfoutput>#track.tracking1#</cfoutput>&ignore=&track.x=44&track.y=3>Locate/Track</a><br>
		<cfelseif track.tracking2 neq ""> <form action=http://trkcnfrm1.smi.usps.com/PTSInternetWeb/InterLabelInquiry.do method=post  name="getTrackNum"> 
		<p><b>Track Package: Track. Number- </b><cfoutput><font color=white>#track.tracking1#--</font>#track.tracking2#</cfoutput><input name="origTrackNum" type="hidden" id="origTrackNum" value="<cfoutput>#track.tracking2#</cfoutput>" style="width:240px" tabindex="2"><input type="submit" value="Track"></form>
	</cfif><br>
	<cfelse>
	This order may not have shipped
	</cfif>
<cfif session.mail is 'acemat@vsnl.com'>ENTER Tracking- : <a href=cartissues.cfm?cartid=<cfoutput>#cartid#</cfoutput>>Add Tracking/ Issue</a></cfif>		
	<cfif track.issue neq ""><font color="red"><br><br><cfoutput>#track.issue#</cfoutput></font></cfif>

	</td>

  </tr>
</Table>

<br>
	

    </cfif>
	   <table width="80%" align="left">
	   <tr><td>
  <table  align="left"  width="90%" style="display:block;border-bottom:1px dashed black;">
        <tr> 
      <td colspan="6"><span style="text-align:center;display:block;margin-left:2px;background-color:#FFFFFF;color:#666600;font:Arial;text-decoration:underline;font-weight:bold;border:2px groove #CCCCCC;">Invoice/Packing Slip</span></td>
    </tr>
  <tr> 
<cfoutput>      <td colspan="6"> <strong>Order No. (<a href=cartview.cfm?cartid=#cartid#>Cartid</a>)</strong>: <a title="confirm this cart (if paid using pp,auth.net,check)" href="http://www.semiprecious.com/itemsell.cfm?cartid=#cartid#&paymode=#q_ship.paymode#&returntocarts=1">#cartid#</a> | <strong>Date:</strong> <a href="cartstatus21.cfm" >#dateformat(solditems.datebought,'dd-mmm-yy')#</a><strong> | Affiliate: </strong><font color=red>#solditems.affiliateID#</font>; Payment Method: #pay#, #q_ship.shippingdetails# </cfoutput>  
	  <!--- remove <cfif session.mail is "acemat@vsnl.com" or session.mail is "info@silverscorpio1.com"> Assign To: <cfoutput><a href=itemsell.cfm?assignto=harish&cartid=#cartid#>Harish</a> | <a href=itemsell.cfm?assignto=Acemat&cartid=#cartid#>ACEMAT</a> | <a href=itemsell.cfm?assignto=new&cartid=#cartid#>AUSTIN</a> --->|| <cfoutput> Current Status: <font color=red>#q_ship.status#</font></cfoutput>	</cfif> <a href=itemsell.cfm?cartid=<cfoutput>#cartid#</cfoutput>&statustonew=1>Make New</a> || <a href=itemsell.cfm?cartid=<cfoutput>#cartid#</cfoutput>&statustonew=0>Mark Done</a></td>
    </tr><cfoutput><cfif isdefined("giftmsg")><tr>
              <td>  <a href="/itemsell.cfm?#CGI.QUERY_STRING#&gift=yes"><img src="/images/gift.gif" align="absmiddle" vspace="0" hspace="0" border="0"   height="24" /></a></td>
              <td colspan="5" style="padding:4px;font:16px;font-family:courier;border:black 2px dashed;color:black;">#giftmsg#</td></tr></cfif></cfoutput>
    <tr bgcolor="#CCCC99" onMouseOver=this.className='table_row_over'; onMouseOut=this.className='table_row_'; > 
      <td> <b>ID</b></td>
      <td><b>Picture</b></td>
          <td align="center"><b>Qty</b></td>
       <cfif gift is "no">   <td align="center"><b>Price</b></td></cfif>
          <td align="center" width=100><b>Description</b></td>
          <td align="center" width=150>Packed?</td>
    </tr>
    <Cfset variables.storagelayer = "">
    <!--- storage layer is a hidden layer that will show the places of storage of the items --->
    <cfoutput QUERY="solditems" group="storage"> 
	<!---<tr><td class="rowb" colspan="2" ><i>#lcase(cat)#</i></td><td colspan="4">&nbsp;</td></tr>--->
		

	<cfoutput>

      <tr onMouseOver="this.className='wishlist';" onMouseOut="this.className='table_row_';" > 
        <td> 
          <a href='jewelry_item.cfm?itemnumber=#itemid#' >#itemid#</a> </td>
        <td> 
	<cfif showimage eq "">
        <cfif session.mail is "acemat@vsnl.com">  <a href="edititem.cfm?newitem=#itemid#" target="itemsellimg"></cfif>
		  <cfif storage is 'pippin'>
  		  <img src=#thumblink# width=70 border="0" alt="#internalnote#">
		<cfelseif storage is 'CMZP' or storage is 'CMPET'>
  		  <img src=images/#cat#/thumb/#itemid#.jpg height=70 border="0" alt="#internalnote#">
		  <cfelse>
		  <img src=images/#cat#/thumb/#itemid#.jpg width=70 border="0">
		  </cfif>
		        <cfif session.mail is "acemat@vsnl.com">  </a> </cfif>
	</cfif>
        </td>
        <td bgcolor="##FFFFFF"> 
<cfset amnt = 0>
          <cfif quantity gt 1> <font color=red size=+1><b>#quantity#</b></font><cfelse>#quantity#</cfif></td>
        <cfif gift is "no"><td> <cfif solditems.affiliateid neq 'regwsale'><cfif status is 3> <span class="error" >Sale!</span><br>
		<s>#format(price)#</s></cfif>
  </cfif><div class="price" ><cfif rate neq "">#format(rate*fraction)#</cfif> <!--- 
          <cfif solditems.affiliateid eq 'regwsale'>
            <cfif wholesaleprice neq "" and wholesaleprice neq 0.0 >
              #dollarformat(wholesaleprice)# 
              <cfelse>
              #dollarformat(0.5*price)# 
            </cfif>
            <cfelseif status EQ 3>
            Sale:#dollarformat(saleprice)# 
            <cfelse>
            #dollarformat(price)# </cfif></div> ---></td></cfif>
        <td><cfif optionid>
		<span class="optionsinline"><cfif solditems.cat is "beads">OC - MAKE THIS INTO A NECKLACE OF SIZE: </cfif>
<cf_optiondetails option="#optionid#"  newitem='#itemid#' /></span></cfif>
<cfif storage is 'Angela'><b>WILL ARRIVE FROM OHIO</b><br></cfif><cfif supplier contains "OC"><b><br>Will Arrive Separately</b><br></cfif>
 #description# <cfif session.mail is "acemat@vsnl.com">
<cfif internalnote neq ""><br><font color=red>#internalnote#</font></cfif><a href="http://www.semiprecious.com/admintools/returns.cfm?cartid=#cartid#&item=#itemid#&amount=#right(format(price),4)*quantity#&quantity=#quantity#">Refund</a></cfif></td>
        <td  >
			<cfif showimage eq "">
		<form name=#itemid# action="itemsell.cfm"><input type=hidden name=newitem value=#itemid#><input type=hidden name=cartid value=#url.cartid#><input type=text name="newinv" size=1 value=#inventory#><input type=text name="store" size=10  value="<cfif q_ship.status is 'harish' and inventory lt 0>HARISH<cfelse>#storage#</cfif>"><input type=submit value="."><br><cfif note contains 'IN-'>INDIA<cfelse>#note#</cfif></form>

		</cfif>
		</td>
      </tr>
<!---      <cfset Variables.storagelayer = Variables.storagelayer & itemid&"["& inventory&"]" & ":" & storage & " <hr />" > --->
    </cfoutput> </cfoutput>
  </table>
  </td></tr>
 <tr><td>

<table style="display:block;">
<tr ><Td class="price"><b>Total amount:</b>   <cfif cartid neq "">    <cfset totalamount=0>
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
	
 	 <cfoutput><cfif gift is "no"> #format(totalamount*fraction)# (not including shipping).  </cfif>     <cfif solditems.affiliateid eq 'regwsale'><b>shipping:</b>$10.00</cfif> <strong> No. of Items:</strong> #totalqty#.</Td></tr>
	<tr><td>   ===================================================== </td></tr>

 <cfif  solditems.affiliateid neq 'regwsale'  >
 	<cfif purchaser.state is 'tx' or purchaser.state is 'texas'><tr><td>Amount Including Sales Tax: #dollarformat(1.0825*totalamount)#</td></tr></cfif>
  <cfif   find('@',solditems.email)>
<cftry>
	<cfset credit = 0>
      <cf_getcredit email='#solditems.email#'   returnvariable='credit' />
	  <cfif q_ship.status neq 'done'>
	  <cfset credit = credit + 0.2*totalamount />
	    </cfif>
		 <cfquery datasource="sptm" username="nitish" password="rangeela" name="qcr">
           Select lastcreditvalue as lc from invite_credits where  lastcartid = #cartid#  and  email = '#solditems.email#' 
    </cfquery>
 <cfif qcr.recordcount>
 <tr>
   <td>
      <span class="error1">Credit used for the purchase: #format(qcr.lc)#.</span>
	  </td>
	 </tr>
	 </cfif>

	   <tr>
	   <td><span class="headerfont"><cfif purchaser.country eq 'france'>Credit Disponible Pour Le Prochain Achat<cfelse>Credit Available For Future Purchases:</cfif> #dollarformat(credit)# [To use, please login with your Email  while shopping]</span></td> </tr><cfcatch type="expression"><cfoutput>.<font color="white">#cfcatch.Detail# #cfcatch.Message#[#credit#]</font>.</cfoutput></cfcatch></cftry></cfif>	 </cfif></cfoutput>
	   </td></tr>
 <tr><td><i><cfif purchaser.country eq 'france' >Merci Pour Faire Des Emplettes Avec <cfoutput>#store#</cfoutput><cfelse>Thankyou for Shopping with <cfoutput>#store#</cfoutput>.</cfif></i></td></tr>

	</table></td></tr><tr><td>
<!---    Note: The item prices and final amount shown may be different from ones paid 
    at the point of purchase <br>
    because of subsequent price revisions and special discounts used. <strong>The 
    differences can be safely ignored.</strong>    <hr> --->
      ======================================== <br>
Note to Shippers: 
<cfquery datasource="gemssql" name="giftq" >
select note from giftmsg where cartid = #cartid#
</cfquery>
<cfoutput query="giftq">#note#</cfoutput><br>

	    <cfif #purchaser.address1# eq "">
      <p align="left">Ship To:<br>
        <textarea cols="30" rows="6" name="Address" id="Address"></textarea>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      </P>
	  <cfelse>
	  <table><tr><td width=400>
    <span  style="width:400px;display:block;"> 
Name & Mailing Address: <cfif session.mail is "acemat@vsnl.com">(<a href="admintools/invoiceaddress.cfm?cartid=<cfoutput>#cartid#</cfoutput>">edit</a>)</cfif><br>
<cfoutput query="purchaser"> 
<span style="margin-left:50px;display:block;text-transform:capitalize;">
     <font size="+1"> #firstname#<br>
      #address1#<br>
      #city#  #STATE# &nbsp;&nbsp;&nbsp;#zip#<br>
      #COUNTRY#</font><br>
      Cartid/ Billing Email:<strong>#email#</strong> <cfif session.mail is "acemat@vsnl.com" and email contains "@"><a href='http://www.semiprecious.com/showuserdetails.cfm?email=#right(email,len(email) - findnocase("/",email))#'>Email</a></cfif><br>
	  Billing Phone: <strong>#phonenumber#</strong></span></cfoutput>  </span>
    ========================================= 
     </td><td align=left><b>Return Label</b> (include reason/requests to customize):<p>
<font size="+2">
<b>Dynamic Web<br>
1512 Anise Dr<br>
Austin, TX 78741</b>
</font></td></tr></table>
	 
      <textarea cols="100" rows="5" name="promo" id="promo">
	  Please check out other great products from us:
	  www.handmadeLatopcase.com
	  www.haldiramusa.com
	  www.myexhibition.com
	  www.healingcrystalsandstones.com
	  www.gem-stones.com
	  	  </textarea>
    <cfoutput><br>Shipping Code:#q_ship.shippingdetails#.</cfoutput> 
  </cfif>
  <br>
  <cfif cartid neq "-">
    <cfif updateinventory neq "rev">
      <cfquery datasource="gemssql" name="exactcart" >
      select indate from cartstatus where cartid = #cartid# 
      </cfquery>
	  <cfset odbcindate=now()>
      <cfset odbcindate = createodbcdatetime(exactcart.indate)>
      <!--- 	<cfoutput>#odbcindate# for #cartid#</cfoutput> --->
      <cfif len(url.paymode) GT 1>
        <cfinvoke  component="cartcontrol.cartmonitor" method="updatecart" returnvariable="updateresult">
          <cfinvokeargument name="cartid" value="#url.cartid#"/>
          <cfinvokeargument name="mode" value="#url.paymode#"/>
          <cfinvokeargument name="indate" value="#odbcindate#"/>
        </cfinvoke>
        <cfquery datasource="gemssql">
        update visitrecord set cartid = -1*cartid where cartid = #cartid# 
        </cfquery>
        <cfelseif  (isdefined("form.paymode") and (len(form.paymode) GT 1)) >
        <cfinvoke  component="cartcontrol.cartmonitor" method="updatecart" returnvariable="updateresult">
          <cfinvokeargument name="cartid" value="#form.cartid#"/>
          <cfinvokeargument name="mode" value="#form.paymode#"/>
          <cfif isdefined("form.shipping")>
            <cfinvokeargument name="shipping" value="#form.shipping#"/>
          </cfif>
          <cfinvokeargument name="indate" value="#odbcindate#"/>
        </cfinvoke>
        <cfif updateresult>
          	<cfset cartid = form.cartid>
			  <cfif q_ship.tps eq 'y'>
					<cfquery datasource="sptm" username="nitish" password="rangeela" >
					update thirdpartysales set cartshipped = 'y' where cartid = '#form.cartid#' 
					and coupon = '#solditems.affiliateID#' 
					</cfquery>
			  </cfif>
          <cfinvoke component="inventory" method="updatepercart" returnvariable="flag" >
            <cfinvokeargument name="cartid" value="#cartid#">
          </cfinvoke>
  <cfif #purchaser.firstname# eq "">
  	 </cfif>
	 
    <p align="left">Ship To:<br>
      <textarea cols="30" rows="6" name="Address" id="Address"></textarea>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  </cfif>
  <p align="left">======================================================== 
	  an alternative to two queries done above
	  <cfquery datasource="gemssql" name="lessinv">
	  select newitem , cat from items , buyingrecord where (items.inventory < 1 and items.newitem = buyingrecord.itemid*1 and buyingrecord.cartid = #cartid# and datebought = #odbcindate#)
	  </cfquery> --->
          <br>
          Inventory Updated ... <cfoutput>^#form.paymode#^</cfoutput> 
          <cfset inventupdate = 1>
          <cfquery datasource="gemssql">
          update visitrecord set cartid = -1*cartid where cartid = #cartid# 
          </cfquery>
          <cfset refdate = dateadd('d',-6,Now())>
          <cfquery datasource="gemssql" name="s">
          delete from visitrecord where cameon < #refdate# and cartid > 0 
          </cfquery>
          <cfelse>
          Inventory Not Updated. 
        </cfif>
        <cfif  not isdefined("inventupdate")>
          Inventory not edited (Possibly already updated while confirming payment 
          status...if it was 2co, auth.net,chck or pp only) 
        </cfif>
        <p align="left">Click here to <a href='itemsell.cfm?<cfoutput>odbcindate=#urlencodedformat(odbcindate)#&cartid=#cartid#</cfoutput>&updateinventory=rev'>Reverse 
          inventory & cart status</a> updates. <br>
          <cfelse>
        <p class="error1">Inventory not updated because Payment mode was not specified 
          through form. &nbsp;</p>
      </cfif>
    </cfif>
    <cfquery datasource="gemssql" name="exact">
    select itemid,rate from buyingrecord where datebought = #odbcindate# and cartid 
    = #cartid# and quantity>0 
    </cfquery>


  </cfif>
  <br></td></tr><tr><td>
  	<cfif pay neq "">
	</td></tr></table>
	<cfabort>
	</cfif>
	<cfif cartid neq "">
  <span class="title">Or Fill form below to process another cartid:</span> 
  <cfform action='itemsell.cfm' method="post">
    <table width="88%" border="1">
      <tr> 
        <td>Please enter cart id:</td>
        <td><cfoutput> 
            <input type="text" value="#cartid#" name="cartid">
            <span class="error1">( Inventory for pp, auth.net,chck and 2co status 
            carts is already updated.)</span></cfoutput></td>
      </tr>
	  
	  <tr><td>Address:</td><td><textarea cols="30" rows="5" name="Address" id="Address"></textarea></td></tr>
      <tr> 
      <tr> 
        <td>Payment Mode : </td>
        <td > <select value="1" name="paymode" >
            <option ></option>
            <option value="secure2"  >Secure 2 Checkout</option>
            <option value="check">Check</option>
            <option value="others">Others</option>
            <option value="wellsPhone">Phone + Authorize.net</option>
            <option value="wellsCC">Authorize.net CC</option>
            <option value="p">Pay Pal</option>
	 <option value="goo">Google</option>
		
          </select>
          Imp: <span class="error1"> ( This will update inventory also. So if 
          you want to update only status and not the inventory then use the link 
          on cartstatus21.cfm. cart status updated only if this provided. </span></td>
      </tr>
      <tr> 
        <td>Shipping Details (date, parcel, courier etc.):</td>
        <td><input type="text" name="shipping" value="optional"> <input name="submit" type='submit' value='see cart' class="greenbutton"></td>
      </tr>
    </table>
  </cfform>
  <cfelse></td></tr><tr><td>
  <cfparam default="" name="url.cartidfromcartlist">
  <cfform action='itemsell.cfm' method="post">
    <table width="88%" border="1">
      <tr> 
        <td>Please enter cart id:</td>
        <td><cfoutput> 
            <input type="text" value="#url.cartidfromcartlist#" name="cartid">
            <span class="error1">Inventory for chck,pp, auth.net and 2co status 
            carts is already updated</span></cfoutput></td>
      </tr>
	  <tr><td>Address:</td> 0<textarea cols="30" rows="5" name="Address" id="Address">
	  </textarea></tr>
      <tr> 
        <td>Payment Mode : </td>
        <td > <select value="1" name="paymode" required="yes" message="Pse specify payment mode.">
            <option ></option>
            <option value="secure2" >Secure 2 Checkout</option>
            <option value="check">Check</option>
            <option value="others">Others</option>
            <option value="wellsPhone">Phone + Authorize.net</option>
            <option value="wellsCC">Authorize.net CC</option>
            <option value="pp">Pay Pal</option>
	 <option value="p">PayPal payment done</option>
	 	 <option value="goo">Google</option>
          </select>
          Imp: <span class="error1"> (This will update inventory also. So if 
          you want to update only status and not the inventory then use the link 
          on cartstatus21.cfm. )</span></td>
      </tr>
      <tr> 
        <td>Shipping Details (date, parcel, courier etc.):</td>
        <td><input type="text" name="shipping" value="optional"> <input name="submit" type='submit' value='see cart'></td>
      </tr>
    </table>
  </cfform>
</cfif>
<cfquery datasource="gemssql" name="confirmed">
   select count(cartid) as t from cartstatus where paymode = 'pp' or paymode = 'auth.net' or paymode = '2co' or paymode = 'chck' or paymode='Goog'
   </cfquery>
   <cfoutput>#confirmed.t# Carts Pending</cfoutput>
    <!--- info put inline <div id="storagelayer" style="z-index:2;position:absolute;top:80px;left:200px;visibility:hidden;width:100px;border:1px brown dashed;background-color:yellow;"> 
    Where Stored & Inventory AFTER this shipment:<br>
    <cfoutput>#storagelayer# . </cfoutput></div> --->

<a href="http://www.semiprecious.com/admin.cfm?passcode=shaurya">back to admin 
page</a>&nbsp;&brvbar;&Auml; <a href="cartstatus21.cfm">View Carts</a>
</td></tr></table>
<cfif isdefined("url.returntocarts") and len(url.paymode)>
<cflocation addtoken="no" url="cartstatus21.cfm" /></cfif>
</body>
</html>
