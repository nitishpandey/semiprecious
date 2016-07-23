<cfcomponent displayname="pdc controller" >
	<cffunction name="add" access="public" returntype="boolean">
		<cfargument name="tdoi" type="date" required="true">
			<cfargument name="tby" type="string" required="true">
		<cfargument name="apdc" type="date" required="true">
		
		<Cftry>
<cfquery datasource="sptm" username="nitish" password="rangeela"  >
insert into taskpdc (tdtoi,tby, pdc, added) values (
#Arguments.tdoi#,'#Arguments.tby#',#Arguments.apdc#,#Now()#)
</cfquery>
<cfcatch type="any">
<cfset myResult = "false">
<cfreturn myResult>

</cfcatch>
</Cftry>		
<cfset myResult = "true">

<cfreturn myResult>
	</cffunction>
	<cffunction name="alterpdc" access="public" output="true" >
		<cfargument name="tdtoi" type="date" required="true">
		<cfargument name="_pdc" type="date" required="true">
		
		<Cftry>
<cfquery datasource="sptm" username="nitish" password="rangeela"  >
insert into taskpdc (tdtoi,tby, pdc, added) values (
'#Arguments.tdtoi#','#session.apptt#',#Createodbcdate(Arguments._pdc)#,#Now()#)
</cfquery>
<cfcatch type="any">
<cfoutput>#CFcatch.detail#</cfoutput>
</cfcatch>
</Cftry>
		
	</cffunction>
	<cffunction access="public" name="gethistory" output="true" returntype="query" displayname="get changes in PDC" hint="provide task key">
	<cfargument name="tdtoi" type="date" required="true">
			<cfargument name="tby" type="string" required="true">
<cftry>		<cfquery name="s" datasource="sptm" username="nitish" password="rangeela" >
select * from taskpdc where tdtoi = #Createodbcdatetime(Arguments.tdtoi)# and tby = '#Arguments.tby#' order by added
</cfquery>
<cfcatch type="database">
Data base error at pdc get history</cfcatch>
</cftry>
<cfreturn s>
	</cffunction>
</cfcomponent>