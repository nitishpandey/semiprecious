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
<cfcomponent
	displayname="Application"
	output="false"
	hint="Handle the application.">

	<!--- Set up the application. --->
	<CFIF cgi.server_name contains 'www.'>
	<cfset THIS.Name = "wwwSemiprecious" />
	<cfelse>
	<cfset THIS.Name = "Semiprecious" />
	</cfif>
	<cfset THIS.ApplicationTimeout = CreateTimeSpan( 1, 2, 1, 0 ) />
	<cfset THIS.SessionManagement = true />
	<cfset THIS.ClientManagement = true />
	<cfset THIS.Sessiontimeout= CreateTimeSpan( 0, 4, 30, 0 ) />
	<cfset THIS.SetClientCookies = true />


	<!--- <cfset Application.datasource = "mq" />
	 --->
	 <!--- Define the page request properties. --->
	<cfsetting
		requesttimeout="20"
		showdebugoutput="true"
		enablecfoutputonly="false"
		/>

	<cffunction
		name="OnApplicationStart"
		access="public"
		returntype="boolean"
		output="false"
		hint="Fires when the application is first created.">
		<!--- Return out. --->
		<!--- lets set up the entity for post log in options --->
		<!--- need to add application time out --->
		<!--- TODO: How does application rerun this section once it is timed out --->
		<cfscript> application.rootfolder = getdirectoryfrompath(getcurrenttemplatepath());
		</cfscript><cfinclude template="includes/application_startup.cfm" />
		<cfreturn true />
	</cffunction>

	<cffunction
		name="OnSessionStart"
		access="public"
		returntype="void"
		output="true"
		hint="Fires when the session is first created.">
		<!--- Return out. --->
		<cftry>
			<cfinclude template="/includes/session_start.cfm" />
			<cfif not isdefined("session.mail")>
				<cfset session.mail = "" />
			</cfif>
			<cfcatch type="any">
				<!--- we were getting error because of upcountry asps being removed. Swallowing the error for now
				---->	<cfdump var="#cfcatch#" />
				<cfabort />

			</cfcatch>
		</cftry>
		<cfreturn />
	</cffunction>
<cffunction name="OnRequest"
	access="public"
	returntype="void"
	output="true">
		 <cfargument
            name="Template"
            type="string"
            required="true"
            hint="I am the template that the user requested."
/>
<!--- if we include this in OnRequestStart, it is not visible to the target template.May be it goes out of scope. But If i include it here then it classhes
with the include in sessionstart include of same file.  --->
	<cfif not isdefined("request.session_start")>
	<cfinclude template="/includes/udf.cfm" />
	</cfif>
	<cfinclude template="#Arguments.Template#" />
</cffunction>

	<cffunction		name="OnRequestStart"
		access="public"
		returntype="boolean"
		output="true"
		hint="Fires at first part of page processing. Then OnCFC or OnRequest as the case may be.">
		<!--- Define arguments. --->
		<cfargument		name="TargetPage" type="string"	required="true"	/>
		<!--- figure out the intent --->
		<cfparam name='cfh' default="">
		<cfparam name='display' default="900">
		<cfparam name="nextshipdate" default="" />
		<cfif len(cgi.QUERY_string)>
			<cfif not isdefined("pre")>
				<cfset pre = cgi.QUERY_STRING />
			</cfif>
		<cfelse>
			<cfif not isdefined("pre")>
				<cfset pre = "" />
			</cfif>
		</cfif>
		<cfif cgi.HTTP_HOST contains 'localhost'>
		<cfelse>
			<cfinclude template="includes/process_non_www.cfm" />
		</cfif>
		<cfif not  isdefined("Application.active") or isdefined("url.resettheapplication")>
			<!--- simulate application start process --->
			<cfscript>
				application.rootfolder = getdirectoryfrompath(getcurrenttemplatepath());
			</cfscript>
			<cfinclude template="/includes/application_startup.cfm" />
		</cfif>
		<cfset session.currency = '$'>
		<cfset session.country=''>
		<cfset session.sale_factor = 1 />
		<cfset session.getCountry = 'US' />
		<cfif session.mail is "na">
			<!--- to clean up some page that sets mail to 'na' --->
			<cfset session.mail = "" />
		</cfif>
		<cfif not cgi.QUERY_STRING contains 'asd123' >
			<cfif len(session.bulkbuyer.id)>
				<cfset session.tld = 'semipreciouswholesale.com' />
				<!---<cfelseif session.country is 'india'>
					<cfset session.tld = 'semiprecious.in' />--->
			<cfelse>
				<cfset session.tld = 'semiprecious.com' />
			</cfif>
		</cfif>
		<cfloop collection="#url#" item="j">
			<cfset form["#j#"] = urldecode(url["#j#"]) />
		</cfloop>
		<cfreturn true />
	</cffunction>


	<cffunction name="protocol" access="private">
		<cfreturn listgetat(cgi.SERVER_PROTOCOL,1,"/") />
	</cffunction>

	<!---

		<cffunction	name="OnRequest" access="public"
		returntype="void"
		output="true"
		hint="Fires after pre page processing is complete.">
		<!--- Define arguments. --->
	<cfargument name="TargetPage"
		type="string"
		required="false"
		/>
	<cfreturn />
	</cffunction>
 --->

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



	<cffunction output="true" name="read_properties">
		<cfif application.mode is "local">
			<!--- the four up movements are based on the fact that working directory is configured 4 levels deep from location of the openbd app context --->
			<cffile action="read" file="../../../../#Application.app_name#/local_properties" variable="properties" charset="UTF-8" />
		<cfelse>
			<cffile action="read" file="../../../../#Application.app_name#/properties" variable="properties" charset="UTF-8" />
		</cfif>
		<cfloop list="#properties#" index="row" delimiters="#chr(10)#">
			<cfif find("##",row) is 1>
				<cfcontinue />
			</cfif>
			<cftry>
				<cfset application[trim(listgetat(row,1,"="))] = trim(listgetat(row,2,"=")) />
				<cfcatch>
					<cfoutput>
						Looks like your properties file has an error!
					</cfoutput>
				</cfcatch>
			</cftry>
		</cfloop>
	</cffunction>

	<cffunction name="OnMissingTemplate" access="public">
		<cfinclude template="404.cfm" />
		<!--- if it falls through --->
		<cfheader statuscode="404" />
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

		<cfdump var="#session#">
		<cfdump var='#arguments#' />
		<cfabort />
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
