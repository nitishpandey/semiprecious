<!--- --------------------------------------------------------------------------------------- ----
	Blog Entry:
	ColdFusion Application.cfc Tutorial And Application.cfc Reference
	Author:
	Ben Nadel / Kinky Solutions // A reference file
	Link:
	http://www.bennadel.com/index.cfm?event=blog.view&id=726
	Date Posted:
	May 25, 2007 at 7:22 AM
	---- --------------------------------------------------------------------------------------- --->
<cfcomponent displayname="Application" output="false" hint="Handle the application.">

	<!--- Set up the application. --->
<CFIF cgi.server_name contains 'www.'>
	<cfset THIS.Name = "wwwsemiprecious" />
<cfelse>
	<cfset THIS.Name = "semiprecious" />
</cfif>

	<cfset THIS.ApplicationTimeout = CreateTimeSpan( 1, 0, 0, 0 ) />
	<cfset THIS.SessionManagement = true />
	<cfset THIS.Sessiontimeout= CreateTimeSpan( 0, 1, 30, 0 ) />
	<cfset THIS.SetClientCookies = true />
	<cfset this.enablerobustexception = true />
	<!--- Define the page request properties. --->
	<cfsetting requesttimeout="20" showdebugoutput="true" enablecfoutputonly="false" />

	<cffunction name="OnApplicationStart"
		access="public"
		returntype="boolean"
		output="false"
		hint="Fires when the application is first created.">
		<!--- Return out. --->
		<cfset application.rootfolder = getdirectoryfrompath(getcurrenttemplatepath()) />
		<cfinclude template="/includes/application_startup.cfm" />
		<cfset application.tollfree = '<font color="purple">512-666-GEMS(4367)</font>' />

		<cfreturn true />
	</cffunction>

	<cffunction name="OnSessionStart"	access="public" returntype="void"
		output="false"
		hint="Fires when the session is first created.">

		<!--- TODO: 01 Nov 2014 geoip component not found
			<cfif Not IsDefined('session.getCountry')>
			<cfinvoke component="geoip" method="ip2country" returnvariable="qCountry">
			<cfinvokeargument name="ip" value="#cgi.remote_addr#" />
			</cfinvoke>
			<!---<cfdump var = "#cgi.remote_addr#">--->
		<cfif qCountry.country eq 'IN' AND cgi.server_name does not contain 'wholesale' >
			<cfset session.currency = 'Rs'>
			<cfset session.country='india'>
			<cfset session.sale_factor = 1.1 />
			<cfset session.getCountry = 'IN' />
		<cfelse>
			<cfset session.currency = '$'>
			<cfset session.country=''>
			<cfset session.sale_factor = 1 />
			<cfset session.getCountry = 'US' />
		</cfif>
	</cfif>
	--->
	<cfset session.currency = '$'>
	<cfset session.country=''>
	<cfset session.sale_factor = 1 />
	<cfset session.getCountry = 'US' />
		<cftry>
			<cfinclude template="/includes/session_start.cfm" />
			<cfif not isdefined("session.mail")>
				<cfset session.mail = "" />
			</cfif>
			<cfcatch type="any">
				<!--- we were getting error because of upcountry asps being removed. Swallowing the error for now
				<cfdump var="#cfcatch#" />---->
				<cfif not isdefined("session.mail")>
					<cfset session.mail = "" />
				</cfif>
			</cfcatch>
		</cftry>
		<cfif not cgi.QUERY_STRING contains 'asd123' >
	<cfif len(session.bulkbuyer.id)>
		<cfset session.tld = 'semipreciouswholesale.com' />
		<!---<cfelseif session.country is 'india'>
			<cfset session.tld = 'semiprecious.in' />--->
	<cfelse>
		<cfset session.tld = 'semiprecious.com' />
	</cfif>
</cfif>
		<!--- Return out. --->

		<cfreturn />
	</cffunction>

	<cffunction	name="OnRequestStart"
		access="public"
		returntype="boolean"
		output="false"
		hint="Fires at first part of page processing.">
		<!--- Define arguments. --->
		<cfargument		name="TargetPage"
			type="string"
			required="true"
			/>
		<!---TODO: make recipients enabled and disabled. That way we can switch off all messages to a recipient in one go.
			Make recipient label editable for case of literal. Ensure that the values in the literal label are either phone number of email id.
			Make the recipient of e-r-m combination changeable. That way we can modify the template's recipients very quicly
			when a templates is updated then make sure the global keys exist in properties table
			make availble programmable global variables
			handle logging of events if a particular variable in the template is not found in teh payload
			Make messaging schedulable with absolute time or delay. Then we will have to create a per message set
			a time delay or time. After composing of message the dispatcher will check if this is defined and then compute the time (absolute or relative)
			when the message should be sent and put that in a messages to be sent table.
			Another cron job can process this queue every 5 minutes.
			--->
		<cfparam name='cfh' default="" />
		<cfparam name='display' default="900" />
		<cfparam name="nextshipdate" default="" />
		<cfinclude template="/includes/udf.cfm" />
		<cfif len(cgi.QUERY_string)>
			<cfif not isdefined("pre")>
				<cfset pre = cgi.QUERY_STRING />
			</cfif>
		<cfelse>
			<cfif not isdefined("pre")>
				<cfset pre = "" />
			</cfif>
		</cfif>
		<cfset light = 'pink' />
		<cfset dark = '##D64578' />
		<cfreturn true />
	</cffunction>

<!--- 	<cffunction	name="OnRequest" access="public"
		returntype="void"
		output="true"
		hint="Fires after pre page processing is complete.">
		<!--- Define arguments. --->
		<cfargument name="TargetPage"
			type="string"
			required="false"
			/>
		<cfreturn />
	</cffunction> --->

	<cffunction name="OnRequestEnd"		access="public"
		returntype="void"
		output="true"
		hint="Fires after the page processing is complete.">
		<!--- Return out. --->
		<cfreturn />
	</cffunction>

	<cffunction name="OnSessionEnd"
		access="public"
		returntype="void"
		output="false"
		hint="Fires when the session is terminated.">
		<!--- Define arguments. --->
		<cfargument
			name="SessionScope"
			type="struct"
			required="true"
			/>
		<cfargument
			name="ApplicationScope"
			type="struct"
			required="false"
			default="#StructNew()#"
			/>
		<!--- Return out. --->
		<cfreturn />
	</cffunction>

	<cffunction name="OnApplicationEnd"
		access="public"
		returntype="void"
		output="false"
		hint="Fires when the application is terminated.">
		<!--- Define arguments. --->
		<cfargument
			name="ApplicationScope"
			type="struct"
			required="false"
			default="#StructNew()#"
			/>
		<!--- Return out. --->
		<cfreturn />
	</cffunction>

	<cffunction name="OnError"
		access="public"
		returntype="void"
		output="true"
		hint="Fires when an exception occures that is not caught by a try/catch.">
		<!--- Define arguments. --->
		<cfargument
			name="Exception"
			type="any"
			required="true"
			/>
		<cfargument
			name="EventName"
			type="string"
			required="false"
			default=""
			/>
		<!--- Return out. --->
		<cfdump var="#arguments#">
		<cfreturn />
	</cffunction>



	<cffunction name="DateTimeFormat"
		access="public"
		returntype="string"
		output="false"
		hint="Formats the given date with both a date and time format mask.">
		<!--- Define arguments. --->
		<cfargument
			name="Date"
			type="string"
			required="false"
			hint="The date/time stamp that we are formatting."
			/>
		<cfargument
			name="DateMask"
			type="string"
			required="false"
			default="dd-mmm-yyyy"
			hint="The mask used for the DateFormat() method call."
			/>
		<cfargument
			name="TimeMask"
			type="string"
			required="false"
			default="h:mm TT"
			hint="The mask used for the TimeFormat() method call."
			/>
		<cfargument
			name="Delimiter"
			type="Array"
			required="false"
			default=" at "
			hint="This is the string that goes between the two formatted parts (date and time)."
			/>
		<!---
			Return the date/time format by concatenating the date
			and time formatting separated by the given delimiter.
			--->
		<cftry>
			<cfreturn (
				DateFormat(
				ARGUMENTS.Date,
				ARGUMENTS.DateMask
				) &
				ARGUMENTS.Delimiter &
				TimeFormat(
				ARGUMENTS.Date,
				ARGUMENTS.TimeMask
				)
				) />
			<cfcatch type="any">
				<cfreturn Arguments.Date>
			</cfcatch>
		</cftry>
	</cffunction>

</cfcomponent>
