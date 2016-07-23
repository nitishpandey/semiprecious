<CFIF subcat is "" and color is "">
<cfparam name=pricegreater default=5>
<cfparam name=priceless default=1000>
</cfif>
<cfparam name="stored" default="">
<cfparam name="located" default="">
<cfif url.sortorder is "datetaken desc">
<cfset url.sortorder="newitem desc"></cfif>
<cfsavecontent variable="qry">
<cfoutput>
  Select status, newitem, price, case 	when inventory>0 then 1 else 0
		end as instock   from items , (SELECT [key], rank FROM freetexttable(items_FTindex, fulltext, '#form.search_criteria#',100) AS k) x
   where 
  x.[key]=items.newitem 
and
	 (inventory>0 	<cfif cgi.server_name contains 'wholesale'>or orderonrequest=1<cfelse>or (orderonrequest=1 and price>10)</cfif>)  
	 
		<cfif cgi.server_name contains 'wholesale'>
	 and wholesaleprice >0 
	<cfelse>
	and price>0
	</cfif>

and cat <>'ornaments'  and cat <> 'bags'
       
   <CFIF salestatus is 3>
     and (status = 3)
    <CFELSEIF salestatus is 1>
	 	and (status = 1)
     <CFELSE>
     and (status=0 or status=3)
	</CFIF>
	order by rank desc

	</cfoutput>
 </cfsavecontent>
 <cfoutput>
 #qry#
</cfoutput>

