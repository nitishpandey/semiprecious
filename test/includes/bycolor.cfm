<cfset categ = Category>
<cfif categ eq "ALL" or categ eq "">
   <cfset categ = "jewelry">
</cfif>

<br>
<div style="margin-top:1px;border-top:1px #888822 ridge;">
<div  class="greenbutton" align="left"> <strong>
<cfif categ neq "jewelry">&nbsp;&nbsp;&nbsp;<cfoutput>#Ucase(Left(categ,1))##Right(categ,Len(categ)-1)# </cfoutput><cfelse>Jewelry </cfif>
By Color</strong></div></div>

<table cellpadding="1" cellspacing="1" align="center" width="100%" >
  <tr>
    <td style="padding:5px;margin:2px;background-color:#FF6600" width="12px">&nbsp;</td>
   <cfoutput> <td style="padding:5px;margin:2px">
   <cfif categ eq "jewelry"><a href="orange-gemstone-#categ#.cfm"><cfelse><a href="/color-gem-stone/orange-#categ#.cfm"></cfif>Orange #categ#</a>
   </td></cfoutput>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td style="padding:5px;margin:2px;background-color:#990099" width="12px">&nbsp;</td>
     <cfoutput><td style="padding:5px;margin:2px">
        <cfif categ eq "jewelry"><a href="purple-gemstone-#categ#.cfm"><cfelse><a href="/color-gem-stone/purple-#categ#.cfm"></cfif>Purple #categ#</a>
   </td></cfoutput>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td style="padding:5px;margin:2px;background-color:#ffffff" width="12px"><table width="12px" cellpadding="0" cellspacing="0" border="0" margin="0" padding="0"><tr><td>&nbsp;</td></tr></table></td>
     <cfoutput><td style="padding:5px;margin:2px"><cfif categ eq "jewelry"><a href="white-gemstone-#categ#.cfm"><cfelse><a href="/color-gem-stone/white-#categ#.cfm"></cfif>White #categ#</a></td></cfoutput>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td style="padding:5px;margin:2px;background-color:#FF66CC" width="12px">&nbsp;</td>
     <cfoutput><td style="padding:5px;margin:2px"><cfif categ eq "jewelry"><a href="pink-gemstone-#categ#.cfm"><cfelse><a href="/color-gem-stone/pink-#categ#.cfm"></cfif>Pink #categ#</a></td></cfoutput>
  </tr>
  <tr>
    <td style="padding:5px;margin:2px;background-color:#CC3333" >&nbsp;</td>
   <cfoutput>  <td style="padding:5px;margin:2px"><cfif categ eq "jewelry"><a href="red-gemstone-#categ#.cfm"><cfelse><a href="/color-gem-stone/red-#categ#.cfm"></cfif>Red #categ#</a></td></cfoutput>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td style="padding:5px;margin:2px;background-color:#330099">&nbsp;</td>
    <cfoutput> <td style="padding:5px;margin:2px"><cfif categ eq "jewelry"><a href="blue-gemstone-#categ#.cfm"><cfelse><a href="/color-gem-stone/blue-#categ#.cfm"></cfif>Blue #categ#</a></td></cfoutput>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td style="padding:5px;margin:2px;background-color:#808080" >&nbsp;</td>
    <cfoutput> <td style="padding:5px;margin:2px"><cfif categ eq "jewelry"><a href="grey-gemstone-#categ#.cfm"><cfelse><a href="/color-gem-stone/grey-#categ#.cfm"></cfif>Grey #categ#</a></td></cfoutput>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td style="padding:5px;margin:2px;background-color:#000000">&nbsp;</td>
     <cfoutput><td style="padding:5px;margin:2px"><cfif categ eq "jewelry"><a href="black-gemstone-#categ#.cfm"><cfelse><a href="/color-gem-stone/black-#categ#.cfm"></cfif>Black #categ#</a></td></cfoutput>
  </tr>
  <tr>
    <td style="padding:5px;margin:2px;background-color:#009933" >&nbsp;</td>
    <cfoutput> <td style="padding:5px;margin:2px"><cfif categ eq "jewelry"><a href="green-gemstone-#categ#.cfm"><cfelse><a href="/color-gem-stone/green-#categ#.cfm"></cfif>Green #categ#</a></td></cfoutput>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td style="padding:5px;margin:2px;background-color:#663300">&nbsp;</td>
     <cfoutput><td style="padding:5px;margin:2px"><cfif categ eq "jewelry"><a href="brown-gemstone-#categ#.cfm"><cfelse><a href="/color-gem-stone/brown-#categ#.cfm"></cfif>Brown #categ#</a></td></cfoutput>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td style="padding:5px;margin:2px;background-color:#FFCC00" >&nbsp;</td>
     <cfoutput><td style="padding:5px;margin:2px"><cfif categ eq "jewelry"><a href="yellow-gemstone-#categ#.cfm"><cfelse><a href="/color-gem-stone/yellow-#categ#.cfm"></cfif>Yellow #categ#</a></td></cfoutput>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td style="padding:5px;margin:2px;background-color:#ffffff" >&nbsp;</td>
    <cfoutput> <td style="padding:5px;margin:2px"><cfif categ eq "jewelry"><a href="multicolor-gemstone-#categ#.cfm"><cfelse><a href="/color-gem-stone/multi-color-#categ#.cfm"></cfif>Multi-Color #categ#</a></td></cfoutput>
  </tr>
  <cfif category eq "earrings">
  <tr>
    <td align="center" colspan="11" padding="5px"><a href="vermeil_earrings.cfm" >Vermeil Earrings</a></td>
  </tr>
  </cfif>
</table>

<br />
