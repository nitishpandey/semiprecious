<cfparam default="beads" name="category">
<cfparam default="" name="subcat">
<cfparam default="" name="style">

	<cfquery name="stonelist" datasource="gemssql">
		select stone as subcat2 from CatSubcatInStock where  cat='beads' order by stone
	</cfquery>

	

<cfoutput>
	<cfloop query="stonelist">
		<tr>
		<td class="leftstonelist">
		<a href='semiprecious-stone-beads.cfm?subcat=#subcat2#' >#subcat2#<br>
		</td> 
        </tr>
	
	</cfloop>
	</cfoutput>
<tr>
		<td class="leftstonelist" width="90" onMouseOver=this.className='table_row_over'; onMouseOut=this.className='leftstonelist';>
<cfoutput><a href="list.cfm?salestatus=3&category=#category#" class="whiteonred">Clearance</a></cfoutput></td> 
   </tr>
