<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<cfif isdefined("url.country")>
		<cfif not len(url.country) >
			<cflocation  url="/#session.cart#" addtoken="false" />
	
		<cfelseif session.country is 'india'><!--- to fix links from some places in india site pointing to cart.cfm instead of indiacart.cfm --->
			<cflocation  url="/#session.cart#" addtoken="false" />
		</cfif>
   </cfif>
<CFPARAM NAME="session.name" DEFAULT="#session.mail#" type="STRING" /><!--- useful for filling up the form for purchase table entries --->
<CFPARAM NAME="nonUSA" DEFAULT="">
<cfset leftgemstonedisplay="inline" />
<cfset expedited_possible = 1 />	
<CFPARAM NAME="texas" DEFAULT="0" />
<cfif len(session.bulkbuyer.id)>
	<CFPARAM NAME="shipping" DEFAULT="4.99" />
<cfelse>
	<CFPARAM NAME="shipping" DEFAULT="3.99" />
</cfif>
<cfoutput>jjjjja#shipping#</cfoutput>

<cfinclude template="setup.cfm" />
<cftry>
<CFPARAM NAME="description" DEFAULT="" />
<cfparam name="loyaltycredit" default="0" />
<cfparam name="form.optionid" default="0" />
<cfparam name="form.set" default="0" />
<cfparam name="form.style" default="0" />
<cfset handlingcharges = 3.99>
<!--- also set in confirmation page --->
<cfparam default="100" name="invent" />
<cfparam default="0" name="valueadd" />
<CFPARAM NAME="Price" DEFAULT= "0" />
<CFPARAM NAME="category" DEFAULT= "" />
<CFPARAM NAME="newitem" DEFAULT= "" />
<CFPARAM NAME="cart" DEFAULT= "" />
<cfparam name="volumediscount" default="1" />
<CFPARAM NAME="bought" DEFAULT="" />
<CFPARAM NAME="quantity" DEFAULT="1" type="numeric" />
<CFPARAM NAME="j" DEFAULT=0 type="numeric" />
<CFPARAM NAME="newQty" DEFAULT="" />
<CFPARAM NAME="TotalQty" DEFAULT=0 type="numeric" >
<cfparam name="session.gallery" default="list.cfm">
<cfparam default="-9" name="what_happened">
<cfset testing = 0>

<cfif isdefined("url.resendmail")>
<cfquery datasource="sptm" >
				select email from bulkbuyers  where email = '#urldecode(url.resendmail)#'
			</cfquery>
			<cfif exists.recordcount>
<cfmail from="service@semiprecious.com" subject="wholesale jewelry affiliation programme" to="#trim(urldecode(url.resendmail))#" bcc="scorpionitish@yahoo.com"  server="mail23.webcontrolcenter.com" type="html" failto="nitish@semiprecious.com">
			<div align="center" style="border:2px ridge ##666600;padding:4px;"><font color="##558633" size="+2">Semi</font><font color="##ff8000;" size="+2">precious</font>Wholesale.com</div><div style="border:0px ridge ##666600;padding:6px;text-align:left"> 
			Hi ,</div><div style="text-align:justify">
			         &nbsp;&nbsp; 
						Welcome to a collection of huge range of designs in semi precious stones  and all at stunning prices. 
					
			         	Once you activate your account your minimum purchase is #format(session.bulkbuyer.minamt)#. You can also pay using our easy payment plan. No minimum quantity per design. Shipping charges are as low as they can be .
			        <br>
			         So let's get started. Your activation number is  <strong> 48290.</strong> Click on the link given here or cut paste this URL on your browser address - <a href="http://wholesale.semiprecious.com/whole_login.cfm?activationnumber=48290&amp;email=#trim(urldecode(url.resendmail))#">http://wholesale.semiprecious.com/whole_login.cfm?activationnumber=48290&amp;email=#trim(urldecode(url.resendmail))#</a>. 
			          Please use this number for activating your account. This is required 
			          to confirm that you have provided us a valid email address. Hoping to 
			          do  mutually profitable business.</div> <div style="text-align:left">Regards, <br />- Semiprecious.com 
			          Team </div><div align="center" style="background-color:##CCECCC;margin-top:0px;height:10px;">&nbsp;
			</div>
			<hr />
			 </cfmail>
<cfmail from="service@semiprecious.com" subject="Your registration at wholesale store" to="#trim(urldecode(url.resendmail))#" bcc="scorpionitish@yahoo.com"  server="mail23.webcontrolcenter.com"  failto="nitish@semiprecious.com">
			Wholesale.semiprecious.com 
			Hi ,
			     
					Welcome to a collection of huge range of designs in semi precious stones  and all at stunning prices. 
					
			        Once you verify  your email id  you can use easy payment plan. No minimum quantity per design. Shipping charges are as low as they can be .
			        
			         So let's get started. Your activation number is  48290. Cut paste this URL on your browser address - http://www.semipreciouswholesale.com/whole_login.cfm?activationnumber=48290&amp;email=#trim(urldecode(url.resendmail))#. 
			          Please use this number for activating your account. This is required 
			          to confirm that you have provided us a valid email address. Hoping to 
			          do  mutually profitable business.
Regards, 
- Team Semiprecious.com 
			          
			 </cfmail>

			 <cfelse>
			 <cfset url.resendmail = '' />
			</cfif>
</cfif>
<!---<cfset session.mail="test32@aol.com">--->

<cfset cart_msg = "" />
<cfif bought is "buy" and newitem neq "">
<cfset reload = false />
	<cfif isdefined("form.bought")>
		<cfif not session.cartid >
			<cfset reload= true />
		</cfif>
		<cfif session.mail is 'james2@vsnl.com'>
			 <cfdump var="#form#" />
		</cfif>
		<cfinvoke method="additem" attributecollection="#form#" component="cartcontrol.cartmonitor" returnvariable="added"  />
	<cfelse> 
		<cfif not session.cartid >
			<cfset reload= true />
		</cfif>
		<cfinvoke method="additem" attributecollection="#url#" component="cartcontrol.cartmonitor" returnvariable="added"  />
	</cfif>
    <cfif reload>
<cflocation url="#session.cart#?country=#session.address.country_code#&cartid=#session.cartid#&nozero=1" addtoken="no" />
	</cfif>
		
<cftry>	<cfset what_happened = added.response.newitem.qtyadded.XmlText />
<cfcatch>
Site is undergoing short upgrade. will be back in 30 minutes.

<cfoutput>#added#</cfoutput></cfcatch></cftry>
	<cfif  what_happened is 0 >
		<cfset cart_msg="As per available quanity in inventory cannot add any more of this item to your cart" />
	<cfelseif what_happened LT 0 >
		<cfset cart_msg="Selected Item/Design Removed from your cart" />
	<cfelse>
		<cfif what_happened LT form.quantity>
			<cfset cart_msg= 'From available inventory could add only ' & what_happened  />
		</cfif>
	</cfif>
</cfif>
<cfif session.cartid eq 0  ><!--- cartid is assigned here for a unique PC visit. else cookie triggers cartid allocation during start up of session--->
	   	<!--- coming from confirmation page  --->
	 	  	<cfif session.cartitem[1][1]><!--- cart has stuff, make sure it is put in the db with current cart id (could be returning from confirm page and hence got a new cart id ) --->
				<cfinvoke component="cartcontrol.cartmonitor" method="new_cartid" />	
	        <cfelseif isdefined("url.cartid")>
             <cfif url.cartid neq 0 and len(url.cartid)>
               <cfsilent>
                   <cfinclude template="activate_cart.cfm" />
               </cfsilent>
               </cfif>
             </cfif>
        <cfif session.cartid eq 0  >
	        <cfset client.CFCARTID = 0 /> <!--- added because ajax emptying is not setting cookie to 0  by js but rather reloading this page to show empty cart --->
        </cfif>
    <cfelseif not isdefined("client.cfcartid") >
  
 	<cfset client.cfcartid = session.cartid />
    <cfelseif not client.cfcartid >
    <cfset client.cfcartid = session.cartid />
        
</cfif>
 <cfif isdefined("session.login_reminder")>
<cfif len(session.mail) and session.mail neq application.wholesale_guest>
<cfelse>
		<div style="padding:2px;background-color:white;position:absolute;top:190px;left:260px;width:470px;border:4px gray solid;z-index:4">
		<div class="form_heading">Hey! Welcome back</div>
			Please log in using <a class="error" href="/simpleloginform.cfm">'login'</a> link on the header of this page.
			When you log in you can also reload your earlier cart items into your current cart in a single click. 
				
					<cfif session.cartitem[1][1]>
			Best part is you don't lose the items you have in this new cart!</cfif>
			<cfif not len(session.bulkbuyer.id)>
<br />             You can also check your loyalty discount points, use your wish list and invite friends and get special discount coupon.
			</cfif>
		<!-- The image below shows how:</span><br />
		<img src="/images/activate_help.jpg">
		 --><br />
		<br /><br /><span class="green_band">If you want to continue without logging in <cfoutput><a class="error" href="/cart.cfm?country=#session.address.country_code#&cartid=#session.cartid#">click here</a></cfoutput></span>	
				</div>
		
			
	</cfif>
		<cfset k = structdelete(session, 'login_reminder') />
		</cfif>


<!---<cfset quantity = 3>
<cfset price = 10.00>
<cfset optionid= "1">
<cfset bought = "buy">
<cfset newitem= "1038">
---><!--- used to determine on cart page whether the buyer should be routed to list.cfm or listcluster.cfm when he clicks on continue shopping --->
<cfset saletotal = 0>
<!--- this has to be set then why use cfparam? this is aboviouslfy faster --->
<CFIF session.cartid and newQty is 0 and optionid eq arraylen(session.cartitem) and newitem LTE optionid>
             <cfquery datasource="gemssql" name="confirmation">
				    SELECT  buyer FROM cartstatus WHERE (cost>0 or paymode <> 'null') and cartid = '#session.cartid#' <!---AND paymode='null' and paymode is not null--->
		  </cfquery>
		  <cfif not confirmation.recordcount>
			  	<cfquery datasource="gemssql" name="updatecart">
                    delete from buyingrecord where itemid = '#session.cartitem[newitem][1]#' and cartid = '#session.cartid#' and optionid = '#session.cartitem[newitem][5]#'
            </cfquery>
					<cfquery datasource="gemssql" ><!--- tracking changes to cart. not accurate though because updates from say 4 to 2 is counted as add to cart of -2 and 2 to 2 that of 0 --->
							   		update cartstatus set noofsaleitems  = noofsaleitems + #session.cartitem[newitem][4]# where cartid = #session.cartid#  
						   </cfquery>
					

	  <cfif optionid is 1><!--- proxyf for cartitem array len --->
	   <cfset session.cartitem[1][1] = 0 />
  			  <cfquery datasource="gemssql" >
			          update cartstatus set indate  =  #now()# , paymode ='emptied' where cartid = #session.cartid# and paymode = 'null'
		      </cfquery>              
                                   <cfset session.grandtotal = 0.00 />
								<cfset session.totalQty = 0.00 />
								   
             <cfset client.cfcartid = 0 />

               
			  <cfset session.cartid = 0 />
	  <cfelse>
  			<cfset oms = arrayDeleteAt(session.cartitem,newitem) />
	  </cfif>
</cfif>

</cfif>

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


<!--- update cart if they clicked on something to buy --->

       <!--- by anup - increment cartid if cart was confirmed before just in case its paid for but not update of status as paid but keep cart items same--->


<!--- end cart not empty check --->
<cfset addressset = 0>

<cfif len(session.name) and session.bulkbuyer.id neq application.wholesale_guest><!--- defined only on login (login.cfm or whole_login.cfm)--->
<cfset addressset = 1>
</cfif>
<!--- <cfif (not len(session.bulkbuyer.id)) and session.mail contains "@" and session.mail contains "." and session.mail does not contain 'guest'>
	<cfquery datasource="gemssql" name="purchaserinfo">
            SELECT * FROM memberinfo  WHERE email='#session.mail#' 
    </cfquery>
	<cfif purchaserinfo.RecordCount>
	    <cfset addressset = 1>
	</cfif>  
<cfelse>
  <cfif len(session.bulkbuyer.id) and session.bulkbuyer.id neq application.wholesale_guest>
<!---THIS CHANGED BY ANUP, BULKBUYER IS STILL IN MYSQL---> 
<cfquery datasource="sptm" name="purchaserinfo">
  SELECT name as firstname, address as address1, phoneno as phonenumber, address2, city, state, country, zip FROM bulkbuyers
  WHERE email = '#session.bulkbuyer.id#'
</cfquery>
<cfif purchaserinfo.RecordCount>
    <cfset addressset = 1>
	</cfif>
 </cfif>
</cfif>--->
<CFSET grandTotal=0>
<cfset session.grandtotal = 0>
<CFSET subTotal=0>
<CFSET amounts=0>
<CFSET TotalQty=0>
<cfset emptyitems = 0>
  
<html>
<HEAD>
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
    	<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<TITLE>Jewelry Items selected on Semiprecious.com</TITLE>
<link rel="shortcut icon" href="/favicon.ico" />
<script language="JavaScript" type="text/javascript" src="/js/global.js">
<script language="JavaScript" type="text/javascript" src="/js/macromediafuncs.js">
</script>
<script language="JAVASCRIPT1.1" type="TEXT/JAVASCRIPT" >
var io, response_awaited =0, reduce_amt = 0;
var req;

function dummy() {
		if (req.readyState == 4) {
		if (req.status == 200 ) {
//alert(req.readyState);
			good = 0;
			if (window.DOMParser) // our CFC is sending in xml disguised as text. this we had to do  because when we try to send in XML content (http header text/xml) then it creates problems for normal cfmx pages since then the browser believes everything else is also xml compliant
			{
			parser=new DOMParser();
			xmlDoc=parser.parseFromString(req.responseText,"text/xml");
			}
			else // Internet Explorer
			{
			xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false";
			xmlDoc.loadXML(req.responseText);
			} 
			if (xmlDoc)	{
				if (xmlDoc.documentElement)  // for mozilla we need to test for req.response itself and this one is for IE
				{
					good = 1;
				}
			}

			if ( good == 0 )
			{
				//document.getElementById("ajaxcheck").value  = 0 ;
				goProcess('add'); // that process basically submits the form for post to web
			}

if (good == 1) {
				var	response = xmlDoc.documentElement;
   				var newval = 	xmlDoc.documentElement.getElementsByTagName('grandtotal')[0].childNodes[0].data ; //response.getElementsByTagName('cart')[0][3].data;
   				var ship = 	xmlDoc.documentElement.getElementsByTagName('shipping')[0].childNodes[0].data ;
				var cur = xmlDoc.documentElement.getElementsByTagName('currency')[0].childNodes[0].data 
				var qty_remove = xmlDoc.documentElement.getElementsByTagName('qty')[0].childNodes[0].data 

	//   alert(newval);
   // NA for cart page. document.getElementById().value =    document.getElementById().value*1 - response_awaited; // top item qty
    // NA for cart page  document.getElementById().value =    document.getElementById().value*1 - reduce_amt; // top total
	     		 	 document.getElementById('summary_total').innerHTML =   newval; // document.getElementById().value*1 - reduce_amt; // cart summary total
		 
		 try {	 
		 
		     document.getElementById('subtotal').value =   newval*1; 
				 	 if (newval*1 == 0)
					   {
				 <cfoutput>
			 			window.location = '#session.cart#?country=#session.address.country_code#' ;</cfoutput>
               	   
					   }
					 document.getElementById('grandtotal').value =    Math.round((newval*1  + ship*1)*100)/100 ; 
				
				 document.getElementById('hidden_total').value =  		document.getElementById('grandtotal').value; 

		 } catch(e)
		 {
			 // may not exist for ws
		 }
		 //need to set standard shipping as per country and below or abouve the $70 mark.
		 // need to reload page with country or not with country depending on crossed ws buyer threshold
		 document.getElementById('amount'+io).value = 	Math.round((document.getElementById('amount'+io).value - reduce_amt)*100)/100;
		 _hide =  document.getElementById('amount'+io).value;
		document.getElementById('added_'+io).innerHTML = 	(document.getElementById('added_'+io).innerHTML)*1 - qty_remove;
		_hide = 		document.getElementById('added_'+io).innerHTML*1;
		document.getElementById('amount_'+io).innerHTML = 	Math.round(((document.getElementById('amount_'+io).innerHTML)*1 - reduce_amt)*100)/100;
		document.getElementById('shipping').value = ship;
try {
		document.getElementById('shipping_').innerText = ''+ cur + ship;
} catch (e)
 {
 }
 	document.getElementById(io).style.backgroundColor = 'white';
		
 if (	_hide == 0 )
			document.getElementById(io).style.display = 'none';
			
		response_awaited  = 0;
	return true;	}
		}
		alert("Error in response. Website down? You may refresh page to check your internet connection.");
				 <cfoutput>
			 window.location = '#session.cart#?country=#session.address.country_code#' ;</cfoutput>

	
}

}

function dummy2() {
		if (req.readyState == 4) {
		if (req.status == 200 ) {
			document.getElementById('visit_email_').innerHTML = 'Saved! If required, you can use your email id on cart page to recover your carts' ;
return;
}
}
}

function _visit_email()
 {
	
		 
var ve =			document.getElementById('visit_email').value;

 //branch for native XMLHtpRequest ojbect
//alert('i called successfully');
 if (window.XMLHttpRequest) {
//alert('i called successfully');
 var k = Math.random();
  req = new XMLHttpRequest();
  req.onreadystatechange = dummy2;
		var _url = '/cartcontrol/cartmonitor.cfc?method=visit_email&visit_email_='+ve+'&ender='+k
  req.open("GET",_url,true);
  req.send(null);
return false;  
 }
 else if ( window.ActiveXObject) {

  req = new ActiveXObject("Microsoft.XMLHTTP");
	if (req) {
 //alert(url);
	 req.onreadystatechange = dummy2;
		var _url = '/cartcontrol/cartmonitor.cfc?method=visit_email&visit_email_='+ve+'&ender='+k
  
	 req.open("GET",_url,true);
	 req.send();
     return false;
        } 
     }
  }
function reduce_item(itemid,optionid,qty,rate)
 {
	 if (response_awaited == -1)
			{	 <cfoutput>
			 window.location = '#session.cart#?country=#session.address.country_code#' ;</cfoutput>
               
			}

	 if (response_awaited)
	     {
			 response_awaited = -1 ; // once we have seen a repeate click.
			 //location.url = tradictional way
			 alert("Please wait for previous operation to complete");
			 //just to make sure we are in synch (reality and visual)
			 
		 return ;
		 }
	
		 
		 io = itemid + '' + optionid;
           try {		
			document.getElementById(io).style.backgroundColor = '#FEEaEa';
		   } catch (e)
		   {
			    <cfoutput>
			 window.location = '#session.cart#?country=#session.address.country_code#' ;</cfoutput>
               
			   return;
		   }

 //branch for native XMLHtpRequest ojbect
//alert('i called successfully');
 if (window.XMLHttpRequest) {
//alert('i called successfully');
 var k = Math.random();
  req = new XMLHttpRequest();
  req.onreadystatechange = dummy;
  var _url = '/cartcontrol/cartmonitor.cfc?method=reduce_item&itemid='+itemid+'&optionid='+optionid+'&quantity='+qty+'&ender='+k
  req.open("GET",_url,true);
  response_awaited = qty;
   if (qty == 0 )
	     response_awaited = 1;
	reduce_amt = rate*qty;
  req.send(null);
  
 }
 else if ( window.ActiveXObject) {

  req = new ActiveXObject("Microsoft.XMLHTTP");
	if (req) {
 //alert(url);
	 req.onreadystatechange = dummy;
		var _url = '/cartcontrol/cartmonitor.cfc?method=reduce_item&itemid='+itemid+'&optionid='+optionid+'&quantity='+qty+'&ender='+k
  
	 req.open("GET",_url,true);
	 req.send();
  	response_awaited = qty;
   if (qty == 0 )
	     response_awaited = 1;
		reduce_amount = rate*qty;
         } 
     }
  }

function goProcess(inString){
if(inString=='Proceed to Checkout')
{
	<cfif cgi.server_name contains 'wholesale'>
    		  self.document.cartform.action="http://www.semipreciouswholesale.com/confirmation.cfm?cartid=<cfoutput>#session.cartid#</cfoutput>";
	<cfelseif session.country is 'india'>
	self.document.cartform.action="http://www.semiprecious.in/indiaconfirmation.cfm?cartid=<cfoutput>#session.cartid#</cfoutput>";
	<cfelse>
	self.document.cartform.action="http://www.semiprecious.com/confirmation.cfm?cartid=<cfoutput>#session.cartid#</cfoutput>";
			//BrowserDetect.init();
		//if ( BrowserDetect.browser == "explorer"  || BrowserDetect.browser == "Explorer")
			//		  self.document.cartform.action="http://www.semiprecious.com/confirmation.cfm?cartid=#session.cartid#";
				//  else
					//  self.document.cartform.action="http://www.semiprecious.com/confirmation.cfm?cartid=#session.cartid#" ;
	</cfif>
//alert(1);
try {if (!_CF_checkcartform(self.document.cartform)) return false;} catch(e){}
self.document.cartform.submit();
		return ;

	}
	texas = 1
	
		if(inString=='Save Cart'){
			<cfif cgi.server_name contains 'wholesale'>
						self.document.cartform.action="http://semiprecious.com/confirmation.cfm?save=1";
			<cfelse>
					self.document.cartform.action="http://www.semiprecious.com/confirmation.cfm?save=1";
			</cfif>

			self.document.cartform.submit();
				return;
	}
	if(inString=='buy more'){
<cfif session.gallery contains 'gemstone.'>
	<cfoutput>location.href='/gemstone.cfm?#session.filter#';</cfoutput>
<cfelseif session.gallery contains 'angela'>
	<cfoutput>location.href='/designer_jewelry_angela.cfm?#session.gallery#?#session.filter####newitem#_anchor';</cfoutput>
<cfelseif session.gallery contains 'daily'>
	<cfoutput>location.href='/daily_deals/daily_deals.cfm###newitem#_anchor';</cfoutput>
<cfelse>
	<cfoutput>location.href='/gemstone_jewelry_gallery.cfm?#session.filter####newitem#_anchor';</cfoutput>

</cfif>
	return;
	/* 
	self.document.cartform.submit();
	return;
	*/
	}
	if(inString=='indianfranchisee'){
self.document.cartform.action="indianfranchisee.cfm";
	self.document.cartform.submit();
	return;
	}
		
}</script>
<cfif newitem neq "">
  <CFQUERY DATASOURCE="gemssql" NAME="stats">
						update nitish.itemstats set addToCart=addToCart+1 where itemid =#newitem#
	 </cfquery>
</cfif>


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
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
<cfif bought is "buy" and newitem neq "">
	<style media="screen"   type="text/css" >
<!--	 
<cfoutput>
##added_#newitem##form.optionid# 
{
	 background-color:##D9EDD9;
	 }
	 </cfoutput>

	 -->
	 </style>
	 <cfelse>
	 </cfif>
</HEAD>

<BODY style="margin-top:0;">
<div align="center">
<div style="width:930px">

  <CFINCLUDE TEMPLATE="/header#session.country#.cfm">
<cfflush />
<cfset layerpos = 242 + 65*arraylen(session.cartitem) />
<div style="display: none;" id="easy_content1">
					 	<div style="background-image: url('/images/help_resources_tl.gif') no-repeat; width: 560px;">
							<br><div style="background-color: white; border: 2px solid gray; padding: 1px;">
<span style="float: right; color: red;">[<span style="cursor: pointer;" class="error1" onClick="document.getElementById('que_answer').innerHTML='';">X</span>]</span>
	<div class="heading">
		<h2>How to earn from our advertising spend?</h2>
	</div>
	All online shopping stores are burdened with huge advertisement and promotion costs.  
	Naturally, this adds to the product cost and you end up paying higher prices. We, at semiprecious.com, have started a novel customer participation program to reduce the high costs of promotions and pass on the benefit of reduced costs to our customers. Anyone can join in simple steps and benefits are substantial and immediate.
	<ul style="text-align: left; margin-left: 20px;" class="ul_arrow"> 
		<li>Signed up members <a href="/login.cfm">click here</a>. If you are not our registered customer, sign up by filling up a simple form. <a href="/apply.cfm" class="green_bg">Sign up here</a>
		</li><li>After signing up, click on invite friends link on your account welcome page.
		</li>
		<li>After you have submitted a minimum of six correct referrals, the system will provide you a special one time <span style="color: red;">35% discount coupon</span> (You get flat 35% discount on all items other than the ones on sale. For items on sale you will get discount of 17.5%).
		</li>
		<li>You can participate in this program more than once and continue to enjoy whopping discounts for your future shopping.
		</li>
		<li style="color: blue;">We emphasize that we do not spam or share your or your friends' details with anyone for any purpose.</li>
	</ul>
	<span style="float: right; color: red;">[<span style="cursor: pointer;" class="error1" onClick="document.getElementById('que_answer').innerHTML='';">X</span>]</span>
</div>
		 				</div>
		 		</div>
<!--- Visit Email div --->
<div id="whyemail" style="text-align:left;position:absolute; left:40px; top:<cfoutput>#layerpos#</cfoutput>px; width:493px; height:134px; z-index:3; visibility: hidden; background-color: white; layer-background-color: #A9A9D3; border: 2px groove #666666;padding:2px;"> 
<strong>Email Id For Cart:</strong> This is an optional feature and needed only once for a cartid. If you use this feature then you must enter your email id every time the cart id changes.<br />
This feature helps you get back your shopping cart using the email id you enter here. It can be useful if you need to shut down your computer before completing your shopping. This is also useful if you do part of your shopping from your office and then from home.  <br />
The other option is to sign up and get an account page that gives you discounts and simpler cart saving features.
  <p onClick="MM_showHideLayers('whyemail','','hide')" style="cursor:pointer">[CLOSE] </p>
</div>
<!--- End Visit Email div --->

<!--- Gift Message div --->
<div id="giftmessage" style="position:absolute; left:40px; top:<cfoutput>#layerpos#</cfoutput>px; width:343px; height:94px; z-index:3; visibility: hidden; background-color: #EEEE99; layer-background-color: #999933; border: 3px groove orange;padding:2px;"> The message that you type here will be printed and sent along with the shipment of the gift. 
  Please keep the message sweet and short (250 characters). Thank you.
  <p onClick="MM_showHideLayers('giftmessage','','hide')" style="cursor:pointer;color:red;">[CLOSE] </p>
</div>
<!--- End gift message div --->
<div id="look_set_hint" style="position:absolute; font-size:12px;left:200px; top:160px; width:560px; height:86px; z-index:3; visibility: hidden;  layer-background-color: #999933; border: 1px groove #666666;padding:2px;border-top:4px solid #666600;background-color:white;text-align:left;">
  <ul style="margin-top:20px;">
    <li style="margin-top:20px;">Click on purple <span class="lookinline">&nbsp;similar</span> box to see our suggested designs  similar to this design.</li>
    <li style="margin-top:20px;">Click on orange <span class="setinline">&nbsp;set </spaN> box to  see a few  jewelry designs that can  make a set with this item.
	 </li>
  </ul>
  <span onMouseOver="MM_showHideLayers('look_set_hint','','hide')"><span   class="greenbutton">[Hide]</span> </span><br /> </div>

<table id="container1" width="930px" cellspacing="0" cellpadding="0" border="0" style="padding:0 1px 0 1px">
<tr style="width:928px;" align="center">

<td valign="top" width="144px" align="left" ><!--- BEGIN LEFT SIDE STUFF --->

  <CFINCLUDE TEMPLATE="leftmenus.cfm" />
  <!--- END LEFT SIDE STUFF --->
</td>
<td align="center" valign="top">
   		<cfif isDefined("FORM.arb")>
   		<p style="font-family:'trebuchet ms', helvetica, sans-serif; color:red; font-size:16px; text-align:center">THANK YOU, YOUR ORDER HAS BEEN SUCCESSFULLY PLACED!</P>
			<cfquery datasource="gemssql">
				update cartstatus set paymode = 'arb1' where cartid = '#form.cartid#'
			</cfquery>
		</cfif>

<cfif session.cartitem[1][1] >
<cfform action="#session.country#confirmation.cfm" method="post" name="cartform">
<div   style="width:740px;text-align:center;margin-top:10px;margin-bottom:4px;">
<div align="left" style="height:22px;color:#625;width:98%;
font-family:arial;
font-size:1.4em;">
	<cfif (arraylen(session.cartitem) GT 3) > <img src="/images/moreshopping.gif" style="margin-left:10px;border:2px gray ridge;left:10px;margin-top:3px;cursor:pointer;width:90px;display:inline;" onClick="javascript:goProcess('buy more')" > 
	<cfelseif (arraylen(session.cartitem) GTE 2)  and (len(session.mail) is 0) and 0><!--- switched off, anup said so --->
    	   
					<div id ="advert" style="display:inline;width:350px;position: relative; background-color: rgb(231, 2, 2); border: 2px ridge red; padding: 1px; color: white;">
    					<img style="display: inline; position: absolute; top: -5px; left: 342px;" onclick='javascript: var d = document.getElementById("easy_content1").innerHTML; document.getElementById("que_answer").innerHTML = d;' src="/images/que.gif" />
					
 	 	  <a style="text-decoration: underline; cursor: pointer; color: white;" href="/login.cfm?fromcart=advert">Pay upto 35% less for this cart! Click Here ... </a>
			 <span style="position: absolute; z-index: 3; top: 5px; left: -12px; color: black;" id="que_answer"></span></div>
		</cfif>
<span style="margin-left:80px;">REVIEW FOR YOUR CART (ID:</span> <font color="black"><cfoutput>#session.cartid#</cfoutput></font>)</div>
<!--- <cfif len(cart_msg)><div align="center" class="green_band_ticked"><cfoutput>#cart_msg#</cfoutput></div></cfif>
 ---></div>

<TABLE bordercolor="#FFF" style="margin-left:6px;border:1px #fff solid;width:772px;" cellspacing="0" align="center"  >
 <cfoutput><tr class="grayplacard" >
<TH width="18%" ><img src="http://#session.tld#/images/que.gif" style="display:inline;" onClick="MM_showHideLayers('look_set_hint','','show')" />We Suggest  </TH>
  <TH width="15%" colspan="1">Edit Cart</TH  >
  <TH width="26%" colspan="2">Design</TH  >

  <TH width="15%">Price(#session.currency#)</TH>
  <TH width="18%">Quantity</TH>
  <TH width="12%">Amt (#session.currency#)</TH>
</tr></cfoutput>

		<cfif session.desc_flag>
			<cfif session.mail is "" > <!--- this code is reached everytime only for admin_email --->
      			<cfset session.desc_flag = 0 />
			</cfif>
		</cfif>
	<cfif session.cartitem[1][1]>
		<cfset chain =  0 />
		<cfset pendant = 0 />
    <CFLOOP  INDEX="j"  to="1" from="#ArrayLen(session.cartitem)#" step="-1" >
	<cfset valueadd =0 />
  
          <CFQUERY NAME="qprice" DATASOURCE="gemssql" timeout="40"    >
           SELECT
                <cfif session.cartitem[j][5]> options.description as optsdesc, </cfif> newitem, cat, storage, subcat+ ' ' + cat as description,clustercount,status,storage,thumblink FROM Items 
    <cfif session.cartitem[j][5]> inner join options on items.newitem=options.itemid  </cfif>
    WHERE   items.newitem = #session.cartitem[j][1]# 
    <cfif session.cartitem[j][5]> and options.optionid = #session.cartitem[j][5]#</cfif>
    </CFQUERY>
	     <cfoutput>
		 <tr id="#session.cartitem[j][1]##session.cartitem[j][5]#" >
            <td  class="rowb" align="center" valign="middle">
					<cfswitch expression="#qprice.clustercount#">
    					<cfcase value="1">
    					<span class="lookinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=look" >&nbsp;Similar&nbsp;</a></span>
    					</cfcase>
												<cfcase value="2">
																<span class="setinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=set">&nbsp;In This Set&nbsp;</a></span>
														</cfcase>
														
														<cfcase value="3">
																		<span class="lookinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=look">&nbsp;Similar&nbsp;</a>
																		</span><hr />

<span class="setinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=set" >&nbsp;Set&nbsp;</a></span></cfcase><cfdefaultcase >&nbsp;</cfdefaultcase></cfswitch>
					</td>

            <td   style="text-align:right;padding-right:6px;">

	<font size="1"><a href='jewelry_item.cfm?itemnumber=#session.cartitem[j][1]#&editcart=#j#&existqty=#session.cartitem[j][4]#&optionid=#session.cartitem[j][5]#' style="color:green">Change Qty</a>
</font><img src="http://#session.tld#/images/add_item.jpg" width="12" height="12" alt="buy more"> <!---
   <a href='cart.cfm?newQty=0&newitem=#j#&optionid=#arraylen(session.cartitem)#&country=#session.address.country_code#' ><font color="##CC0000">Remove</font></a> <img src="images/trash.jpg" width="12" height="12" alt="delete">
--->
    <cfif session.cartitem[j][4] GT 1>
<a href="javascript:reduce_item(#session.cartitem[j][1]#,#session.cartitem[j][5]#,1,#session.cartitem[j][3]#);">  <font color="##CC2020">Reduce Qty</font></a> <img src="images/dnarrow.gif" width="13" height="13" alt="reduce">
</cfif>
<a href="javascript:reduce_item(#session.cartitem[j][1]#,#session.cartitem[j][5]#,0,#session.cartitem[j][3]#);"><font color="##440000">Remove</font></a> <img src="http://#session.tld#/images/trash.jpg" width="12" height="12" alt="delete">
   
   
</td>
            <td align="left"><img src="http://#session.tld#/images/#qprice.cat#/thumb/#qprice.newitem#.jpg" border="0" width="80"></td>
			<TD   align='left'  ><span  class="listdescr"><b>ID:#session.cartitem[j][1]#</b><br />
              <cfif qprice.storage contains "IN-">
			  	<cfset expedited_possible = 0 />
               <cfelse>
                
                <b><font color=green>Quick Ship Possible</font></b><br />
              </cfif>
             #qprice.description#
			<cfif not chain>
				<cfif findnocase('chain',qprice.description)>
					<cfset chain = 1 />
				</cfif>
			</cfif>
			<cfif not pendant >
				<cfif findnocase('pendant',qprice.description)>
					<cfset pendant = 1 />
				</cfif>
			</cfif>
			
              <cfif session.cartitem[j][5]>
                <span class="optionsinline">[#qprice.optsdesc#]</span>
              </cfif>
              </span>
              <input type="hidden" name="itemnumber#j#" value="#session.cartitem[j][1]#">
            </TD>
			
            <cfset TotalQty=session.cartitem[j][4]+TotalQty>
    
          	              <td  class="rowb" align="center">
	        <input type="hidden" name="category#j#" value="#session.cartitem[j][2]#">
            <input type="hidden" name="quantity#j#" value="#session.cartitem[j][4]#">
              <cfset amounts=session.cartitem[j][3]*session.cartitem[j][4]>
              <cfif qprice.status is 3>
                <cfset saletotal = saletotal + amounts >
                <span class="saleprice">
                <cfelse>
                <span                 class="price">
              </cfif>
              #decimalformat(value_convert(session.cartitem[j][3]))# </span>
              <input type="hidden" name="price#j#" Value="#DecimalFormat(session.cartitem[j][3])#">
            </td>
            <td  class="rowb" align="right">  <span id="added_#session.cartitem[j][1]##session.cartitem[j][5]#">#session.cartitem[j][4]#</span>
            </td>
            
            <td  class="rowb"><span id="amount_#session.cartitem[j][1]##session.cartitem[j][5]#">#decimalformat(value_convert(amounts))#</span>
              <input type="hidden" name="amount#j#" id="amount#session.cartitem[j][1]##session.cartitem[j][5]#" Value="#amounts#">
            </td>
			</tr>
          </cfoutput> 
    	    <cfset subTotal= amounts + subTotal>
				<cfset Session.GrandTotal= subTotal>
     
    
    </CFLOOP>
        <tr>
          <td class="error1" colspan="7">
<cfif Variables.totalQty is 1 and len(session.mail) is 0 and 0>
<span id="visit_email_">
	(OPTIONAL)	 Enter Your Email Id Here <a onClick="MM_showHideLayers('whyemail','','show')" style="cursor:pointer">[?]</a>: 
<input style="background-color:pink;color:blue;" type="text" name="visit_email" id="visit_email" size="50"   /> <input type="button" onClick="javascript:_visit_email();"
 value="Remember  Cart" class="greenbutton" />
</span>
	
<cfelse>
<div style="padding:1px;background-white;border:1px red ridge;width:115px;margin:2px;"><div style="background:red;color:white;padding:4px;" align="center" ><a style="color:white;"  href="/cartcontrol/cartmonitor.cfc?method=emptycart" onClick="javascript:return confirm('All items will be removed from the cart!');">Click Here To Empty Your Cart</span></a></div></div>
			      <cfif quantity GT invent or (pendant GT chain )>
	We suggest you pick a <a href="chains.cfm?cart_suggest=1">silver chain</a> from our collection for the pendant you have picked
      </cfif>
	</cfif>
</td>


        </tr>
	<cfset session.totalqty = Variables.totalqty />
	
	<!--- out of above loop we have presented the cart and totaled up the qty in TotalQty and value in subtotal --->
    <cfoutput>
    <cfif totalQty is 0>
        <tr>
          <td colspan="7"><h4>Your shopping cart is empty....</h4>
        <ul class="arrow_ul" style="text-align:left;margin-left:20px;">
		<li>   

		<strong>	Click here to use the cart Id (cart number)or your email id  to get back your earlier cart. Click <a href="/fillcart.cfm"><strong>here</strong></a></strong>	
  
            </li>
			
            <li> In case your browser has been set not to accept cookies,                   email us item numbers you want and we will send you a secure 
            web link to pay for them </li><li>OR call us at <cfoutput>#Application.tollfree#</cfoutput> with your                   item numbers.
			</li>
			<li> Cart does not work without cookies but if you think you have cookies ON and empty cart is incorrect please click <a href="/contactus.cfm" target="_self">here</a> and inform us of this error.</li>
			</ul> </td>

        </tr>
	</cfif>
	</cfoutput>
	
    

    <!--- <cfif isdefined("cookie.cart")>
<cfoutput>Set this cookei #cookie.cart#.</cfoutput>
</cfif> --->
    
<cfif session.country is "india">
      <tr bordercolor="#FFFFFF">
          <td colspan="3"   align="center"><a href="gemstone_jewelry_gallery.cfm?<cfoutput>#session.filter#</cfoutput>">Look around for more stuff</a></td>
          <td colspan="3" bgcolor="#FFFFFF" align="center"><a href="indiaconfirmation.cfm"><font size=5>Select Payment Mode</font></a></td>
        </tr></table>
        <cfelse>
      <tr  >
          <td colspan="6" height="2"  align="center" style="border-bottom:0px dashed #999;padding-top:6px;"  ><!---
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
<!---&nbsp;&nbsp;
<div class=""><a href="/daily_deals/daily_deals.cfm"><img  border="0" align="absbottom" title="listing some items that we are selling on near cost price to delight our customers" src="http://www.semiprecious.in/daily_deals/jewelrydeals.gif" alt="semiprecious gemstone jewelry on sale" /></a>
<a class="gray_url"  onClick="javascript:goProcess('Click here to Buy More Items')">More Shopping</a>&nbsp;
<cfif not len(session.mail)><a class="gray_url" href="/apply.cfm">Sign up for discounts</a><cfelse></cfif>&nbsp;
	  		<cfif application.live_support > 

			<div style="display:inline;border:0px ridge #0A0 ;margin-top:4px;padding:2px 4px" align=center>
   <a class="login_link" onclick="open_live_support()" href="javascript://"><img style="text-decoration:none;" src="/images/callus.png" height="20px" valign="center" border=0 />&nbsp;<span style="position:relative;bottom:4px">Online Help</span></a>
</div></cfif>

</div>--->
           </td>
        </tr>
      </table>
	  
	  
      <table   cellspacing="2"  style="width:780px;dispaly:inline;">
<tbody style="display:;">
      <cfif isdefined("url.country") >
  <!--- <cfdump var="#countriesxml#" />--->
               <cfset country_name = session.address.country />
                  <cfif session.address.country_code neq url.country or not len(session.address.country)>
						<cfset session.address.country_code = url.country />
								<cfinvoke component="countryresolver" method="get_country_name" returnvariable="country_name" >
		  							<cfinvokeargument name="code" value="#urldecode(url.country)#">
		  						</cfinvoke>
                          <cfset session.address.country = country_name />        
                    </cfif>      
                    <!-- now compute shipping. shipping can be computed only when country code is available -->            
	      <cfinvoke component="cartcontrol.cartmonitor" method="compute_shipping" returnvariable="os" >
               <cfinvokeargument name="items_total" value="#subtotal#" />
               <cfinvokeargument name="country_code" value="#url.country#" />
           </cfinvoke>
           
           <cfset shipping = os />
       <!---
		  <cfif len(session.bulkbuyer.id) >
	 			<cfif url.country is "USA"  >
    					 <cfset shipping=3.99>
				<cfelse>
					 <cfset shipping=12.99>
				</cfif>
			<cfelse>
				<cfif url.country is "USA" or url.country is "AU"  >
    				<cfif subtotal  GTE application.retail_free_shipping>
        				<cfset shipping=0>
					<cfelse>
						<cfset shipping = 2.99 />
	      			</cfif>
		  	      <CFELSE>
				  	<cfif subtotal  GTE application.retail_free_shipping>
        				<cfset shipping=9.99>
					<cfelse>
						<cfset shipping = 14.99 />
	      			</cfif>
				</CFIF>  
			</cfif>		
			--->
			<cfset GrandTotal= shipping + subTotal>
			<cfset Session.GrandTotal=  subTotal>
    		
       	<cfoutput>	          <tr>
                <!---                <td  align="center" height="150" width="200" nowrap>
 slowing down the page tremendously
				<span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=hF33DTtyM65nCwzDN0SwqGGgTQPxn3o4Ym0uzkuDY7OQkc0HNahexOlJ"></script>

				</td>
				--->
				   <td  align="right" style="border-top:1px gray solid;border-bottom:1px gray solid;" colspan="2" nowrap="true" >
			     <font size=+1>
				 <b>Items' Total<a name="checkout">:</a> </b>  
				 <input class="inputtext" name="GrandTotals" type="hidden" id="hidden_total"  value="#format(subTotal)#">
				 <span id="summary_total">#format(subTotal)#</span>
				</font></td><tr><td align="right" style="padding-bottom:40px;" colspan="2" nowrap="true"> 			     <font size=+1>

				Standard Shipping: <input type="hidden" size="4" name="shipping"    id="shipping" value="#shipping#" />
                    	<span id="shipping_">
                  	<cfif shipping>#format(shipping)#<cfelse><span class="error1">Free!</span></cfif> </span>

				 <cfset session.grandtotal = subTotal /><!--- this is used in header for display--->
                <br />
				  <cfif  session.bulkbuyer.id eq "" >
Shipping Discount for Orders over #format(application.retail_free_shipping)# [Free within US].<br />
			 
						<cfif subtotal LT application.arb_amount> 
							<span class="error1">Pay in easy installments for invoice more than #format(application.arb_amount)#</span>
						</cfif>
		   		</cfif></font>
            <input type="hidden" size='3' name="discount" value="0">

				</td>
              </tr>					</cfoutput>
              <!--- international shipping is handled by specialhandling so this is set to 0--->
            <!---    when removing delayed shipping above hidden variable is to be shown and toggle in other situation ---->
            <cfif isdefined("session.giftid") and session.giftamt GT 0>
              <tr>
                <td  align="right" valign="middle"  >Gift 
                  Amt (#):</td>
                <td align="right" valign="middle"> <cfoutput>#format(session.giftamt)#</cfoutput>.00 </td>
                <input type="hidden" value="gift" name="couponcode">
              </tr>
           </cfif>
    	 <cfif  (len(session.bulkbuyer.id)) >
			<cfoutput>	
				      <tr >
			<td colspan=2 align="center">   
		      <input type="hidden" value="regwsale" name="couponcode">
              <input type="hidden" name="GiftWrap" value="0.00" />
              <input type="hidden" name="giftmsg" value="na" />
              <input type="hidden"  name="texas" value="0" />
              
                
	         <input style="" name="Shipto" value="#session.name#" type="hidden" >
			  <input  name="Street1" value="#session.address.address1#" type="hidden" >
              <input name="Street2" value="#session.address.address2#" type="hidden" />
			  <input name="City" value="#session.address.city#" type="hidden" />
    		  <input name="State" value="#session.address.state#" type="hidden"  >
               <input name="zip" value="#session.address.zip#" type="hidden" />
        </td></tr>
		<cfif  (subtotal LT session.bulkbuyer.minamt)>

        <tr >
			<td colspan=2 align="center">
				 <div class="green_band"> Shop for #format(500)#  to get #session.bulkbuyer.fivehundreddiscount#<!--  -->% discount </div><br />
						 <div class="green_band"> Shop for #format(1000)#  to get  #session.bulkbuyer.thousanddiscount#% discount</div><br />
					 	 <div class="green_band"> Shop for #format(2000)#  to get #session.bulkbuyer.twothousanddiscount#% discount</div>
		<br />
						 <span class="error2" style="margin-top:4px;">Please shop for minimum of #format(session.bulkbuyer.minamt)# to enable check out</span>
<br />		 
   <img src="/images/moreshopping.gif" style="border:2px gray ridge;width:120px;cursor:pointer" onClick="javascript:goProcess('buy more')" > &nbsp;
			
		</tr>
		
		<cfelse>
		<tr ><td colspan=2 align="center">	 <tr ><td colspan=2 align="center">   <img src="/images/moreshopping.gif" style="border:2px gray ridge;width:120px;cursor:pointer" onClick="javascript:goProcess('buy more')" > &nbsp;
				<font color=##948 size=+1><b>OR START CHECKOUT BELOW</b></font>  
				</TD></tr>
				<tr><td colspan=2 bgcolor=##948 style="color:white;" >
					<cfif len(session.bulkbuyer.id)>Volume discount (for carts over #format(500)#/#format(1000)#/#format(2000)#) will be applied on the next stage of checkout
					</cfif>&nbsp;</td>
              </TR>			
			<cfif url.country neq 'USA'>
				  <tr>
                  <td  align="right">Shipping to country:</td>
                  <td>#country_name#<input  name="country" value="#country_name#" type="hidden" />&nbsp; [<a href="/#session.cart#?cartid=#session.cartid#&amp;b=22&amp;##checkout">Change Country</a>]</td>
                </tr>
				<cfelse>
				<tr>
                  <td  colspan=2 align="center">
					<input  name="country" value="#country_name#" type="hidden" />&nbsp; [<a href="/#session.cart#?cartid=#session.cartid#&amp;cc=22&amp;##checkout">To Ship Outside of USA Click Here</a>]
					</td>
                </tr>
				</cfif>
			</cfif>	

			</cfoutput>
			
			    <tr>
                	<td  align="right">Email(<span class="form_heading">Optional</span>): </td>
                	<td  align="left">
				<cfif session.mail contains "@" and session.mail does not contain 'guest'>
				  <input type="hidden" name="email" value="<cfoutput>#session.mail#</cfoutput>" size="40"><cfoutput>#session.mail#</cfoutput>
			 	 <cfelse>
            		<input REQUIRED="true" MESSAGE="Please provide a valid email id" type="text" name="email" value="" size="40">
             	</cfif>
					</td>
					 </tr>
               <tr>
                <td  align="right">Phone No.

			<cfif addressset >
: </td>	                <td  align="left">				<cfinput  name="phonenumber" value="#session.address.phone#" size="30" required="yes" message="Please provide a valid phone number">
				<cfelse>
					   <cfif url.country  neq "USA" >
						: </td>	                <td  align="left">	<cfinput  name="phonenumber" value="" size="30" required="yes" message="Please provide a valid phone number">
						<cfelse>
							
(<span class="form_heading">Optional</span>): </td>                <td  align="left">	<input type="text" name="phonenumber" value="" size="30"  message="Please provide a valid phone number">
				     </cfif>
				</cfif>
				</td>
              </tr>
          <tr>
                <td  align="right">  Shipping : 
				 </td>
				 <cfset hand_msg = "" />
                 <td  align="left">
				<select name="SpecialHandling"  >
	   			<option  value="0" selected >Standard (USPS with tracking )</option>
				  <cfif expedited_possible  >
					   <cfif url.country  is "USA" or url.country  is "AU" or url.country  is "GB" or url.country  is "NZ">
						    		<cfset hand_msg ="[Standard: Ships in 2 to 3 days]" />	
						  			<cfif url.country  is "USA" or url.country  is "AU">
												<option  value="1.1">Priority (2-3 Days Delivery in USA) Add $1.10</option>
				
						  			</cfif>
											<option   value="9.9">Express (1-2 Days Delivery in USA) Add $9.9</option>
							<cfelse>
										<cfset hand_msg ="[Shipped 4 to 6 days from Austin]" />	
										<option   value="12">USPS Express Add $12.00</option>
						</cfif>
					  	<cfelse>
                			<cfif url.country  is "USA" or url.country  is "AU" or url.country  is "NZ" or url.country  is "GB">
					      		<cfset hand_msg ="[Shipped in 4 to 6 days from Austin]" />	
									<option   value="32">UPS (5-6 Days Delivery) Add $32.00</option>
								<cfelse>
					      			<cfset hand_msg ="[Shipped in 4 to 6 days from Austin]" />	
									<option   value="32">UPS (7-9 Days Delivery) Add $32.00</option>
							</cfif>
					  </cfif>
         </select> <br />        
                  				  <cfoutput><span style="color:blue">#hand_msg#</span></cfoutput>
</td>
              </tr>
    
              <tr>
                <td colspan="2">&nbsp;</td>
              </tr>
              <cfelse><!--- STARTING FORM FOR RETAIL --->
              <!---			<cfif isdefined("url.texaserror")>
			  <tr class="error" ><cfelse>			<tr></cfif>
              <td align="right">Buying from Texas? (<span class="error">*</span>):</td>
              <td align="right">We will pay Sales Tax on your be	half.
			   <input type="hidden"  name="texas" value="0"  onClick="javascript:texaschecked();"/>
			  
			  </td></tr>--->
              <input type="hidden"  name="texas" value="0" />
              
              <cfoutput>
               <input type="hidden" name="Shipto" value="#session.name#" size="40">
               <input type="hidden" name="Street1" value="#session.address.address1#" size="40">
               <input type="hidden" name="Street2" value="#session.address.address2#" size="40">
               <input  type="hidden" name="City" value="#session.address.city#" size="15">
               <input type="hidden" name="State" value="#session.address.state#" size="15">
               <input type=hidden name="zip" value="#session.address.zip#" size="15">
            
			    <tr ><td colspan=2 align="center">   <img src="/images/moreshopping.gif" style="margin-top:2px;border:2px gray ridge;width:120px;cursor:pointer" onClick="javascript:goProcess('buy more')" > &nbsp;
				<font color="##633096" size=+1><b>OR START CHECKOUT BELOW</b></font>  
				</TD>
				<tr><td colspan="2" bgcolor="##633096" >&nbsp;</td></tr>
            
              <cfif url.country neq 'USA'>
				  <tr>
                  <td  align="right"><font size=+1>Shipping to country:</font></td>
                  <td>#country_name#&nbsp; [<a href="/#session.cart#?wejelry=2##checkout">Change Country</a>]</td>
                </tr>
				<cfelse>
				<tr>
                  <td  colspan="2" align="center">&nbsp; [<a href="/#session.cart#?cartid=#session.cartid#&amp;cc=24&amp;##checkout">If Package is To Ship Outside of USA Click Here</a>]</td>
                </tr>
				</cfif>  
              </cfoutput>
			  
			  <cfif session.mail contains "@">
				  <input type="hidden" name="email" value="<cfoutput>#session.mail#</cfoutput>" size="40">
			  <cfelse>
			  <tr>
           	    <td align="right"><font size=+1>Email</font><cfif 1 or url.country eq "USA">(<span class="form_heading">Optional</span>)</cfif>: </td>
                
					<td  align="left">
					<cfif url.country neq "USA">
              				<cfinput required="false" message="Please provide a valid email id."  type="text" name="email" value="" size="40">
						<cfelse>
         					<cfinput required="false"   type="text" name="email" value="" size="40">
		  			</cfif>
							</td>
              	</tr>
              </cfif>
            	<input type="hidden" name="country" value="<cfoutput>#country_name#</cfoutput>" size="15">
               
				<!--- <tr>
			    <td  align="right"><font size=+1>Phone No.</font><cfif 1 or url.country eq "USA">(<span class="form_heading">Optional</span>)</cfif>:</td>
                <td  align="left">
              		<cfif url.country neq "USA">
						<cfif addressset eq 1>
								<cfinput required="true" message="Please provide a valid phone no."   name="phonenumber" value="#purchaserinfo.phonenumber#" size="30" STYLE="font-family: Verdana; font-weight: bold; font-size: 14px; ">
							<cfelse>
								<input required="true" message="Please provide a valid phone no."   name="phonenumber"  size="30" STYLE="font-family: Verdana; font-weight: bold; font-size: 14px; ">
							
						</cfif>
					<cfelse>
							
							<cfif addressset eq 1>
								<cfinput required="false" message="Please provide a valid phone no."  name="phonenumber" value="#purchaserinfo.phonenumber#" size="30">
							<cfelse>
								<cfinput required="false" message="Please provide a valid phone no."  name="phonenumber" value="" size="30">
							</cfif>
					</cfif>
							</td>
              </tr> --->
             
              <tr>
                <td  align="right"> <font size=+1>Shipping Options</font>: <br />
				 </td>
                <td  align="left">
                  
							 <cfif url.country  is "USA" or url.country  is "AU" or url.country  is "NZ" or url.country  is "GB">
							<select name="SpecialHandling" >  
									<cfif expedited_possible  >
							    		<cfset hand_msg ="[Standard: Ships within 2 days]" />	
										<option   value="0.00" selected > Standard (USPS with tracking )</option>
										<option   value="1.1"> Priority (2-3 Days Delivery in Mainland) + $1.10</option>
									<!-- 	<option   value="9.9"> Express (4 Days Delivery) + $9.9</option> -->
									<cfelse>
										<cfset hand_msg ="[Standard: Ships within 5 days]" />	
									<option   value="0"> Standard (USPS with tracking )</option>
									<option   value="12"> USPS Express + $12.00</option>
									</cfif>
							  </select><br />

					  	<cfelse>
                		
										  <cfif expedited_possible  >
								    <select name="SpecialHandling" >
									      			<cfset hand_msg ="[Standard: Ships in 3 days]" />	
											<option    value="0.00" selected >Standard (USPS with tracking )</option>
								    		<option   value="32.00">UPS (5-6 Days Delivery) + $32.00</option>
								  </select><br />
										<cfelse>
								      		<cfset hand_msg ="[Ships within 5 days from Austin, USA]" />	
										<input type="hidden" name="SpecialHandling" value="0.00"  />
											</cfif>
					 
                    </cfif>
				  <cfoutput><span style="color:blue">#hand_msg#</span></cfoutput>
      <cfinclude template="vacation.inc" />
                </td>
              </tr>
			          <tr>
              <!--- Authorize.net logo --->
              <td  align="right">
              
                      <!---<td align=center><a href="http://www.centraltx.bbb.org/commonreport.html?bid=90026075"><img src="images/bblogo.gif"></a></td>--->
            	<!---	  
<span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=hF33DTtyM65nCwzDN0SwqGGgTQPxn3o4Ym0uzkuDY7OQkc0HNahexOlJ"></script>
--->
		   <span style="color:gray;"><font size=+1>Coupon</font>,if any:</td><td> <input name="couponcode" type="text" class="detail" value="" size="12" maxlength="18"><br />	    
</td>
      </tr>
			      <tr>
	                <td  align='right' nowrap><img src="/images/gift.gif" align="absmiddle" vspace="0" hspace="0" border="0"   height="22" style="display:inline;" />&nbsp;&nbsp;<font color="#000000" size=+1>Gift Wrap</font>: </td>
	                <td align="left"  ><select name="GiftWrap" onChange="javascript:grandtotal(this.form)">
	                    <option value="0.00" selected>No Gift Bag</option>
	                    <option value="1.00" >Red Velvet Pouch: $1.00</option>
	                  </select>
	                </td>
	              </tr>
	              <tr id="giftmsg">
	                <td align="right">  <font size=+1>Message (If Gift)</font> <span id="j"  style="text-decoration:underline" ><a onClick="MM_showHideLayers('giftmessage','','show')" style="cursor:pointer">[?]</a></span>:</td>
	                <td align="left" nowrap ><textarea rows=3 cols=50  name="giftmsg"  onClick="javascript:this.value='';return;" VALUE="" MAXLENGTH="245" ></textarea>
	                </td>
	              </tr>
				
			  <cfif len(session.mail) and session.mail contains "@">
		                <tr>
		                  <td align="right">  <font size=+1>Loyalty Discount</font><a href="viewinvitecredits.cfm" ALT="friends invited for jewelry site">[?]</a>:</td>
		                  <td align="left"><font color="#CC0000"> 
     				  <cftry>
						   <cfinvoke component="invitationandcredit" method="reversecredit"  returnvariable="q">
						 	  <cfinvokeargument name="mail" value="#session.mail#" />
						   </cfinvoke>
						<cfcatch type="any">
						                <cfmail to="nitish@semiprecious.com" from="cs@semiprecious.com" subject="at cart Could not reverse " server="mail23.webcontrolcenter.com" type="html">
						  #cfcatch.detail#, #cfcatch.message# for #session.mail#
						  </cfmail>
						</cfcatch>
						</cftry>
		                 <cfif subtotal>
                            <cfinvoke component="invitationandcredit" method="usecredit" returnvariable="newsubtotal" >
		                    <cfinvokeargument name="amounttopay" value="#subtotal#">
		                    <cfinvokeargument name="saleitemamount" value="#saletotal#">
		                    <cfinvokeargument name="finalize" value="0">
		                    <!--- this is basically always 0 but comes into play in confirmation page --->
		                    </cfinvoke>
                            <cfelse>
                            <cfset newsubtotal = subtotal />
                            Nil
                            </cfif>
		                    </font> (Maximum discount is 20% of current order value)</td>
		                </tr>
					 <cfset loyaltycredit = subtotal - newsubtotal />
					  <!--- <cfset subtotal = newsubtotal /> --->
					  <cfset Session.grandtotal = subtotal  />
					  
			`  </cfif>
			
      <tr>
        <td align="center" colspan="2">
                      </td></tr>
	 </cfif><!--- end of wholesale and retail section --->
	    <cfoutput>
			 
			<tr><td align=right style="padding-top:4px;"><b> <!--<font size=+1>Grand Total:</font>--></b> </td><td align='left'>
			 	 <input type="hidden"  name="loyaltycredit" value="#decimalformat(loyaltycredit)#">
         		<input type="hidden"  name="subTotal" value="#decimalformat(subTotal)#" id="subtotal"> 
                <input class="inputtext" name="GrandTotal" type="hidden" id="grandtotal"  value="#decimalformat(subTotal + shipping)#" size="6" maxlength="9"> <span class="green_band" style="padding-top:0px;">Any applicable discounts will be applied on confirmation</span>
           </cfoutput>     
                <cfset session.grandtotal = subTotal  />
                       <input type="hidden" name="j" value="<cfoutput>#ArrayLen(session.cartitem)#</cfoutput>">
</td>
            </tr>
<cfif (len(session.bulkbuyer.id) and session.grandtotal GTE session.bulkbuyer.minamt) or (not len(session.bulkbuyer.id))>
<tr><td colspan=2 align=center style="padding-top:2px;padding-bottom:2px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
<!--<span class="greenbutton" style="display:inline;cursor:pointer;padding:4px;border:2px outset #9BA;color:black;height:30px;" onClick="javascript:goProcess('Proceed to Checkout')" >Confirm Cart and Select Payment Method&rarr;</span>  --> 
<input type="submit" style="font-weight:bold;font-size:1.1em;display:inline;cursor:pointer;padding:4px;height:34px;" class="action_button" onlick="javascrip:goProcess('Proceed to Checkout')" value=" Confirm Cart and Select Payment Method&rarr; " />    </td></tr>
<cfelse>
<tr><td colspan=2 align=center style="padding-top:4px;padding-bottom:2px;"><span class="error2" ><font size=+1>Please shop for <cfoutput>#format(session.bulkbuyer.minamt)#</cfoutput> minimum to select payment mode</font></span>     
<br />
<br /> <img src="/images/moreshopping.gif" style="width:120px;border:2px gray ridge;cursor:pointer;" onClick="javascript:goProcess('buy more')" />&nbsp;&nbsp;    </td></tr>


</cfif>		 
<cfelse>
</form>
		 <tr><td colspan="2"  align="right"><br /><font size=+1 color="purple">Total (not including shipping)<a name="checkout" style="text-decoration:none;">:</a>   
				 <span id="summary_total"><cfoutput>#format(subTotal)#</cfoutput></span></font>
              				 <input class="inputtext" name="GrandTotals" type="hidden" id="hidden_total"  value="<cfoutput>#format(subTotal)#</cfoutput>">

				 	<cfoutput>
				 
                 <input type="hidden" size="4" name="shipping"    id="shipping" value="#shipping#">
                <!-- hiding this because shipping changes as per   url.country . and that is not known at this stage <br /><font size=+1 color="gray">Standard Shipping:     	
                  	<cfif shipping>#format(shipping)#<cfelse><span class="error1">Free!</span></cfif></font>  -->
					
					</cfoutput>
<cfoutput>
				 <ul class="arrow_ul" style="width:400px;text-align:right;font-size:14px;text-align:left;margin-left:20px;">
				 	 <cfif not len(session.bulkbuyer.id)>
					 <li>Shipping discounts for billing over #format(application.retail_free_shipping)#</li>
					 <li>Verified buyers can pay using the installment plan</li>
					 <Cfelse>
					 <li>
                     <span style="position:relative;">
					 <img src="/images/que.gif"   onClik="document.getElementById('que_answer').innerHTML='';" onClick="document.getElementById('que_answer').innerHTML=document.getElementById('easy_content').innerHTML;" />
                     <span id="que_answer" style="position:absolute;z-index:3;top:10px;left:20px;"></span>&nbsp;Verified Buyers can use our instalment payments
                     </span></li>
					 <cfif isdefined("url.resendmail") ><cfif len(url.resendmail)><li class="error1">Your Verification Mail Sent</li><cfelse>
					 <li class="error1">No mail sent. You need to first <a href="wholesale_register.cfm?beaded=1" class="side_link">apply for wholesale buying account</a></li></cfif></cfif>
					 
					 </cfif>	 
				 </ul> 
				 <div id="easy_content" style="display:none;">
				 	<div style="background-image:Url('/images/help_resources_tl.gif') no-repeat;width:400px;">
					  <div class="detailrow" align="left">
						<br /><span class="login_link">&nbsp;Verified wholesale buyers</span>    
						<div style="background-color:white;border:2px ##E6Cf84 solid;border-top:0px;padding:2px;text-align:justify;"> can  can use our 3 instalment payment plan.
						 To qualify as a verified wholesale buyer you need to register and then verify your registration. Please [<a href="wholesale_register.cfm" class="side_link">Register</a>] here.<br /> If you have already registered  
						 <cfif session.bulkbuyer.id is application.wholesale_guest> <cfelse>and not received the verification then click <a href="#session.cart#.cfm?resendmail=#urlencodedformat(session.bulkbuyer.id)#" >here</a></cfif>, you should soon recieve the verification number and URL.
						 <br />If you do not recieve the verification email or a query from our team please <span class="error1">do check your spam folder</span> and then you can write in to us at <strong>cs@semiprecious.com</strong>. <br ><div style="text-align:left;margin-left:2px">-Team Semiprecious.com-&nbsp;&nbsp;&nbsp;[<span  onClick="document.getElementById('que_answer').innerHTML='';" class="error1" style="cursor:pointer;">Close</span>]
				 </div>
		 		</div>
		 	</div>
		</div>
		 
			
				 </cfoutput></font></td>
				 </tr>
				 
		   
 <TR>
                <TD colspan="2" valign="center" align=right>
                 <img src="/images/moreshopping.gif" style="border:2px gray ridge;cursor:pointer"  width="126px" onClick="javascript:goProcess('buy more')" /> &nbsp;  &nbsp;				
			
	 <cfif (not len(session.bulkbuyer.id) ) or (len(session.bulkbuyer.id) and  (subtotal GTE session.bulkbuyer.minamt))>
			
				
<font size=+1>OR 	
			 START CHECKOUT BELOW</font>			</TD>
            
              </TR>
			  <tr><td colspan=2 style="background-color:#DDD;height:10px;"> &nbsp;   &nbsp;</td></tr>
			  <tr border=1>
			  <td colspan="2" align="center">	
				 <cfoutput><form action="/#session.cart#?cartid=#session.cartid#&country=#session.address.country_code###checkout" method="get" ></cfoutput>
				 <span class="saleprice"><font size=+1>Select 'Ship To' Country:<cfinclude template="/includes/countries_drop_down.htm" />&nbsp;
		</font>  <input type="submit" name="submit" class="greenbutton" style="width:242px;border:1px solid black;display:inline;" value="Click Here To Continue Check Out &rarr;" /></span> 
		  </form> 
		 <cfelse>
		 <span class="error1">[</span><span class="error2">To Start Check Out Please Shop for Minimum <cfoutput>#format(session.bulkbuyer.minamt)#</cfoutput></span><span class="error1">]</span>
<cfoutput>	<br />	 <div class="green_band"> Shop for #format(500)#  to earn #session.bulkbuyer.fivehundreddiscount#<!--  -->% discount </div><br />
		 <div class="green_band"> Shop for #format(1000)#  to earn #session.bulkbuyer.thousanddiscount#% discount</div>
		 <cfif 0 and arraylen(session.cartitem) LTE 4><br /><br /> <div class="" style="border:2px ##E6Cf84 solid;text-align:left;"><span class="login_link">All our verified wholesale buyers</span> can avail a lower minimum purchase of  #format(application.bulkbuyer.minamt)#. Above #format(application.bulkbuyer.arb_minamt)# you can also avail 3 instalment payment plan.<br />
		 To qualify as our verified wholesale buyer you need to verify your registration. Please do it now [<a href="wholesale_register.cfm" class="side_link">Register</a>]. If you have already registered and not received the verification 
		 <cfif session.bulkbuyer.id contains 'guest'> please fill in your email id here <form action="#session.cart#"><input type="text" name="resendmail" size="30"><input style="background-color:##ACB;display:inline;cursor:pointer;padding:2px;border:2px ridge ##9BA" type="submit" value="Request Verification Email"></form><cfelse><form action="/#session.cart#"><input type="hidden" name="resendmail" value="#session.bulkbuyer.id#" /><input type="submit" style="background-color:##ACB;display:inline;cursor:pointer;padding:2px;border:2px ridge ##9BA" value="Resend Verification Email"></form></cfif> We will resend you the verification number and URL.
		 If you still do not recieve the verification email please do check your spam folder or you can write in to us at cs@semiprecious.com. <br ><div style="text-align:left;margin-left:2px">-Team Semiprecious.com-</div>
		 </div>
		 </cfif>
		  </cfoutput>
		 </cfif>
		 &nbsp;</td></tr>
		 </cfif>
		 </tbody>
          </table></td>
      </tr>
    
   <cfoutput >
      
	  <cfif not totalqty >
        <tr>
          <td colspan="6" class="details"> No Item Bought. Click <a href="index.cfm" class="unnamed1" ALT="start jewelry shopping">Here</a> to Start Shopping.
            <hr />
           <ul class="arrow_ul" style="text-align:left;margin-left:20px;">
		<li>   
		 
		<strong>Lost your cart?</strong>	<span style="color:blue;">No problem at all.</span> Click here to use the cart Id (cart number)or your email id  to get back your earlier cart. Click <a href="/fillcart.cfm"><strong>here</strong></a>
  
            </li>
			<li>
				<form action="" method="get">If you had saved your cart using your email id then please provide the email id here:<input type="text" name="visit_email"> <input type="submit" value="Recall Cart" /> </form> 
			</li>
            
            <li> In case your browser has been set not to accept cookies,                   email us item numbers you want and we will send you a secure 
            web link to pay for them </li><li>OR call us at <cfoutput>#Application.tollfree#</cfoutput> with your                   item numbers.
			</li>
			<li> Cart does not work without cookies but if you think you have cookies ON and empty cart is incorrect please click <a href="/contactus.cfm" target="_self">here</a> and inform us of this error.</li>
			</ul> </td>
        </tr>
      </cfif>
      <!---         <input type="hidden" name="tcredit1" value="#getcredit1.earned#">
        <input type="hidden" name="newearned" value="#getcredit1.newearned#"> --->
    </cfoutput>
  
  	</cfif>
    
  <cfelse>

  <span style="display:block;background-Color:yellow;width:400px;margin-top:10px;padding:10px;border:2px red groove;text-align:center;vertical-align:middle;color:#666600;font-size:12px;">Your Cart is Empty. </span>

  
  <hr>
<ul class="arrow_ul" style="text-align:left;margin-left:20px;">
				<li>   

		<strong>Lost your cart?</strong>	<span style="color:blue;">No problem at all.</span> Click here to use the cart Id (cart number)or your email id  to get back your earlier cart. Click <a href="/fillcart.cfm"><strong>here</strong></a>
  
            </li>
					<li> In case your browser has been set not to accept cookies,                   email us item numbers you want and we will send you a secure 
            web link to pay for them </li><li>OR call us at <cfoutput>#Application.tollfree#</cfoutput> with your                   item numbers.
			</li>
			<li> Cart does not work without cookies but if you think you have cookies ON and empty cart is incorrect please click <a href="/contactus.cfm" target="_self">here</a> and inform us of this error.</li>
			</ul></td></tr> 
            
            </cfif>
			</cfform>    

	<cfelse>
	
  <span style="display:block;background-Color:yellow;width:400px;margin-top:10px;padding:10px;border:2px red groove;text-align:center;vertical-align:middle;color:#666600;font-size:12px;">Your Cart is Empty. </span>
  
  <hr>
<ul class="arrow_ul" style="text-align:left;margin-left:20px;">
		<li>   
				<strong>Lost your cart?</strong>	<span style="color:blue;">No problem at all.</span> You can use the cart Id (cart number)or your email id  to get back your earlier cart. Click <a href="/fillcart.cfm"><strong>here</strong></a>

            </li>
			
            <li> In case your browser has been set not to accept cookies,                   email us item numbers you want and we will send you a secure 
            web link to pay for them </li><li>OR call us at <cfoutput>#Application.tollfree#</cfoutput> with your                   item numbers.
			</li>
			<li> Cart does not work without cookies but if you think you have cookies ON and empty cart is incorrect please click <a href="/contactus.cfm" target="_self">here</a> and inform us of this error.</li>
			</ul>
           </td></tr>
    </cfif>
    
<tr> <td colspan="2"  align="center">
<div style="text-align:center;padding-top:40px;width:98%;background-color:white"><cfinclude template="/mainfooter.cfm"></div></td></tr></table>



<script LANGUAGE="JAVASCRIPT" type="TEXT/JAVASCRIPT">
<cfif isdefined("url.error_msg")>
	alert('Excessive Traffic on Server. Request you to refill shipment details and click on confirm button again.');
</cfif>
function format(expr, decplaces){
var str="" + Math.round (eval(expr) * Math.pow(10,decplaces));
while(str.length <=decplaces){
str= "0" + str}
var decpoint= str.length - decplaces
return str.substring(0,decpoint) + "." + str.substring(decpoint,str.length);}
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
var BrowserDetect = {
	init: function () {
		this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
		this.version = this.searchVersion(navigator.userAgent)
			|| this.searchVersion(navigator.appVersion)
			|| "an unknown version";
		this.OS = this.searchString(this.dataOS) || "an unknown OS";
	},
	searchString: function (data) {
		for (var i=0;i<data.length;i++)	{
			var dataString = data[i].string;
			var dataProp = data[i].prop;
			this.versionSearchString = data[i].versionSearch || data[i].identity;
			if (dataString) {
				if (dataString.indexOf(data[i].subString) != -1)
					return data[i].identity;
			}
			else if (dataProp)
				return data[i].identity;
		}
	},
	searchVersion: function (dataString) {
		var index = dataString.indexOf(this.versionSearchString);
		if (index == -1) return;
		return parseFloat(dataString.substring(index+this.versionSearchString.length+1));
	},
	dataBrowser: [
		{
			string: navigator.userAgent,
			subString: "Chrome",
			identity: "Chrome"
		},
		{ 	string: navigator.userAgent,
			subString: "OmniWeb",
			versionSearch: "OmniWeb/",
			identity: "OmniWeb"
		},
		{
			string: navigator.vendor,
			subString: "Apple",
			identity: "Safari",
			versionSearch: "Version"
		},
		{
			prop: window.opera,
			identity: "Opera"
		},
		{
			string: navigator.vendor,
			subString: "iCab",
			identity: "iCab"
		},
		{
			string: navigator.vendor,
			subString: "KDE",
			identity: "Konqueror"
		},
		{
			string: navigator.userAgent,
			subString: "Firefox",
			identity: "Firefox"
		},
		{
			string: navigator.vendor,
			subString: "Camino",
			identity: "Camino"
		},
		{		// for newer Netscapes (6+)
			string: navigator.userAgent,
			subString: "Netscape",
			identity: "Netscape"
		},
		{
			string: navigator.userAgent,
			subString: "MSIE",
			identity: "Explorer",
			versionSearch: "MSIE"
		},
		{
			string: navigator.userAgent,
			subString: "Gecko",
			identity: "Mozilla",
			versionSearch: "rv"
		},
		{ 		// for older Netscapes (4-)
			string: navigator.userAgent,
			subString: "Mozilla",
			identity: "Netscape",
			versionSearch: "Mozilla"
		}
	],
	dataOS : [
		{
			string: navigator.platform,
			subString: "Win",
			identity: "Windows"
		},
		{
			string: navigator.platform,
			subString: "Mac",
			identity: "Mac"
		},
		{
			   string: navigator.userAgent,
			   subString: "iPhone",
			   identity: "iPhone/iPod"
	    },
		{
			string: navigator.platform,
			subString: "Linux",
			identity: "Linux"
		}
	]

};



function grandtotal(form)
	{
	var stotal = 0;
	var totalQnty = 0;
	var maxj = form.j.value;
	var gtotal = 0;

for (var k=1 ; k <= maxj; k++) {
var pr ="price" + k ;
var Qnty ="quantity" + k ;
totalQnty = totalQnty*1 + document.getElementById(Qnty).value*1;
stotal = (document.getElementById(pr).value*document.getElementById(Qnty).value + stotal*1);
}
// alert(0);
<cfif session.bulkbuyer.id neq "" or cgi.server_name contains "wholesale">
// form.shipping.value =  <cfoutput>#handlingcharges#</cfoutput> ;

gtotal = document.getElementById('shipping').value*1 + stotal;
form.discount.value=0;
form.subTotal.value=format(stotal,2);
if (form.nonUS)
{
	
	
gtotal = document.getElementById('shipping').value*1 + stotal*1 + document.getElementById('SpecialHandling').value*1  + form.nonUS.value*1 - form.loyaltycredit.value*1;
}
else
{
gtotal = document.getElementById('shipping').value*1 + stotal*1 + document.getElementById('SpecialHandling').value*1 - form.loyaltycredit.value*1;
}
//alert(gtotal);
<cfelse>
gtotal = form.shipping.value*1 + stotal;
form.discount.value=0;
form.subTotal.value=format(stotal,2);
if (form.nonUS)
{
gtotal = form.shipping.value*1 + stotal*1 + form.SpecialHandling.value*1 + form.GiftWrap.value*1 - form.loyaltycredit.value*1 + form.nonUS.value*1;
}
else
{
gtotal = form.shipping.value*1 + stotal*1 + form.SpecialHandling.value*1 + form.GiftWrap.value*1 - form.loyaltycredit.value*1;
}
</cfif>
form.GrandTotal.value=format(gtotal,2);

if (totalQnty < 2)
{
form.discount.value = 0};

}

function MM_callJS(jsStr) { //v2.0
  return eval(jsStr)
}

<cfif len(cart_msg)>
alert('<cfoutput>#cart_msg#</cfoutput>');	
</cfif>
//-->
</script>
</div>
</div>
</BODY>

</HTML>

<cfcatch type="any">
<!---	<cfset cfAdmin=createObject("component", "cfide.adminapi.administrator")>
<cfset isLoggedIn=cfAdmin.login("prec1@us")>

<cfset setDSN=createObject("component","CFIDE.adminapi.datasource")>
<cfinvoke component="sptm" method="stopOdbcService">

<cfinvoke component="sptm" method="startOdbcService">
	<cfinvoke component="gemssql" method="stopOdbcService">

<cfinvoke component="gemssql" method="startOdbcService">
	--->
	<cfoutput>#cfcatch.message#, #cfcatch.extendedinfo# #cfcatch.detail#
<cfif isdefined("cfcatch.sql")>
#cfcatch.sql#
</cfif>
	</cfoutput>
	<cfdump var="#cfcatch.TagContext#">
	</cfcatch>
	</cftry>
	
	
	
	
	
	
	
	
	
	
	
	