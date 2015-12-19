<cfquery name=stones datasource=gemssql>
Select  distinct  stone from ltbstones 
</cfquery>

<cfset catlist ="beads,necklaces,pendants,earrings,brooches,rings,healing,bracelets">

<cfoutput query="stones">
   
<cfset subcat=  #replace(replace(stone," ","","All"),",","_","All")#>
<cfset subcat2=  #replace(stone," ","_","All")#>
        #lcase(subcat)#.cfm, /real-gemstones/stone-#lcase(subcat2)#.html<br> 

		 
   
      <cfloop index="catname" list=#catlist#>
#lcase(subcat)#_#lcase(catname)#.cfm, /gemstone-jewelry/gemstone-#catname#/real-gemstones/stone-#lcase(subcat2)#.html<br> 
        
   </cfloop>
   </cfoutput>


