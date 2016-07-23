 <CFPARAM name=cid default="">
<CFPARAM name=categ default="">
<CFPARAM name=updateinventory default="no">
<cfset cartid = cid>
<cfif cid neq "">
  <CFQUERY DATASOURCE="gemssql" NAME="solditems">
  SELECT top 100 email, itemid, CAT, quantity, status, price, saleprice, datebought, 
  affiliateID, description FROM buyingrecord, items where items.newitem=buyingrecord.itemid*1 
  and quantity>0 
    and cartid=#cid#
  order by datebought desc 
  </cfquery>

<CFQUERY DATASOURCE="gemssql" NAME="purchaser">
Select firstname, address1,city,state,country from purchase where email= '#cid#' 
</cfquery>


<head>
<title>Items Sold: Semiprecious.com</title>
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor='white' >

<Table cellpadding='0' cellspacing='0' bgcolor='white' width='750' align=left border=0>
  <tr> 
    <td align='left' bgcolor='white'><img src='images/semiprecious.gif' height=68 width=450></td>
    <td align='right'></td>
    <td><img src='images/logo.jpg' width="300" height="68"></td>
  </tr>
</Table>
<br>
<left> 
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><b>Invoice/Packing Slip</b></p>
<left> ORDER ID (cartid):<cfoutput>#cartid#</cfoutput> Date and Time Purchased:<cfoutput>#solditems.datebought#, <font color=red>#solditems.affiliateID#</font></cfoutput> 
<table width=600>
  <tr bgcolor="#CCCCCC"> 
    <td><b>ID</b></td>
    <td><b>Picture</b></td>
    <td><b>Description</b></td>
    <td></td>
  </tr>
  <cfoutput QUERY="solditems"> 
    <tr> 
      <td><a href='detail.cfm?itemnumber=#itemid#'>#itemid#</a> <cfif cartid eq "-">
          #email#</cfif></td>
      <td> 
          <CFSET categ = cat>
 <a href="detail.cfm/#itemid#.htm" target="itemsellimg"><img src=images/#categ#/thumb/#itemid#.jpg height=50 border="0"></a> 
      </td>
      <td bgcolor="##FFFFFF"><font size="+1">Qty: <font <cfif quantity gt 1> color=red</cfif>>#quantity#</font></font> <font size="+1"> 
        <cfif status EQ 3>
          Sale:#dollarformat(saleprice)# 
          <cfelse>
          #dollarformat(price)# 
        </cfif>
        ,&nbsp;&nbsp;: #description# </font></td>
      <td><a href='edititem.cfm?newitem=#itemid#'>.<font color=white>set</font>.</a></td>
    </tr>
  </cfoutput> 
</table>
<br>
<b> Total amount (not including shipping):</b>$  
  <cfset totalamount=0>
  <cfoutput query="solditems"> 
    <cfif status is 3>
      <cfset totalamount=saleprice*quantity + totalamount>
      <cfelse>
      <cfset totalamount=price*quantity+ totalamount>
    </cfif>
  </cfoutput> 

<cfoutput> 
#totalamount# , Cart Id : #cid#. <br><p>
   <a href="itemsell.cfm?cartid=#cid#&paymode=#url.paymode#&couponcode=#url.couponcode#"> Confirm Shipment of this cart</a><br>
    <a href="copycart.cfm?cartid=#cid#">Copy  This Cart</a> <br>
  <a href="cartdelete.cfm?cid1=#cid#&paymode=#url.paymode#">
    Delete this cart</a> (remove buying record and cartstatus and purchase tables). 
  </p>
</cfoutput> 
<p> 
<cfelse>
   <!--- now reverse the inventory --->
   <cfif listfindnocase(url.paymode ,'pp,chck,check,2co,auth.net,wellscc,paypal,secure2,icheck')>
   <cfinvoke method="rupdatepercart" component="inventory" returnvariable="result" >
   <cfinvokeargument name="cartid" value="#cid1#" />
    </cfinvoke>
	</cfif>
    <CFQUERY DATASOURCE="gemssql" NAME="solditems">
 delete FROM buyingrecord where cartid =#cid1#
   </cfquery>
    <CFQUERY DATASOURCE="gemssql" NAME="solditems">
 delete FROM cartstatus where cartid =#cid1#
   </cfquery>
       <CFQUERY DATASOURCE="gemssql" NAME="solditems"> <!--- purchase table is yet to be provided with
	   a cartid column --->
 delete FROM purchase where email ='#cid1#'
   </cfquery>

   Deleted  <cflocation url="cartstatus21.cfm" addtoken="no">
</cfif>
 <a href="http://www.semiprecious.com/admin.cfm?passcode=shaurya">admin 
  page</a>&nbsp;&brvbar;&Auml; <a href="cartstatus21.cfm">View Carts</a> 

</body>
</html>
