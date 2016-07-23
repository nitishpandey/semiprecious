<cfquery name="getstorage" datasource="gemssql">
Select Storage, inventory from itemsStorage where itemid=#newitem#
</cfquery>

<cfif getStorage.recordcount GT 0>
<cfoutput query="getstorage"><a href="/admintools/extrastorage.cfm?itemid=#newitem#">Extra Storage</a>: <font color=green>#inventory# in #storage#</font></cfoutput>  
<cfelse>
<cfoutput>
<a href="/admintools/extrastorage.cfm?itemid=#newitem#">Extra Storage</a>
</cfoutput>
</cfif>