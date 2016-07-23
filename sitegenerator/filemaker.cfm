
<!--- GROUP PAGE MAKER--->
<cfquery name=groups datasource=gemssql2>
Select  groupname, cat from groupings where cat='beads'
</cfquery>

<cfoutput query=groups>
<!---<cffile action = "write" 
   file = "C:\ColdFusion8\wwwroot\semiprecious\shaped\#lcase(groupname)#-gemstone-#lcase(cat)#.cfm"    
   output = "
   <cfset groupname='#groupname#'>
   <cfset category='#cat#'>
   <cfinclude template='/gemstone_jewelry_gallery.cfm'>
   ">--->

<cffile action = "write" 
   file = "C:\ColdFusion8\wwwroot\semiprecious\shaped\#lcase(groupname)#-gemstone-jewellery.cfm"    
   output = "
   <cfset groupname='#groupname#'>
   <cfset category='jewelry'>
   <cfinclude template='/gemstone_jewelry_gallery.cfm'>
   ">
   
   file made: 	semiprecious\shaped\#lcase(groupname)#-gemstone-jewellery.cfm <br>
   </cfoutput>

<!--- Color page maker 
---<cfset colorlist ="orange,purple,white,pink,red,blue,gray,grey,black,green,brown,yellow,multi">---
<cfset colorlist ="multi">
<cfset catlist ="jewelry,jewellery,beads,necklaces,pendants,earrings,brouches,rings,healing,bracelets">

<cfloop index="catname" 
list=#catlist#>

   <cfloop index="colorname"
    list=#colorlist#>
	
        
        <cffile action = "write" 
         file = "C:\ColdFusion8\wwwroot\semiprecious\color-gem-stone\#lcase(colorname)#-#lcase(catname)#.cfm"    
         output = "
         <cfset color='#colorname#'>
         <cfset category='#catname#'>
         <cfinclude template='/gemstone_jewelry_gallery.cfm'>
         ">
   </cfloop>
   <cfouput>file made: 	semiprecious\color-gem-stone\#lcase(colorname)#-#lcase(catname)#.cfm"  </cfouotput> <br>
 </cfloop>
--->   
<!--- 
<cfquery name=stones datasource=gemssql2>
Select  distinct  stone from ltbstones 
</cfquery>

<cfset catlist ="bead">

<cfoutput query="stones">
   
<cfset subcat=  #replace(replace(stone," ","","All"),",","_","All")#>
        <cffile action = "write" 
         file = "C:\ColdFusion8\wwwroot\semiprecious\healing_#lcase(subcat)#.cfm"    
         output = "<cfheader statuscode='301' statustext='Moved permanently'>
		 <cfheader name='Location' value='http://www.semiprecious.com/#lcase(subcat)#_healing.cfm'> 
		 ">
		 <cffile action = "write" 
         file = "C:\ColdFusion8\wwwroot\semiprecious\jewelry_#lcase(subcat)#.cfm"    
         output = "<cfheader statuscode='301' statustext='Moved permanently'>
		 <cfheader name='Location' value='http://www.semiprecious.com/#lcase(subcat)#_jewelry.cfm'> 
		 ">

   
      <cfloop index="catname" list=#catlist#>
        <cffile action = "write" 
         file = "C:\ColdFusion8\wwwroot\semiprecious\#lcase(catname)#_#lcase(subcat)#.cfm"    
         output = "<cfheader statuscode='301' statustext='Moved permanently'>
		 <cfheader name='Location' value='http://www.semiprecious.com/#lcase(subcat)#_#lcase(catname)#s.cfm'> 
		 ">

        <cffile action = "write" 
         file = "C:\ColdFusion8\wwwroot\semiprecious\#lcase(catname)#s_#lcase(subcat)#.cfm"    
         output = "<cfheader statuscode='301' statustext='Moved permanently'>
		 <cfheader name='Location' value='http://www.semiprecious.com/#lcase(subcat)#_#lcase(catname)#s.cfm'> 
		 ">
         <cffile action = "write" 
         file = "C:\ColdFusion8\wwwroot\semiprecious\#lcase(subcat)#_#lcase(catname)#.cfm"    
         output = "<cfheader statuscode='301' statustext='Moved permanently'>
		 <cfheader name='Location' value='http://www.semiprecious.com/#lcase(subcat)#_#lcase(catname)#s.cfm'> 
		 ">

   </cfloop>
   </cfoutput>
   
--->
