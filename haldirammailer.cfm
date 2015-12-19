<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>

<body>
<!---- create news letter in the mailer body of th e php mailer in haldirams --->
<!---- create a table for haldiram subscribers 
<cfquery datasource="sptm" username="nitish" password="rangeela">
create table haldiram_members  (name varchar(40), phone varchar(20), email varchar(50),nlstatus smallint(2),address varchar(80))
</cfquery>
 <cfset address = ''>
<cfset rootpath = getdirectoryfrompath(getcurrenttemplatepath()) >
<cffile action="read" file="#rootpath#2004customers.txt"  variable="thecsv"   />

<cfloop list="#thecsv#"  index="k" delimiters="#chr(13)##chr(10)#" >
<cfset count = 0>
Ha
<cfloop list="#k#" index="j" delimiters=",">
<cfset count = count + 1>
<cfswitch expression="#count#" >
<cfcase value="6">
<cfset name = #j#>
</cfcase>
<cfcase delimiters="," value="11,7,8,9,10">
<cfset address = address & ' ' & j>
</cfcase>
<cfcase value="12">
<cfset phone = j>
</cfcase>
<cfcase value="13">
<cfset email = j>
<cfset count = 0>
<cfif email neq 'bleep'  and  not find('bleep',address)>
<cfquery datasource="sptm" username="nitish" password="rangeela" name="unq">
select * from haldiram_members where email  = '#email#'
</cfquery>
<cfif  not unq.recordcount>
<cfquery datasource="sptm" username="nitish" password="rangeela">
insert into haldiram_members (name,address,phone,email,nlstatus) values ( '#name#','#address#','#phone#','#email#',0)
</cfquery>
</cfif>
</cfif>
<cfset address = ''>
</cfcase>
</cfswitch>
</cfloop>
</cfloop> --->
 pick 20 of  them and invoke mail url for each of them 1 by one 
 update status to done for each of them 
<!--- for some reaseon the above code added 1 extra row for each entry  with bleep falling in email field 
<cfinvoke component="mysqlquery" method="query"  returnvariable="r">
<cfinvokeargument name="myArgument" value="select * from haldiram_members" />
</cfinvoke>
<cfdump expand="no" var="#r#" /><cfinvoke component="mysqlquery" method="query"  returnvariable="r">
<cfinvokeargument name="myArgument" value="update haldiram_members set nlstatus = 0" />
</cfinvoke>--->
<cfset count = 0>
<cfset emailstosend = 30>
<cfset haldiramnltosend = 1>
<cfinvoke method="query" component="mysqlquery" returnvariable="rv" >
<cfinvokeargument  name="myArgument" value="select * from haldiram_members where nlstatus < #haldiramnltosend#" >
</cfinvoke>
<cfset rv = "">
<cfset rv = querynew('name,email')>
<cfset r = queryaddrow(rv,1)>
<cfset r = querysetcell(rv,'name','nitish',1)>
<cfset r = querysetcell(rv,'email','nitishpandey@rediffmail.com',1)>

<cfif rv.recordcount LT emailstosend>
<cfset emailstosend = rv.recordcount>
</cfif>
<cfloop query="rv">
<cfif name eq ''>
<cfset name = 'customer'>
</cfif>
<cfoutput>#email#</cfoutput>
<cfhttp redirect="yes" url="http://www.haldiramusa.com/nlmailer.php" method="get" >
<cfhttpparam name="email" value="#trim(email)#" type="url" >
<cfhttpparam name="cusname" value="#urlencodedformat(trim(name))#" type="url">
</cfhttp>
<cfoutput>#cfhttp.FileContent#</cfoutput>
 <cfinvoke method="query" component="mysqlquery" returnvariable="r">
<cfinvokeargument name="myArgument" value='update haldiram_members set nlstatus = #haldiramnltosend# where email = "#email#"' >
</cfinvoke> 
<cfset count = count +1 >
<cfif count eq emailstosend>
<cfbreak />
</cfif>
</cfloop>
</body>
</html>
