<cfquery name=stones datasource=gemssql>
Select  distinct  stone from ltbstones 
</cfquery>

<cfset catlist ="beads,necklaces,pendants,earrings,brooches,rings,healing,bracelets">

<cfset colorlist ="red,green,blue,yellow,white,black,purple,blue,brown,multicolor,orange,pink,multi">

<cfloop index="colorname" list=#colorlist#>
<!---
<cfset subcat=  #replace(replace(stone," ","","All"),",","_","All")#>
<cfset subcat2=  #replace(stone," ","_","All")#>
  --->
     <!---   <cffile action = "write" 
         file = "C:\ColdFusion8\wwwroot\semiprecious\redirect\#lcase(subcat)#.cfm"    
         output = "<cfheader statuscode='301' statustext='Moved permanently'>
		 <cfheader name='Location' value='http://www.semiprecious.com/gems/#lcase(subcat2)#.html'> 
	 ">--->	<cfoutput>
/color-gem-stone/#lcase(colorname)#-jewellery.cfm,/gems/#lcase(colorname)#.html<br>
/color-gem-stone/#lcase(colorname)#-jewelry.cfm,/gems/#lcase(colorname)#.html<br></cfoutput>
   <cfloop index="catname" list=#catlist#>
	<cfoutput>/color-gem-stone/#lcase(colorname)#-#lcase(catname)#.cfm,/jewelry/gemstone-#catname#/gems/#colorname#.html<br></cfoutput>
		 
   
   
<!---        <cffile action = "write" 
         file = "C:\ColdFusion8\wwwroot\semipreciouswholesale\redirect\#lcase(subcat)#_#lcase(catname)#.cfm"    
         output = "<cfheader statuscode='301' statustext='Moved permanently'>
		 <cfheader name='Location' value='http://www.semiprecious.com/jewelry/#catname#/gems/#lcase(subcat2)#.html'> 
		 ">
--->
        
   </cfloop>
</cfloop>


