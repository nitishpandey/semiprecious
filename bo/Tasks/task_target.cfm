<cfif findnocase("@",url.cartid)>
<cflocation url="/crm/viewmessages.cfm?email=#url.cartid#" addtoken="no" />
<cfelseif isNumeric(url.cartid)>
<cflocation url="/itemsell.cfm?cartid=#url.cartid#" addtoken="no" />
<cfelse>
No Target
</cfif>