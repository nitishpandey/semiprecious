<cfset supcode = session.apptt />

<cfparam name="msg" default="" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>
Items Recently Ordered
</title>
    
    <style type="text/css">
        .style9
        {
            width: 371px;
        }
        .style10
        {
            width: 418px;
        }
        .style11
        {
            width: 418px;
            height: 21px;
        }
        .style12
        {
            height: 32px;
        }
        .style13
        {
            width: 418px;
            height: 32px;
        }
    </style>
    <link type="text/css" rel="stylesheet" href="../css/StyleSheet.css">
    <script type="text/javascript" language="javascript" src="/js/prototype.js"></script>
    <script type="text/javascript">
    function fnDecline(itemid,cartid,optionid,qty,weight,size,indate){
    	var urlString = '';
		var urlString = 'itemid='+itemid+'&cartid='+cartid+'&optionid='+optionid+'&qty='+qty+'&weight='+weight+'&size='+size+'&indate='+indate;
		var pars = urlString +'&'+Date.parse(Date());
		var url = 'declineitem.cfm';
		
		var ajax= new Ajax.Request
		(
			url, 
			{
				method:'get', 
				parameters:pars, 
				onSuccess:function(xhr)
				{ 
					alert('Item has been successfully declined!')
					
					document.getElementById('tr_'+itemid).style.display = 'none';
				},
				onFailure:function(xhr){
					alert('There is an error in updating the record');
				}
			}
		);
    }
	</script>

    <style type="text/css">
        .style1
        {
            width: 100%;
            
        }
        .style2
        {
            height: 61px;
        }
        .style5
        {
            height: 27px;
            width: 582px;
        }
        .style8
        {
        }
        .style9
        {
            width: 17px;
        }
           td.india
        {
            background-color: darkgreen;
        }
    </style>
</head><body style="background-color: rgb(217, 217, 217);">

    <form id="form1"  method="post">

    <div>
     <table cellspacing="0" cellpadding="0" bgcolor="White" style="background-color: white;" class="style1">
  <tbody>
    <tr>
      <td align="left" valign="top" rowspan="2" style="width: 5%;">
        &nbsp;
      </td>
      <td rowspan="2" class="style2">
        <img src="../Images/semipreciouslogo.jpg" id="Image3">
                </td>
      <td align="left" class="style10">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/tm-tm/mainmenu.cfm" id="HyperLink1">Main Menu</a>
        &nbsp;&nbsp;<a href="../moo" id="HyperLink2">MOO Menu</a>

        &nbsp; &nbsp;&nbsp;<a href="/tm-tm/logout.cfm" id="HypLogout">Log Out</a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <span style="color: rgb(0, 51, 204);" id="Label2">Logged In :</span>
        &nbsp;<span style="color: rgb(153, 0, 51);" id="LblLoginName">
          <cfoutput>#supcode#</cfoutput>
        </span>
        &nbsp;
      </td>
      <td align="left" valign="top" rowspan="2" style="width: 5%;">
        &nbsp;
      </td>
    </tr>
    <tr>
      <td align="left" class="style5">
      	<div align="right">
        	<input type="button" value="Export To Excel" onclick="window.open('modlistexcel.cfm');"> 
    	</div>
      </td>
    </tr>
    <tr style="height: 2px;">
      <td align="left" valign="top">
      </td>
      <td height="2px" bgcolor="#009999" colspan="2">
      </td>
      <td align="left" valign="top">
      </td>
    </tr>

    <tr>
      <td class="style9">
        &nbsp;
      </td>
      <td valign="top" rowspan="2" colspan="2" class="style8">
<br/>
<br/>
<cfif isdefined("url.action")>
<cfquery datasource="gemssql" name="d" >
	select indate from cartstatus where cartid = #url.cartid#
</cfquery>
	<cfif d.recordcount>
	    <cfset hrs = datediff('h',d.indate,now()) />
		<cfif hrs GT 120>
			<cfset msg = "Too late to cancel. You only have 120 hrs to decline a request" />
			
		<cfelse>
		  <cfset negsupcode = "-#supcode#" />
			<cfquery datasource="gemssql" name="d" >
				update buyingrecord set makeondemandnote = '#negsupcode#' where cartid = #url.cartid# and itemid=#url.itemid# and optionid = #url.optionid# and inventoryatsale = -1 and quantity > 0
			</cfquery>		
			<cfmail from="cs@semipreciuos.com" to="stacyanup@gmail.com" subject="#supcode# declines MOO" >
			
					update buyingrecord set makeondemandnote = '#negsupcode#' where cartid = #url.cartid# and itemid=#url.itemid# and optionid = #url.optionid# and inventoryatsale = -1 and quantity > 0	
			
			</cfmail>
				<cfset msg = "Decline message sent to Anup and item marked as declined." />
			</cfif>

	</cfif>
</cfif>


<cfif isdefined("form.ship") >
<cfoutput><cfset myStringVar = "#supcode#WIP"></cfoutput>
<cfset curDate = #Now()#>
		<cfloop list="#form.ship#" index="ind" >
				<!--- put a counter of qty here ---> <cfset cartid_ = listgetat(ind,1,"_") />
				<cfset itemid_ = listgetat(ind,2,"_") />
				<cfset optionid_ = listgetat(ind,3,"_") />
				<cfquery  datasource="gemssql" >
					update buyingrecord set MAKEONDEMANDNOTE ='#myStringVar#'  where cartid = #cartid_# 
																							and itemid = #itemid_#
																							and optionid = #optionid_#
					insert into moo(cartid,itemid,optionid,WIPDate) values(#cartid_#,#itemid_#,#optionid_#,#curDate#);
				</cfquery>
				
				
		</cfloop>
	
	<cfif isdefined("url.status")><cfoutput>#url.status#</cfoutput> </cfif>
	<!--- output qty of times here --->
	
	Now items are in production in your workshop.You can check these items in the given links(below).

</cfif>
<cfquery name="d" datasource="gemssql" >

select  indate, cat, couponcode, cartstatus.cartid as cartid, itemid, optionid, quantity ,size,size2,WEIGHT,metalwt from buyingrecord, items,cartstatus  where buyingrecord.cartid = cartstatus.cartid and items.newitem = buyingrecord.itemid and inventoryatsale = -1 and quantity > 0 and indate > '8/1/2011' and paymode <>'emptied' and paymode<>'null'
and MAKEONDEMANDNOTE not like '%WIP%' and MAKEONDEMANDNOTE not like '%SHI%' AND (moo_decline is NULL OR moo_decline = 0) order by indate asc

</cfquery>
<div align="center" backgroundcolor="gray" style="font-size:bolder; padding-left:40px">NEW ITEMS FOR PRODUCTION</div>	
<div id="msg" style="width:200px;padding-left:40px"><cfoutput>#msg# | #d.recordcount# pending</cfoutput></div>	

Working Items : <a href="WIPSupplierModlist.cfm"> Items in Production</a><BR/>
Shipped Items : <a href="ShippedSuppliermodlist.cfm" > Items Shipped</a>
<br/>
<br/



<div style="width:850px;border:1px solid black;padding:2px;align:left">
<form action="modlist.cfm" method="post">

<table style="border:1px dashed brown">

<tr style="background:gray;color:white;"><td>Sr.No.</td><td>Pic</td><td>Cartid</td>
<td>Itemid</td><td width="50px">Qty</td><td width="60px">Weight</td><td width="50px">Size(Inches)</td><td>Description</td><td>Select ?</td><td>Date Order</td><td>DECLINE</td></tr>
<cfoutput query="d">
<tr id="tr_#Itemid#">
<td>#currentrow#</td><td><img src="/images/#cat#/thumb/#itemid#.jpg" alt="#itemid#" /></td>
<td><a href="http://www.semiprecious.com/itemsell.cfm?cartid=#Cartid#" target="_blank">#Cartid#</a></td><td><a href="http://www.semiprecious.com/detail.cfm?newitem=#itemid#"  target="_blank">#Itemid#</a></td>
<td>#Quantity#</td><td>#WEIGHT#</td><td>#size#</td>
<td>
<cfif optionid gt 0 >
<cfquery name="b" datasource="gemssql">

   select  DESCRIPTION	 from options where ITEMID=#itemid# and OPTIONID=#optionid#

</cfquery>
#b.description#
</cfif>

</td><td class="#couponcode#"><input type="checkbox" name="ship" value="#cartid#_#itemid#_#optionid#" /></td>
<td> #DateFormat(indate, "mmm-dd-yyyy")#
   <cfset day = 2>
	 <cfset inDt = #DateFormat(indate, "mmm-dd-yyyy")#>
    </td>
 <td>
  	<!--- <cfset diffday=dateDiff( 'd', #indate#, now())>
  	 <cfif diffday gt day >
    <img src="0521-1012-0921-2539_TN.jpg" Height="40px" Width="40px"/>.
<cfelse> 
<a href="modlist.cfm?action=cancel&itemid=#itemid#&cartid=#cartid#&optionid=#optionid#&date=#indate#" target="_blank"> Cancel (36 hours)</a>

    </cfif> --->
    <input type="button" value="Decline" onclick="fnDecline(#itemid#,#cartid#,#optionid#,#Quantity#,'#WEIGHT#','#size#','#inDt#')" />

<td/></tr>
</cfoutput>

</table>
<br/>

<INPUT TYPE="HIDDEN" VALUE="" NAME="shipment_details" />
<!-- Please provide shipment details: <input type="text" name="shipment_details" value="" size="30"> -->
<div align="center"><input type="submit" value="After Selecting Items Check Box Click Here To Update Items Information" />
</div>
<br/>
<br/>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr style="height: 5px;">
                <td>
                    </td>
                <td bgcolor="#009999" colspan="2">
                
                
                
                
                    </td>
                <td>
                    </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    &nbsp;<span id="Label1">Copyright@Ganna Life Sciences Pvt. Ltd. ,2010. All Rights Reserved</span>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </tbody></table>
    </div>
 
</body></html>
