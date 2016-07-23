  <CFQUERY DATASOURCE="semiprecious" NAME="solditems">
  SELECT top 100 email, itemid, CAT, buyingrecord.optionid, quantity, status, price, saleprice, wholesaleprice, datebought, storage, 
  affiliateID, description FROM buyingrecord, items where items.newitem=buyingrecord.itemid*1 
  and quantity>0 
    and email='#cartid#' 
  order by datebought desc, newitem asc
  </cfquery>
<CFQUERY DATASOURCE="semiprecious" NAME="purchaser">
Select firstname, address1,city,state,zip,country,email from purchase where email='#cartid#'  or cartid = '#cartid#'
</cfquery>
<head>
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
<cfif  url.afid eq 'young'>
<cfinclude template="youngheader.cfm">
<cfelseif url.afid eq 'jandj'>
<cfinclude template="jandjheader.cfm">
<cfelse>
  <Table cellpadding='0' cellspacing='0' bgcolor='white' width='750' align=left border=0>
    <tr> 
      <td align='left' bgcolor='white' height=100>&nbsp;</td>

    </tr>
  </Table>
  <br>
  <left> 
  <p>&nbsp;</p>
  <p><b>Invoice/Packing Slip</b></p>
  <left> ORDER ID (cartid):<cfoutput>#cartid#</cfoutput> Date and Time Purchased:<cfoutput>#solditems.datebought#, <font color=red>#solditems.affiliateID#</font></cfoutput> 
  <br>
  <table width=600>
    <tr> 
      <td><b>ID</b></td>
      <td><b>Picture</b></td> <td><b>Qty</b></td> <td><b>Price</b></td>
      <td><b>Description</b></td>
      <td></td>
    </tr>
	<Cfset variables.storagelayer = "">
	<!--- storage layer is a hidden layer that will show the places of storage of the items --->
    <cfoutput QUERY="solditems"> 
      <tr> 
        <td><a href='detail.cfm?itemnumber=#itemid#'>#itemid#</a>
		 <cfif cartid eq "-">
            #email#</cfif></td>
        <td>  <a href="edititem.cfm?newitem=#itemid#" target="itemsellimg"><img src=images/#categ#/thumb/#itemid#.jpg width=50 border="0"></a> 
        </td>
        <td bgcolor="##FFFFFF"> #quantity# </td><td> <font size="+1"> 
</td><td>
           #description# </font></td>
        <td><a href='edititem.cfm?newitem=#itemid#' onMouseOver="MM_showHideLayers('storagelayer','','show')" onMouseOut="MM_showHideLayers('storagelayer','','hide')" >.<font color=white>set</font>.</a></td>
      </tr>
    </cfoutput> 
  </table>
<br>
  <b> Total amount (not including shipping):</b>$ 
    <cfset totalamount=0>
    <cfoutput query="solditems"> 
	  <cfif wholesaleprice eq "" or  wholesaleprice eq 0>
             <cfset wholeprice = 0.5*price>
       <cfelse>
           <cfset wholeprice = wholesaleprice>
   </cfif>
	       <cfset totalamount=wholeprice*quantity + totalamount>
      	  </cfif>
    </cfoutput> 
	<cfoutput>#totalamount#</cfoutput> 
  <br>
Note: The item prices and final amount may differ from amount paid at the point of purchase because of price revisions.
  <p> Name & Mailing Address 
  <p> <cfoutput query="purchaser"> 
      #firstname#<br>
      #address1#<br>
      #city#, #STATE#,#zip#<br>
      #COUNTRY# <br>

	  (Email/Cartid:#email#)
	  </cfoutput> 
  <p>========================================= 
  <p> 
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
  
  <br>
  
<br>
<br>
<cfoutput> Shipping Code:#q_ship.shippingdetails#.</cfoutput></cfif> 
<br>

  <cfif #purchaser.firstname# eq "">
    <p align="left">======================================== 
    <p align="left">Ship To:<br>
      <textarea cols="30" rows="6" name="Address" id="Address"></textarea>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  
  
  </cfif>
  <br>
</body>
</html>
