<cfquery name=groups datasource=gemssql>
select distinct cat, groupname from dbo.Groupings
</cfquery>



<cfset catlist ="beads,necklaces,pendants,earrings,brooches,rings,healing,bracelets">

<cfset colorlist ="red,green,blue,yellow,white,black,purple,blue,brown,multicolor,orange,pink,gray">

<!---<cfloop index="groups" list=#colorlist#>
`
<cfset subcat=  #replace(replace(stone," ","","All"),",","_","All")#>
<cfset subcat2=  #replace(stone," ","_","All")#>
  --->
     <!---   <cffile action = "write" 
         file = "C:\ColdFusion8\wwwroot\semiprecious\redirect\#lcase(subcat)#.cfm"    
         output = "<cfheader statuscode='301' statustext='Moved permanently'>
		 <cfheader name='Location' value='http://www.semiprecious.com/gems/#lcase(subcat2)#.html'> 
	 ">--->	<cfoutput query="groups">			   
<cfif cat is 'jewelry'>/shaped/#lcase(groupname)#-gemstone-jewellery.cfm,/gems/#lcase(groupname)#.html<br><cfelseif cat is 'healing'>
/shaped/#lcase(groupname)#-gemstone-#lcase(cat)#.cfm,/healing-crystals/gems/#lcase(groupname)#.html<br><cfelse>
/shaped/#lcase(groupname)#-gemstone-#lcase(cat)#.cfm,/jewelry/gemstone-#lcase(cat)#/gems/#lcase(groupname)#.html<br></cfif></cfoutput>

