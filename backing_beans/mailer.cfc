<!---
	--- NewCFComponent
	--- --------------
	---
	--- author: nitish
	--- date:   20/02/16
	--->
<cfcomponent accessors="false" output="false" persistent="false">

	<cffunction access="public" description="called  to send the mails" name="sendmail"  output="false" returntype="boolean" >
		<cfargument name="bccto" required="false" default="" />
		<cfargument name="ccto" required="false" default="" />
		<cfargument name="mailto" required="true" />
		<cfargument name="subject" required="true" />
		<cfargument name="mailcontent" required="true" />
		<cfargument name="fromemail" required="false" default="service@semiprecious.com" type="string">
		<cftry>
			<cfmail  server="#application.smtpserver#" port="25" useSSL="false" from="#arguments.fromemail#"
			  password="#application.smtppassword#"  username="#application.smtpuser#"  bcc="#arguments.bccto#" to="#arguments.mailto#" subject="#arguments.subject#" cc="#arguments.ccto#"   type="html">
			         #arguments.mailcontent#
			</cfmail>
			<cfcatch type="any">
				<cfreturn false />
			</cfcatch>
		</Cftry>

		<cfreturn true />
	</cffunction>

</cfcomponent>
