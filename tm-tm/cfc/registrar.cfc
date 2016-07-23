<!--- Generated by Dreamweaver MX 6.0.1722 [en] (Win32) - Mon Sep 27 10:08:40 GMT+0530 (India Standard Time) 2004 --->
<cfcomponent displayName="user registration" hint="registers and unregisters users">
  <cffunction access="public" name="changepassword" output="true" returntype="boolean" displayname="change password" hint="provide both old and new password, role not required">
    <cfargument name="oldpassword" type="string" required="true" displayname="old password">
    <cfargument name="newpassword" type="string" required="true"  displayname="new password">
    <cfargument name="apptt" type="string" required="false" default="#session.apptt#" displayname="Appointment">
    <cfquery datasource="gemssql"   name="ar">
    select * from users where password = '#Arguments.oldpassword#'
    </cfquery>
    <cfif ar.recordcount>
      <cfquery name="change" datasource="gemssql"  >
      update users set password = '#arguments.newpassword#' where apptt = '#Arguments.apptt#' 
      </cfquery>
      <cfset answer = "true">
      <cfelse>
      <cfset answer = "false">
    </cfif>
    <cfreturn answer />
  </cffunction>
  <cffunction name="register" hint="provide user apptt" access="public" output="true">
    <cfargument name="apptt" required="true" type="string" >
    <cfargument  name="password" required="true" type="string">
    <!--- register body --->
    <!--- first check that the user apptt provided does not exist already  --->
    <cfquery datasource="gemssql"   name="ar">
    select * from users where apptt = '#Arguments.apptt#' 
    </cfquery>
    <cfif ar.recordcount>
      The apptt already exists. <br>
If you have forgotten your password then please  contact tm administrator.<br>
 Else click here to try registering <a href="register.cfm">again</a>. 
      <cfelse>
      <cfquery datasource="gemssql"  >
      insert into users (apptt, password) values ('#Arguments.apptt#','#Arguments.password#') 
      </cfquery>
      User Registered. Please Click <a href="login.cfm">here</a> to Login. 
    </cfif>
  </cffunction>
  
  <cffunction name="get" hint="provide user apptt" access="remote" output="false">
    <cfargument name="apptt" required="false" default="#session.apptt#" type="string" >
	 <cfargument name="tablefield" required="true" type="string" >
    <cfquery datasource="gemssql"   name="ar">
		  select #arguments.tablefield# as k from users where apptt = '#arguments.apptt#'
 </cfquery>
  <cfreturn ar.k />
 </cffunction>
  <cffunction name="change" hint="provide user apptt" access="remote" output="false">
    <cfargument name="apptt" required="false" default="#session.apptt#" type="string" >
	 <cfargument name="tablefield" required="true" type="string" >
	 <cfargument name="newvalue" required="true" type="string" >

    <cfquery datasource="gemssql"   name="ar">
		  update users set #arguments.tablefield# = '#arguments.newvalue#' where apptt = '#arguments.apptt#'
 </cfquery>


    <!--- unregister body --->
  </cffunction>
  <cffunction name="unregister" hint="provide user apptt" access="public" output="true">
    <cfargument name="apptt" required="true" type="string" >
    <!--- unregister body --->
  </cffunction>
  <cffunction name="validate" output="false" returntype="boolean"  >
    <cfargument name="apptt" type="string" required="true" >
    <cfargument name="password" type="string" required="true">
    <cfquery datasource="gemssql"   name="ar">
    select * from users where apptt = '#Arguments.apptt#' and password = '#Arguments.password#' 
    </cfquery>
    <cfif ar.recordcount>
      <cfset check = "true">
      <cfelse>
      <cfset check = "false">
    </cfif>
    <cfreturn check >
  </cffunction>
</cfcomponent>
