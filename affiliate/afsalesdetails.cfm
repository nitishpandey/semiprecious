<html>
<head>
<title>Your Sales Details</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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

<body>
<cfif isdefined("form.cartid")>
<cfquery datasource="sptm" username="nitish" password="rangeela" name="detail">
update affiliatesales set creditdate = #createodbcdate(now())#, creditdetails = '#form.details#' where cartid = #form.cartid#
</cfquery>
<!--- put a mailer her to the concerned person --->
UPdated but not informed
<a href="admin.cfm">Admin Page</a> 
</cfif>
<cfif isdefined("url.vid")>
<cfif url.vid is 'shau'>
<cfset affiliatelist = '"jng","jandj","young"'>
Main : <a href="../admin.cfm">Admin Page</a> <a href="../cartstatus21.cfm">Carts</a> <br>

<div id="updateform" style="display:hidden; boder:1px groove #203200; position:absolute; top:66px; left:112px; width:350px; background-color: #9999CC; layer-background-color: #9999CC; border: 1px none #000000;"> 
  <form action="afsalesdetails.cfm" method="post">
cartid: <input type="text" name="cartid" value=""><br>
    Credit Txn details : 
    <input type="text" name="details" value="">
<input type="submit" value=" Update Credit Details">
</form>
  <a href="#" accesskey="a" onClick="MM_showHideLayers('updateform','','hide')" >Hide</a></div>
  </cfif>
<cfquery datasource="sptm" username="nitish" password="rangeela" name="details">
select * from affiliatesales  where  afid = '#url.vid#'  <cfif url.vid eq 'shau'>or afid in (#affiliatelist#) </cfif>  order by cartid desc
</cfquery>
<a href="admin.cfm">Admin Page</a> 
<br>
The Sales and Credit Record 
<table  border="1" bordercolordark="#000066"><tr bgcolor="#CCCCCC"><td>Cartid</td><td>Afid</td><td>AmtRcvd</td><td>Wholesale<br>
Price</td><td>Credit</td><td>Creditdate</td><td>Details</td></tr>
<cfoutput query="details">
<tr><td><a href="cartitems.cfm?cartid=#cartid#&afid=#afid#">#cartid#</a></td>
      <td><a href="##" onClick="MM_showHideLayers('updateform','','show')">#afid#</a></td><td>#cost#</td><td>#wspricetotal#
</td><td>#Credit#</td><td>#creditdate#&nbsp;</td><td <cfif creditdetails eq 'pending'>bgcolor="pink"</cfif>>#creditDetails#</td></tr>

</cfoutput>
</table>
<script language="JavaScript1.1">
MM_showHideLayers('updateform','','hide');
</script></cfif>
</body>
</html>
