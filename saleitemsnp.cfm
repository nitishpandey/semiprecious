<cfparam name="maxrows" default="10" type="numeric">


<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
</head>

<body>
<cfparam name="url.startrow" default="1">
<cfif isdefined("form.nosale")>
This is  status 0 now (active ?).
<cfloop list="#form.nosale#" index="idx">
<cfquery datasource="semiprecious" >
update items set status = 0 where newitem = #idx#

</cfquery>
<cfoutput>#idx#</cfoutput>
</cfloop>

</cfif>
ITems currently on sale (status is 3) (check the box to remove from sale and press 
submit. 
<cfquery datasource="semiprecious" name="sales2">
select  cat, subcat, lastbought, inventory,status, newitem from items where status = 3 order by inventory asc, subcat
</cfquery>
<cfoutput>(#sales2.recordcount#)</cfoutput>
<form action="saleitemsnp.cfm" method="post">
  <table border="1" cellpadding="2" cellspacing="2">
    <tr bgcolor="#999966"> 
      <td>Image</td>
      <td>cat</td>
      <td>subcat</td>
      <td>lastbought</td>
      <td>inventory</td>
      <td>status</td>
      <td>Item</td>
      <td>Off Sale ?</td>
    </tr>
    <cfoutput query="sales2" startRow="#StartRow#" maxRows="#MaxRows#"> 
      <tr> <td><img src="/images/#cat#/thumb/#newitem#.jpg" ></td>
        <td>#sales2.cat#</td>
        <td>#sales2.subcat#</td>
        <td>#sales2.lastbought#&nbsp;</td>
        <td>#sales2.inventory#</td>
        <td>#sales2.status#</td>
        <td>#sales2.newitem#</td><td><input type="checkbox" value="#newitem#" name="nosale"></td>
      </tr>
    </cfoutput> 
  </table>


  <input name="submitnosale" type="submit" class="greenbutton">
</form><cfoutput>
<CFIF startrow GT maxrows >
<cfset prevstartrow = startrow - maxrows>
<a href="saleitemsnp.cfm?startrow=#prevstartrow#">Previous</a>
</CFIF>
<cfset lastrow = startrow + maxrows>

<cfif lastrow LTE sales2.recordcount>
<cfset nextstartrow = startrow + maxrows>
<a href="saleitemsnp.cfm?startrow=#nextstartrow#">Next</a>

</cfif></cfoutput>
<a href="http://www.semiprecious.com/admin.cfm?passcode=shaurya">back to admin page</a>
</body>
</html>
