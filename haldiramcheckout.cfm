 <CFPARAM NAME="description" DEFAULT="">
<cfparam name="session.wholesale" default="">
<CFPARAM NAME="Price" DEFAULT= "">
<CFPARAM NAME="category" DEFAULT= "">
<CFPARAM NAME="NameID" DEFAULT= "">
<CFPARAM NAME="newitem" DEFAULT= "">
<CFPARAM NAME="cart" DEFAULT= "">
<CFPARAM NAME="bought" DEFAULT="">
<CFPARAM NAME="quantity" DEFAULT="">
<CFPARAM NAME="j" DEFAULT=0>
<cfparam name="url.filter" default="">
<CFPARAM NAME="email" DEFAULT="">
<CFPARAM NAME="discount" DEFAULT=0>
<CFPARAM NAME="wholesaleQTY" DEFAULT="9">
<CFPARAM NAME="couponcode" DEFAULT="">
<CFPARAM NAME="newQty" DEFAULT="">
<CFPARAM NAME="TotalQty" DEFAULT=0>
<CFIF newQty NEQ "">
  <cfset session.cartitem[newitem][4]= newQty>
</CFIF>
<!---<CFSET session.cartitems = listDeleteAt(session.cartitems,delAt)>--->
<!--- one less than actual qty --->
<CFINCLUDE TEMPLATE="setup.cfm">
<!--- dont do the logics done below on cartid because that is always set to 1 on application.cfm page for
reasons of not knowing where all it may be required. it could not be removed after uniquecartid was introduced
--->
<cfif isdefined("session.cartid2")>
<cfquery datasource="semiprecious">
update cartstatus set paymode ='repeat' where cartid = #session.Cartid2#
</cfquery>
<!--- setting to repeat may undo setting to pp or 2CO but does not in anyway hamper 
the processing of the order by the customer, the trusted 3rd party or you the vendor.
it only tells that the carts were not abandoned from the confirmation page --->
</cfif>
<!--- keep the cfset to 0 outside because that has to be done in any case --->
<cfset  session.cartid2 = 0>
<!--- to go to confirmation page one has to in each and every case of ecentric shopping
come through cart.cfm  and there this variable will be set to 0  . thus refresh of confirmation  page or
return to confirm page from a paypal's first page will not cause cartid to be incremented --->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFQUERY DATASOURCE="semiprecious" NAME="getcredit1">
SELECT earned, newearned FROM memberinfo WHERE email='#session.mail#' 
</CFQUERY>
<HTML>
<HEAD>
<TITLE>Automated Checkout from Semiprecious.com</TITLE>
<script LANGUAGE=JAVASCRIPT>
<!--
function format(expr, decplaces){
var str="" + Math.round (eval(expr) * Math.pow(10,decplaces));
while(str.length <=decplaces){
str= "0" + str}
var decpoint= str.length - decplaces
return str.substring(0,decpoint) + "." + str.substring(decpoint,str.length);}

function goProcess(inString){
	if(inString=='Proceed to Checkout'){
	<cfoutput>self.document.cartform.action="haldiramconfirmation.cfm?#urlencodedformat(session.filter)#";</cfoutput>


	self.document.cartform.submit();
	return;
	}
	if(inString=='Click here to Buy More Items'){
	<cfoutput>self.document.cartform.action='list.cfm?#urlencodedformat(session.filter)#';</cfoutput>
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

if (totalQnty == 0) {
form.shipping.value =  0.00}
if (totalQnty == 1) {
form.shipping.value =  1.95}
if (totalQnty >=2) {
form.shipping.value = 0.00}
<!---
if (totalQnty ==3) {
form.shipping.value = 0.00}

if (totalQnty ==4) {
form.shipping.value = 2.00}
if (totalQnty ==5) {
form.shipping.value = 1.00}
if (totalQnty >=6) {
form.shipping.value = 0.00}
--->
gtotal = form.shipping.value*1 + stotal;

form.discount.value=0;

<!---
if (totalQnty <= 9){

form.discount.value = (10*(totalQnty/9))-(10/9);
}
else
{form.discount.value = 20};
--->
stotal= stotal*(1-(form.discount.value/100));
form.subTotal.value=format(stotal,2);
gtotal = form.shipping.value*1 + stotal*1 + form.SpecialHandling.value*1 + form.GiftWrap.value*1 +form.nonUS.value*1;
form.GrandTotal.value=format(gtotal,2);

if (totalQnty < 2){form.discount.value = 0};

}

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
	form.GrandTotal.value =form.subTotal.value*1 + form.shipping.value*1 + form.GiftWrap.value*1+form.SpecialHandling.value*1;
	form.GrandTotal.value = format(form.GrandTotal.value,2);
	}
}

//-->
</script>
<style type="text/css">
<!--
.small {
	font: italic 9px "Times New Roman", Times, serif;
}

-->
</style>
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--

-->
</style>
</HEAD>
<BODY BGCOLOR="white" topmargin='0'>
<CFINCLUDE TEMPLATE="header.cfm"> 
<br>
<CFIF #bought# IS "wish">
<Cfif session.cartitem[1][1] EQ 0 and newitem NEQ "">
  <CFSET session.cartitem[1][1] =newitem>
  <CFSET session.cartitem[1][2] =category>
  <CFSET session.cartitem[1][3] =price>
  <CFSET session.cartitem[1][4] =quantity>
</Cfif>
   hello. your item has been added to the wish list. 
      <CFELSEIF #bought# IS "buy">

<Cfif session.cartitem[1][1] EQ 0 and newitem NEQ "">
  <CFSET session.cartitem[1][1] =newitem>
  <CFSET session.cartitem[1][2] =category>
  <CFSET session.cartitem[1][3] =price>
  <CFSET session.cartitem[1][4] =quantity>
<cfelse>
	    <CFLOOP  INDEX="j"  from="1" to="#ArrayLen(session.cartitem)#">
      <cfif session.cartitem[j][1] eq newitem >
        <CFSET session.cartitem[j][1] =newitem>
        <CFSET session.cartitem[j][2] =category>
        <CFSET session.cartitem[j ][3] =price>
        <CFSET session.cartitem[j][4] =quantity>
		<cfset added = 1>
		<!-- Added -->
		<cfbreak />
      </CFIF>
	  </cfloop>
	  <cfif not isdefined("added")>
	    <CFLOOP  INDEX="j"  from="1" to="#ArrayLen(session.cartitem)#">
      <cfif  session.cartitem[j][4] eq 0>
        <CFSET session.cartitem[j][1] =newitem>
        <CFSET session.cartitem[j][2] =category>
        <CFSET session.cartitem[j ][3] =price>
        <CFSET session.cartitem[j][4] =quantity>
		<cfset added = 1>
		<!-- Added -->
		<cfbreak />
      </CFIF>
	  </cfloop>
</cfif>
	  <cfif not isdefined("added")>
<!-- New Added
<cfoutput>#arraylen(session.cartitem)#</cfoutput> -->
<cfset cartal = arraylen(session.cartitem) + 1>
	   <CFSET session.cartitem[cartal][1] =newitem>
        <CFSET session.cartitem[cartal][2] =category>
        <CFSET session.cartitem[cartal][3] =price>
          <CFSET session.cartitem[cartal][4] =quantity>
      </cfif>
	  </Cfif>
    </cfif> 
    <!---
<CFSET #session.cartitems# = "">
--->
    <TABLE BORDER="0"  width="700" align=center>
      <tr> 
        <td valign="top">&nbsp;<span class="cart"><b></b></span> </TD>
        <TD align="left"> <TABLE border="1" bordercolor="#CCCCCC" cellspacing="0"  >
        <tr bgcolor="#cccc99"> 
              <TH width="25%">Item </TH>
              <TH width="14%">Picture</TH>
              <TH width="18%">Price</TH>
              <TH width="14%">Quantity</TH>
              <TH width="6%">Amount</TH>
              <TH width="12%">Remove</TH>
            </tr><cfif session.cartitem[1][1] is not 0>
	<form action="" method="post" name="cartform">
            <CFSET grandTotal=0>
            <CFSET subTotal=0>
            <CFSET amounts=0>
            <CFSET TotalQty=0>
            <cfset emptyitems = 0>
            <CFLOOP  INDEX="j"  from="1" to="#ArrayLen(session.cartitem)#">
              <CFiF session.cartitem[j][4] gt 0>
                <CFQUERY NAME="qprice" DATASOURCE="semiprecious">
                SELECT nameid, newitem as newimage,description FROM Items WHERE 
                newitem=#session.cartitem[j][1]# 
                </CFQUERY>
                <tr> 
                  <cfoutput> 
                    <TD align='center'> <font size="-3">(ID:#session.cartitem[j][1]#)#qprice.description#</font> <input type="hidden" name="itemnumber#j#" value="#session.cartitem[j][1]#"></TD>
                    <td align="left"> <cfset TotalQty=session.cartitem[j][4]+TotalQty> 
                      <CFIF session.cartitem[j][2] IS "SETS">
                        <CFSET categ = "necklaces">
                        <CFELSE>
                        <CFSET categ = session.cartitem[j][2]>
                      </CFIF> <img src="images/#categ#/thumb/#qprice.newimage#.jpg" height="50"> 
                      <input type="hidden" name="category#j#" value="#session.cartitem[j][2]#"> 
                      <input type="hidden" name="quantity#j#" value="#session.cartitem[j][4]#">
					  </td>
                      <td align="center">$#DecimalFormat(session.cartitem[j][3])# <input type="hidden" name="price#j#" Value="#DecimalFormat(session.cartitem[j][3])#">                      </td>
                    <cfset p=session.cartitem[j][3]>
                    <td>#session.cartitem[j][4]#&nbsp;&nbsp;&nbsp;&nbsp;<font size="2"><a href='detail.cfm?itemnumber=#session.cartitem[j][1]#&editcart=#j#'>Edit</a></font></td>
                    <td>#dollarformat(p*session.cartitem[j][4])# <input type="hidden" name="amount#j#" Value="#evaluate(p*session.cartitem[j][4])#"> 
                    </td>
                    <td><a href='cart.cfm?newQty=0&newitem=#j#&filter=#urlencodedformat(url.filter)#'>Remove</a></td>
                  </cfoutput> </tr>
                <cfset amounts=#evaluate(p*session.cartitem[j][4])#>
                <cfset subTotal= #amounts# + #subTotal#>
                <cfelse>
                <!--- since we are now adding values with 0 value we dont do this  <cfset emptyitems = emptyitems + 1> --->
                <cfoutput> 
                  <input type="hidden" name="amount#j#" Value="0">
                  <input type="hidden" name="price#j#" Value="0">
                  <input type="hidden" name="quantity#j#" Value="0">
                </cfoutput> 
              </cfif>
            </CFLOOP>
            <cfif totalQty is 0>
<cfoutput>
              <h3>Sorry, cart is empty.</h3> <a href="list.cfm?#session.filter#">Shop</a>.
</cfoutput>
              <cfabort>
            </cfif>
            <cfif totalQty is 1>
              <cfset shipping = 1.95>
              <cfelseif totalQty is 2>
              <cfset shipping =0.00>
              <cfelseif totalQty gt 2>
              <cfset shipping  = 0.00>
              <!---
<cfelseif j is 4>
<cfset shipping  = 2.00>
<cfelseif j is 5>
<cfset shipping  = 1.00>
<cfelseif j GT 5>
<cfset shipping  = 0.00>
--->
            </cfif>
            <cfset GrandTotal= shipping + subTotal>
            <tr> 
            <!--   <td align="center"><input name="button" type="button" class="greenbutton" onclick="javascript:goProcess('Click here to Buy More Items')" value="Continue Shopping"> 
              </td> -->
              <td colspan="2" align="right" nowrap> <span class="details">	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Basic&nbsp;&nbsp; 
                Shipping:</span></td>
          <td align="right"> $ 
            <input type="text" size="4" name="shipping" onfocus="javascript:alert('Sorry, this task is not allowed.');this.blur()" value="<cfoutput>#shipping#</cfoutput>">
          </td>
              
          <td  colspan="3" align='right' nowrap><b>Gift Wrap: </b> 
            <select name="GiftWrap" ONClick="javascript:grandtotal(this.form)">
                  <option value="0.00" Selected>No Gift Wrap</option>
                  <option value="1.50" >Gift Wrap: $1.50</option>
                </SELECT> </td>
            </tr><tr><td colspan=2 align="right">
            <cfoutput> 
              <input type="hidden" size='3' name="discount" value="0">
              <input type="hidden" size="5" name="subTotal" value="#decimalformat(subTotal)#">
            <!--- <tr> 
                <td  colspan="6" align='right'>
				<b><font size=3 color=red>Orders placed between 12 PM CST 1st July and 12th July will be shipped on 13th July</font></b>
				<b>
				--->
            <span class="openpara"><b>Shipping upgrade for U.S:</span> </b></td>
          <td colspan="4" align="right"> 
            <select name="SpecialHandling" ONClick="javascript:grandtotal(this.form)">
                    <option value="0.00" Selected>Regular Mail (4 to 7 days from today): $0.00</option>
                    <option value="2.65" >Priority Mail with free tracking (2-3 
                    days, not guaranteed): $2.65</option>
                    <option value="12.00">Federal Express 2 day (guaranteed): 
                    $12.00</option>
                  </SELECT>
          </td>
              </tr>
              <tr> 
                
          <td  colspan="2" align='right'><b><font color="##00CC33">Additional 
            Shipping must for non-U.S</font>: </td>
          <td colspan="4" align="right"> </b> 
            <select name="nonUS" ONClick="javascript:grandtotal(this.form)">
                    <option value="0.00" Selected>USA: $0.00</option>
                    <option value="1.00">Canada: $1.00</option>
                    <option value="2.00" >Europe & Australia (7 to 15 days): $2.00</option>
                    <option value="10.00"> Asia & Africa (7 to 21 days): $10.00</option>
                  </SELECT>
          </td>
              </tr>
              <tr> 
                
              
          <td colspan="3" align="left"  ><font>Haldiram Cartid</font>: 
            <input type="text" value="#session.wholesale#" SIZE="8" Name="couponcode"> <font color=blue>&nbsp;</font> <font size="-2"><br>(Will be applied on checkout)</font></td>
          <td  colspan="2" align='right'><b>Grand Total <font size=1>(including shipping)</font>:</td><td align="right">$ 
            <input name="GrandTotal" type="text"  onFocus="javascript:alert('Sorry, this task is not allowed.');this.blur()" value="#decimalformat(evaluate(grandTotal))#" size="6" maxlength="9">
                  </b> </td>
              </tr>
           
            <!---<tr> 
              <td colspan="6" align="right"  ><font color=blue>Discount code, if any</font>: 
               <input type="text" value="" SIZE="6" Name="couponcode"> <font color=blue>&nbsp;</font> <font size="-2"><br>(Will be applied on checkout)</font></td>
            </tr>--->
			      
              <tr> 
               <td colspan="2" align="center"><input name="button2" type="button" class="greenbutton" onclick="javascript:goProcess('Click here to Buy More Items')" value="Continue Shopping"></td>  
               
 <td  colspan="4" align='center'> <input type="hidden" name="j" value="#evaluate(ArrayLen(session.cartitem) - emptyitems)#"> 
                  <!--- original by tipu <input type="hidden" name="j" value="<cfoutput>#totalQty#</cfoutput>"> --->
                  <!--<input type="button" onClick="javascript:grandtotal(this.form)" VALUE="Recalculate Total">-->
                  <!---
<input type="button" value="Click here to Buy More Items" onClick="javascript:goProcess('Click here to Buy More Items')">--->
                  <input type="button" class="greenbutton" onclick="javascript:goProcess('Proceed to Checkout')" value="Choose Check Out Method"> 
                </td>
              </tr>
            </cfoutput> </table></TD>
      </TR>
      
<!---   <tr> 
    <td colspan=2><ul>
        <li><!--- Flat $1.95 Shipping on one item. <font color="#CC3333">FREE SHIPPING</font> 
          ON TWO OR MORE ITEMS  ---></li>
      </ul></td>
      </tr> --->
      
  <tr> 
    <td colspan=2><ul>
        <cfif totalQty is 1>
          <li><font color=red>Your Basic Shipping charges $ 1.95. Buy 2 or more 
            to get FREE 1st class shipping !</font></li>
        </cfif>
        <li>Click on the '<strong>continue shopping</strong>' button if you wish 
          to shop for more items .</li>
        <li> If you are finished with shopping, click on '<strong>Choose Check 
          Out Method</strong>' button to go to the '<strong>finalized cart</strong>' 
          page. </li>
        <li>On 'finalized cart' page you will see exact totals and you can choose 
          a <strong>'secure' payment mode</strong>.
		   
          <!--- Any doubts/questions, call 512 589 9009, immediate pick up, no waiting. 
          Helpline not avlbl till 23 Nov 04. Over --->
        </li>
		<li>You are entitled a 25 % discount subject to condition that you have 
          a valid haldiram cartid of over $50 and no other discount was availed 
          with the haldiram purchase.<a href="haldiramcheckout.cfm"></a>.</li>
      </ul></td>
      </tr>
    </TABLE>
    <cfoutput> 
	<cfif not totalqty>
    No Item Bought. Click <a href="index.cfm" class="unnamed1">Here</a> to Start Shopping. 
  </cfif>
      <input type="hidden" name="tcredit1" value="#getcredit1.earned#">
      <input type="hidden" name="newearned" value="#getcredit1.newearned#">
    </cfoutput> </form> </cfif> 
    <!--- <!-- 	<cfinclude template="images.cfm"> --> --->
    <CFINCLUDE TEMPLATE="footer.htm"> 

</BODY>
</HTML>
