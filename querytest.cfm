<cfparam name="vquery" default="">
<cfparam name="vquery1" default="email">
<cfparam name="vquery2" default="email">
<cfparam name="vquery3" default="email">
<cfparam name="vcase" default="1">
<form action="querytest.cfm" method="post">
<textarea name="vquery" cols="40"></textarea><br />
<input type="text" name="vquery1" value="" />
<input type="text" name="vquery2" />
<input type="text" name="vquery3" />
<input type="submit" />
</form>
<cfswitch expression="#vcase#">

<cfcase value="1">
<CFQUERY DATASOURCE="gemssql" NAME="Stones">
       select * from buyingrecord order by datebought desc
</CFQUERY>
<cfloop query="Stones">
<cfoutput>#cartid# #itemid# #email# #optionid# #quantity# #rate# <br /></cfoutput>
</cfloop>
</cfcase>

<cfcase value="2">
<CFQUERY DATASOURCE="gemssql" NAME="Stones">
       select * from cartstatus order by indate desc
</CFQUERY>
<cfloop query="Stones">
<cfoutput>#cartid# #status# <br /></cfoutput>
</cfloop></cfcase>



</cfswitch>
