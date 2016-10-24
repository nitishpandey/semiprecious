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
	displayname="Commodity Price Tracker"
	output="false"
	hint="Handle the application">

	<!--- Set up the application. --->
	<cfset THIS.Name = "cpt" />

	<cfset THIS.ApplicationTimeout = CreateTimeSpan( 1, 2, 1, 0 ) />


	<cfset THIS.SessionManagement = true />
	<!--- 	<cfset THIS.Sessiontimeout= CreateTimeSpan( 0, 1, 30, 0 ) />
		<cfset THIS.SetClientCookies = true /> --->
	<cfset THIS.datasource = "cpt" />
	<cfset Application.datasource = "cpt" />

	<!--- Define the page request properties. --->
	<cfsetting requesttimeout="2" showdebugoutput="true" enablecfoutputonly="false" />

	<cffunction	name="OnApplicationStart"	access="public" returntype="boolean"	output="false"
		hint="Fires when the application is first created.">
		<!--- Return out. --->
		<!--- lets set up the entity for post log in options --->
		<!--- need to add application time out --->
		<!--- TODO: How does application rerun this section once it is timed out --->
		<cfscript>
			initialize();
		</cfscript>
			<cflog application="true" text="Started up" type="Lifecycle" />

		<cfreturn true />
	</cffunction>

	<cffunction	name="OnSessionStart"
		access="public"
		returntype="void"
		output="false"
		hint="Fires when the session is first created.">
		<!--- Return out. --->
		<cfreturn />
	</cffunction>

<cffunction		name="OnRequestStart"	access="public"
		returntype="boolean"
		output="true"
		hint="Fires at first part of page processing. Then OnCFC or OnRequest as the case may be.">
		<!--- Define arguments. --->
		<cfargument		name="TargetPage" type="string" required="true" />
		<!--- figure out the intent --->
		<!--- Here we can block off all folders other than service folder from being accessed form the web using ReGEX --->
		<cfif not isdefined("session.user")>
			  <cfinvoke method="dologin" returnvariable="r" />
		</cfif>
		<cfscript> application.rootfolder = getdirectoryfrompath(getcurrenttemplatepath());


		 Application.rootdir = getdirectoryfrompath(getcurrenttemplatepath()) ;
		</cfscript>
		<cfset session.mail  = '' />
		<cfset Application.admin_email = session.mail />
		<cfset session.apptt="nitish" />


		<cfscript>
			if (isdefined("url.application_restart") OR isdefined("url.applicationrestart") or isdefined("url.restart_application"))

				{
					initialize();

				}


				if (isdefined('getHttpRequestData().headers["X-Requested-With"]'))
				    {
				    Request.isAjax = true;
				    }
				    else
				    {
				    	  Request.isAjax = false;
				    }

		  </cfscript>
		  	<cfmapping logicalpath="customrequest" directorypath="#Application.rootdir#" />
		<cfloop collection="#url#" item="j">
			<cfset form["#j#"] = urldecode(url["#j#"]) />
		</cfloop>
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
<cffunction name="dologin" access="private">


	<cfscript>
	return true;
		Form.service = 'doLogin';
		structdelete(url,'service',false);
	</cfscript>


</cffunction>
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
			<cflog application="true" text="Shut down" type="Lifecycle" />

		<!--- Return out. --->
		<cfreturn />
	</cffunction>

	<cffunction access="private" output="false" name="initialize" returntype="void" hint="use url restartApplication in URL">
		<cfscript>
  			Application.mode = "local"; // make it anything other than local to make it in production mode, then it will read properties from the file named "properties" else it will read	from local_properties
			Application.depends_on = "Hosting location of the events (MMM) dir	ectory";
			Application.dbhost = "localhost";
			Application.deploymentprefix = "/";
			Application.cfcprefix = "#this.Name#.";
			Application.urlprefix =  "#cgi.context_path#/#this.name#";
			Application.url = "#protocol()#://#cgi.HTTP_HOST#/#cgi.context_path#/#this.name#"; //do not include last forward slash

			if (!DataSourceIsValid("#this.name#"))
				{
				var ds = { username: "root", databasename: "#this.name#", password: "bebb@123", drivername: "org.gjt.mm.mysql.Driver", hoststring:
					"jdbc:mysql://#Application.dbhost#:3306/#this.name#?useUnicode=true&characterEncoding=UTF-8" };
				DataSourceCreate("#this.name#", ds);
				}

			this.readproperties();
			Application.dsn = this.name;
		</cfscript>

	</cffunction>

	<cffunction access="private" output="true" name="readproperties">
		<cfif application.mode is "local">
			<!--- the four up movements are based on the fact that working directory is configured 4 levels deep from location of the openbd app context --->
			<cffile action="read" file="../../../../#this.name#/local_properties" variable="properties" charset="UTF-8" />
		<cfelse>
			<cffile action="read" file="../../../../#this.name#/properties" variable="properties" charset="UTF-8" />
		</cfif>
		<cfloop list="#properties#" index="row" delimiters="#chr(10)#">
			<cfif find("##",row) is 1>
				<cfcontinue />
			</cfif>
			<cftry>
				<cfset application[trim(listgetat(row,1,"="))] = trim(listgetat(row,2,"=")) />
			 <cfcatch>
				<cflog application="true" text="Reading properties on startup. Looks like your properties file has an error!" type="warning" />


			 </cfcatch>
			 </cftry>

		</cfloop>
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
