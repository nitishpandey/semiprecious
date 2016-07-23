<div style="height:12px;border:1px solid black;background:black;padding:2px;">
<div style="border:1px skyblue;background:white;">

<cfquery datasource="gemssql" name="p">
select * from moo where cartid = #url.cartid# and itemid = #url.itemid# and optionid=#url.optionid#
</cfquery>
<cfif p.recordcount  >
<a href="javacript:alert('where to go?'); return false;">
			<cfoutput query="p">
			#dateformat(wipdate,"dd/mm/yyyy")#:#dateformat(shidate,"dd/mm/yyyy")#:#dateformat(rcvdate,"dd/mm/yyyy")#:#dateformat(comdate,"dd/mm/yyyyy")#:#p.sup_tracking#
		</cfoutput>
	</a>
<cfelse>
Item is in queue for production
</cfif>
</div>
</div>