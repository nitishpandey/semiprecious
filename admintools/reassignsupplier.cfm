<CFQUERY NAME="remove" DATASOURCE="gemssql" >
update items set supplier='#supplier#' where newitem='#itemid#'
</cfquery>

<cflocation addtoken="no" url="/#oldsupplier#.cfm?itemnum=#itemid#">
