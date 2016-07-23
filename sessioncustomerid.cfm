
<cftry>
<cfquery datasource="gemssql" name="crm" >
	select customerid from crmkey where email = '#session.mail#'
</cfquery>
    <cfif crm.recordcount>
	  <cfset session.customerid = crm.customerid />
	<cfelse>
	<cfif len(session.bulkbuyer.id)>
		<cfquery datasource="gemssql">
					insert into crmkey (email,customertype,newmsg,tele) values ('#session.mail#','wholesale',0,'#valid.phoneno#')
			</cfquery>
	<cfelse>
		<cfquery datasource="gemssql">
					insert into crmkey (email,customertype,newmsg,tele) values ('#session.mail#','retail',0,'#login.phonenumber#')
			</cfquery>

	</cfif>		
			<cfquery datasource="gemssql" name="crm" >
				select customerid from crmkey where email = '#session.mail#'
			</cfquery>
				  <cfset session.customerid = crm.customerid />
	</cfif>  
 	  <cfcatch type="any">Customer Comes first...<!-- <cfoutput>#cfcatch.message#</cfoutput>--></cfcatch></cftry>
