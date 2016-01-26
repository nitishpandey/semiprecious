<html>
<head>
<title>There was an error processing the request</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="stlye_semiprecious.css" rel="stylesheet" type="text/css">
</head>
Does it work first time?

<body style="background-color:white;width:900px;">

<!---
<cfset k = 1 />
<cfset scriptname = replace(cgi.script_name,'/','') />
<cfset cat = listgetat(scriptname,1,'_') />
<cfset stone = listgetat(scriptname,2,'_') />
<cfif findnocase(cat,'necklacearringbraceletpendantcufflink')>
 <cflocation url="#stone#_#cat#.cfm" />
 </cfif>
<cfoutput>#k#, #cat#,#stone#,#scriptname#</cfoutput>
<cfoutput>#error.HTTPReferer#
</CFOUTPUT>
 <cfif StructKeyExists( VARIABLES, "Error" )>
  <cfdump var='#variables.error#' />
  <cfabort />
</cfif> ....near abort ....
--->

<h2> We are fixing the site...</h2>
<div align="center"><div align="justify" style="border:2px;background-color:white;;color:maroon;width:800px">Oops! There was an error encountered while processing your request. </div>
Possibly you caught us updating/correcting/improving our site? In that case you would find this page working fine
after a few minutes.
<p>However, we are sorry for the inconvenience caused to you and would appreciate if you
  could forward the following information to our administator at anup@semiprecious.com
  <hr />
The error details are: </p> <!--Please forward us the error and help us improve
our store. we will be glad to extend free items worth 10% of your order. Let us
know about this error and the cartid of your order.-->
  <table style="border:1px purple solid;color:red;background-color:white;">
<cfoutput>
   <!--- No longer this key exists <tr>
      <td width="" bgcolor="##000000"><font color="##FFFFFF">Diagnostic</font></td>
      <td width="">#error.Diagnostics#</td>
    </tr>
    <tr>
      <td bgcolor="##000000"><font color="##FFFFFF">URL (if any)</font></td>
      <td>#error.querystring#</td>
    </tr>
    <tr>
      <td bgcolor="##000000"><font color="##FFFFFF">Error Page</font></td>
      <td>#error.template#</td>
    </tr>

    <tr>
      <td bgcolor="##000000"><font color="##FFFFFF">Browser</font></td>
      <td>#error.browser#</td>
    </tr>
    <tr>
    <td>Content</td>
    <td style="width:200px;height:50px;overflow:scroll">#error.generatedcontent#</td>
  </tr>   --->
  </table></cfoutput>

</div>
</body>
</html>
