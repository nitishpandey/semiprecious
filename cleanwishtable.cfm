<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<CFQUERY DATASOURCE="gemssql" name="j">
select email, subcat,newitem,dateadded from wish  order by email,newitem,dateadded desc
</CFQUERY>
<cfset e = ''>
<cfset n = ''>
<cfoutput>#now()#, #j.recordcount#</cfoutput>
<cfloop query="j"  >
<cfif email neq e or newitem neq n > <!--- is there a change --->
<CFQUERY NAME="wishinsert" DATASOURCE="gemssql">
delete from wish where email = '#email#' and newitem ='#newitem#' 
</CFQUERY>
<CFQUERY NAME="wishinsert" DATASOURCE="gemssql">
INSERT INTO wish(email, newitem,subcat,dateadded) VALUES('#email#', '#newitem#','#subcat#','#dateadded#')
</CFQUERY>
<cfset e = email>
<cfset n = newitem>
</cfif>
</cfloop>

<cfoutput>#now()#</cfoutput>
<CFQUERY DATASOURCE="gemssql" name="j">
select email, subcat,newitem,dateadded from wish  order by email,newitem,dateadded desc
</CFQUERY>
<cfoutput>#now()#, #j.recordcount#</cfoutput>

</body>
</html>
