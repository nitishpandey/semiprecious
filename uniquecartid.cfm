
<!--- <cfif not( application.cartid mod 99) >
<cfquery datasource="semiprecious">
update properties set pvalue = #application.cartid# where pname='cartid'
</cfquery>
</cfif> --->



<cfquery datasource="semiprecious" name="q_cartid">
select cartid , indate from cartstatus order by indate desc
</cfquery>
<!--- <cfquery datasource="semiprecious" name="q_cartid">
select pvalue from properties where pname = 'cartid'
</cfquery> --->

<cfset application.cartid =  q_cartid.cartid*1 +5  >
<!--- <cfquery datasource="semiprecious">
update properties set pvalue = #application.cartid# where pname='cartid'
</cfquery> --->
