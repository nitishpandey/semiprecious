<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
</body>
</html>
<cfcomponent>
	<cffunction name="query" access="public" returntype="query" >
		<cfargument name="myArgument" type="string" required="true">
		<cfset myResult = 1>
		<cfquery datasource="sptm" password="rangeela" username="nitish" name="myResult">
 #Arguments.myArgument#
</cfquery>
<cftry>
	<cfreturn myResult>
	<cfcatch  type="expression"><cfset myResult = querynew('i')>	<cfreturn myResult>
	</cfcatch></cftry>
	</cffunction>
</cfcomponent>