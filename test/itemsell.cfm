<cftry>
<CFPARAM name="makemoo" default="">
<CFPARAM name="printable" default="">
<CFPARAM name="optionid" default="no">
<CFPARAM name="movetracking" default="">
<CFPARAM name="showimage" default="">
<CFPARAM name="mooitem" default="">
<CFPARAM name="zoom" default="">
<cfparam name="orderby" default="storage">
<cfset solditems.recordcount = 0 />
  <CFPARAM name="gift" default="no">
  <CFPARAM name="form.paymode" default="">
<CFPARAM name="categ" default="">
<CFPARAM name="url.print" default="0">
<CFPARAM name="pay" default="">
<CFPARAM name="fraction" default="1">
<cfparam default="" name="url.paymode">
<CFPARAM name="updateinventory" default="no">
<cfparam default="" name="url.couponcode">
<cfparam name="newitem" default="">
<cfparam name="StatusToNew" default="">
<cfparam name="note" default="">
<cfparam name="cartid" default="">

<cfparam name="archived" default="no">
<cfset ringsize = 0 />
<cfset moo = 0 />

<link rel="stylesheet" type="text/css" href="/style.css" />
<script src="/js/html5.js" type="text/javascript"></script>

<cfif movetracking is "yes">
  <cftry>
  <cfquery datasource="gemssql" name="moveit">
  update cartissues set tracking3=tracking2, tracking2='' where cartid=#cartid#

  </cfquery>
   <cfquery datasource="gemssql" name="moveit">
 	update cartstatus set tracking=null where cartid=#cartid#

  </cfquery>
  <cfcatch type="any">
  Error in mooing the item
  </cfcatch>
  </cftry><cfoutput>
	<cflocation url="itemsell.cfm?cartid=#cartid#"></cfoutput>
</cfif>
<cfif makemoo is "yes">
  <cftry>
  <cfquery datasource="gemssql" name="mooit">
  update buyingrecord set makeondemandnote='prashant' , makeondemand=1 , inventoryatsale=-1 where
  cartid=#cartid# and itemid=	#mooitem#
  </cfquery>
  <cfcatch type="any">
  Error in mooing the item
  </cfcatch>
  </cftry>
	<cfelseif makemoo is "no">
	<cftry>
  	<cfquery datasource="gemssql" name="mooit">
  update buyingrecord set makeondemandnote=null , makeondemand=0, inventoryatsale=0 where
  cartid=#cartid# and itemid=	#mooitem#
  </cfquery>
	<cfcatch>
	Error removing MOO
  </cfcatch>
	</cftry>
</cfif>

<html>
<head>
 <link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
<style type="text/css" media="screen">
a:visited {
color:red;
}
.inventory0 {
color:red ;
}
body {
	font-family:verdana;
}
</style>
<link rel="shortcut icon" href="/favicon.ico" />

<title><cfoutput>#cartid# </cfoutput> Items Bill: The Jewelry Store</title>
<cfif isdefined("url.cartid")>
<cfif  len(url.cartid)>
<cfset cartid = listgetat(url.cartid,1) />
<cfset url.next_cart = listDeleteAt(url.cartid,1) />
<cfset url.cartid = cartid />
</cfif>
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
<body  >
<div align="center">
<cfif cartid is "">
<form name="cartinfo" acion=itemsell.cfm method=get>
ENTER INVOICE Number/CARTID (6  to 7 digit number): <input name=cartid value="" size=5>
<input type=submit value="View">
</form>
<cfelse>


<cfif newitem neq "">
 <cfif session.mail eq application.admin_email>
   <h1> This page is under modification. If you encounter any error please use this URL http://www.semiprecious.com/itemsell_1.cfm</h1>
<cftry>
 <cfquery datasource="gemssql" name="updateitem">
	update items set inventory=#newinv#, storage='#store#' where newitem=#newitem#
  </cfquery>
			<cfcatch type="database">
<h2>DB error, email cs@semiprecious.com with this error</h2>
</cfcatch>
</cftry>
</cfif>
<cflocation URL="http://www.semiprecious.com/itemsell.cfm?cartid=#cartid#">
</cfif>
<cftry>
	<cfquery name="openissues"  datasource="gemssql">
		Select cartissues.* from cartissues where cartid=#cartid#
	</cfquery>
     		<cfcatch type="database">
<h2>DB error, email cs@semiprecious.com with this error</h2>
</cfcatch>
</cftry>
	 <cfif session.mail eq application.admin_email>
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
<cftry>
<cfquery datasource="gemssql" name="assign">
	update buyingrecord set note='#note#' from buyingrecord where cartid=#cartid# and itemid='#item#'
</cfquery>
		<cfcatch type="database">
<h2>DB error, email cs@semiprecious.com with this error</h2>
</cfcatch>
</cftry>
</cfif>



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
<cfcase value="ccavenu">
<cfset url.paymode = 'ccav'>
</cfcase>
<cfcase value="arb1">
<cfset url.paymode = 'arb'>
</cfcase>
<cfcase value="authphone">
<cfset url.paymode = 'wellsphone'>
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
<cfif Url.paymode neq "" and url.paymode neq "null">
	  <Cfquery datasource="gemssql" name="updatePayment">
    	update cartstatus set paymode=<cfoutput>'#url.paymode#'</cfoutput> from cartstatus where cartid = <cfoutput>#cartid#</cfoutput>
	   </Cfquery>
	   Cost and value not updated
  </cfif>

	   <!--- manually update payment status for google or paypal and address and inventory--->
<cfif form.paymode is "p" or form.paymode is 'goo' or form.paymode is 'chck' or form.paymode is 'authcc' or form.paymode is 'ccav' or form.paymode is 'authphone' or form.paymode is 'arb'>
	<cfif form.paymode is "p">
		<cfset url.paymode='pp'>
	<cfelseif form.paymode is "goo">
		<cfset url.paymode='goog'>
	<cfelseif form.paymode is "authcc" >
		<cfset url.paymode='auth.net'>
	<cfelseif form.paymode is "ccav" >
		<cfset url.paymode='ccavenu'>
	<cfelseif form.paymode is "Wellsphone" or form.paymode is "authphone" >
		<cfset url.paymode='authphone'>
	<cfelseif form.paymode is "arb" >
		<cfset url.paymode='arb1'>
			<cfelse>
		<cfset url.paymode='chck' >

	</cfif>


	     <cfinvoke  component="cartcontrol.cartmonitor" method="updatecart" returnvariable="updateresult">
		          <cfinvokeargument name="cartid" value="#cartid#"/>
		          <cfinvokeargument name="mode" value="#url.paymode#"/>
		          <cfif isdefined("form.shipping")>
		            <cfinvokeargument name="shipping" value="#form.shipping#"/>
		          </cfif>
		        	</cfinvoke>
		        <cfquery datasource="gemssql">
		        update visitrecord set cartid = -1*cartid where cartid = #cartid#
		        </cfquery>
	   <Cfquery datasource="gemssql" name="checkpurchase">
			Select cartid from purchase where cartid = '#form.cartid#'
	   </Cfquery>

      <cfif checkpurchase.recordcount is 0>
		   <Cfquery datasource="gemssql" name="updatePurchase">
			insert into purchase(cartid, address1) values(<cfoutput>'#cartid#', '#form.address#'</cfoutput>)
		   </Cfquery>
	   </cfif>


Updated payment status for auth/arb/ccavenue/paypal/google order. PLease go back and pack order.
<cfoutput>

	<a href="itemsell.cfm?cartid=#cartid#&amp;ujpdated">to cart </a>
  </cfoutput>
  <cfelse>

<!--- CLOSED added by Anup--->



<cftry>
  <Cfquery datasource="gemssql" name="q_ship">
    Select shippingdetails, paymode,tps,status,buyer,couponcode from cartstatus where cartid = <cfoutput>#cartid#</cfoutput>
    </Cfquery>
	<cfif q_ship.recordcount is 0>
	<cfset archived="yes">
	<Cfquery datasource="gemssql" name="q_ship">
    Select shippingdetails, paymode,tps,status,buyer,couponcode from cartstatus_archive where cartid = <cfoutput>#cartid#</cfoutput>
    </Cfquery>
	<CFQUERY DATASOURCE="gemssql" NAME="solditems">
	SELECT     TOP 100 PERCENT  dbo.items.subcat as subcat2,dbo.items.grouping,dbo.items.orderonrequest, dbo.items.weight, dbo.items.internalNote, buyingrecord.inventoryatsale,buyingrecord.makeondemandnote, buyingrecord.email, buyingrecord.itemid, dbo.items.CAT, dbo.items.supplier,
                      dbo.items.thumblink, buyingrecord.Note, buyingrecord.optionid,  buyingrecord.quantity, dbo.items.status, buyingrecord.rate,
                      dbo.items.price, dbo.items.saleprice, dbo.items.wholesaleprice, buyingrecord.datebought, dbo.items.storage, buyingrecord.affiliateID,
                      LEFT(dbo.items.Description, 150) AS description, dbo.items.Inventory
FROM         dbo.buyingrecord_archive as buyingrecord LEFT OUTER JOIN
                      dbo.items ON buyingrecord.itemid * 1 = dbo.items.newitem
WHERE    buyingrecord.quantity>0 and (buyingrecord.rate IS NOT NULL) AND (buyingrecord.cartid = #cartid#)
ORDER BY #orderby# </cfquery>
  <cfif solditems.recordcount is 0>

    <CFQUERY DATASOURCE="gemssql" NAME="solditems">SELECT     TOP 100 PERCENT dbo.items.grouping, dbo.items.subcat as subcat2,dbo.items.orderonrequest, dbo.items.weight, dbo.items.internalNote, dbo.buyingrecord.email, dbo.buyingrecord.itemid, dbo.items.CAT, dbo.items.supplier,
                      dbo.items.thumblink,dbo.buyingrecord.inventoryatsale, dbo.buyingrecord.Note, dbo.buyingrecord.optionid,buyingrecord.makeondemandnote, dbo.buyingrecord.buyingrecordid,dbo.buyingrecord.quantity, dbo.items.status, dbo.buyingrecord.rate,
                      dbo.items.price, dbo.items.saleprice, dbo.items.wholesaleprice, dbo.buyingrecord.datebought, dbo.items.storage, dbo.buyingrecord.affiliateID,
                      LEFT(dbo.items.Description, 150) AS description, dbo.items.Inventory
FROM         dbo.buyingrecord LEFT OUTER JOIN
                      dbo.items ON dbo.buyingrecord.itemid * 1 = dbo.items.newitem
WHERE     buyingrecord.quantity>0  (dbo.buyingrecord.rate IS NOT NULL) AND (dbo.buyingrecord.cartid = #cartid#)
ORDER BY #orderby#
  </cfquery>
   </cfif>
<cfelse>

    <CFQUERY DATASOURCE="gemssql" NAME="solditems">SELECT     TOP 100 PERCENT dbo.items.grouping, dbo.items.subcat as subcat2, dbo.items.weight,dbo.items.orderonrequest, dbo.items.internalNote, dbo.buyingrecord.email, dbo.buyingrecord.itemid, dbo.items.CAT, dbo.items.supplier,
                      dbo.items.thumblink, dbo.buyingrecord.Note, dbo.buyingrecord.inventoryatsale,dbo.buyingrecord.optionid, dbo.buyingrecord.buyingrecordid,buyingrecord.makeondemandnote,dbo.buyingrecord.quantity, dbo.items.status, dbo.buyingrecord.rate,
                      dbo.items.price, dbo.items.saleprice, dbo.items.wholesaleprice, dbo.buyingrecord.datebought, dbo.items.storage, dbo.buyingrecord.affiliateID,
                      LEFT(dbo.items.Description, 150) AS description, dbo.items.Inventory
FROM         dbo.buyingrecord LEFT OUTER JOIN
                      dbo.items ON dbo.buyingrecord.itemid  = dbo.items.newitem
WHERE     buyingrecord.quantity>0 and  (dbo.buyingrecord.rate IS NOT NULL) AND (dbo.buyingrecord.cartid = #cartid#)
ORDER BY #orderby#
  </cfquery>
  </cfif>

<cfcatch>
error between lines 270 and 304
	</cfcatch>
</cftry>

<cfif updateinventory is "rev">
  <!--- this was yes previously . first update cartstatus and inventory together if going from paid to null otherwise keep inventory as it is--->
  <cfinvoke  component="cartcontrol.cartmonitor" method="rupdatecart" returnvariable="rupdateresult">
	    <cfinvokeargument name="cartid" value="#url.cartid#" />
    </cfinvoke>
  <cfoutput>
  #rupdateresult#
 	<a href="cartstatus21.cfm?cartid=#url.cartid#&amp;reversed">Back to cartstatus </a>
  </cfoutput>
</cfif>

<CFQUERY DATASOURCE="gemssql" NAME="purchaser">
	Select firstname, address1,address2,city,state,zip,country,phonenumber, email,billingstate, comments from purchase where cartid = '#cartid#'
</cfquery>
<cfif findnocase('g',q_ship.shippingdetails)>
<cftry>
	<cfquery datasource="gemssql" name="giftq" >
		select message from giftmsg where cartid = #cartid#
	</cfquery>
	<cfif giftq.recordcount >
		<cfset giftmsg = giftq.message />
	</cfif>
	<cfcatch type="any">
		<cfset giftmsg = 'GIFT' />
	</cfcatch>
	</cftry>
</cfif>


<table id="container1" width="900px" cellspacing="0" cellpadding="0" border="0" style="padding:0 10px 0 10px">
    <cfif not print><tr style="width:900px;" align="left">
    <td align="left" valign="top" style="padding:10px;">
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
	<cfif url.couponcode is 'india'>
		<cfset store = 'semiprecious.in' />
        <cfset gif = 'images/headerin.gif' />
	<cfelseif url.couponcode is 'regwsale' or len(session.bulkbuyer.id) or q_ship.couponcode is 'regwsale'>
		<cfset store = 'semipreciouswholesale.com' />
        <cfset gif = 'wholesale-jewellery/images/wholesalesilverjewelrylogo.jpg' />
	<cfelse>
         <cfset gif = 'images/semipreciouslogo.jpg' />
		<cfset store = 'semiprecious.com' />
   	</cfif>
	<cfquery name="track"  datasource="gemssql">
		Select * from cartissues where cartid = #cartid#
	</cfquery>
<div align="left"  style="text-align:left;font-size:24px">
<cfoutput>
<a href="http://#store#"><img src='#gif#' width="309" height="57" border=0></a>
&nbsp;&nbsp;&nbsp;Invoice and Packing Slip
</cfoutput>
</div>

<cfif session.mail is application.admin_email and printable is "">
<cftry>
	     <cfinvoke  component="tm-tm.cfc.task" method="getcartissues" returnvariable="newcartissues">
                  <cfinvokeargument name="cartid" value="#cartid#"/>
          </cfinvoke>

	  <cfif newcartissues.recordcount>
		  <div style="width:900px;height:100px;overflow-y:scroll;border:0px black ridge;padding:2px;">
		  <ul style="margin-left:2px;text-align:left;">
		  <cfoutput query="newcartissues" group="status">
		  <li style="margin-left:2px;" class="issues_#status#" >#Status#</li>
		  <ol style="margin-left:-10px;text-align:left;">
		  <cfoutput>
		  <li style="margin-left:4px;text-align:left;">
		  	For: <a href="/tm-tm/taskdetails.cfm?by=#tby#&doi=#urlencodedformat(tdtoi)#">#action# &rarr;
		    '#detail#' EDC: #dateformat(pdc,'short')#</a>
		    <cfinvoke  component="tm.cfc.task" method="getresponses" returnvariable="viewdetails">
            <cfinvokeargument name="by" value="#tby#"/>
            <cfinvokeargument name="doi" value="#tdtoi#"/>
          </cfinvoke><ul class="arrow_ul">
		<cfloop query="viewdetails" >
		    <li>#addedby#:#detail# </li>
		</cfloop></ul>  </li>
		  </cfoutput></ol>
		  </cfoutput>
		  </ul>
		  </div>
		  </cfif>
  	     <cfinvoke  component="tm-tm.cfc.task" method="getnewcartissues" returnvariable="newcartissues">
            <cfinvokeargument name="cartid" value="#cartid#"/>
          </cfinvoke>
	  <cfif newcartissues.recordcount>
		  <div style="width:900px;height:100px;overflow-y:scroll;border:0px black ridge;padding:2px;">
		  <ul style="margin-left:2px;text-align:left;">
		  <cfoutput query="newcartissues" group="status">
		  <li style="margin-left:2px;" class="issues_#status#" >#Status#</li>
		  <ol style="margin-left:-10px;text-align:left;">
		  <cfoutput>
		  <li style="margin-left:4px;text-align:left;">
		  	For: <a href="/bo/Tasks/addresponse.aspx?tby=#tby#&taskid=#taskid#&status=#status#&action=#action#">#action# &rarr;
		    '#detail#' EDC: #dateformat(pdc,'short')#</a>
		    <cfinvoke  component="tm.cfc.task" method="getnewresponses" returnvariable="viewdetails">
	            <cfinvokeargument name="taskid" value="#taskid#"/>
          </cfinvoke>
		  <ul class="arrow_ul">
		<cfloop query="viewdetails" >
		    <li>#addedby#:#comments# </li>
		</cfloop></ul>  </li>
		  </cfoutput></ol>
		  </cfoutput>
		  </ul>
		  </div>


		  </cfif>
<Cfcatch type="any">
	Not showing Issues because of <cfoutput>#cfcatch.message#</cfoutput> issue in page.
	To remove this message add "Print" to the URL.
</cfcatch>
</cftry>
</cfif>
	</td></tr>
	</cfif>
<tr><td>
<cfif printable eq "">
<table border=0 width=100%>
<tr>	<td style="border:4px orange solid;padding:10px;font-family:helvetica;color:blue;"><cfoutput>
	<cfif track.recordcount gt 0>
		<cfif track.tracking1 neq "" and track.tracking2 eq "">
		<cfoutput><br><b>SHIPPING STATUS:</b> In transit from our India Office to Semiprecious.com Austin dispatch office
		 <a href=http://wwwapps.ups.com/WebTracking/processInputRequest?HTMLVersion=5.0&loc=en_IN&Requester=UPSHome&amp;tracknum=#track.tracking1#&amp;ignore=&amp;track.x=44&track.y=3>Click Here To Track</a></cfoutput><br>
		<cfelseif track.tracking2 neq "">
		<p><b>Track Your Package: </b>
		<cfif track.tracking2 is 'united'>
		 <form action="http://www.unitedcouriers.biz/track.asp" method="post"  name="getTrackNum">

#track.tracking1#
		<input name="afno" type="hidden"  value="#track.tracking1#" >
<input type="submit" value="Click To Track"></form>
			<cfelse>
		<a href="https://tools.usps.com/go/TrackConfirmAction_input?origTrackNum=#track.tracking2#">#track.tracking2#</a>


		</cfif>
		 <cfif session.mail is application.admin_email><a href="itemsell.cfm?movetracking=yes&cartid=#cartid#">Move Tracking</a></cfif>
	</cfif>
<br>
	</cfif>

</cfoutput>
<cfif session.mail is application.admin_email><br />
<cfif isdefined("url.next_cart")><a href="javascript:history.go(-1);">Prev</a> <cfoutput><a href="?cartid=#url.next_cart#">Next Cart&rarr;</a></cfoutput></cfif>
ENTER Tracking- : <cfoutput>Add <a href=/admintools/cartissues.cfm?cartid=#cartid#>Tracking</a>/
				<a href="/tm-tm/newtask.cfm?cartid=#cartid#">Issue</a>
				<a href="/bo/tasks/addtask.aspx?cartid=#cartid#">New Issue</a>

					</cfoutput>
	<cfif track.issue neq "">
	<div align="justify" style="width:800px;;border:1px gray ridge;padding:2px;">Tracking Issue:<font color="red"><cfoutput>#track.issue#</cfoutput></font></div>
	</cfif>
</cfif>

	</td>  </tr>

			<!--- check returns/refunds--->
	  <cfquery datasource="gemssql" name="fetchrefunds">
	  select * from returns where cartid=#cartid#
	  </cfquery>
	  	  <cfif fetchrefunds.recordcount GT 0>
	  	   <tr><td>
		   <font color=brown>The following items
		   <cfif fetchrefunds.refunded is 0>
			  will be
			   <cfelse>
			  have been
			</cfif> refunded: <cfoutput query="fetchrefunds">#itemid#(#optionid#) (-#dollarformat(amount)#) Qty:#qty# (<i>#reason#</i>) </cfoutput>.<br /></font>
		   </td></tr>
	    </cfif>
		<cfif purchaser.comments neq "">	<tr><td><cfoutput query="purchaser"><font color=red><b>Special Instructions<b></font>: #comments#</cfoutput></td></tr></cfif>
<tr><td><cfoutput>Order Items by: <a href="/itemsell.cfm?cartid=#cartid#&orderby=cat">Category</a> ||  <a href="/itemsell.cfm?cartid=#cartid#&orderby=storage">Storage</a>  ||  <a href="/itemsell.cfm?cartid=#cartid#&orderby=newitem">Item ID</a></td><td><a href="/itemsell.cfm?cartid=#cartid#&orderby=storage&zoom=yes">Storage/zoom</a>
<a href="/itemsell.cfm?cartid=#cartid#&orderby=#orderby#&printable=yes&showimage=no">[print]</a></cfoutput></td></tr>
</Table>
</cfif> <!--- printable --->
<p>&nbsp;</p>

</td></tr></cfif>
	   <tr><td>
  <table    width="100%" >
        <tr class="bracelet_txt">
<cfoutput>
      <td colspan="7"> <strong>Cartid</strong>:
<!---<a title="confirm this cart (if paid using pp,auth.net,check)" href="http://www.semiprecious.com/itemsell.cfm?cartid=#cartid#&paymode=#q_ship.paymode#&returntocarts=1">---><b><font color=red>#cartid#</font></b><!---</a>---> |
<strong>Date:</strong> <a href="cartstatus21.cfm" >#dateformat(solditems.datebought,'dd-mmm-yy')#</a><strong> |
	<a href="admintools/print_item_slips.cfm?#CGI.QUERY_STRING#" >PRTLST</a> | Aff: </strong>
	<font color=red><cfif q_ship.couponcode is 'india'><img src="images/goif.gif" alt="india shipping"></cfif>#q_ship.couponcode#</font>; Payment: #q_ship.paymode#, #q_ship.shippingdetails# </cfoutput>
	  <!--- remove <cfif session.mail is application.admin_email or session.mail is "info@silverscorpio1.com"> Assign To: <cfoutput><a href=itemsell.cfm?assignto=harish&cartid=#cartid#>Harish</a> | <a href=itemsell.cfm?assignto=Acemat&cartid=#cartid#>ACEMAT</a> | <a href=itemsell.cfm?assignto=new&cartid=#cartid#>AUSTIN</a> --->| <cfoutput> Status: <font color=red>#q_ship.status#</font>
<cfif isuserinrole("superadmin")>{ <a href="http://www.semiprecious.com/crm/viewmessages.cfm?customerid=28914&email=#q_ship.buyer#" target="crm">#q_ship.buyer#</a>}</cfif></cfoutput>
<cfif q_ship.recordcount >
	<!---<CFIF q_ship.couponcode IS "india" and cgi.SERVER_NAME does not contain '.in' and session.mail neq application.admin_email>
		<CFLOCATION URL="HTTp://www.semiprecious.in/itemsell.cfm?#CGI.QUERY_STRING#" addtoken="no" />
	</CFIF>--->
</cfif>

	</td>
    </tr><cfoutput>
	<cfif isdefined("giftmsg")><tr>
              <td>  <a href="/itemsell.cfm?#CGI.QUERY_STRING#&amp;gift=yes"><img src="/images/gift.gif" align="absmiddle" vspace="0" hspace="0" border="0"   height="24" /></a></td>
              <td colspan="6" style="padding:4px;font:16px;border:black 2px dashed;color:purple;">#giftmsg#</td></tr></cfif></cfoutput>
    <tr  class="grayplacard">
<td>SNo.</td>
      <td width=50> <b>Item Id</b></td>
      <td><cfif showimage is ""><b>Picture</b></cfif></td>
          <td align="center"><b>Qty</b></td>
       <cfif gift is "no">   <td align="center"><b>Price</b></td></cfif>
          <td align="center" ><b>Description</b></td>
          <td align="center" >Packed?</td>
    </tr>
    <Cfset variables.storagelayer = "">
	<cfset totalwt=0>
    <!--- storage layer is a hidden layer that will show the places of storage of the items --->
    <cfoutput QUERY="solditems" group="cat" >
	<!---<tr><td class="rowb" colspan="2" ><i>#lcase(cat)#</i></td><td colspan="4">&nbsp;</td></tr>--->

<tr><TD colspan="7">#CAT#</TD></tr>
<CFOUTPUT>
<cfif weight neq "">
<cfset totalwt=totalwt+weight></cfif>
      <tr >
<td>#currentrow#</td>
        <td>
          <a title="Store Shelf no. #price#" href='/jewelry_item.cfm?itemnumber=#itemid#' ><cfif zoom is 'yes'><font size=+3><cfelse><font color=black></cfif>#itemid#</font></a> <!--- helps admin to see current price on mouseover but does not interfere with prints --->
		  </td>

        <td>


<cfif showimage eq "">
        <cfif session.mail is application.admin_email>
              <a href="/admintools/edititem.cfm?newitem=#itemid#" target="itemselling">
              </cfif>
		  <cfif storage is 'pippin'>
  		      <img src=#thumblink# width=70 border="0" alt="#internalnote#" />
		   <cfelseif storage is 'CMZP' or storage is 'CMPET'>
  		      <img src="/images/#cat#/thumb/#itemid#.jpg" height="70" border="0" alt="#internalnote#" />
		    <cfelse>
		     <img src="/images/#cat#<cfif zoom is ''>/thumb</cfif>/#itemid#.jpg" <cfif zoom is ''>width="70"<cfelse>width=400</cfif> border="0" />
		  </cfif>
	 <cfif session.mail is application.admin_email>  </a>
	 </cfif>
	</cfif>
        </td>
        <td bgcolor="##FFFFFF">
<cfset amnt = 0>
          <cfif quantity gt 1> <font color=red size=+1><b>#quantity#</b></font><cfelse>#quantity#</cfif></td>
        <cfif gift is "no"><td>
<cfif solditems.affiliateid neq 'regwsale' and (not len(session.bulkbuyer.id))>
		<cfif status is 3> <span class="error" >Sale!</span><br>
		<s>#rate_format(price)#</s></cfif>
  </cfif>
  <div class="price" >
  <cfif rate neq "">#rate_format(rate*fraction)#</cfif>
  </div>

  </td>
			</cfif>
        <td>

			<cfif optionid GT 0>
			<cfif cat is "rings">
				<cfset ringsize = 1 />
			</cfif>
			<span class="optionsinline">
			<cfif solditems.cat is "beads">OC - MAKE THIS INTO A NECKLACE OF SIZE: </cfif>
				<cfsavecontent variable="v">
					<cf_optiondetails option="#optionid#"  newitem='#itemid#' />
				</cfsavecontent>
				#listfirst(v)#
			</cfif>
			</span>

<cfif storage is 'Angela'><b>WILL SHIP FROM OHIO</b><br></cfif>
<cfif supplier contains "OC"><b><br>Will Arrive Separately</b><br></cfif>

		<cfif inventoryatsale is -1 >
 			<cfset moo = 1 />
			<cftooltip 			sourcefortooltip="/bo/moo/moosuptrackinglink.cfm?cartid=#cartid#&optionid=#optionid#&itemid=#itemid#">
			<span style="background-color:blue;color:white;width:50px">-MOO-

		  <cfif session.mail is application.admin_email>
			<a style="color:yellow;" href="bo/moo/additemtomoo.cfm?itemid=#itemid#&cartid=#cartid#" target="moo">
					&nbsp;
					#left(makeondemandnote,4)#
				<cfelse>
			<a href="##" style="color:yellow" onclick='javascript:return false;'>
				     <cfif len(makeondemandnote) gt 3>
					#right(left(makeondemandnote,3),3)#
					<cfelse>
					In Queue
					</cfif>
				</cfif>
			</a>
		</span>
		 </cftooltip>
    </cfif>
#subcat2# #grouping# #cat# #left(description,80)# ...
<cfif weight neq "">wt: #decimalformat(weight*0.035274)# oz</cfif>
<cfif inventoryatsale is -1 >
<br><strong><font color=red>THIS ITEM IS MOO</font>: MADE ON ORDER - WILL TAKE 3 to 6 WEEKS TO DELIVER</strong></cfif>
<cfif session.mail is application.admin_email and printable eq "">
	<cfif internalnote neq ""><br><font color=red>#internalnote#</font>
	</cfif>
	<cfif inventory LT 1 and printable eq "">
	<a href="/itemsell.cfm?makemoo=yes&cartid=#cartid#&mooitem=#itemid#">MOO IT!</a> !!
		<a href="/itemsell.cfm?makemoo=no&cartid=#cartid#&mooitem=#itemid#"><b>UN</b>MOO IT!</a>
		</cfif>

<a href="http://www.semiprecious.com/admintools/returns.cfm?optionid=#optionid#&cartid=#cartid#&item=#itemid#&amount=#rate*quantity#&quantity=#quantity#">Refund</a>
		</td>
				   <td  >

										<cfif showimage eq "">
												<form name=#itemid# action="itemsell.cfm"><input type=hidden name=newitem value=#itemid#>
												<input type=hidden name=cartid value=#cartid#><input type=text name="newinv" size=1 value=#inventory#>
												<input type=text name="store" size=16  value="<cfif q_ship.status is 'harish' and inventory lt 0>HARISH<cfelse>#storage#</cfif>"><input type=submit value="."><br />
												<cfif note contains 'IN-'>INDIA<cfelse><cfif zoom is 'yes'><span style="font-size:30">#note#</span><cfelse>#note#</cfif></cfif></form>

										</cfif>
				<cfelse>
			</td><td>

				</cfif>
		</td>
      </tr>
<!---      <cfset Variables.storagelayer = Variables.storagelayer & itemid&"["& inventory&"]" & ":" & storage & " <hr />" > --->
  </CFOUTPUT>
</cfoutput>
  </table>
  </td></tr>
 <tr><td><p>&nbsp;<p>

<table style="display:block;">
<tr class="" ><Td class="price"><b>Total amount:</b>
 <cfif cartid neq "">
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

 	 <cfoutput>
	 <cfif gift is "no">
	  #rate_format(totalamount*fraction)# (not including shipping).
	   </cfif>
	    <strong> No. of Items:</strong> #totalqty#. <strong> Approx. wt:</strong> #decimalformat(totalwt*0.035274+1)# oz  </Td></tr>
	<tr><td><cfif session.mail is application.admin_email><a href="?cartid=#cartid#&amp;print=1">show without address (save paper!)</a>
	</cfif>
<cfif print>
<cfif session.mail is application.admin_email><a href="?cartid=#cartid#&amp;print=0">show with address </a>
	<cfabort />
</cfif>
</cfif>
 </td></tr>

 <cfif  solditems.affiliateid neq 'regwsale'  >
 	<cfif purchaser.state is 'tx' or purchaser.state is 'texas'><tr><td colspan="2">Amount Including Sales Tax: #rate_format(1.0825*totalamount)#</td></tr></cfif>
  <cfif   find('@',solditems.email)>
  <!--- 			<cfinvoke component="invitationandcredit" method="buyer_type" returnvariable="b_type"  >
					<cfinvokeargument name="buyer_email" value="#solditems.email#">
				</cfinvoke>--->
				<cfif 1 is 'retail'>
		<cftry>
	<cfset credit = 0>
      <cf_getcredit email='#solditems.email#'   returnvariable='credit' />
	<cfif q_ship.status neq 'done'><!---- done status comes after shipment is done. There could be refunds before the shipment hence the credit would be added only then --->
		  <cfset credit = credit + 0.2*totalamount /><!--- for now we can show the credit value --->
    </cfif>
		 <cfquery datasource="gemssql"  name="qcr">
           Select 0 as lc
    </cfquery>
 <tr>
   <td><cfif qcr.recordcount>

      <span class="error1">Loyalty Discount: #format(qcr.lc)#.</span>
	  	 <cfelse>
	  <cfquery datasource="gemssql"  name="qcr">
           Select 1 as lc
    </cfquery>
	<cfif qcr.recordcount>

[#decimalformat(qcr.lc)#|#qcr.lastcartid#|CRM]
</cfif>&nbsp;
	 </cfif>
<!---
	   <tr>
	   <td>
	   	<span class="headerfont">
	   	<cfif purchaser.country eq 'france'>Credit Disponible Pour Le Prochain Achat<cfelse>Loyalty Shopping Points After This Shipment</cfif>:
		 #format(credit)# [Login  When Shopping]</span>
		 </td> </tr>
	--->
	   	<cfcatch type="expression">
	   	<cfoutput>.<font color="white">#cfcatch.Detail# #cfcatch.Message#[#credit#]</font>.</cfoutput>
	  	 </cfcatch></cftry>
		</cfif>
   </cfif>
	   	 </cfif>
		 </cfoutput>
	   </td>
	   </tr>

 <tr><td><cfif purchaser.country eq 'france' >Merci Pour Faire Des Emplettes Avec <cfoutput>#store#</cfoutput><cfelse>Thank you for shopping with <cfoutput>#store#</cfoutput>.</cfif>
 |</td></tr>

	</table>
    </td></tr><tr><td>
      <hr color="blue" />
		<cfoutput>Note to Shippers: Shipping: <b>[#listfirst(q_ship.shippingdetails,"|")#]</b> <cfif  find('@',solditems.email)>
		<a href='dlaymail.cfm?buyer=#solditems.email#&amp;cartid=#cartid#'>-</a>
		</cfif>
</cfoutput>
<cftry>
<cfquery datasource="gemssql" name="giftq" >
	select note from giftmsg where cartid = #cartid#
</cfquery>

<cfoutput query="giftq">#note#</cfoutput>
<cfcatch type="any">
	GM:
</cfcatch>
</cftry><br>

	    <cfif purchaser.address1 eq "" and purchaser.address2 eq "" >
      <p align="left">Ship To: <cfif session.mail is application.admin_email><cfoutput>(<a href="admintools/invoiceaddress.cfm?cartid=#cartid#">edit</a></cfoutput>)
	  </cfif><br>
        <textarea cols="30" rows="6" name="Address" id="Address"></textarea>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </P>
	  <cfelse>
	  <table><tr><td width=800>
    <div  style="width:400px;border:1px green solid">
		Shipping Address: <cfif session.mail is application.admin_email or isuserinrole('guestadmin')>
		(<cfoutput><a href="admintools/invoiceaddress.cfm?cartid=#cartid#">edit</a></cfoutput>)
	<cfoutput query="purchaser">
    	<br><br><br>
	  <cfif (email contains "@")>
		  <cftry>
		  <a href='/crm/viewmessages.cfm?email=#right(email,len(email) - findnocase("/",email))#'>Send Email to Customer</a>
		<cfcatch type="any"></cfcatch></cftry></cfif><br>
<span style="margin-left:20px;display:block;text-transform:capitalize;">
     <font size="+1"> #firstname#<br>
      <cfif len(address1) gt 2>#address1#<br></cfif><cfif len(address2) gt 2>#address2#<br></cfif>
      #city#  #STATE# &nbsp;#zip#<br>
      #COUNTRY#</font><br>
      Cartid/Billing Email:<strong>#email#</strong><br>
	  Billing Phone: <strong>#phonenumber#</strong></span></cfoutput><cfelse>Not Shown </cfif> </div>
Billing City-ZIP - <cfoutput>#purchaser.billingstate#</cfoutput>
     </td>
	 <td align=left width="540px" style="border:1px blue solid;"><b>Return Label</b> (Include reason/requests to customize):<br>
<font size="+2">
<cfif url.couponcode is 'india'>
	Semiprecious.in<br />
	B 16, Ist Floor,<br />
	ARD Complex,<br />
	RK Puram, Sec 13<br />
	New Delhi - 22
	<cfelse>
SP Returns <br />
706B W. Ben White Blvd<br>
Suite 210B<br />
Austin, TX 78704<br />
</cfif></font></td></tr></table>

      <div  cols="100" ROWS="5" NAME="promo" id="promo">
	  Please check out other great products from us:
	  <a class="side_link" href="http://www.handmadeLaptopcase.com">Trend Setting Handmade Laptop Bags</a> (www.handmadelaptopcase.com)
	  	  </div>
    <cfoutput><br>Shipping Code:#q_ship.shippingdetails#.</cfoutput>
  </cfif>
  <br>
	<cfif printable neq ""><cfabort></cfif>
             <cfif session.mail is application.admin_email>
  <cfif cartid neq "">
     <cfif updateinventory neq "rev">
	    	<cfif archived is "no">
		      <cfquery datasource="gemssql" name="exactcart" >
		      select indate from cartstatus where cartid = #cartid#
		      </cfquery>
			<cfelse>
			 <cfquery datasource="gemssql" name="exactcart" >
		      select indate from cartstatus_archive where cartid = #cartid#
		      </cfquery>
			</cfif>
		   <cfset odbcindate=now()>
		  <cfif exactcart.RecordCount>
		  <cfset odbcindate = createodbcdatetime(exactcart.indate)>
      <!--- 	<cfoutput>#odbcindate# for #cartid#</cfoutput> --->

                 	<cfif len(url.paymode) GT 1>
		        ...<cfinvoke  component="cartcontrol.cartmonitor" method="updatecart" returnvariable="updateresult">
		          <cfinvokeargument name="cartid" value="#url.cartid#"/>
		          <cfinvokeargument name="mode" value="#url.paymode#"/>
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
		        </cfinvoke>

		        <cfif updateresult>
		          	<cfset cartid = form.cartid>


			    <p align="left">Ship To:<br>
			      <textarea cols="30" rows="6" name="Address" id="Address"></textarea>
			      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  </cfif>
  <p align="left">========================================================
	  an alternative to two queries done above
	  <cfquery datasource="gemssql" name="lessinv">
	  select newitem , cat from items , buyingrecord where (items.inventory < 1 and items.newitem = buyingrecord.itemid*1 and buyingrecord.cartid = #cartid# and datebought = #odbcindate#)
	  </cfquery>
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
	<cfoutput>  <a href=itemsell.cfm?cartid=#cartid#&amp;statustonew=1>Make New</a>
		  <p align="left">Click here to <a class="error1" href="itemsell.cfm?odbcindate=#urlencodedformat(odbcindate)#&cartid=#cartid#&updateinventory=rev">Reverse
          inventory & cart status</a> <!--updates. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/admintools/cancelorder.cfm?cancelcartid=#cartid#">
          <img src="/admintools/images/cancel.jpg" border=0></a> -->
		  </cfoutput>

    </cfif>
    <cfquery datasource="gemssql" name="exact">
    select itemid,rate from buyingrecord where datebought = #odbcindate# and cartid
    = #cartid# and quantity>0
    </cfquery>
    </cfif>
   </cfif>
  </cfif>
  </cfif><br></td></tr><tr><td>
  	<cfif pay neq "">
	</td></tr></table>
	<cfabort >
	</cfif>
	<cfif cartid neq "">
   <cfif session.mail eq application.admin_email> <span class="form_heading">Or Fill form below to process another cartid:</span>
  <cfform action='itemsell.cfm' method="post">
    </td></tr><tr><td><table width="88%" border="1">
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
        <td >
			<select VALUE="1" name="paymode" >
            <option ></option>
            <option value="chck">Check/MO</option>
            <option value="AuthPhone">Authorize.net on Phone</option>
            <option value="AuthCC">Authorize.net</option>
			    <option value="CCAv">CCavenue</option>
				<option value="arb">Auth ARB</option>
            <option value="p">Pay Pal</option>
	 <option value="goo">Google</option>

          </select>
          Imp: <span class="error1"> ( This will update inventory also. So if
          you want to update only status and not the inventory then use the link
          on cartstatus21.cfm. cart status updated only if this provided. </span></td>
      </tr>


      <tr>
        <td>Shipping Details (date, parcel, courier etc.):</td>
        <td><input type="text" name="shipping" value="optional">
		<input name="submit" type='submit' value='Submit Updates' class="greenbutton"></td>
      </tr>
    </table>
  </cfform> </cfif>
  <cfelse></td></tr><tr><td>
  <cfif session.mail eq application.admin_email>
  <cfparam default="cartid" name="url.cartidfromcartlist">
  <cfform action='itemsell.cfm' method="post">
    <table width="88%" border="1">
      <tr>
        <td>Please enter cart id:</td>
        <td><cfoutput>
            <input type="text" value="#url.cartidfromcartlist#" name="cartid">
            <span class="error1">Inventory for chck,pp, auth.net status
            carts is already updated</span></cfoutput></td>
      </tr>
	  <tr><td>Address:</td> 0<textarea cols="30" rows="5" name="Address" id="Address">
	  </textarea></tr>
      <tr>
        <td>Shipping Details (date, parcel, courier etc.):</td>
        <td><input type="text" name="shipping" value="optional"> <input name="submit" type='submit' value='see cart'></td>
      </tr>
    </table>
  </cfform><cfquery datasource="gemssql" name="confirmed">
   select count(cartid) as t from cartstatus where paymode = 'pp' or paymode = 'auth.net' or paymode ='authphone' or paymode = 'chck' or paymode='Goog'
   </cfquery>
   <cfoutput>#confirmed.t# Carts Pending</cfoutput>
    <!--- info put inline <div id="storagelayer" style="z-index:2;position:absolute;top:80px;left:200px;visibility:hidden;width:100px;border:1px brown dashed;background-color:yellow;">
    Where Stored & Inventory AFTER this shipment:<br>
    <cfoutput>#storagelayer# . </cfoutput></div> --->

<a href="http://www.semiprecious.com/admin.cfm?passcode=shaurya">back to admin
page</a>&nbsp;&brvbar;&Auml; <a href="cartstatus21.cfm">View Carts</a>

<cfif isdefined("url.returntocarts") and len(url.paymode)>
<cflocation addtoken="no" url="cartstatus21.cfm" /></cfif>
  </cfif>
</cfif>


        <cfinclude template="/mainfooter.cfm">
      </td>
    </tr>
  </table>
    </cfif><!--- url.paymode is one of pp, goo etc. --->
</cfif><!--- cartid not given --->

<cfif solditems.recordcount>
<script language="javascript">
<cfoutput>
	document.getElementById('shippingnote').innerHTML =   "<b>Shipment Note</b>: <cfif MOO>	Since you have a MOO (Make On Order) design, shipment from  our Austin office is scheduled for  #dateformat(dateadd('d',22,solditems.datebought),'dd-mmm-yy')#
	<cfelseif ringsize>	Since you have ordered a ring with a specific size your order is likely to ship from  our Austin office on #dateformat(dateadd('d',8,solditems.datebought),'dd-mmm-yy')#
	<cfelse>The order is expected to ship from our Austin office on #dateformat(dateadd('d',6,solditems.datebought),'dd-mmm-yy')#
	</cfif></cfoutput>";
</script>
</cfif>
</body>
</html>
<cfcatch type="any">
<h2> This is information for the Development Team. </h2>
<cfdump var="#cfcatch#" />

</cfcatch>
</cftry>