<cfparam name="optionid" default="0">
 <CFPARAM name="cartid" default="-">
<CFPARAM name="categ" default="">
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

</cfswitch>

<CFPARAM name=updateinventory default="no">
<cfif cartid neq "-">
  <CFQUERY DATASOURCE="semiprecious" NAME="solditems">
  SELECT  email, itemid, CAT, buyingrecord.optionid, quantity, status, price, saleprice, wholesaleprice, datebought, storage, 
  affiliateID, description,inventory FROM buyingrecord, items where items.newitem=buyingrecord.itemid*1 
  and quantity>0     and cartid=#cartid# 
  order by datebought desc, cat ,newitem
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
<cfinvokeargument name="cartid" value="#cart_id#">
</cfinvoke>
 
  <h3>
    <script >alert("INVENTORY REVERSED! ");</script>
  </h3>
  <cfelse>
    <script >alert("INVENTORY NOT REVERSED BECAUSE THE CART WAS  'EITHER NEW OR EXPIRED'!");</script>
  
  </cfif>
</cfif>
<CFQUERY DATASOURCE="semiprecious" NAME="purchaser">
Select firstname, address1,city,state,zip,country,email from purchase where email='#cartid#'  or cartid = '#cartid#'
</cfquery>
<head>
<title>Items Bill: The Jewelry Store</title>
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
<style type="text/css" media="screen">
<!--
.table_row_ {
   background-color:white;
   }
.table_row_over {
 background-color:#DADAAA;
}
-->
</style>
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
<cfif cartid neq "-">
  <cfif  url.couponcode eq 'young'>
    <cfinclude template="youngheader.cfm">
    <cfelseif url.couponcode eq 'jandj'>
    <cfinclude template="jandjheader.cfm">
    <cfelseif url.couponcode eq 'jng'>
    <cfinclude template="jngheader.cfm">
    <cfelse>
    <Table cellpadding='0' cellspacing='0' bgcolor='white' width='750' align=left border=0>
      <tr bgcolor="#CCCCCC" > 
        <td align='left' bgcolor='white' height=100>&nbsp;</td>
      </tr>
    </Table>
    <br>
    <left> 
    <p>&nbsp;</p>
  </cfif>
  <p>&nbsp;</p>
  <span style="display:block;margin-left:2px;width:600px;background-color:#666600;font-color:white;color:white;font:Helvetica;text-decoration:underline;font-weight:bold;">Invoice/Packing 
  Slip</span> <left>
  <table border="1" bordercolor="#666666">
    <tr>
      <td> <strong>ORDER ID (cartid)</strong>:<cfoutput>#cartid#</cfoutput> <strong>| Date and Time Purchased:</strong><cfoutput>#solditems.datebought#, <font color=red>#solditems.affiliateID#</font></cfoutput> </td>
    </tr>
  </table>
  <table width=680>
    <tr bgcolor="#CCCC99" onMouseOver=this.className='table_row_over'; onMouseOut=this.className='table_row_'; > 
      <td> <b>ID</b></td>
      <td><b>Picture</b></td>
      <td><b>Qty</b></td>
      <td><b>Price</b></td>
      <td><b>Description</b></td>
      <td></td>
    </tr>
    <Cfset variables.storagelayer = "">
    <!--- storage layer is a hidden layer that will show the places of storage of the items --->
    <cfoutput QUERY="solditems"> 
      <tr onMouseOver=this.className='table_row_over'; onMouseOut=this.className='table_row_'; > 
        <td> 
          <a href='detail.cfm?itemnumber=#itemid#'>#itemid#</a> <cfif cartid eq "-">
            #email#</cfif></td>
        <td> <CFIF #CAT# IS "SETS">
            <CFSET categ = "necklaces">
            <CFELSE>
            <CFSET categ = cat>
          </CFIF> <a href="edititem.cfm?newitem=#itemid#" target="itemsellimg"><img src=images/#categ#/thumb/#itemid#.jpg width=50 border="0"></a> 
        </td>
        <td bgcolor="##FFFFFF"> <font <cfif quantity gt 1> color="red"</cfif>>#quantity#</font></td>
        <td> <font size="+1"> <cfif solditems.affiliateid eq 'regwsale'>
            <cfif wholesaleprice neq "" and wholesaleprice neq 0.0 >
              #dollarformat(wholesaleprice)# 
              <cfelse>
              #dollarformat(0.5*price)# 
            </cfif>
            <cfelseif status EQ 3>
            Sale:#dollarformat(saleprice)# 
            <cfelse>
            #dollarformat(price)# </cfif></td>
        <td> <cfif optionid>
            <a href="detail.cfm?itemnumber=#itemid#" style="border:1px red groove;">[option 
            : #optionid#]</a></cfif> #description# </font></td>
        <td><a href='edititem.cfm?newitem=#itemid#' onMouseOver="MM_showHideLayers('storagelayer','','show')" onMouseOut="MM_showHideLayers('storagelayer','','hide')" >.<font color=white>set</font>.</a></td>
      </tr>
      <cfset Variables.storagelayer = Variables.storagelayer & itemid&"["& inventory&"]" & ":" & storage & " <hr />" >
    </cfoutput> 
  </table>
  <br>
  <b> Total amount (not including shipping):</b>$ 
  <cfif cartid neq "-">
    <Cfquery datasource="semiprecious" name="q_ship">
    Select shippingdetails, tps from cartstatus where cartid = #cartid# 
    </Cfquery>
    <cfset totalamount=0>
    <cfoutput query="solditems"> 
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
    </cfoutput> <cfoutput>#totalamount#</cfoutput> <br>
    Note: The item prices and final amount shown may be different from ones paid 
    at the point of purchase <br>
    because of subsequent price revisions and special discounts used. <strong>The 
    differences can be safely ignored</strong>.<br>

    <span  style="width:400px;border-bottom:2px brown dashed;display:block;"> <strong>Name</strong>& <strong>Mailing Address<hr />
      </strong> <cfoutput query="purchaser"> #firstname#<br>
      #address1#<br>
      #city#, #STATE#,#zip#<br>
      #COUNTRY# <br>
      (Cartid/Email:#email#) </cfoutput> </span>
    <p>========================================= 
    <cfif #purchaser.firstname# eq "">
      <p align="left">======================================== 
      <p align="left">Ship To:<br>
        <textarea cols="30" rows="6" name="Address" id="Address"></textarea>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      </P>
    </cfif>
    <p> 
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <br>
    <br>
    <br>
    <cfoutput> Shipping Code:#q_ship.shippingdetails#.</cfoutput> 
  </cfif>
  <br>
  <cfif #purchaser.firstname# eq "">
    <p align="left">======================================== 
    <p align="left">Ship To:<br>
      <textarea cols="30" rows="6" name="Address" id="Address"></textarea>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  </cfif>
  <p align="left">======================================================== 
  <cfif cartid neq "-">
    <cfif updateinventory neq "rev">
      <cfquery datasource="semiprecious" name="exactcart" >
      select indate from cartstatus where cartid = #cartid# 
      </cfquery>
      <cfset odbcindate = createodbcdatetime(exactcart.indate)>
      <!--- 	<cfoutput>#odbcindate# for #cartid#</cfoutput> --->
      <cfif len(url.paymode) GT 1>
        <cfinvoke  component="cartcontrol.cartmonitor" method="updatecart" returnvariable="updateresult">
          <cfinvokeargument name="cartid" value="#url.cartid#"/>
          <cfinvokeargument name="mode" value="#url.paymode#"/>
          <cfinvokeargument name="indate" value="#odbcindate#"/>
        </cfinvoke>
        <cfquery datasource="semiprecious">
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
<cfinvokeargument name="cartid" value="#cart_id#">
</cfinvoke>

          <br>
          ++++++++++++++++++++++++++++++++++++++++++++++ <br>
          <br>
          <br>
          <br>
          <!--- 
	  an alternative to two queries done above
	  <cfquery datasource="semiprecious" name="lessinv">
	  select newitem , cat from items , buyingrecord where (items.inventory < 1 and items.newitem = buyingrecord.itemid*1 and buyingrecord.cartid = #cartid# and datebought = #odbcindate#)
	  </cfquery> --->
          <br>
          Inventory Updated ... <cfoutput>^#form.paymode#^</cfoutput> 
          <cfset inventupdate = 1>
          <cfquery datasource="semiprecious">
          update visitrecord set cartid = -1*cartid where cartid = #cartid# 
          </cfquery>
          <cfset refdate = dateadd('d',-6,Now())>
          <cfquery datasource="semiprecious" name="s">
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
    <cfquery datasource="semiprecious" name="exact">
    select itemid from buyingrecord where datebought = #odbcindate# and cartid 
    = #cartid# and quantity>0 
    </cfquery>
    <cfif exact.recordcount>
      <br>
      <br>
      Reorder Candidates: (if any is negative then you may not be able to fulfil 
      even the current order )<br>
      <Cfoutput query="exact"> 
        <cfquery datasource="semiprecious" name="invalert">
        select cat , inventory from items where ( inventory < 1 and newitem = 
        #itemid#) 
        </cfquery>
        <cfif invalert.recordcount>
          #itemid# ([#invalert.inventory#]#invalert.cat# ) &nbsp; &nbsp; <br>
        </cfif>
      </Cfoutput> 
      <cfelse>
      Cart not found ! 
    </cfif>
  </cfif>
  <br>
  <span class="title">Or Fill form below to process another cartid:</span> 
  <cfform action='itemsell.cfm' method="post">
    <table width="88%" border="1">
      <tr> 
        <td>Please enter cart id:</td>
        <td><cfoutput> 
            <input type="text" value="#cartid#" name="cartid">
            <span class="error1">( Inventory for pp, auth.net,chck and 2co status 
            carts is already updated.)</span></cfoutput></td></td>
      </tr>
      <tr> 
        <td>Payment Mode : </td>
        <td > <select value="1" name="paymode" >
            <option ></option>
            <option value="secure2"  >Secure 2 Checkout</option>
            <option value="check">Check</option>
            <option value="others">Others</option>
            <option value="wellsPhone">Phone + Authorize.net</option>
            <option value="wellsCC">Authorize.net CC</option>
            <option value="paypal">Pay Pal</option>
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
  <cfelse>
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
      <tr> 
        <td>Payment Mode : </td>
        <td > <select value="1" name="paymode" required="yes" message="Pse specify payment mode.">
            <option ></option>
            <option value="secure2" >Secure 2 Checkout</option>
            <option value="check">Check</option>
            <option value="others">Others</option>
            <option value="wellsPhone">Phone + Authorize.net</option>
            <option value="wellsCC">Authorize.net CC</option>
            <option value="paypal">Pay Pal</option>
          </select>
          Imp: <span class="error1"> ( This will update inventory also. So if 
          you want to update only status and not the inventory then use the link 
          on cartstatus21.cfm. cart status updated only if this provided. )</span></td>
      </tr>
      <tr> 
        <td>Shipping Details (date, parcel, courier etc.):</td>
        <td><input type="text" name="shipping" value="optional"> <input name="submit" type='submit' value='see cart'></td>
      </tr>
    </table>
  </cfform>
</cfif>
<cfquery datasource="semiprecious" name="confirmed">
   select count(cartid) as t from cartstatus where paymode = 'pp' or paymode = 'auth.net' or paymode = '2co' or paymode = 'chck'
   </cfquery>
   <cfoutput>#confirmed.t# Carts Pending</cfoutput>
     <div id="storagelayer" style="z-index:2;position:absolute;top:80px;left:200px;visibility:hidden;width:100px;border:1px brown dashed;background-color:yellow;"> 
    Where Stored & Inventory AFTER this shipment:<br>
    <cfoutput>#storagelayer# . </cfoutput></div>

<a href="http://www.semiprecious.com/admin.cfm?passcode=shaurya">back to admin 
page</a>&nbsp;&brvbar;&Auml; <a href="cartstatus21.cfm">View Carts</a>
</body>
</html>
