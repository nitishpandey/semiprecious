<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfset count = 0 />
<cftry>
<cfdirectory action="list" directory="d:\inetpub\semiprecious\carts\" name="j">
<cfset refdate = dateadd('d',-21,Now())>
<cfloop query="j" >
<cfif datelastmodified LT  refdate>
<cffile action="delete"  file="d:\inetpub\semiprecious\carts\#name#"  />
<cfset count = count + 1 />
			  </cfif>
			  </cfloop>
			  <cfcatch type="any"> 
              </cfcatch>
			  </cftry>
<cfoutput>			  Cleaned #count# files.</cfoutput>
</body>
</html>
