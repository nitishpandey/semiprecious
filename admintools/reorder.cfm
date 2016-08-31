
    


<cfif session.mail is application.admin_email>
    
<cfif isdefined("itemnum")><cfquery name="checkorder" datasource="gemssql">
Select orderfor from anup.restock where itemnum =#itemnum#
</cfquery>

<cfif checkorder.recordcount gt 0>
    <h2><br><br><br>SORRY THIS ITEM ALREADY ASSIGNED TO <cfoutput>#checkorder.orderfor#</cfoutput></h2>
    <cfabort>
	<cfelse>
<cfquery name="addtoorder" datasource="gemssql">
insert into anup.restock (orderdate, orderfor, itemnum, quantity,notes) select '#orderdate#', '#orderfor#', #itemnum#, #quantity#, '#notes#'
</cfquery>

<cfset suppliername=orderfor />
</cfif>

</cfif>
<cfset session.bulk.id ="anupsulekha@hotmail.com">
<cfinclude template="/admintools/supplierrestock.cfm" />
<cfelse>
FBI:YOU ARE NOT AUTHORIZED!
</cfif>
