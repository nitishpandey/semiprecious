<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFPARAM NAME="nonUSA" DEFAULT="">
<CFPARAM NAME="texas" DEFAULT="0">
<CFPARAM NAME="shipping" DEFAULT="125">
<cfinclude template='setup.cfm' />
<CFPARAM NAME="description" DEFAULT="">
<cfparam name="form.optionid" default="0">
<cfset handlingcharges = 125.00>
<!--- also set in confirmation page --->
<cfparam default="100" name="invent">
<cfparam default="0" name="valueadd" />
<CFPARAM NAME="Price" DEFAULT= "0">
<CFPARAM NAME="category" DEFAULT= "">
<cfparam name="form.set" default="0">
<cfparam name="form.style" default="0">
<CFPARAM NAME="newitem" DEFAULT= "">
<CFPARAM NAME="cart" DEFAULT= "">
<cfparam name="volumediscount" default="1" />
<CFPARAM NAME="bought" DEFAULT="">
<CFPARAM NAME="quantity" DEFAULT="1" type="numeric" >
<CFPARAM NAME="j" DEFAULT=0>
<CFPARAM NAME="newQty" DEFAULT="">
<CFPARAM NAME="TotalQty" DEFAULT=0>
<cfparam name="session.gallery" default="list">
<cfset testing = 0>
<!---<cfset session.mail="test32@aol.com">--->


<cfset saletotal = 0>
<!--- this has to be set then why use cfparam? this is aboviouslfy faster --->
<CFIF  newQty is 0 and optionid eq arraylen(session.cartitem) and newitem LTE optionid>
		<cfquery datasource="gemssql" name="updatecart">
                 delete from buyingrecord where itemid = '#session.cartitem[newitem][1]#' and cartid = '#session.cartid#' and optionid = '#session.cartitem[newitem][5]#'
            </cfquery>
  <cfif optionid is 1>
	   <cfset session.cartitem[1][1] = 0 />
		<cfset session.cartid = 0 >
  <cfelse>
  		<cfset oms = arrayDeleteAt(session.cartitem,newitem) />
	  </cfif>
</CFIF>

<!---<CFSET session.cartitems = listDeleteAt(session.cartitems,delAt)>--->
<!--- one less than actual qty --->
<!--- dont do the logics done below on cartid because that is always set to 1 on application.cfm page for
reasons of not knowing where all it may be required. it could not be removed after uniquecartid was introduced
--->

<!---  setting to repeat  does not in anyway hamper 
the processing of the order by the customer, the trusted 3rd party or you the vendor.
it only tells that the carts were not abandoned from the confirmation page   --->
<!--- to go to confirmation page one has to in each and every case of ecentric shopping
come through cart.cfm  and there this variable will be set to 0  . thus refresh of confirmation  page or
return to confirm page from a paypal's first page will not cause cartid to be incremented --->

<!--- <CFQUERY DATASOURCE="semiprecious" NAME="getcredit1">
SELECT earned, newearned FROM memberinfo WHERE email='#session.mail#' 
</CFQUERY> --->

 <!--- Check if current cart is paid, or if current cart has a different email attached to it. --->
   <cfif  len(session.mail)  > 
     <cfquery datasource="gemssql" name="currentcart">
        SELECT cartid, email FROM buyingrecord
        WHERE cartid = '#session.cartid#'
        AND email = '#session.mail#'
        
      </cfquery>
      <cfif not currentcart.recordcount and  session.cartitem[1][1] >
        <!--- email doesn't match stored email.  We'll delete this session cart and start a new one. --->
	        <cfinvoke component="cartcontrol.cartmonitor" method="new_cartid" />
            
          
      </cfif>
   
   </cfif>
   
   


<!--- End pull from db update --->
<!--- update cart if they clicked on something to buy --->
<cfif bought is "buy" and newitem neq "">
  <!--- nothing in cart currently, so added item that was clicked --->
    <!--- See if item clicked is already in cart --->
    <cfinvoke method="additem" attributecollection="#form#" component="cartcontrol.cartmonitor" returnvariable="added"  />
</cfif>
<!--- if the cart is not empty, confirm that there's a cartid and update db --->
  <!--- if there is no cartid, create one --->
  <!--- End no cartid --->
  <cfif session.cartitem[1][1] >
	<cfif not session.cartid><!--- this situation happens when a person comes back from confirmation page . this logic could be put in the application.cfm but then it would run for refresh of confirmation page also. that we do not want --->
	     <cfinvoke component="cartcontrol.cartmonitor" method="new_cartid" />
 	</cfif>
  </cfif>

<!--- end cart not empty check --->
<cfset addressset = 0>
  <cfif len(session.mail)>
  <cfset addressset = 1>
<cfset purchaserinfo = session.address>
<cfset purchaserinfo.phone = '111test'>

        <cfquery datasource="gemssql" name="urchaserinfo">
            SELECT firstname, lastname, email, address1, address2,state,country, phonenumber,city, zip FROM memberinfo 
            WHERE email='#session.mail#' 
            </cfquery>
<cfset purchaserinfo.firstname = urchaserinfo.firstname & " " & urchaserinfo.lastname />
  <cfelse>
 
<!---    <cfquery datasource="gemssql" name="purchaserinfo">
   SELECT firstname, lastname, address1, address2, city, state, country, zip FROM bulkbuyers
  WHERE email = '#session.bulkbuyer.id#'
</cfquery>
    <cfset addressset = 1>
--->  
</cfif> 
<html>
<HEAD>
<TITLE>Jewelry Items selected on Semiprecious.com</TITLE>
<link rel="shortcut icon" href="/favicon.ico" />
<!---<script language="JavaScript" type="text/javascript" src="/CFIDE/scripts/cfform.js"></script>
--->
  <script type="text/javascript" src="/js/mm_menu.js"></script>
    <script type="text/javascript" src="newtopmenu.files/dmenu.js"></script>
    <!-- (c) 2009, by Deluxe-Menu.com -->

<script LANGUAGE=JAVASCRIPT>
<!--
function format(expr, decplaces){
var str="" + Math.round (eval(expr) * Math.pow(10,decplaces));
while(str.length <=decplaces){
str= "0" + str}
var decpoint= str.length - decplaces
return str.substring(0,decpoint) + "." + str.substring(decpoint,str.length);
}
var popUpWin=0;
function popUpWindow(URLStr, left, top, width, height)
{
  if(popUpWin)
  {
    if(!popUpWin.closed) popUpWin.close();
  }
  popUpWin = open(URLStr, 'popUpWin', 'toolbar=no,location=no,directories=no,status=no,menub ar=no,scrollbar=no,resizable=no,copyhistory=yes,width='+width+',height='+height+',left='+left+', top='+top+',screenX='+left+',screenY='+top+'');
}
var texas = 1;
<cfif session.bulkbuyer.id NEQ "">
texas = 1 ;
</cfif>
function texaschecked() {
texas = 1;
return ;
}
function copy_ship(frm) {

}
function validate(frm){
	return true; 
	var aName = Array();
	aName['account_id'] = 'Account ID';
	aName['reference_no'] = 'Reference No';
	aName['amount'] = 'Amount';
	aName['description'] = 'Description';
	aName['name'] = 'Billing Name';
	aName['address'] = 'Billing Address';
	aName['city'] = 'Billing City';
	aName['state'] = 'Billing State';
	aName['postal_code'] = 'Billing Postal Code';
	aName['country'] = 'Billing Country';
	aName['email'] = 'Billing Email';
	aName['phone'] = 'Billing Phone Number';
	aName['ship_name']='Shipping Name';
	aName['ship_address']='Shipping Address';
	aName['ship_city']='Shipping City';
	aName['ship_state']='Shipping State';
	aName['ship_postal_code']='Shipping Postal code';
	aName['ship_country']='Shipping Country';
	aName['ship_phone']='Shipping Phone';
	aName['return_url']='Return URL';
	aName['giftmsg']='Return URL';
	

	for(var i = 0; i < frm.elements.length ; i++){
		if((frm.elements[i].value.length == 0)||(frm.elements[i].value=="Select Country")){
						if((frm.elements[i].name=='country')||(frm.elements[i].name=="ship_country"))
					alert("Select the " + aName[frm.elements[i].name]);
					else
					  {
					 if ((frm.elements[i].name !='couponcode') && (frm.elements[i].name !='giftmsg')) {
					alert("Enter the " + aName[frm.elements[i].name]);
					frm.elements[i].focus();
					return false;
					}
					}
			}
			if(frm.elements[i].name=='account_id'){
			
			if(!validateNumeric(frm.elements[i].value)){
					alert("Account Id must be NUMERIC");
			frm.elements[i].focus();
			return false;
			}
			}
			
			if(frm.elements[i].name=='amount'){
			if(!validateNumeric(frm.elements[i].value)){
					alert("Amount should be NUMERIC");
			frm.elements[i].focus();
			return false;
			}
			}
			if((frm.elements[i].name=='postal_code')||(frm.elements[i].name == 'ship_postal_code'))
			{
			if(!validateNumeric(frm.elements[i].value)){
					alert("Postal code should be NUMERIC");
			frm.elements[i].focus();
			return false;
			}
			}	
			
			if((frm.elements[i].name=='phone')||(frm.elements[i].name =='ship_phone')){
			if(!validateNumeric(frm.elements[i].value)){
					alert("Enter a Valid CONTACT NUMBER");
			frm.elements[i].focus();
			return false;
			}
			}		
    	
    
	
		if((frm.elements[i].name == 'name')||(frm.elements[i].name == 'ship_name'))
		{
		
		if(validateNumeric(frm.elements[i].value)){
					alert("Enter your Name");
			frm.elements[i].focus();
			return false;
			}
		}
		
				
		if(frm.elements[i].name=='ship_postal_code'){
			if(!validateNumeric(frm.elements[i].value)){
					alert("Postal code should be NUMERIC");
			frm.elements[i].focus();
			return false;
			}
			}		
    
			
							
		if(frm.elements[i].name == 'email'){
				if(!validateEmail(frm.elements[i].value)){
					alert("Invalid input for " + aName[frm.elements[i].name]);
					frm.elements[i].focus();
					return false;
				}		
			}
			
	}  
	return true;
}

	function validateNumeric(numValue){
		if (!numValue.toString().match(/^[-]?\d*\.?\d*$/)) 
				return false;
		return true;		
	}

function validateEmail(email) {
    //Validating the email field
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	//"
    if (! email.match(re)) {
        return (false);
    }
    return(true);
}


Array.prototype.inArray = function (value)
// Returns true if the passed value is found in the
// array.  Returns false if it is not.
{
    var i;
    for (i=0; i < this.length; i++) {
        // Matches identical (===), not just similar (==).
        if (this[i] === value) {
            return true;
        }
    }
    return false;
};


function goProcess(inString){

/****************************************Start of form validation***********************************************/
// Author		:	Arun
// Created By	:	AGC India
// Created Date	:	20-Jul-2009
// Copyright	:	Semiprecious.com
/**************************************************************************************************************/
/****************End of form validation***********************************************/

	texas = 1;
	if(inString=='Proceed to Checkout'){
	
self.document.cartform.action="indiaconfirmation.cfm";
   if (validate(self.document.cartform)){
	self.document.cartform.submit();
	return;
	}
	return false;
	}
	if(inString=='Save Cart'){
self.document.cartform.action="indiaconfirmation.cfm?save=1";
	self.document.cartform.submit();
	return;
	}
	if(inString=='Buy More'){
<cfif session.gallery is 'listcluster' and newitem neq ''>
	<cfoutput>self.document.cartform.action='jewelry_item.cfm?newitem=#newitem#';</cfoutput>
<cfelse>
	<cfoutput>self.document.cartform.action='gemstone_jewelry_gallery.cfm?#urldecode(session.filter)#';</cfoutput>
</cfif>
	self.document.cartform.submit();
	return;
	}
	if(inString=='indianfranchisee'){
self.document.cartform.action="indianfranchisee.cfm";
	self.document.cartform.submit();
	return;
	}
		
		}
function grandtotal(form)
	{
	var stotal = 0;
	var totalQnty = 0;
	var maxj = form.j.value;
	var gtotal = 0;
	var currencyexchange = 30;

for (var k=1 ; k <= maxj; k++) {
var pr =eval("form" + ".price" + k + ".value");
var Qnty =eval("form" + ".quantity" + k + ".value");
totalQnty = totalQnty*1 + Qnty*1;
stotal = (pr*Qnty + stotal*1);
}
// alert(0);


if (totalQnty == 0) {
form.shipping.value =  125
}
if (totalQnty == 1) {
form.shipping.value =  125
}
if (totalQnty ==2) {
form.shipping.value = 125
}
if (totalQnty > 2) {
form.shipping.value = 125}

if (stotal > 5000) {
form.shipping.value =  0.00}

gtotal = form.shipping.value/currencyexchange + stotal;
form.discount.value=0;

//stotal= stotal*(1-(form.discount.value/100) ) - form.loyaltycredit.value;
form.subTotal.value=format(stotal,2);
//alert(form.shipping.value*1);
//alert(form.SpecialHandling.value*1);
//alert( form.GiftWrap.value*1);
//alert(form.nonUS.value*1);

gtotal = form.shipping.value/currencyexchange + stotal*1 + form.SpecialHandling.value*1 + form.GiftWrap.value*1;

//alert(gtotal);
//
//if (form.texas.checked)
//	{
//	gtotal = gtotal  + form.texas.value*1;
//}


form.GrandTotal.value=format(gtotal,2);
//alert(gtotal);
//alert(form.shipping.value)
if (totalQnty < 2)
{
form.discount.value = 0
};

}

/*
function credit(form)
{ if (form.tcredit.value*1 > 0)
	{

	form.subTotal.value=form.subTotal.value*1;
	form.tcredit.value=form.tcredit.value*1;

	if(form.subTotal.value*1 >= form.tcredit.value*1){
	form.subTotal.value = form.subTotal.value*1 - form.tcredit.value*1;
	form.rcredit.value = form.tcredit.value;
	form.tcredit.value=format(0,2);
	form.subTotal.value=format(form.subTotal.value,2);
	}
	if(form.subTotal.value*1 < form.tcredit.value*1){
	form.tcredit.value= form.tcredit.value*1 - form.subTotal.value*1;
	form.rcredit.value= form.subTotal.value;
	form.subTotal.value=format(0,2);
	form.tcredit.value=format(form.tcredit.value,2);
	form.rcredit.value=format(form.rcredit.value,2);
	}
	if (form.texas.checked)
	{
	form.GrandTotal.value =form.texas.value*1 + form.subTotal.value*1 + form.shipping.value*1 + form.GiftWrap.value*1+form.SpecialHandling.value*1;
		}
		else
		{
	form.GrandTotal.value =form.subTotal.value*1 + form.shipping.value*1 + form.GiftWrap.value*1+form.SpecialHandling.value*1;

		}
	form.GrandTotal.value = format(form.GrandTotal.value,2);
if (form.GifWrap.value == 0)
	{
	document.getElementById('giftmsg').style.visibility = hidden; 
	MM_showHideLayers('giftmsg','','hide');
	}
	else{
	document.getElementById('giftmsg').style.visibility = visible;
	MM_showHideLayers('giftmsg','','show');
	}
	}
}
*/

function MM_callJS(jsStr) { //v2.0
  return eval(jsStr)
} 
--> 
</script>
<style type="text/css">
<!--
input.btn {
	color:black;
	font-family:'trebuchet ms', helvetica, sans-serif;
	font-size:110%;
	font-weight:bold;
}
td.saleprice {
	color:maroon;
}
<cfif session.bulkbuyer.id neq ""> td.price {
color:maroon;
}
</cfif> .small {
 font: italic 9px "Times New Roman", Times, serif;
}
// -->
</style>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="/js/imageswap.js"></script>

<cfif bought is "buy" and newitem neq "">
	<style media="screen"   type="text/css" >
<!--	 
<cfoutput>
##added_#newitem#_#form.optionid# 
{
	 background-color:##D9EDD9;
	 }
	 </cfoutput>

	 -->
	 </style>
	 </cfif>
</HEAD>
<cfif newitem neq "">
  <CFQUERY DATASOURCE="gemssql" NAME="stats">
		update nitish.itemstats set addToCart=addToCart+1 where itemid =#newitem#
	 </cfquery>
</cfif>
<BODY style="margin-top:0pt;">
<div align="center">
  <CFINCLUDE TEMPLATE="/headerindia.cfm">
<cfset layerpos = 242 + 65*arraylen(session.cartitem) />
<!--- Gift Message div --->
<div id="giftmessage" style="position:absolute; left:140px; top:<cfoutput>#layerpos#</cfoutput>px; width:343px; height:94px; z-index:3; visibility: hidden; background-color: #EEEE99; layer-background-color: #999933; border: 2px groove #666666;padding:2px;"> The message that you type here will be printed and sent along with the shipment of the gift. 
  Please keep the message sweet and short (250 characters). Thank you.
  <p onClick="MM_showHideLayers('giftmessage','','hide')" style="color:red;cursor:pointer">[CLOSE] </p>
</div>
<!--- End gift message div --->
<div id="looksethint" style="position:absolute; font-size:12px;left:200px; top:160px; width:560px; height:86px; z-index:3; visibility: hidden;  layer-background-color: #999933; border: 1px groove #666666;padding:2px;border-top:4px solid #666600;background-color:white;text-align:left;">
  <ul>
    <li><span class="lookinline">Click on  Similar sign to see some of the jewelry items  similar to this item.</span></li>
    <li><span class="setinline">Click on orange Set  sign to  see some of the jewelry that can  make a set with this item.</span> </li>
  </ul>
  <span onMouseOver="MM_showHideLayers('looksethint','','hide')"><span   class="greenbutton">[Hide]</span> </span> </div>
  <div id="container2">
<table id="container1"  cellspacing="0" cellpadding="0" border="0" style="width:70%;padding:0 2px 0 2px">
<tr style="width:100%" align="center">
<!---<td valign="top"  align="center" width="142px;" ><!--- BEGIN LEFT SIDE STUFF --->
  <CFINCLUDE TEMPLATE="leftmenus.cfm">
  <!--- END LEFT SIDE STUFF --->
</td>--->
<td align="center" valign="top" style="width:930px;background:white;">


<p style="border-bottom:1px gray groove;width:50%;"><B>CART REVIEW FOR Cart ID<cfoutput> #session.cartid#</cfoutput></B></p>
<table border="0" cellpadding="0"  style="position:relative;margin-left:2px;"  width="754px" >
<thead class="greenbutton">
  <TH width="17%">Item </TH  >

  <TH width="27%">Description </TH  >
  
  <TH width="12%">Price</TH>
  <TH width="16%">Quantity</TH>
  <TH width="8%">Amount</TH>
  <TH width="10%" align="left">Remove <a href="http://www.semiprecious.com/cartcontrol/cartmonitor.cfc?method=emptycart" onClick="javascript:return confirm('All items will be removed from the cart!');"><font color="#FF0000">All</font></a>
  <TH width="16%">&nbsp;</TH>
  </TH>
</thead>
<CFSET grandTotal=0>
<cfset session.grandtotal = 0>
<CFSET subTotal=0>
<CFSET amounts=0>
<CFSET TotalQty=0>
<cfset emptyitems = 0>
<cfif session.cartitem[1][1] >
  <cfform action="" method="post" name="cartform">
   <cfloop  index="j" from="#ArrayLen(session.cartitem)#" to=1 step="-1">
   <cfset valueadd =0>
        <CFQUERY NAME="qprice" DATASOURCE="gemssql">
	            SELECT cat, storage, left(description,100) +'..' as description,clustercount,status,storage,thumblink FROM Items WHERE   newitem = #session.cartitem[j][1]# 
                </CFQUERY>
        <cfif  isdefined("text")>
          <cfset text = text & ','  & session.cartitem[j][1] & ":" & session.cartitem[j][4] & ":" & session.cartitem[j][5]>
          <cfelse>
          <cfset text = session.cartitem[j][1] & ":" & session.cartitem[j][4] & ":" & session.cartitem[j][5]>
        </cfif>
        <tr> <cfoutput>
            <TD  class="rowb" align='left'  ><img src="/images/#qprice.cat#/thumb/#session.cartitem[j][1]#.jpg" width="40px">
		<br />	<b> ID:#session.cartitem[j][1]#</b>
       </TD>
	        <TD   align='left'  ><span  class="listdescr">
              <br />
              #qprice.description#
              <cfif session.cartitem[j][5]>
                <cfquery datasource="gemssql" name="opts">
 		     		select description from options where itemid = #session.cartitem[j][1]# and optionid = #session.cartitem[j][5]#
				</cfquery>
               <!--- <cfif len(session.bulkbuyer.id)>
                  <cfif isnumeric(opts.valueadd)>
                    <cfset valueadd = opts.valueadd/2 >
                  </cfif>
                  <Cfset volumediscount = 1 />
                  <!---- volumediscount is discontinued given on 3 or more items. this 2.5 % for wholesale and  5 for others. this is mentioned in the login pages so if you change take note of this --->
                  <cfelse>
                  <cfif isnumeric(opts.valueadd)>
                    <cfset valueadd = opts.valueadd>
                  </cfif>
                  <Cfset volumediscount = 1 />
                </cfif> --->
                <span class="optionsinline">[#opts.description#]</span>
              </cfif>
              </span>
              <input type="hidden" name="itemnumber#j#" value="#session.cartitem[j][1]#">
            </TD>
            <cfset TotalQty=session.cartitem[j][4]+TotalQty>
            <input type="hidden" name="category#j#" value="#session.cartitem[j][2]#">
            <input type="hidden" name="quantity#j#" value="#session.cartitem[j][4]#">
              <td  class="rowb" align="center">

              <cfset amounts=#evaluate(session.cartitem[j][3]*session.cartitem[j][4])#>
              <cfif qprice.status is 3>
                <cfset saletotal = saletotal + amounts >
                <span class="saleprice">
                <cfelse>
                <span                 class="price">
              </cfif>
              #format(session.cartitem[j][3])#  </span>
              <input type="hidden" name="price#j#" Value="#DecimalFormat(session.cartitem[j][3])#">
            </td>
            <td id="added_#session.cartitem[j][1]#_#session.cartitem[j][5]#"  align="center">#session.cartitem[j][4]#&nbsp;&nbsp;&nbsp;&nbsp;<font size="2"><a href='jewelry_item.cfm?itemnumber=#session.cartitem[j][1]#&editcart=#j#&existqty=#session.cartitem[j][4]#&optionid=#session.cartitem[j][5]#'>Edit</a></font></td>
            <td  class="rowb">#format(amounts)#
              <input type="hidden" name="amount#j#" Value="#amounts#">
            </td>
            <td  class="rowb"><a href='#session.country#cart.cfm?newQty=0&newitem=#j#&optionid=#arraylen(session.cartitem)#' ><font color="##CC0000">Remove</font></a></td>
            	  <td  class="rowb" align="center" valign="middle">
					<cfswitch expression="#qprice.clustercount#">
					<cfcase value="1"><span class="lookinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=look" >&nbsp;Similar&nbsp;</a></span>
					</cfcase><cfcase value="2"><span class="setinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=set">&nbsp;Sets&nbsp;</a></span></cfcase><cfcase value="3"><span class="lookinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=look">&nbsp;Similar&nbsp;</a></span><hr />

<span class="setinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=set">&nbsp;Sets&nbsp;</a></span></cfcase><cfdefaultcase >&nbsp;</cfdefaultcase></cfswitch>
					</td>

          </cfoutput> </tr>
        <cfset subTotal= amounts + subTotal>
        
     
    </CFLOOP>
    <cfoutput>
      <cfif quantity GT invent >
        <tr>
          <td class="error1" colspan="7">For item #newitem# only #invent# in stock. #evaluate(quantity - invent)# may ship in 4 weeks or you will be refunded. </td>
        </tr>
      </cfif>
      <!---   <TR> 
                <TD class="error1" colspan="6"> WE ARE UPGRADING- NOT SHIPPING 
                  TILL 12 July! GET 5% DISCOUNT FOR THE DELAY </TD>
              </TR> --->
      <cfif totalQty is 0>
        <tr>
          <td colspan="7"><h4>Sorry, cart is empty....</h4>
            Use the Product Categories on top banner or <a href="gemstone_jewelry_gallery.cfm?#session.filter#">Click here to shop</a>.<br>
            
            <hr />
            <span class="row2">If you are returning with a cartid , click <a href="fillcart.cfm"><strong>here</strong></a></span> <br>
            Note: In case your browser has been set not to accept cookies,                   email us item numbers you want and we will send you a secure 
            web link to pay for them OR call us at #Application.indiaphone# with your       item numbers. Cart does not work without cookies<br>
            If you think you have cookies ON and empty cart is incorrect please click <a href="contactus.cfm" target="_self">here</a> and inform us of this error. </td>
        </tr>
        </tr>
        </table>
        <cfinclude template="footer.htm">
		</div>
		</body>
		</html>
        <cfabort />
      </cfif>
    </cfoutput>
    <cfset session.totalqty = Variables.totalqty />
    <cfif totalQty is 1>
      <cfset shipping  = 125>
      <cfelseif totalQty is 2>
      <cfset shipping =125>
      <cfelseif totalQty gt 2>
      <cfset shipping  = 125>
      <cfif subtotal  GT 4999>
        <cfset shipping=0>
      </cfif>
      <!---
<cfelseif j is 4>
<cfset shipping  = 2.00>
<cfelseif j is 5>
<cfset shipping  = 1.00>
<cfelseif j GT 5>
<cfset shipping  = 0.00>
--->
    </cfif>
   <cfif subtotal  GT 4999>
      <cfset shipping=0>
    </cfif>
	<cfset temp  = cgi.server_name />
	<!--- seen a transient bug here. if cgi.server_name is 
	used directly then the findnocase does not find .in in cgi.server_name --->
	
    <cfif not findnocase(".in",temp)>
					<tr>
					<td colspan="2">&nbsp;</td>
					</tr>
					<tr>
					<td colspan="2">&nbsp;</td>
					</tr>
      <tr bordercolor="#FFFFFF">
					
          <td colspan="3"   align="center"><a href="gemstone_jewelry_gallery.cfm?<cfoutput>#session.filter#</cfoutput>" class="contactUsBtn">&nbsp;Look around for more stuff&nbsp;</a></td>
          <td colspan="2" bgcolor="#FFFFFF" align="center"><cfoutput><a href="https://#cgi.SERVER_NAME#/indiaconfirmation.cfm" class="contactusBtn"></cfoutput>&nbsp;Select Payment Mode&nbsp;</a></td>
        </tr>
        <cfelse>
      <tr   >
  <td colspan="7" style="height:50px;"  align="center" bgcolor="#FFFFFF"><input  type="button" class="greenbutton"  onClick="javascript:goProcess('Buy More')" value="&larr;More Shopping">             
</td>
		 <!---
        Your confidence is important to us. Any concern?<strong> Call us now: <cfoutput>#Application.tollfree#</cfoutput> </strong>   --->
            <!---       <cfif  not (form.style + form.set)>
        Your confidence is important to us. Any concern?<strong> Call us now:</strong>1-800-620-9849 
<cfelse>
        <div class="biggreen"><cfoutput>For Item #newitem# See Items : 
            <cfif form.style>
              <span  class="lookinline"><a href="listcluster.cfm?itemid=#form.newitem#&type=look">That 
              Look Similar</a></span>&nbsp;&nbsp;
            </cfif>
            <cfif form.set>
              <span  class="setinline"><a href="listcluster.cfm?itemid=#form.newitem#&type=set">That 
              Make a Set</a></span>
            </cfif>
          </cfoutput></div>
      </cfif> --->
         
          
        </tr>
      </table>
      <table align="center"  border="0"  cellspacing="0" bordercolor="#bbbb99" width="752px" style="border:0px black ridge;">
              <input type="hidden" size="4" name="shipping"    id="shipping" value="125">
            <input type="hidden" size='3' name="discount" value="0">
            <!---    when removing delayed shipping above hidden variable is to be shown and toggle in other situation ---->
            <cfset newsubtotal = subtotal />
            <cfif isdefined("session.giftid") and session.giftamt GT 0>
              <tr>
                <td  align="right" valign="middle"  >Gift 
                  Amt (#):</td>
                <td align="right" valign="middle"> Rs <cfoutput>#session.giftamt#</cfoutput>.00 </td>
                <input type="hidden" value="gift" name="couponcode">
              </tr>
              <cfelseif session.bulkbuyer.id neq "">
              <cfset shipping = handlingcharges />
            
              
			   <cfoutput>
              
			</cfoutput>
			  
              <tr>
                <td  align="right">Email (optional): </td>
                <td  align="left"><input name="email" value="<cfif len(session.mail)><cfoutput>#session.mail#</cfoutput></cfif>" size="40"></td>
              </tr>
               <tr>
                <td  align="right">Phone: </td>
                <td  align="left"><input name="phonenumber" value="" size="30"></td>
              </tr>

              <tr>
                <td colspan="2">&nbsp;</td>
              </tr>
              <input type="hidden" value="regwsale" name="couponcode">
              <input type="hidden" name="GiftWrap" value="0.00" />
			  
              <input type="hidden" name="giftmsg" value="na" />
              <input type="hidden"  name="texas" value="0"  onClick="javascript:texaschecked();"/>
              <cfelse>
              <input type="hidden"  name="texas" value="0"  onClick="javascript:texaschecked();"/>
              
              <tr>
                <td>&nbsp;</td>
              </tr>
			 		  <input type="hidden" name="SpecialHandling" value="0.00" />
			  
                <input type="hidden" name="GiftWrap" value="0.00" />
				<input type="hidden" name="giftmsg" value="" />
         <!--     <tr id="giftmsg">
                <td align="right"> Message With Gift <span id="j"  style="text-decoration:underline" ><a onClick="MM_showHideLayers('giftmessage','','show')" style="cursor:pointer">[?]</a></span>:</td>
                <td align="left" nowrap ><input type="text" name="giftmsg"  onClick="javascript:this.value='';return;" value="" size="75" maxlength="245" />
                </td>
              </tr>
			  -->
              <cfif len(session.mail)>
                <tr>
                  <td align="right"> Loyalty Points [<a href="viewinvitecredits.cfm" alt="friends invited for jewelry site">?</a>]:</td>
                  <td align="left"><font color="#CC0000"> 
                 <cftry>
				   <cfinvoke component="invitationandcredit" method="reversecredit"  returnvariable="q">
				 	  <cfinvokeargument name="mail" value="#session.mail#" />
				   </cfinvoke>
				<cfcatch type="any">
				                <cfmail to="nitish@semiprecious.com" from="cs@semiprecious.com" subject="Could not loyal at indiacart "  type="html">
				  #cfcatch.detail#, #cfcatch.message# for #session.mail#
				  </cfmail>
				</cfcatch>
				</cftry>  
				 <cfinvoke component="invitationandcredit" method="usecredit" returnvariable="newsubtotal" >
                    <cfinvokeargument name="amounttopay" value="#subtotal#">
                    <cfinvokeargument name="saleitemamount" value="#saletotal#">
                    <cfinvokeargument name="finalize" value="0">
                    <!--- this is basically always 0 but comes into play in confirmation page --->
                    </cfinvoke>
                    </font> (Max discount is 20% of current order value or loyalty points which ever is less)</td>
                </tr>
                </cfif>
                <!---	<input name="couponcode" type="hidden" class="inputtext" value="" size="12" maxlength="18"> --->
            
            </cfif>
            	<tr>
                  <td  align="right" valign="middle" nowrap  ><font color="#000000">Coupon (if any)</font>: </td>
                  <td align="left" valign="left"><input name="couponcode" type="text" title="Enter any promotional or agent code you may have" class="inputtext" value="" size="12" maxlength="18">
                  </td>
                </tr>
            
			<cfoutput>
              <input type="hidden"  name="loyaltycredit" value="#decimalformat(evaluate(subtotal - newsubtotal))#">
              <cfset subtotal = newsubtotal />
              <input type="hidden"  name="subTotal" value="#decimalformat(newsubTotal)#">
            </cfoutput>
			  <cfset GrandTotal= 0+ 0*shipping/value_convert(1) + 1*newsubTotal>
  
            <tr>
              <td colspan=2>&nbsp;</td>
            </tr>
             <tr>
			  <td colspan=2 align='center' valign="middle" ><b><font color="#f880c0;">Total</font> :</b> 
                <input  name="GrandTotal" type="hidden"   value="<cfoutput>#decimalformat(grandtotal)#</cfoutput>" />
                  <cfoutput>#format(grandtotal)#</cfoutput>
				
				<cfset session.grandtotal = grandtotal>
                <font size=1>(Not Including 1% VAT and Shipping Charges <!---- <cfoutput>#format(evaluate((shipping)/value_convert(1)))#</cfoutput> --->)</font> </td>
            </tr>
			<!---
			<tr>
					 <td class="form_HEADING" colspan=2>Billing Address</td></tr>
			<cfoutput>	<tr>
                  <tr>
                  <td  align="right"><font color="red" >*</font>Bill To (Full Name): </td>
                  <td  align="left"><input name="name" value="<cfif addressset eq 1>#purchaserinfo.firstname#</cfif>" size="40"></td>
                </tr>
                <tr>
                  <td  align="right">Address:</td>
                  <td  align="left"><input name="address" value="<cfif addressset eq 1>#purchaserinfo.address1# #purchaserinfo.address2#</cfif>" size="40"></td>
                </tr>
                
                <tr>
                  <td  align="right">City: </td>
                  <td  align="left"><input name="city" value="<cfif addressset eq 1>#purchaserinfo.city#</cfif>" size="15"></td>
                </tr>
                <tr>
                  <td  align="right"> State: </td>
                  <td  align="left"><input name="state" value="<cfif addressset eq 1>#purchaserinfo.state#</cfif>" size="15"></td>
                </tr>
                <tr>
                  <td  align="right"> PIN code: </td>
                  <td  align="left"><input name="postal_code" value="<cfif addressset eq 1>#purchaserinfo.zip#</cfif>" size="15">
                  </td>
                </tr>
				  <tr>
                  <td  align="right">Country:</td>
                  <td>
					<cfset country_dropdown_name = 'country' />
					<cfinclude template="/includes/countries_drop_down.cfm" /></td>
					<!-- <input name="country" value="<cfif addressset eq 1>#purchaserinfo.country#<cfelse>india</cfif>" size="15"> --></td>
                </tr>
				    <tr>
                  <td  align="right" valign="middle" nowrap  ><font color="##440000">Email id</font>: </td>
                  <td align="left" valign="left">
				<input required="yes" message="Please provide  email id" name="email" type="text" title="Enter a contact medium" class="inputtext" value="<cfif addressset eq 1>#session.mail#</cfif>" size="32" maxlength="48">
                  </td>
                </tr>
			<tr>
                  <td  align="right" valign="middle" nowrap  ><font color="##440000">Phone no</font>: </td>
                  <td align="left" valign="left">
				<input required="yes" message="Please provide a contact  no. " name="phone" type="text" title="Enter a contact medium" class="inputtext" value="<cfif addressset eq 1>#purchaserinfo.phone#</cfif>" size="32" maxlength="48">
                  </td>
                </tr>
				 <tr>
					 <td class="form_HEADING" colspan=2>Shipping Address</td></tr>
				<tr>
                  <td  align="right">Ship To: </td>
                  <td  align="left"><input name="ship_name" value="<cfif addressset eq 1>#purchaserinfo.firstname#</cfif>" size="40"></td>
                </tr>
                <tr>
                  <td  align="right">Address:</td>
                  <td  align="left"><input name="ship_address" value="<cfif addressset eq 1>#purchaserinfo.address1# #purchaserinfo.address2#</cfif>" size="40"></td>
                </tr>
                <tr>
                  <td  align="right">City: </td>
                  <td  align="left"><input name="ship_city" value="<cfif addressset eq 1>#purchaserinfo.city#</cfif>" size="15"></td>
                </tr>
                <tr>
                  <td  align="right"> State : </td>
                  <td  align="left"><input name="ship_state" value="<cfif addressset eq 1>#purchaserinfo.state#</cfif>" size="15"></td>
                </tr>
                <tr>
                  <td  align="right"> PIN code: </td>
                  <td  align="left"><input name="ship_postal_code" value="<cfif addressset eq 1>#purchaserinfo.zip#</cfif>" size="15">
                  </td>
                </tr>
				  <tr>
                  <td  align="right">Country:</td>
                  <td>India<input type="hidden" name="ship_country" value="ind" size="10"></td>
                </tr>
			</cfoutput>	  -->  <!-- <tr>
                  <td  align="right" valign="middle" nowrap  ><font color="#440000">Email id</font>: </td>
                  <td align="left" valign="left">
				<input required="yes" message="Please provide  email id" name="ship_email" type="text" title="Enter a contact medium" class="inputtext" value="<cfif addressset eq 1>#session.mail#</cfif>" size="32" maxlength="48">
                  </td>
                </tr> -->
			 <input type="hidden" name="account_Id" value="6437" />
			 <cfoutput><input type="hidden" name="reference_no" value="#session.cartid#" />
			 </cfoutput><input type="hidden" name="mode" value="LIVE" />
			 <input type="hidden" name="description" value="Your Jewellery Picks" />
		<cfoutput>	 <input type="hidden" name="amount" value="#value_convert(session.grandtotal)#" />
		</cfoutput>	 <input type="hidden" name="return_url" value="http://www.semiprecious.in/response.php?DR={DR}" />
			 
        --->  
            <input type="hidden" name="j" value="<cfoutput>#evaluate(ArrayLen(session.cartitem) - emptyitems)#</cfoutput>">
		<input type="hidden" name="new_shipping" value="0" />
            <tr bgcolor="#FFFFFF">
              <td colspan="2"   style="text-align:right;margin-right:40px;"><img src=http://www.semiprecious.com/images/checkout.gif onClick="javascript:goProcess('Proceed to Checkout')" style="cursor:pointer">
                <!---
<input name="button" type="button" size=20 class="btn" onClick="javascript:goProcess('Proceed to Checkout')" value="Save Cart + Checkout Options"> --->
              </td>
            </tr>
            <tr>
              <td colspan=2><div style="padding-top:40px;width:750px"><font color=red><b><u><img src=http://www.semiprecious.com/images/secure_lock_2.gif><a href=/authorizenet/safeshopping.cfm>SECURITY NOTE</a></u>:</b></font> You will be taken to secure third party credit card transaction pages where we collect your sensitive credit card number.<img src=http://www.semiprecious.com/images/secure_lock_2.gif><img src=http://www.semiprecious.com/images/secure_lock_2.gif><img src=http://www.semiprecious.com/images/secure_lock_2.gif>
<br></div>
</td>
            </tr>
            <!---
	  <tr bgcolor="#FFFFFF"> <td colspan="2" align="center">
 <input name="button" type="button" class="greenbutton"  onClick="javascript:goProcess('Save Cart')" value='Save Cart for Later'> 
</td>
          </tr>--->
            <!---   <tr> 
            <td colspan="2"><ul>
                <li><strong>*</strong>: Discount will be applied when you finalize 
                  your cart at checkout but before payment.</li>
                <li><strong>#</strong>: Gift Certificate Amount and basic shipping 
                  will be reduced from your amount at checkout but before payment.</li>
              </ul></td>
          </tr>
         --->
          </table>
		</td>
      </tr>
      
    </cfif>
    </TABLE>
    </td>
    </tr>
    <cfoutput>
      <cfif not totalqty>
        <tr>
          <td colspan="2" class="details"> No Item Bought. Click <a href="index.cfm" class="unnamed1" alt="start jewelry shopping">Here</a> to Start Shopping.
            <hr>           <br>
            In case your browser has been set not to accept cookies, to order without           cookies, email us item numbers you want and <br>
            we will send you a secure web link to pay for them OR call us at #Application.indiaphone# with your item numbers. Cart does not work 	without cookies<br>
            If you think you have cookies ON and empty cart is incorrect please           click <a href="contactus.cfm" target="_self">here</a> and inform us 
            of this error.<br>
            <br>
            <span class="row2">If you are returning with a cartid , click <a href="fillcart.cfm"><strong>here</strong></a></span> . </td>
        </tr>
      </cfif>
      <!---         <input type="hidden" name="tcredit1" value="#getcredit1.earned#">
        <input type="hidden" name="newearned" value="#getcredit1.newearned#"> --->
    </cfoutput>
  </cfform>
  </td>
  </Tr>
  </table>
  <cfelse>
  </td>
  </tr>
  </table>
  <span style="display:block;backgroundColor:yellow;width:400px;margin-top:10px;padding:10px;border:2px red groove;text-align:center;vertical-align:middle;color:#666600;font-size:12px;">Your Cart is empty. Click <a href="/index.cfm" class="unnamed1">here</a> to Start 
  Shopping. </span>
  <hr>
  <br>
  In case your browser has been set not to accept cookies and you wish to order without cookies, email us item numbers you want and 
  we will send you a secure web link to pay for them OR call us at <cfoutput>#Application.indiaphone#</cfoutput> with your item numbers. Cart does not work without cookies.<br>
  If you think you have cookies ON and empty cart is incorrect please click <a href="contactus.cfm" target="_self">here</a> and inform us of this error. <br>
  <br>
  <span class="row2">If you are returning with a cartid , click <a href="fillcart.cfm">here</a></span>
</cfif>
<!--- <!-- 	<cfinclude template="images.cfm"> -->  --->
<span style="font-color:white;color:white;">......</span>
<!---
<center><table><tr><td><!-- Begin Official PayPal Seal --><a href="https://www.paypal.com/us/verified/pal=cs%40semiprecious%2ecom" target="_blank"><img src="http://www.paypal.com/en_US/i/icon/verification_seal.gif" border="0" alt="Official PayPal Seal"></A><!-- End Official PayPal Seal --></td><td><img src=https://www.paypalobjects.com/en_US/i/logo/verisign.gif></td><td></td></tr></table> </center>
--->
<cfoutput>
  <script language="JavaScript1.1">
//document.getElementById("cart").style.color = "maroon";
//		
//  document.getElemenStById("cart").style.textDecoration = "none" ;
  
<cfif quantity GT invent>
<cfset bal = quantity - invent>
alert("For item #newitem# : #quantity# ordered, #invent#  will ship immediately,  #bal#  in 2-4 weeks.");
</cfif>

<cfif session.bulkbuyer.id neq "">
 	document.getElementById("wholesale").style.color = "maroon";
    document.getElementById("wholesale").style.textDecoration = "none" ;

</cfif>
	
</script>
</cfoutput>
<!--- Footer --->

<!--- End footer --->
</td>
</tr>
</table>
</div><cfinclude template="/mainfooter.cfm">
</div><!--- centering the entire body content --->
</BODY>
<footer><!-- Google Code for pageview Conversion Page -->
<script language="JavaScript" type="text/javascript">
<!--
var google_conversion_id = 1072681239;
var google_conversion_language = "en_US";
var google_conversion_format = "2";
var google_conversion_color = "999966";
if (1) {
  var google_conversion_value = 1;
}
var google_conversion_label = "pageview";

//-->
</script>
<script language="JavaScript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<img height=1 width=1 border=0 src="http://www.googleadservices.com/pagead/conversion/1072681239/imp.gif?value=1&label=pageview&script=0">
</noscript>
<SCRIPT language="JavaScript" type="text/javascript">
<!-- Yahoo! Inc.
var ysm_accountid  = "10CC04QGR59A2PT01M2RHEVOJN0";
document.write("<SCR" + "IPT language='JavaScript' type='text/javascript' " 
+ "SRC=//" + "srv3.wa.marketingsolutions.yahoo.com" + "/script/ScriptServlet" + "?aid=" + ysm_accountid 
+ "></SCR" + "IPT>");
// -->
</SCRIPT></footer>
</HTML>
