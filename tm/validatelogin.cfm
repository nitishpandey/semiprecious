<!--- validate the login --->
<cfif isdefined("form.apptt")>
<cfinvoke component="register" method="validate" returnvariable="check" >
<cfinvokeargument value="#form.password#" name="password">
<cfinvokeargument name="apptt" value="#trim(form.apptt)#">
</cfinvoke>
<cfif check>
<cflocation addtoken="yes"  url="/tm/mainmenu.cfm">
<cfelse>
<cfoutput>#check#</cfoutput>
<cflocation addtoken="no" url="/tm/login.cfm">
</cfif>
<cfelse>
<cflocation addtoken="no" url="/tm/login.cfm">
</cfif>