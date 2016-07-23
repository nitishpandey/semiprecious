<html>
<head>
<title>Untitled Document</title>
<script language="JavaScript">
function removeitems(t)
{
t.action='matchremover.cfm'; 
t.submit();
return ;
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body><cfparam name="count" default="1" type="numeric">

<cfparam default="81" name="maxrow" type="numeric">
<cfparam  default="1" name="url.startrow">
<cfparam  default="1" name="url.maxrow">
<cfset endrow = url.startrow + maxrow>
<cfquery datasource="gemssql" name="items">

select newitem , cat,style from items 

</cfquery>
<cfform action="matchadder.cfm" target="_self" method="post">
  <Table align="center" border="1">
    <Cfloop  query="items"  startrow="#url.startrow#" endrow="#endrow#"><cfif count eq 1>
      <tr></cfif>
        <td><cfoutput>#style#<img src="/images/<cfif cat is "sets">necklaces<cfelse>#cat#</cfif>/thumb/#newitem#.jpg" hspace="0" vspace="0" border="0"> 
            <input type="checkbox" name="itemslist" value="#newitem#,#cat#">
          </cfoutput> </td>
        <cfset count = count + 1><cfif count eq 4>
        <cfset count = 1>
      </tr></cfif>
    </Cfloop>
    <cfif count neq 1>
      <cfloop from="#count#" to="3" index="idx">
        <td>&nbsp;</td>
      </cfloop></tr>
    </cfif>
  </Table>
  <input type="submit" value="Add to Style no.">
  <cfinput required="yes" type="text" validate="integer" name="matchid">
  <input type="reset" name="Submit2" value="Reset">
  <input type="button" name="Submit" value="Remove Selected items" onClick="javascript:removeitems(this.form);">
<cfoutput>  <input type="hidden" name="startrow" value="#url.startrow#">
    <input type="hidden" name="maxrow" value="#maxrow#"></cfoutput>
</cfform>
[A new matchid will be automatically created if it does not exist; but you will 
have to provide the id]<br>
<cfoutput> 
  <cfif   startrow neq 1 ><a href="matcheditor.cfm?startrow=#evaluate(endrow - 2*maxrow)#&maxrow=#maxrow#" target="_self">Prev</a></cfif>
<cfif endrow LT items.recordcount><a href="matcheditor.cfm?startrow=#endrow#&maxrow=#maxrow#" target="_self">Next</a></cfif>
</cfoutput></body>
</html>
