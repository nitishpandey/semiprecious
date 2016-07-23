<!---<cfquery name=stones datasource=gemssql>
Select oldpage from [301redirect]  where oldpage like '%.cfm/%'
</cfquery>

<cfset SKU2=right(stones.oldpage,len(stones.oldpage)-findnocase('.cfm/',stones.oldpage)-4)>

<cfif find('_', sku2) GE 1>
<cfquery name=addsku datasource=gemssql>
update [301redirect]  set sku=#left(sku2,find('_',SKU2)-1)#
where oldpage = '#stones.oldpage#'
</cfquery>
</cfif>
</cfloop>
--->

<cfset searchterm=replace(cgi.script_name,"/","")>

<cfset SKU2=left(searchterm,findnocase('_',searchterm)-1)>
<cfif IsNumeric(sku2)>
<cfquery name=matcholdnew datasource=gemssql>
Select top 1  newpages, sku as newsku from magentonew where sku='#sku2#' and oldpage<>'Not Visible Individually'
</cfquery>

<cfset searchterm=replace(searchterm,sku2,'')>
<cfset searchterm=replace(searchterm,'_',"")>
<cfset searchterm=replace(searchterm,'_',"+","all")>
<cfset searchterm=replace(searchterm,'-',"+","all")>
<cfset searchterm=replace(searchterm,'.htm',"")>
<cflocation URl="http://www.semiprecious.com/catalogsearch/result/?q=#searchterm#">
<cfoutput>#matcholdnew.newpages#</cfoutput>
</cfif>
<cfoutput>#sku2#, #searchterm#</cfoutput>



<cfoutput>#cgi.script_name#</cfoutput>

