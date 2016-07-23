<!--- validate the login --->
<cfif isdefined("form.login")>
<cfinvoke component="register" method="validate" returnvariable="check" >
<cfinvokeargument value="#form.password#" name="password">
<cfinvokeargument name="apptt" value="#trim(form.apptt)#">
</cfinvoke>
<cfif check>
<cflocation addtoken="yes"  url="/tm/mainmenu.cfm">
<cfelse>
<cflocation addtoken="no" url="/tm/login.cfm">
</cfif>
<cfelse>
<cflocation addtoken="no" url="/tm/login.cfm"></cfif>