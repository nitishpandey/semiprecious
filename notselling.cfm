<html>
<head>
<title>Sales Candidates or does it need a better snap?</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
</head>

<body>
<cfparam default="3" name="form.age">
The default period to declare an item not selling is 3 months. If this page is called directly by typing in the url on the address bar this is
what will be used. However you can use the form on the admin.cfm page to choose a different timeperiod (integer months).
<cfif isdefined("form.putonsale")>
<cfloop list="#form.putonsale#" index="idx">
<cfquery datasource="gemssql" >
update items set status = 3 where newitem = #idx#

</cfquery>
<cfoutput>#idx#</cfoutput>
</cfloop>



</cfif>

<cfset reference = createodbcdate(Dateformat(dateadd('m',evaluate("-1*form.age"),Now()),'yyyy-mm-dd'))>
<cfquery datasource="gemssql" name="sales">
select cat, subcat,description, lastbought, price, saleprice,basecost, inventory,status, newitem from items where lastbought < #reference# and inventory > 0 order by  lastbought, status
</cfquery><br>

<cfoutput>#sales.recordcount# items not sold even once for the past #form.age# months
</cfoutput><br>
  <form name="form1" method="post" action="notselling.cfm">
<table border="1" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCCC"> 
    <td>Image</td>
	<td>Descr</td>
    <td>cost</td>
	<td>Price</td>
	<td>Sale</td>
    <td>subcat</td>
    <td>lastbought</td>
    <td>inventory</td>
    <td>status</td>
    <td>item</td>
    <td>Put on sale ?</td>
  </tr>
    <tr> 
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>
          <input name="Submit" type="submit" class="greenbutton" value="Submit">
        </td>
    </tr>
  <cfoutput query="sales"> 
<cfset cata  = cat>
<cfif cat eq 'sets'>
<cfset cata = 'necklaces'>
</cfif>
    <tr> 
      <td><a href="edititem.cfm?newitem=#newitem#" target="editwindow"><img src="/images/#cata#/thumb/#newitem#.jpg" ></a></td>
	  <td style="font-size:10px">#description#</td>
      <td>#sales.basecost#</td>
	        <td>#sales.price#</td>
			      <td>#sales.saleprice#</td>
      <td>#sales.subcat#</td>
      <td>#sales.lastbought#</td>
      <td>#sales.inventory#</td>
      <td>#sales.status#</td>
      <td>#sales.newitem#</td>
      <td><input type="checkbox" value="#newitem#" name="putonsale"></td>
    </tr>

  </cfoutput>     <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td><input name="Submit2" type="submit" class="greenbutton" value="Submit"></td>
    </tr>
</table>
</form>
<a href="http://www.semiprecious.com/admin.cfm?passcode=shaurya">back to admin page</a>
</body>
</html>
