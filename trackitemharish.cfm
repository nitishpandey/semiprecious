<cfparam name=newitem default="">
<cfparam name="assignto" default="">
<cfparam name="showonly" default="">
<cfparam name="note" default="">
<cfparam name="orderby" default="indate">

<cfif newitem neq "">
<cfif session.mail eq 'acemat@vsnl.com'>
 <Cfquery datasource="gemssql" name="updateitem">
	update items set inventory=#newinv#, storage='#store#' where newitem=#newitem#
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
    Select shippingdetails, paymode,tps,status from cartstatus where cartid = 1
    </Cfquery>
	
    <CFQUERY DATASOURCE="gemssql" NAME="solditems">
  SELECT internalnote, email, itemid, CAT, supplier,  note, buyingrecord.optionid as optionid, quantity,  cartstatus.STATUS, buyingrecord.rate, price, saleprice, wholesaleprice, datebought, storage, 
  affiliateID, left(description, 150) as description,inventory FROM buyingrecord, items, cartstatus where items.newitem=buyingrecord.itemid*1 
  and quantity>0  <cfif showonly neq "">and note like '%#showonly#%'</cfif>   and cartstatus.cartid=BUYINGRECORD.CARTID and paymode <> 'null'  and items.inventory<0 and indate >'6/1/08'  order by #orderby# 
  </cfquery>

   <CFQUERY NAME="solditems" dbtype="query">
  SELECT distinct itemid,cat, description, inventory, storage, supplier, optionid from solditems where cat <> 'beads'
  </cfquery>


</cfif> 


<cfif updateinventory is "rev">
  <!--- this was yes previously . first update cartstatus--->

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
   <Table cellpadding='0' cellspacing='0' bgcolor='white' width=80%  border=0>
  <tr> 
    <td align='left' bgcolor='white' colspan=3><a href=index.cfm><img src='images/header.gif' width="309" height="57"></a></td>
  </tr>
</Table>

	   <table width="80%" align="left">
	   <tr><td>
  <table  align="left"  width="90%" style="display:block;border-bottom:1px dashed black;">
        <tr> 
      <td colspan="6"><span style="text-align:center;display:block;margin-left:2px;background-color:#FFFFFF;color:#666600;font:Arial;text-decoration:underline;font-weight:bold;border:2px groove #CCCCCC;">Track Items out of Stock</span></td>
    </tr>
<cfoutput>    <tr> 
      <td colspan="6">   Show only for: <cfoutput><a href=trackitemharish.cfm?showonly=harish>Harish</a> | <a href=trackitemharish.cfm?showonly=Acemat>ACEMAT</a> | | <a href=trackitemharish.cfm?showonly=Vijay>Vijay</a> | <a href=trackitemharish.cfm?showonly=Austin>AUSTIN</a> || ------------------ sort by --> <a href=trackitemharish.cfm?orderby=itemid>Item Number</a>  | <a href=trackitemharish.cfm?orderby=indate>Date of order</a></cfoutput>	</td>
    </tr><cfif isdefined("giftmsg")><tr>
              <td><a href="/itemsell.cfm?#CGI.QUERY_STRING#&gift=yes"><img src="/images/gift.gif" align="absmiddle" vspace="0" hspace="0" border="0"   height="24" /></a></td>
              <td colspan="5" style="padding:4px;font:16px;font-family:courier;border:black 2px dashed;color:black;">#giftmsg#</td></tr></cfif></cfoutput>
   <tr bgcolor="#CCCC99" onMouseOver=this.className='table_row_over'; onMouseOut=this.className='table_row_'; > 
      <td> <b>ID</b></td>
      <td><b>Picture</b></td>
          <td align="center" width=100><b>Description</b></td>
          <td align="center" width=150>Packed?</td>
    </tr>
    <Cfset variables.storagelayer = "">
    <!--- storage layer is a hidden layer that will show the places of storage of the items --->
    <cfoutput QUERY="solditems" group="storage"> 
	<!---<tr><td class="rowb" colspan="2" ><i>#lcase(cat)#</i></td><td colspan="4">&nbsp;</td></tr>--->
		

	<cfoutput>
	<!---
	<CFQUERY DATASOURCE="gemssql" NAME="pippin">
		Select thumblink,storage from items where newitem=#itemid#
		</cfquery>
		--->
      <tr onMouseOver="this.className='wishlist';" onMouseOut="this.className='table_row_';" > 
        <td> 
          <a href=itemsell.cfm?cartid=#cartid#>#cartid#</a>-<a href='jewelry_item.cfm?itemnumber=#itemid#' >#itemid#</a>  </td>
        <td> 
		  <img src=images/#cat#/thumb/#itemid#.jpg width=70 border="0">
		  </a> 
        </td>
        <td>
<cfif storage is 'Angela'><b>WILL ARRIVE FROM OHIO</b><br></cfif><cfif supplier contains "OC"><b>Will Arrive Separately</b><br></cfif> #description# </td>
        <td  ><form name=#itemid# action="trackitemharish.cfm"><input type=hidden name=newitem value=#itemid#><input type=text name="newinv" size=1 value=#inventory#><input type=text name="store" size=10  value="<cfif q_ship.status is 'harish' and inventory lt 0>HARISH<cfelse>#storage#</cfif>"><input type=submit value="."></form>
		<form name="#itemid#note" action="trackitemharish.cfm"><input type="text" name="note" size=8 value="#note#"><input type="hidden" name="cartid" value="#cartid#"><input type=hidden name=item value=#itemid#><input type="submit" value="Ass."></form></td>
      </tr>
<!---      <cfset Variables.storagelayer = Variables.storagelayer & itemid&"["& inventory&"]" & ":" & storage & " <hr />" > --->
    </cfoutput> </cfoutput>
  </table>
  </td></tr></table>
</body>
</html>