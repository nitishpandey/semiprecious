
<CFPARAM NAME="session.bulkbuyer.minamt" DEFAULT= "250">
<cfinclude template=setup.cfm>
 <CFPARAM NAME="description" DEFAULT=""> <CFPARAM NAME="shipping" DEFAULT="3.00">
 <cfparam name="form.optionid" default="0">
 <cfif isdefined("form.ajaxcheck") >
 <cfset session.ajaxcheck = form.ajaxcheck />
 </cfif>
<cfset handlingcharges = 10.00> <!--- also set in confirmation page --->
 <cfparam default="100" name="invent">
<cfparam default="0" name="valueadd" />
<CFPARAM NAME="Price" DEFAULT= "">
<CFPARAM NAME="category" DEFAULT= "">
<cfparam name="form.set" default="0">
<cfparam name="form.style" default="0">
<CFPARAM NAME="newitem" DEFAULT= "">
<CFPARAM NAME="cart" DEFAULT= "">
<cfparam name="volumediscount" default="0.975" />
<CFPARAM NAME="bought" DEFAULT="">
<CFPARAM NAME="quantity" DEFAULT="1" type="numeric" >
<CFPARAM NAME="j" DEFAULT=0>
<CFPARAM NAME="newQty" DEFAULT="">
<CFPARAM NAME="TotalQty" DEFAULT=0>
<cfparam name="session.gallery" default="list"> <!--- used to determine on cart page whether the buyer should be routed to list.cfm or listcluster.cfm when he clicks on continue shopping --->
<cfset saletotal = 0> <!--- this has to be set then why use cfparam? this is aboviouslfy faster --->
<CFIF newQty NEQ "">
  <cfset session.cartitem[newitem][4]= newQty>
</CFIF>
<!---<CFSET session.cartitems = listDeleteAt(session.cartitems,delAt)>--->
<!--- one less than actual qty --->
<CFINCLUDE TEMPLATE="setup.cfm">
<!--- dont do the logics done below on cartid because that is always set to 1 on application.cfm page for
reasons of not knowing where all it may be required. it could not be removed after uniquecartid was introduced
--->

<cfset session.cartid = 0>

<!---  setting to repeat  does not in anyway hamper 
the processing of the order by the customer, the trusted 3rd party or you the vendor.
it only tells that the carts were not abandoned from the confirmation page   --->

<!--- to go to confirmation page one has to in each and every case of ecentric shopping
come through cart.cfm  and there this variable will be set to 0  . thus refresh of confirmation  page or
return to confirm page from a paypal's first page will not cause cartid to be incremented --->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!--- <CFQUERY DATASOURCE="semiprecious" NAME="getcredit1">
SELECT earned, newearned FROM memberinfo WHERE email='#session.mail#' 
</CFQUERY> --->
<HTML>
<HEAD>
<TITLE>Jewelry Items selected on Semiprecious.com</TITLE>
<link rel="shortcut icon" href="/favicon.ico" />
<script LANGUAGE=JAVASCRIPT>
<!--

<!--
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
<cfif isdefined("session.bulkbuyer.id")>
texas = 1 ;
</cfif>
function texaschecked() {
texas = 1;
return ;
}
function goProcess(inString){
texas = 1
	if(inString=='Proceed to Checkout'){
	//if (texas == 0 )
	 //{
	 //alert("Please specify if you are buying from the state of Texas in USA or outside of Texas");
	 //return false;
	// }
self.document.cartform.action="https://www624.ssldomain.com/semiprecious/confirmation.cfm";
	self.document.cartform.submit();
	return;
	}
		if(inString=='Save Cart'){
self.document.cartform.action="confirmation.cfm?save=1";
	self.document.cartform.submit();
	return;
	}
	if(inString=='Click here to Buy More Items'){
<cfif session.gallery is 'listcluster' and newitem neq ''>
	<cfoutput>self.document.cartform.action='jewelry_item.cfm?newitem=#newitem#';</cfoutput>
<cfelse>
	<cfoutput>self.document.cartform.action='gemstone_jewelry_gallery.cfm?#session.filter#';</cfoutput>
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

for (var k=1 ; k <= maxj; k++) {
var pr =eval("form" + ".price" + k + ".value");
var Qnty =eval("form" + ".quantity" + k + ".value");
totalQnty = totalQnty*1 + Qnty*1;
stotal = (pr*Qnty + stotal*1);
}
// alert(0);
<cfif isdefined("session.bulkbuyer.id")>

form.shipping.value =  <cfoutput>#handlingcharges#</cfoutput> ;

gtotal = form.shipping.value*1 + stotal;
form.discount.value=0;

//stotal= stotal*(1-(form.discount.value/100) ) - form.loyaltycredit.value;
form.subTotal.value=format(stotal,2);
//alert(form.shipping.value*1);
//alert(form.SpecialHandling.value*1);
//alert( form.GiftWrap.value*1);
//alert(form.nonUS.value*1);
gtotal = form.shipping.value*1 + stotal*1 + form.SpecialHandling.value*1 + form.GiftWrap.value*1 + form.nonUS.value*1;
//alert(gtotal);
<cfelse>

if (totalQnty == 0) {
form.shipping.value =  3.00}
if (totalQnty == 1) {
form.shipping.value =  3.00}
if (totalQnty ==2) {
form.shipping.value = 3.00}
if (totalQnty > 2) {
form.shipping.value = 3.00}

if (stotal > 69) {
form.shipping.value =  0.00}

gtotal = form.shipping.value*1 + stotal;
form.discount.value=0;

//stotal= stotal*(1-(form.discount.value/100) ) - form.loyaltycredit.value;
form.subTotal.value=format(stotal,2);
//alert(form.shipping.value*1);
//alert(form.SpecialHandling.value*1);
//alert( form.GiftWrap.value*1);
//alert(form.nonUS.value*1);
gtotal = form.shipping.value*1 + stotal*1 + form.SpecialHandling.value*1 + form.GiftWrap.value*1 + form.nonUS.value*1;
//alert(gtotal);
//
//if (form.texas.checked)
//	{
//	gtotal = gtotal  + form.texas.value*1;
//}

</cfif>
form.GrandTotal.value=format(gtotal,2);

if (totalQnty < 2)
{
form.discount.value = 0};

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
//-->
</script>
<style type="text/css">
<!--
td.saleprice {
color:maroon;
}
<cfif isdefined("session.bulkbuyer.id")>
td.price {
color:maroon;
}
</cfif>
.small {
	font: italic 9px "Times New Roman", Times, serif;
}

-->
</style>
<cfif session.mail is 'nitishpandey@indiatimes.com'>
<link href="styles/npstyles11.css" rel="stylesheet" type="text/css" />
<cfelse>
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css" />
</cfif>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
</HEAD>
<BODY BGCOLOR="white" leftmargin="0" topmargin='0'>
<div align="center">
<cfset layerpos = 242 + 65*arraylen(session.cartitem) />
<div id="giftmessage" style="position:absolute; left:40px; top:<cfoutput>#layerpos#</cfoutput>px; width:343px; height:94px; z-index:3; visibility: hidden; background-color: #EEEE99; layer-background-color: #999933; border: 2px groove #666666;padding:2px;"> 
  The Message that you type here will be printed and sent along with the Shipment of the gift. 
    Please keep the message sweet and short (250 alphabets). Thankyou.
  <p onMouseOver="MM_showHideLayers('giftmessage','','hide')">[CLOSE] </p>
</div>
<div id="looksethint" style="position:absolute; font-size:12px;left:200px; top:160px; width:560px; height:86px; z-index:3; visibility: hidden;  layer-background-color: #999933; border: 1px groove #666666;padding:2px;border-top:4px solid #666600;background-color:white;text-align:left;"> 
<ul><li><span class="lookinline">Click on  = (equal) sign to see some of the jewelry items  similar to this item.</span></li>
<li><span class="setinline">Click on orange + (plus)  sign to  see some of the jewelry that can  make a set with this item.</span>
</li></ul>
  <span onMouseOver="MM_showHideLayers('looksethint','','hide')"><span   class="greenbutton">[Hide]</span> </span>
</div>
<CFINCLUDE TEMPLATE="header.cfm"> 
      <CFIF bought IS "buy" and newitem NEQ "">
  <Cfif session.cartitem[1][1] EQ 0 >
    <CFSET session.cartitem[1][1] =newitem>
  <CFSET session.cartitem[1][2] =category>
  <CFSET session.cartitem[1][3] =price>
  <CFSET session.cartitem[1][4] =quantity>
  <CFSET session.cartitem[1][5] =optionid>
<cfset added = 1>
  <cfelse>
<cfset added = 0>
	    <CFLOOP  INDEX="j"  from="1" to="#ArrayLen(session.cartitem)#">
           <cfif session.cartitem[j][1] eq newitem and  session.cartitem[j][5] eq optionid >
                  <CFSET session.cartitem[j][2] =category> <!--- only qty is required but cate and price are reentered just to make sure --->
                 <CFSET session.cartitem[j ][3] =price>
                 <CFSET session.cartitem[j][4] =quantity>
		  		<cfset added = 1>
		<!-- Added -->
		<cfbreak />
      </CFIF>
	  </cfloop>
	      <cfif not added >
            <CFLOOP  INDEX="j"  from="1" to="#ArrayLen(session.cartitem)#">
             <cfif  session.cartitem[j][4] eq 0> <!--- possibly  a deleted item --->
             <CFSET session.cartitem[j][1] =newitem>
        <CFSET session.cartitem[j][2] =category>
        <CFSET session.cartitem[j ][3] =price>
        <CFSET session.cartitem[j][4] =quantity>
		 <CFSET session.cartitem[j][5] =optionid>
  		<cfset added = 1>
		<!-- Added -->
		<cfbreak />
      </CFIF>
	  </cfloop>
</cfif>
    <cfif not added>
<!---New Added
<cfoutput>#arraylen(session.cartitem)#</cfoutput> --->
<cfset cartal = arraylen(session.cartitem) + 1>
	   <CFSET session.cartitem[cartal][1] =newitem>
        <CFSET session.cartitem[cartal][2] =category>
        <CFSET session.cartitem[cartal][3] =price>
          <CFSET session.cartitem[cartal][4] =quantity>
		   <CFSET session.cartitem[cartal][5] =optionid>
  <cfset added = 1>
      </cfif>
	  </Cfif>
    </cfif> 
   <div style="width:800px;" align="left"><h3><cf_steps step="3" /></h3> &nbsp; </div>
 <table border="0" cellpadding="0"  style="position:relative;margin-left:2px;"  width="794px">
  <tr>
 <td valign="top" align="center">
   <TABLE BORDER="0"   align="center" width="794px">
    <tr> 
         <TD align="center"> <TABLE bordercolor="#AAAA99" style="border:1px #666600 solid;" cellspacing="0" align="center"  >
              <tr class="greenbutton"> 
              <TH width="27%">Item </TH  >
			  <TH width="16%">Picture</TH>
               <TH width="5%">[ <span id="j"  style="text-decoration:underline;color:red;" onClick="MM_showHideLayers('looksethint','','show')">?</span> ]</TH>
              <TH width="12%">Price</TH>
              <TH width="16%">Quantity</TH>
              <TH width="8%">Amount</TH>
                <TH width="10%" align="left">Remove <a href="http://www.semiprecious.com/cartcontrol/cartmonitor.cfc?method=emptycart" onClick="javascript:return confirm('All items will be removed from the cart!');"><font color="#FF0000">All</font></a></TH>
            </tr>   <CFSET grandTotal=0>
			<cfset session.grandtotal = 0>
            <CFSET subTotal=0>
            <CFSET amounts=0>
            <CFSET TotalQty=0>
            <cfset emptyitems = 0>
						<cfif session.cartitem[1][1] is not 0>
                       	<cfform action="" method="post" name="cartform">
                          <CFLOOP  INDEX="j"  from="1" to="#ArrayLen(session.cartitem)#">
						<cfset valueadd =0>
		 		   <cfif session.cartitem[j][4] gt 0>
                <CFQUERY NAME="qprice" DATASOURCE="gemssql">
	            SELECT left(description,100) +'..' as description,clustercount,status,storage,thumblink FROM Items WHERE   newitem = #session.cartitem[j][1]# 
                </CFQUERY>
				<cfif  isdefined("text")>
						<cfset text = text & ','  & session.cartitem[j][1] & ":" & session.cartitem[j][4] & ":" & session.cartitem[j][5]>
				<cfelse>
				        <cfset text = session.cartitem[j][1] & ":" & session.cartitem[j][4] & ":" & session.cartitem[j][5]>
				</cfif>
     <tr> 
                  <cfoutput> 
                    <TD  class="rowb" align='center'  > <span  class="listdescr">(ID:#session.cartitem[j][1]#)#qprice.description# 
					<cfif session.cartitem[j][5]>
							   <cfquery datasource="gemssql" name="opts">
      		select description,  valueadd from options where itemid = #session.cartitem[j][1]# and optionid = #session.cartitem[j][5]#
				</cfquery>
				<cfif isdefined("session.bulkbuyer.id")>
				<cfif isnumeric(opts.valueadd)>
				<cfset valueadd = opts.valueadd/2 >
				</cfif>
				<Cfset volumediscount = 0.975 />
				<!---- volumediscount is given on 3 or more items. this 2.5 % for wholesale and  5 for others. this is mentioned in the login pages so if you change take note of this --->
				
								<cfelse>
				<cfif isnumeric(opts.valueadd)>
				<cfset valueadd = opts.valueadd>
				</cfif>
				<Cfset volumediscount = 0.95 />
				</cfif>
					<span class="optionsinline">[#opts.description#]</span>
							</cfif> </span>
					  <input type="hidden" name="itemnumber#j#" value="#session.cartitem[j][1]#">
					</TD>
                    <td  class="rowb" align="left"> 
					<cfset TotalQty=session.cartitem[j][4]+TotalQty> 
					<cfif qprice.storage is 'pippin'>
							<img src=#qprice.thumblink# height="60">
					<cfelse>
                          <img src="images/# session.cartitem[j][2]#/thumb/# session.cartitem[j][1]#.jpg" height="60"> 
					</cfif>
                      <input type="hidden" name="category#j#" value="#session.cartitem[j][2]#"> 
                      <input type="hidden" name="quantity#j#" value="#session.cartitem[j][4]#">
					  </td><td  class="rowb" align="center" valign="middle">
					<cfswitch expression="#qprice.clustercount#"><cfcase value="1"><span class="lookinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=look" >=</a></span>
					</cfcase><cfcase value="2"><span class="setinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=set">+</a></span></cfcase><cfcase value="3"><span class="lookinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=look">=</a></span><hr />

<span class="setinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=set">+</a></span></cfcase><cfdefaultcase >&nbsp;</cfdefaultcase></cfswitch>
					</td>
					    <td  class="rowb" align="center">  
   <cfif session.cartitem[j][4] GT 2>
	       <cfset valuewithoption= volumediscount*(session.cartitem[j][3] + valueadd)>*
<cfelse>
	       <cfset valuewithoption=round(session.cartitem[j][3])*1 + valueadd*1>
		   </cfif>
	       <cfset amounts=#evaluate(valuewithoption*session.cartitem[j][4])#>  

						<cfif qprice.status is 3>
					 <cfset saletotal = saletotal + amounts >
                   <span class="saleprice">     
					 <cfelse>
<span                 class="price">     
				 </cfif>       
					  #format(valuewithoption)# </span><input type="hidden" name="price#j#" Value="#DecimalFormat(valuewithoption)#">   </td>
               
                    <td  class="rowb" align="center">#session.cartitem[j][4]#&nbsp;&nbsp;&nbsp;&nbsp;<font size="2"><a href='jewelry_item.cfm?itemnumber=#session.cartitem[j][1]#&editcart=#j#&existqty=#session.cartitem[j][4]#&optionid=#session.cartitem[j][5]#'>Edit</a></font></td>
                    <td  class="rowb">#format(amounts)# <input type="hidden" name="amount#j#" Value="#amounts#"> 
                    </td>
                    <td  class="rowb"><a href='cart.cfm?newQty=0&newitem=#j#&optionid=#session.cartitem[j][5]#' ><font color="##CC0000">Remove</font></a></td>
                  </cfoutput> </tr>
				 
              <cfset subTotal= amounts + subTotal>
                <cfelse>
                <!--- since we are now adding values with 0 value we dont do this  <cfset emptyitems = emptyitems + 1> --->
                <cfoutput> 
                  <input type="hidden" name="amount#j#" Value="0">
                  <input type="hidden" name="price#j#" Value="0">
                  <input type="hidden" name="quantity#j#" Value="0">
                </cfoutput> 
              </cfif>
            </CFLOOP>
			<cfoutput> <cfif quantity GT invent ><tr><td class="error1" colspan="7">For item #newitem# only #invent# in stock.  #evaluate(quantity - invent)# can ship in 2 - 4 weeks. </td></tr>
				  </cfif>
<!---   <TR> 
                <TD class="error1" colspan="6"> WE ARE UPGRADING- NOT SHIPPING 
                  TILL 12 July! GET 5% DISCOUNT FOR THE DELAY </TD>
              </TR> --->
            <cfif totalQty is 0>
<tr><td colspan="7">
              <h4>Sorry, cart is empty....</h4> Use the Product Categories on top banner or 	  <a href="gemstone_jewelry_gallery.cfm?#session.filter#">Click here to shop</a>.<br>  
		<cfif isdefined("session.cartinfile")>
			<cftry>
		 	  <cffile action="delete"  file="d:\inetpub\semiprecious\carts\#session.cartinfile#"  />
			  <cfcatch type="any"> 
              </cfcatch>
			  </cftry>
		 <cfcookie 
           name = "cartinfile"
           expires = "now"        >
</cfif>
<hr />     
   <span class="row2">If you are returning with a cartid , click <a href="fillcart.cfm"><strong>here</strong></a></span> <br>
                  Note: In case your browser has been set not to accept cookies,                   email us item numbers you want and we will send you a secure 
                  web link to pay for them OR call us at #Application.tollfree# with your                   item numbers. Cart does not work without cookies<br>
If you think you have cookies ON and empty cart is incorrect please click <a href="contactus.cfm" target="_self">here</a> and inform us of this error.
</td></tr></table></td></tr></table></td></tr></table>
<cfinclude template="footer.htm">
              <cfabort />
            </cfif>
			</cfoutput>
			<cfset session.totalqty = Variables.totalqty />
                   <cfif totalQty is 1>
                       <cfset shipping  = 3.00>
              <cfelseif totalQty is 2>
              <cfset shipping =3.00>
              <cfelseif totalQty gt 2>
              <cfset shipping  = 3.00>
              
              <cfif subtotal  GT 69><cfset shipping=0></cfif>
              <!---
<cfelseif j is 4>
<cfset shipping  = 2.00>
<cfelseif j is 5>
<cfset shipping  = 1.00>
<cfelseif j GT 5>
<cfset shipping  = 0.00>
--->
            </cfif>
			<cfif not isdefined("session.cartinfile")>
		     	<cfif isdefined("session.bulkbuyer.id")>

			      <cfset  session.cartinfile = session.bulkbuyer.id />
		         	<cfelseif  len(session.mail)>
		             	<cfset session.cartinfile = session.mail />
               	<cfelse>
		     	<cfset session.cartinfile = datepart('d',now()) & datepart('m',now()) &  timeformat(now(),'HHmm') & randrange(10,50) & '.txt'>
		     <!---	<cfif session.bulkbuyer.id is 0><cfset variables.cartinfile="guest@mail.com"></cfif>--->
			</cfif>
			</cfif>
		<cfset Variables.cartinfile = session.cartinfile>		
		<!---
			<cffile action="write" nameconflict="overwrite" file="d:\inetpub\semiprecious\carts\#Variables.cartinfile#"   addnewline="no" output="#text#"  />
			<cfcookie 
   name = "cartinfile"
   value = "#Variables.cartinfile#"
   expires = "20"
   secure = "No" />
   --->
<!--- <cfif isdefined("cookie.cart")>
<cfoutput>Set this cookei #cookie.cart#.</cfoutput>
</cfif> --->
            <cfset GrandTotal= shipping + subTotal>
			<cfif isdefined("session.india") and session.India is 1>
													<tr bordercolor="#FFFFFF">
    <td colspan="3"   align="center"><a href="gemstone_jewelry_gallery.cfm?<cfoutput>#session.filter#</cfoutput>">Look around for more stuff</a></td>

    <td colspan="2" bgcolor="#FFFFFF" align="center"><a href="indiaconfirmation.cfm">Select Payment Mode</a></td>
  </tr>
					<cfelse>
		<tr   >
                
    <td colspan="4" height="2"  align="left"   class="greenbutton"> 
        Your confidence is important to us. Any concern?<strong> Call us now: <cfoutput>#Application.tollfree#</cfoutput> </strong>      <!---       <cfif  not (form.style + form.set)>
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
      </cfif> ---> </td>
                <td colspan="3"  align="center" bgcolor="#FFFFFF">
<input name="button2" type="button" class="greenbutton" style="font-weight:bold" onclick="javascript:goProcess('Click here to Buy More Items')" value="Continue Shopping"></td>  </tr></table> 
</td></tr><tr><td align="center">
<table align="center"  border="1"  cellspacing="0" bordercolor="#bbbb99" width="792px" style="border:0px black ridge;">
       	      <tr> 
            <!--   <td align="center"><input name="button" type="button" class="greenbutton" onclick="javascript:goProcess('Click here to Buy More Items')" value="Continue Shopping"> 
              </td> -->
            <td  align="right" nowrap> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Standard Shipping:</td>
            <td  align="right" nowrap>      <input type="hidden" size="4" name="shipping"    id="shipping" onFocus="javascript:alert('Sorry, this task is not allowed.');this.blur()" value="<cfif  isdefined("session.bulkbuyer.id")><cfoutput>$#handlingcharges#</cfoutput><Cfelse><cfoutput>$#shipping#</cfoutput></cfif>"><cfif  isdefined("session.bulkbuyer.id")><cfoutput>$#handlingcharges#</cfoutput><cfelse>-----------------(free for $70+ order) ---------------------- :<cfoutput>$#shipping#</cfoutput></cfif>
            </td>
          </tr>
<!--           <tr> 
            <td align="center" valign="middle" bgcolor="#CCCC99"><font face=arial narror size=2> 
              <script src="http://js.squaretrade.com/REL026/026269634.js"></script>
              </font></td> 
            <td colspan="2" align="left" bgcolor="#CCCC99" style="padding-bottom:2px;"> <ul>
                <li> Finished with shopping? Make your shipping choices if any 
                  in the form below.</li>
                <li>Then click on '<strong>Start Check Out</strong>' button to 
                  '<strong>finalize' </strong>your cart. </li>
                <li>With the 'finalized cart' you will see exact total and <strong>'secure' 
                  payment choices.</strong> </li>
              </ul></td>
          </tr>-->
         
                <input type="hidden" size='3' name="discount" value="0">
 <!---    when removing delayed shipping above hidden variable is to be shown and toggle in other situation ----> 
		  <cfset newsubtotal = subtotal /> 
          <cfif isdefined("session.giftid") and session.giftamt GT 0>
            <tr> 
              <td  align="right" valign="middle"  >Gift 
                Amt (#):</td>
              <td align="right" valign="middle"> 
                $<cfoutput>#session.giftamt#</cfoutput>.00 </td>
              <input type="hidden" value="gift" name="couponcode">
            </tr>
            <cfelseif isdefined("session.bulkbuyer.id")>  
					
 	<cfset shipping = handlingcharges /> <tr> 
            <td  align='right'>Shipping Region: </td>
            <td align="right"> 
              <cfselect name="nonUS" onclick="javascript:grandtotal(this.form)" required="yes" message="Please select Shipping to." >
                <option value="0.00" >USA/Greenland: $0.00</option>
                <option value="5.00" >Canada: $5.00</option>
                <option value="7.00" >South America: $7.00</option>
                <option value="8.00" >UK/Europe (5  days): $8.00</option>
                <option value="8.00" >Australia (7  days): $8.00</option>
                <option value="25.00">Asia/Africa (7 to 15 days): $25.00</option>
              </cfselect> </td>
          </tr> 
              <input type="hidden" value="regwsale" name="couponcode">
			<input type="hidden" name="GiftWrap" value="0.00" />
			<input type="hidden" name="giftmsg" value="na" />
		   <cfelse>   
			<cfif isdefined("url.texaserror")><tr class="error" ><cfelse>			<tr></cfif>
              <td align="right">Buying from Texas? (<span class="error">*</span>):</td>
              <td align="right">We will pay Sales Tax on your behalf.
			   <input type="hidden"  name="texas" value="0"  onClick="javascript:texaschecked();"/>
			  
			  </td></tr>
 <tr> 
            <td  align='right'>Specify Shipping Region: </td>
            <td align="right"> 
              <cfselect name="nonUS" onclick="javascript:grandtotal(this.form)" required="yes" message="Please select Shipping to." >
<option value="0.00" >USA/Greenland: Add $0.00</option>
                <option value="1.00" >Canada: Add $1.00</option>
                <option value="2.00" >Europe/Australia (7 to 10 days): Add $2.00</option>
                <option value="10.00">Asia/Africa (7 to 15 days): Add $10.00</option>
              </cfselect> </td>
          </tr>
  		  <tr> 
            <td  align="right"> 
                Shipping Upgrade<b>(Only for USA): </b> 
		</td>
            <td  align="right"> <select name="SpecialHandling" onclick="javascript:grandtotal(this.form)">
                <option value="0.00" selected>USPS with tracking (3 to 6 days) + $0.00</option>
                <option value="3.00" >Priority Mail+delivery confirmation: + $3.00</option>
                <option value="9.00">Express Mail (Overnight/2nd day): + $9.00</option>
                <option value="29.00">Fedex (Overnight Most Places): + $29.00</option>
                <option value="39.00">Fedex (Overnight Remote Places): + $39.00</option>
              </select>
			<cfinclude template=vacation.inc> </td>
          </tr> 
		
		      <tr> 
            <td  align='right' nowrap><img src="/images/gift.gif" align="absmiddle" vspace="0" hspace="0" border="0"   height="22" style="display:inline;" />&nbsp;&nbsp;<font color="#000000">Gift Wrap</font>: 
            </td>
              <td align="right"  >
                 <select name="GiftWrap" onclick="javascript:grandtotal(this.form)">
                  <option value="0.00" selected>No Gift Bag</option>
                  <option value="1.00" >Red Velvet Gift Bag: $1.00</option>
                </select> </td>
          </tr>
		  <tr id="giftmsg">
            <td align="right">
              Message With Gift <span id="j"  style="text-decoration:underline" onClick="MM_showHideLayers('giftmessage','','show')">[?]</span>:</td>
            <td align="right" nowrap >
              <input type="text" name="giftmsg"  onClick="javascript:this.value='';return;"value="" size="50" maxlength="245" />
            </td>
          </tr>
<cfif len(session.mail)>
            <tr> 
              <td align="right"> 
                Purchase Credit <a href="viewinvitecredits.cfm" alt="friends invited for jewelry site">[?]</a></td>
              <td align="right">(You  can use upto 20% of current order value) <font color="#CC0000">
                <cfinvoke component="invitationandcredit" method="usecredit" returnvariable="newsubtotal" >
                  <cfinvokeargument name="amounttopay" value="#subtotal#">
                <cfinvokeargument name="saleitemamount" value="#saletotal#">
                  <cfinvokeargument name="finalize" value="#session.cartid#"> <!--- this is basically always 0 but comes into play in confirmation page --->
                </cfinvoke></font></td>
			</tr>
			<cfelse>
			         <!---   <tr> 
              <td  align="right" valign="middle" nowrap  ><font color="#000000">Affiliate/Discount 
                code</font>:</td>
              <td align="right" valign="middle"> 
                <input name="couponcode" type="text" class="inputtext" value="" size="12" maxlength="18"> 
              </td>
            </tr>--->
			</cfif>
          </cfif>               <cfoutput>
		   <input type="hidden"  name="loyaltycredit" value="#decimalformat(evaluate(subtotal - newsubtotal))#">
		   	<cfset subtotal = newsubtotal />
            <input type="hidden"  name="subTotal" value="#decimalformat(subTotal)#"></cfoutput>

          <tr>
		   <tr> 
              <td  align="right" valign="middle" nowrap  ><font color="#000000">Affiliate/Discount 
                code</font>:</td>
              <td align="right" valign="middle"> 
                <input name="couponcode" type="text" class="inputtext" value="" size="12" maxlength="18"> 
              </td>
            </tr> 
            <td   align='right' valign="middle"><b><font color="#B00000">Grand 
              Total</font> :</b></td>
            <td align="right" valign="middle"><font size=1>(Including Shipping & Tax)</font> $ 
              <input class="inputtext" name="GrandTotal" type="text"  onFocus="javascript:alert('Sorry, this task is not allowed.');this.blur()" value="<cfoutput>#decimalformat(evaluate(subTotal + shipping))#</cfoutput>" size="6" maxlength="9"> 
			  <cfset session.grandtotal = grandtotal>
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td align=right>Note to shippers: (optional)</td><td align='right'>  <input type="text" name="note" size=80 maxlength="245" /></td>
          </tr>
          <input type="hidden" name="j" value="<cfoutput>#evaluate(ArrayLen(session.cartitem) - emptyitems)#</cfoutput>">
          <tr bgcolor="#FFFFFF"> 
            <td  colspan="2" align='center'> 
<input name="button" type="button" size=20 class="greenbutton" onClick="javascript:goProcess('Proceed to Checkout')" value="Finalize cart and select secure payment option"> 
</td>
          </tr>
	  <tr><td colspan=2></td></tr>
	  <!---
	  <tr bgcolor="#FFFFFF"> <td colspan="2" align="center">
 <input name="button" type="button" class="greenbutton"  onClick="javascript:goProcess('Save Cart')" value='Save Cart for Later'> 
</td>
          </tr>--->
        <!--   <tr> 
            <td colspan="2"><ul>
                <li><strong>*</strong>: Discount will be applied when you finalize 
                  your cart at checkout but before payment.</li>
                <li><strong>#</strong>: Gift Certificate Amount and basic shipping 
                  will be reduced from your amount at checkout but before payment.</li>
              </ul></td>
          </tr>
         --></table>
      
 
</td>
      </tr></cfif>
    </TABLE></td></tr>
      <cfoutput> 
        <cfif not totalqty>
		<tr><td colspan="6" class="details">
          No Item Bought. Click <a href="index.cfm" class="unnamed1" alt="start jewelry shopping">Here</a> 
          to Start Shopping. 
          <hr> <cfif isdefined("session.cartinfile")>
			<cftry>
			<cfcookie 
           name = "cartinfile"
           expires = "now"        >
			  <cffile action="delete"  file="d:\inetpub\semiprecious\carts\#session.cartinfile#"  />
			  <cfcatch type="any"> You can use the product categories on top navigator to make a specific choice.<br>
</cfcatch></cftry>
						  <cfcookie 
   name = "cartinfile"
   expires = "now"
>
</cfif>
          <br>
          In case your browser has been set not to accept cookies, to order without           cookies, email us item numbers you want and <br>
        we will send you a secure web link to pay for them OR call us at #Application.tollfree#         with your item numbers. Cart does not work without cookies<br>
          If you think you have cookies ON and empty cart is incorrect please           click <a href="contactus.cfm" target="_self">here</a> and inform us 
          of this error.<br>
          <br>
          <span class="row2">If you are returning with a cartid , click <a href="fillcart.cfm"><strong>here</strong></a></span> 
          . </td></tr>
        </cfif>
<!---         <input type="hidden" name="tcredit1" value="#getcredit1.earned#">
        <input type="hidden" name="newearned" value="#getcredit1.newearned#"> --->
      </cfoutput> </cfform> </td>
  </Tr></table> <cfelse></td></tr></table>
<span style="display:block;backgroundColor:yellow;width:400px;margin-top:10px;padding:10px;border:2px red groove;text-align:center;vertical-align:middle;color:#666600;font-size:12px;">Your Cart is empty. Click <a href="simpleloginform.cfm?subcat=silver" class="unnamed1">here</a> to Start 
Shopping. </span>
<hr>
<br>
In case your browser has been set not to accept cookies and you wish to order without cookies, email us item numbers you want and 
we will send you a secure web link to pay for them OR call us at <cfoutput>#Application.tollfree#</cfoutput> with your item numbers. Cart does not work without cookies.<br>
If you think you have cookies ON and empty cart is incorrect please click <a href="contactus.cfm" target="_self">here</a> 
and inform us of this error. <br>
<br>
<span class="row2">If you are returning with a cartid , click <a href="fillcart.cfm">here</a></span> </cfif> 
<!--- <!-- 	<cfinclude template="images.cfm"> -->  --->
<span style="font-color:white;color:white;">......</span>
<!---
<center><table><tr><td><!-- Begin Official PayPal Seal --><a href="https://www.paypal.com/us/verified/pal=anup%40semiprecious%2ecom" target="_blank"><img src="http://www.paypal.com/en_US/i/icon/verification_seal.gif" border="0" alt="Official PayPal Seal"></A><!-- End Official PayPal Seal --></td><td><img src=https://www.paypalobjects.com/en_US/i/logo/verisign.gif></td><td></td></tr></table> </center>
--->
    

<cfoutput><script language="JavaScript1.1">
document.getElementById("cart").style.color = "maroon";
		
  document.getElementById("cart").style.textDecoration = "none" ;
  
<cfif quantity GT invent>
<cfset bal = quantity - invent>
alert("For item #newitem# : #quantity# ordered, #invent#  will ship immediately,  #bal#  in 2-4 weeks.");
</cfif>

<cfif isdefined("session.bulkbuyer.id")>
 	document.getElementById("wholesale").style.color = "maroon";
    document.getElementById("wholesale").style.textDecoration = "none" ;

</cfif>
	
</script>

</cfoutput>
</div>
<center><a href="http://www.centraltx.bbb.org/commonreport.html?bid=90026075"><img src="images/bblogo.gif" width="80" height="126"></a></center>
<cfinclude template='adminfooter.cfm'>
<!-- Start of StatCounter Code -->
<script type="text/javascript">
var sc_project=3450263; 
var sc_invisible=0; 
var sc_partition=38; 
var sc_security="bd0a68f1"; 
</script>

<script type="text/javascript" src="http://www.statcounter.com/counter/counter_xhtml.js"></script><noscript><div class="statcounter"><a href="http://www.statcounter.com/free_hit_counter.html" target="_blank"><img class="statcounter" src="http://c39.statcounter.com/3450263/0/bd0a68f1/0/" alt="free web site hit counter" ></a></div></noscript>
<!-- End of StatCounter Code -->
</BODY>
</HTML>
