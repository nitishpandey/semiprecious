<cfquery name="groups" datasource="gemssql">
Select distinct groupname from groupings <cfif category neq "All">where cat = '#category#'</cfif>
</cfquery>

<div class="themeslist" id="themespopup" ><p>&nbsp;</p> 
  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="14"><img src="../images/jewelry_box_1.gif" width="14" height="14" hspace="0" vspace="0"    /></td>
      <td height="14"  width="500"  bgcolor="#CCCC99"><img src="images/space.gif" width="1" height="14" /></td>
      <td height="14"><img src="../images/jewelry_box_3.gif" width="14" height="14" hspace="0" vspace="0" align="absmiddle" /></td>
    </tr>
    <tr> 
      <td width="14" bgcolor="#CCCC99">&nbsp;</td>
      <td width="500" align="center"  class="noticeboard">  


<cfoutput query="groups">&nbsp;&nbsp;&nbsp;&nbsp;
<a href="/shaped/#lcase(trim(groupname))#-gemstone-<cfif category neq "All">#lcase(category)#<cfelse>jewellery</cfif>.cfm">
#UCase(groupname)#</a> 
</cfoutput>
&nbsp;&nbsp;&nbsp;&nbsp;
<div align="right" style="display:inline;">[<a href="#"  onMouseDown="javascript:MM_showHideLayers('themespopup','','hide')"><font color="#FF0000">Close</font></a>]</div> 
    </td>
      <td width="14" bgcolor="#CCCC99">&nbsp;</td>
    </tr>
    <tr> 
      <td height="14"><img src="../images/jewelry_box_4.gif" width="14" height="14" hspace="0" vspace="0"    /></td>
      <td height="14" bgcolor="#CCCC99"><img src="images/space.gif" width="1" height="14" /></td>
      <td height="14"><img src="../images/jewelry_box_2.gif" width="14" height="14" hspace="0" vspace="0" align="absmiddle" /></td>
    </tr>
  </table>
</div>
