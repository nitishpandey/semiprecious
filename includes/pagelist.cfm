        
		<b>Pages:</b>
				<cfset numberdisplayed = displayrows*displaycolumns>
			<cfset page=1>
			 <cfloop from=1 to=#getlist.recordcount-numberdisplayed# step=#numberdisplayed# index="i">
			
			
		<cfoutput> <a href='#currentfile#?category=#category#&start=#page*numberdisplayed#
		<cfif url.sortorder neq "">&sortorder=#url.sortorder#</cfif>
		<cfif subcat neq "">&subcat=#subcat#</cfif><cfif color neq "">&color=#color#</cfif><cfif priceless neq "">&priceless=#priceless#</cfif><cfif pricegreater neq "">&pricegreater=#pricegreater#</cfif><CFIF jewelrysize neq "">&jewelrysize=#jewelrysize#</CFIF><CFIF salestatus neq "">&salestatus=#salestatus#</CFIF><cfif advancedsearch neq "">&advancedsearch=#URLEncodedformat(advancedsearch)#</cfif><cfif style neq "">&style=#style#</cfif><cfif groupname neq "">&groupname=#groupname#</cfif>' >
			#page#		</a> | 
</cfoutput>	
<cfset page=page+1>
			
			</cfloop>
			
        