
<!--- GROUP PAGE MAKER --->
<cfquery name=groups datasource=gemssql2>
Select  groupname, cat from groupings
</cfquery>

<cfoutput query=groups>
<cffile action = "write" 
   file = "C:\ColdFusion8\wwwroot\semiprecious\shaped\wholesale-#lcase(groupname)#-gemstone-#lcase(cat)#.cfm"    
   output = "
   <cfset groupname='#groupname#'>
   <cfset category='#cat#'>
   <cfinclude template='/gemstone_jewelry_gallery.cfm'>
   ">
   
   file made: 	semiprecious\shaped\wholesale-#lcase(groupname)#-gemstone-jewellery.cfm <br>
   </cfoutput>

<!--- Color page maker----> 
<cfset colorlist ="orange,purple,white,pink,red,blue,gray,grey,black,green,brown,yellow,multi">---
<cfset colorlist ="multi">
<cfset catlist ="jewelry,jewellery,beads,necklaces,pendants,earrings,brouches,rings,healing,bracelets">

<cfloop index="catname" 
list=#catlist#>

   <cfloop index="colorname"
    list=#colorlist#>
	
        
        <cffile action = "write" 
         file = "C:\ColdFusion8\wwwroot\semiprecious\color-gem-stone\wholesale-#lcase(colorname)#-#lcase(catname)#.cfm"    
         output = "
         <cfset color='#colorname#'>
         <cfset category='#catname#'>
         <cfinclude template='/gemstone_jewelry_gallery.cfm'>
         ">
   </cfloop>
   <cfoutput>file made: 	semiprecious\color-gem-stone\wholesale-#lcase(colorname)#-#lcase(catname)#.cfm"  </cfoutput> <br>
 </cfloop>

   
<cfquery name=stones datasource=gemssql2>
Select  distinct  stone from ltbstones 
</cfquery>

<cfoutput query="stones">	 
   
<cfset subcat=  #replace(replace(stone," ","","All"),",","_","All")#>
        <cffile action = "write" 
         file = "C:\ColdFusion8\wwwroot\semiprecious\wholesale-#lcase(subcat)#_healing.cfm"    
         output = "<cfinclude template='#lcase(subcat)#_healing.cfm'> 
		 ">
		 <cffile action = "write" 
         file = "C:\ColdFusion8\wwwroot\semiprecious\wholesale-#lcase(subcat)#_jewelry.cfm"    
         output = "<cfinclude template='#lcase(subcat)#_jewelry.cfm'> 
		 ">

   
      <cfloop index="catname" list=#catlist#>
        <cffile action = "write" 
         file = "C:\ColdFusion8\wwwroot\semiprecious\wholesale-#lcase(subcat)#_#lcase(catname)#.cfm"    
         output = "<cfinclude template='#lcase(subcat)#_#lcase(catname)#.cfm'> 
		 ">


   </cfloop>
   </cfoutput>
   
   
