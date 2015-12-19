<cfquery name="featured" datasource="gemssql">
Select top 6 newitem, cat from items where inventory>0 and disporder=-100
</cfquery>

        	 <tr>
          <td colspan=6 align="center" width=800>

	          <table width="800"><tr>
          		<td   align="center" valign="top" width="800">
			<cfloop query="featured">
			<cfoutput><a href=detail.cfm?newitem=#newitem#><img src=images/#cat#/thumb/#newitem#.jpg border=0></a>&nbsp;&nbsp;&nbsp;</cfoutput>
			</cfloop>	
	     <!---   </td><td><a href=designer_jewelry_angela.cfm><img src=http://semiprecious.com/images/pendants/thumb/6926.jpg border=0></a></td>--->
	           </tr>
	           </table>
           </td>
           </tr>


                
