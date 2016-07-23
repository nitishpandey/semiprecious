
<cfparam name=subcat default="">
<cfquery name="googleaffil" datasource="gemssql">
Select top 30 prodname, description, htmlcode, price from affil_google where 1=1

and subcat='#subcat#'

</cfquery>
<cfif googleaffil.recordcount GT 0>
<h3> <font color=purple>SIMILAR FINDS FROM OUR AFFILIATES</font></h3>
</cfif>

<table>
<cfoutput query=googleaffil>
<tr height=200><td valign=top height=200>#htmlcode#</td><td>
#description#<br>
<strong>PRICE</strong>: $#price#</td></tr>
</cfoutput>
<tr><td colspan=2 background	color=purple>-</td></tr>

</table>

