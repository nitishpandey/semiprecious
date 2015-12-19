<cfquery name=stones datasource=gemssql>
Select  distinct  stone from ltbstones 
</cfquery>

<cfset catlist ="beads,necklaces,pendants,earrings,brooches,rings,healing,bracelets">

<cfoutput query="stones">
   
<cfset subcat=  #replace(replace(stone," ","","All"),",","_","All")#>
<cfset subcat2=  #replace(stone," ","_","All")#>
        <cffile action = "write" 
         file = "C:\wwww\gem-stones.com\#lcase(subcat)#_jewelry.cfm"     
         output = "<cfheader statuscode='301' statustext='Moved permanently'>
		 <cfheader name='Location' value='http://www.semiprecious.com/real-gemstones/stone-#lcase(subcat2)#.html'> 
		 ">
		  <cffile action = "write" 
         file = "C:\wwww\gem-stones.com\#lcase(subcat)#.cfm"     
         output = "<cfheader statuscode='301' statustext='Moved permanently'>
		 <cfheader name='Location' value='http://www.semiprecious.com/real-gemstones/stone-#lcase(subcat2)#.html'> 
		 ">
		 
   
      <cfloop index="catname" list=#catlist#>
        <cffile action = "write" 
         file = "C:\wwww\gem-stones.com\#lcase(subcat)#_#catname#.cfm"    
         output = "<cfheader statuscode='301' statustext='Moved permanently'>
		 <cfheader name='Location' value='http://www.semiprecious.com/gemstone-jewelry/gemstone-#catname#/real-gemstones/stone-#lcase(subcat2)#.html'> 
		 ">

        
   </cfloop>
   </cfoutput>


