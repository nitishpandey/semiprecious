<cfquery name="groups" datasource="gemssql">
Select distinct groupname from groupings 
<cfif category neq "All" and category neq "">
where cat = '#category#'
<cfelse>
where (cat <> 'beads' and cat <> 'healing' and cat <> 'jewelry')
</cfif>
</cfquery>

 <tr>
<td border=0 align="right"  style="padding:0px" width="8px"><img src="/images/green_left_curve.jpg" height="34px" border="0" /></td>
<td style="cursor:pointer" border=0 align="center"  class="green_bg side_hd" onClick="flipDisplay('LeftThemeDisplay')"  style="padding:0px"><div id="themes" ><cfif category eq "All" or category eq "">Jewelry by&nbsp;Theme<cfelse><cfoutput>#Left( UCase(category), 1 )##Right( LCase( category), Len( category ) - 1 )# by&nbsp;Theme</cfoutput></cfif></div></td>
<td border=0 align="left"  style="padding:0px"><img src="/images/green_right_curve.jpg" height="34" border="0" /></td>
</tr>

<tr>
<td colspan="3">
<div id="LeftThemeDisplay" style="display:none">
<table cellpadding="0" cellspacing="0">


<cfoutput query="groups">
   <tr> 

      <td colspan=3 >  
<a href="/shaped/#lcase(groupname)#-gemstone-<cfif category neq "All">#lcase(category)#<cfelse>jewellery</cfif>.cfm" class="side_link">
#Left( UCase(groupname), 1 )##Right( LCase( groupname), Len( groupname ) - 1 )#</a> 
    </td>
     </tr>
</cfoutput>
</table>
</div>
</td>
</tr>




 
