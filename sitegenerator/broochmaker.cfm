

<cfquery name=groups datasource=gemssql>
Select  stone  from ltbstones where cat='brooches'
</cfquery>

<cfoutput query=groups>


<cffile action = "write" 
       file = "d:\inetpub\semiprecious\#lcase(groups.stone)#_brooches.cfm"    

   output = "   <cfset subcat='#groups.stone#'>
   <cfset category='brooches'>
   <cfinclude template='/gemstone_jewelry_gallery.cfm'>
   ">
   
   file made: 	d:\inetpub\semiprecious\#stone#_brooches.cfm
   </cfoutput>

