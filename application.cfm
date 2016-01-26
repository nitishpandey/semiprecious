<!--- <cfset this.enablerobustexception = true /> --->
<!---<cfif cgi.server_name is "www.semipreciouswholesale.com">
	<cfheader statuscode='301' statustext='Moved permanently'>
	<cfheader name='Location' value="http://www.semiprecious.com/wholesale/">
	</cfif>
	--->
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
<!---
	<cfset newurl= newurl &  replace(cgi.SCRIPT_NAME,"/index.cfm","") >
	<cfif len(pre)>
	<cfset newurl = newurl & "?#pre#" />
	</cfif>
	<CFHEADER statuscode="301" statustext="Moved Permanently">
	<CFHEADER name="Location"  value="#newurl#">
	<cfabort />--->


<cfif cgi.SERVER_NAME does not contain("localhost")>
<cfinclude template="includes/process_non_www.cfm" />
</cfif>

<CFIF cgi.server_name contains 'www.'>
	<CFAPPLICATION name="wwwsemiprecious" setdomaincookies="no"   clientmanagement="yes"  sessionManagement="yes" setclientcookies="yes" clientstorage="cookie" sessiontimeout=#CreateTimeSpan(0,2,0,0)#/>
<cfelse>
	<CFAPPLICATION name="semiprecious" setdomaincookies="no"   clientmanagement="yes"  sessionManagement="yes" setclientcookies="yes" clientstorage="cookie" sessiontimeout=#CreateTimeSpan(0,2,0,0)# />
</cfif>
<cftry>
	<cfset application.rootfolder = getdirectoryfrompath(getcurrenttemplatepath()) />

	<cfif not cgi.QUERY_STRING contains 'asd123' >
		<!---
			<cferror  type="request" template="/requesterrorhandler.cfm">
			--->
		<cfset light = 'pink' />
		<cfset dark = '##D64578' />
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
		<cfif not  isdefined("Application.active") or isdefined("url.resettheapplication")>
		<!--- application start process --->
		<cfset application.rootfolder = getdirectoryfrompath(getcurrenttemplatepath()) />
		<cfinclude template="includes/application_startup.cfm" />
		<cfset application.tollfree = '<font color="purple">512-666-GEMS(4367)</font>' />
	</cfif>

	<CFIF (not isDefined("session.mail")) or (not isdefined("session.cartid")) or (not isdefined("session.cartitem"))>
		<!--- => session start. make sure session.start is not initiali---->
		<cftry>
			<cfinclude template="includes/session_start.cfm" />
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
	<cfelse>
		<cfinclude template="/includes/udf#session.country#.cfm" />
		<!--- udf is required always. it is also required in session set up. however if included during session set up it cannot be included once again --->
	</cfif>
	<cfif session.mail is "na">
		<!--- to clean up some page that sets mail to 'na' --->
		<cfset session.mail = "" />
	</cfif>
	</cfif>
	<cfcatch type="any">
		<!---	<CFAPPLICATION name="semiprecious"  sessionTimeOut="#CreateTimeSpan(0,0,0,0)#" sessionManagement="yes" />--->
		<cfdump var='#cfcatch#' />
		There was an internal error or our browser cookies were corrupted or the server just crashed on you. Click
		<a href="/logout.cfm">
			here
		</a>
		to continue.
		<cfparam name=session.mail default="">
		<cfparam name="session.cart" default="">
		<cfparam name="session.address.country_code" default="">
		<cfparam name="session.cartid" default="">
		<cfif cfcatch.type is 'database'>
			<h1>
				The database server is restarting. Please be patient. The store will be back in a couple of minutes
			</h1>
		</cfif>
		<!---<cfmail to="nitish@semiprecious.com" from="cs@semiprecious.com" subject="Absolute DB cond on application.cfm "  type="html">
			#cfcatch.detail#, #cfcatch.message# for
			<cfdump var="#cfcatch.TagContext[1]#" />
			</cfmail>	--->
		<cfif not isdefined('session.bulkbuyer.id')>
			<cfset session.bulkbuyer.id = "" />
		</cfif>
		<cfif len(session.bulkbuyer.id)>
			<cfset session.tld = 'semipreciouswholesale.com' />
			<!---<cfelseif session.country is 'india'>
				<cfset session.tld = 'semiprecious.in' />--->
		<cfelse>
			<cfset session.tld = 'semiprecious.com'	 />
		</cfif>
		For developers:
		<br />
		<cfoutput>
			#cfcatch.Detail# #cfcatch.Message# #cfcatch.Type#
		</cfoutput>
	</cfcatch>
</cftry>
<!--- move to session_start after 14 Oct 10 --->
<cfif not cgi.QUERY_STRING contains 'asd123' >
	<cfif len(session.bulkbuyer.id)>
		<cfset session.tld = 'semipreciouswholesale.com' />
		<!---<cfelseif session.country is 'india'>
			<cfset session.tld = 'semiprecious.in' />--->
	<cfelse>
		<cfset session.tld = 'semiprecious.com' />
	</cfif>
</cfif>

<!--- handling some requests that are for older SEO friendly URLs and start with /jewelry/#category#/#subcat# --->
<cfif find("jewelry/",cgi.REQUEST_URI)>
	<cfset k = 1 />
	<!--- todo: look at webmaster warnings and missing pages --->
</cfif>
