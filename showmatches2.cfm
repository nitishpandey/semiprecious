
<script language="JavaScript1.1" type="text/javascript">
function checkmatchtype()
 {
 if ( document.forms[0].matchtype.selectedIndex)
    return true;
	alert("You must select a match type.");
document.forms[0].matchtype.focus();
	return false;
 }</script>
 <Cfset erstr = "">
<cfparam name="Application.refid" default="13"><cfif isdefined("form.addid")>
<!--- ipdate the database --->
<!--- ensure thta duplicates are not entered --->

<cfloop list="#form.addid#" index="id">
<cfif id NEQ Application.refid>
<cfquery name="q_already" datasource="semiprecious">
select f1 from match where itemb = #id# and itema = #Application.refid# and f1 = '#form.matchtype#'
</cfquery>
<cfif q_already.recordcount>

 <cfset erstr = erstr & ", " & id>
<!--- <cfquery name="q_already" datasource="semiprecious">
select f1 from match where itema = #id# and itemb= #Application.refid#
</cfquery>
<cfif q_already.recordcount>
<cfquery name="q_already" datasource="semiprecious">
insert into match (itema = #id# and itemb= #Application.refid# 
</cfquery> <cfelse>
</cfif>--->
<cfelse>
<cfquery  datasource="semiprecious" >
insert into match (itema, itemb, f1) values (#Application.refid#, #id#,'#form.matchtype#')</cfquery>
<cfquery  datasource="semiprecious" >
insert into match (itemb, itema, f1) values (#Application.refid#, #id#,'#form.matchtype#')</cfquery>
</cfif>
</cfif>
</cfloop>
</cfif> <cfif isdefined("q_already.recordcount") and q_already.recordcount>
<!---<Cfoutput>
<script>alert("Could not pair up #Application.refid# with #erstr# because their paring already exists as #q_already.f1#.");</script></Cfoutput>
 the table is match, it has two columns for the two items and a third column f1 indicating
type of match. The types of match are Style, Stone, set . To augment the style types one must append them
to the file matchtypes.txt --->
</cfif>
<cfquery name="Recordset1" datasource="semiprecious">
SELECT "match".ITEMA, "match".ITEMB,  "match".f1 FROM "match" WHERE 
"match".ITEMA = #Application.refid# 
</cfquery>

<html>
<head>
<title>Match Maker</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="match.css" rel="stylesheet" type="text/css">

</head>

<body>
<div align="center">

  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0"  width="550" height="240">
    <param name="movie" value="matching2.swf">
  <param name="quality" value="high">
  <embed src="matching2.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="550" height="240" ></embed></object>

<cfparam name="url.cat"  default="bracelets">
<cfset CurrentPage=GetFileFromPath(GetTemplatePath())>
<cfparam name="PageNum_Recordset3" default="1">

<cfswitch  expression="#url.cat#">
    <cfcase value="bracelets">
    
<cfset url.cat = "necklaces">
</cfcase>
    <cfcase value="earrings">
    
<cfset url.cat = "bracelets">
</cfcase>
    <cfcase value="necklaces">
    <cfset url.cat = "pendants">
	</cfcase>
	<cfcase value="pendants">
<cfset url.cat = "earrings">
</cfcase>
</cfswitch>

  <!--- anup --->
  <!--- need to modify this space for ornaments --->
  <cfif url.cat is "Necklaces">
<cfquery name="Recordset3" datasource="semiprecious" username="pandey" password="pandey">
SELECT  Items.newitem, Items.CAT, Items.subcat, size, items.inventory, color,
 Items.Description FROM Items WHERE Items.CAT = 'Necklaces' or ITems.cat = 'Sets'
</cfquery>
<cfelse>
<cfquery name="Recordset3" datasource="semiprecious" username="pandey" password="pandey">
SELECT  Items.newitem, Items.CAT, Items.subcat, size, items.inventory, color,
 Items.Description FROM Items WHERE Items.CAT = '#url.cat#' 
</cfquery>
</cfif>
<!--- anup end --->
<cfset MaxRows_Recordset3=60>
<cfset StartRow_Recordset3=Min((PageNum_Recordset3-1)*MaxRows_Recordset3+1,Max(Recordset3.RecordCount,1))>
<cfset EndRow_Recordset3=Min(StartRow_Recordset3+MaxRows_Recordset3-1,Recordset3.RecordCount)>
<cfset TotalPages_Recordset3=Ceiling(Recordset3.RecordCount/MaxRows_Recordset3)>

<cfset QueryString_Recordset3=Iif(CGI.QUERY_STRING NEQ "",DE("&"&CGI.QUERY_STRING),DE(""))>
<cfset tempPos=ListContainsNoCase(QueryString_Recordset3,"PageNum_Recordset3=","&")>
  <cfif tempPos NEQ 0>
    
  <cfset QueryString_Recordset3=ListDeleteAt(QueryString_Recordset3,tempPos,"&")>
</cfif>
 <cfoutput>
<table border="0" width="88%" align="center">
            <tr> <td width="20%">Showing #url.cat# now.</td>
              <td width="1%" align="center"> <cfif PageNum_Recordset3 GT 1>
                  <a href="#CurrentPage#?PageNum_Recordset3=1#QueryString_Recordset3#"><img src="First.gif" border=0 width="18" height="13"></a> 
                </cfif> </td>
              <td width="21%" align="center"> <cfif PageNum_Recordset3 GT 1>
                  <a href="#CurrentPage#?PageNum_Recordset3=#Max(DecrementValue(PageNum_Recordset3),1)##QueryString_Recordset3#"><img src="Previous.gif" border=0 width="14" height="13"></a> 
                </cfif> </td>
              <td width="14%" align="center"> <cfif PageNum_Recordset3 LT TotalPages_Recordset3>
                  <a href="#CurrentPage#?PageNum_Recordset3=#Min(IncrementValue(PageNum_Recordset3),TotalPages_Recordset3)##QueryString_Recordset3#"><img src="Next.gif" border=0 width="14" height="13"></a> 
                </cfif> </td>
              <td width="18%" align="center"> <cfif PageNum_Recordset3 LT TotalPages_Recordset3>
                  <a href="#CurrentPage#?PageNum_Recordset3=#TotalPages_Recordset3##QueryString_Recordset3#"><img src="Last.gif" border=0 width="18" height="13"></a> 
                </cfif> </td><td width="26%"><a href="showmatches.cfm?cat=#url.cat#" target="_self">Show 
      next category items</a></td>
            </tr>
          </table>
</cfoutput>
<cfoutput>

<form action="showmatches.cfm?PageNum_Recordset3=#PageNum_Recordset3##QueryString_Recordset3#" method="post" onSubmit="return checkmatchtype();" ></cfoutput>

<!---   Click here to Add :
  <input type="submit" name="Submit" value="Commit Match">
  to Item id <cfoutput>#Application.refid#</cfoutput>  --->
    <table border="1">
      <tr bgcolor="#FFFF33"> 
    <!---     <td><font color="#003399">CAT</font></td>
        <td><font color="#003399">subcat</font></td>
        <td rowspan="2"><font color="#003399">Description</font></td> --->
		
        <td><font color="#003399">newitem</font></td>
        <td  rowspan="2"><font color="#003399">Img</font></td>
		
        <td><font color="#003399">newitem</font></td>
        <td  rowspan="2"><font color="#003399">Img</font></td>
		
        <td><font color="#003399">newitem</font></td>
        <td  rowspan="2"><font color="#003399">Img</font></td>
		
        <td><font color="#003399">newitem</font></td>
        <td  rowspan="2"><font color="#003399">Img</font></td>
		
        <td><font color="#003399">newitem</font></td>
        <td  rowspan="2"><font color="#003399">Img</font></td>
		
        <td><font color="#003399">newitem</font></td>
        <td  rowspan="2"><font color="#003399">Img</font></td>
      </tr>
      <tr bgcolor="#FFFF66"> 
        <!--- <td bgcolor="#FFCC99"><font color="#003399">sizeinvent.</font></td>
        <td>color</td> --->
        <td bgcolor="#FF6600"><font color="#003399">Match ?</font></td>
		<td bgcolor="#FF6600"><font color="#003399">Match ?</font></td>
		<td bgcolor="#FF6600"><font color="#003399">Match ?</font></td>
		<td bgcolor="#FF6600"><font color="#003399">Match ?</font></td>
		<td bgcolor="#FF6600"><font color="#003399">Match ?</font></td>
		<td bgcolor="#FF6600"><font color="#003399">Match ?</font></td>
		
      </tr>
	  <cfset colcount = 0>
      <cfoutput query="Recordset3" startrow="#StartRow_Recordset3#" maxrows="#MaxRows_Recordset3#"> 
	  <cfset colcount = colcount + 1>
	  <cfif colcount EQ 7>
	  <cfset colcount = 1>
	  </cfif>
	  <cfif colcount EQ 1>
        <tr> 
		</cfif>
         <!---  <td >#Recordset3.inventory#</td>
          <td>#Recordset3.subcat#</td>
          <td  rowspan="2"> 
            #Recordset3.Description#</td> --->
          <td bgcolor="##FF9933">#Recordset3.newitem#<br>
 <input type="checkbox" value="#newitem#" name="addid"></td>
          <td > 
            <!--- anup --->
            <!--- need to provide img src depending on --->
            <img src="/images/#url.cat#/thumb/#newitem#.jpg" height="50" width="50"></td>
          <!--- anup end --->
     
		  
         <cfif colcount EQ 1>
        </tr> 
		</cfif>
      </cfoutput> 
    </table>

Type of Match : 
  <select name="matchtype">
  <option value="0">Yet To Select</option>
    <option value="Style" selected>Style</option>
    <option value="Set">Set</option>
   <!---  <option value="Stone">Stone</option> --->
  </select>
  Click here to Add : 
  <input type="submit" name="Submit2" value="Commit Match">
    to Reference id<!---  <cfoutput> 
      <input type="hidden" value="#Application.refid#" name="refid">
    </cfoutput> --->
</form> 
If you have the items numbers ready then <a href="itemsmatcher.cfm">click here</a>  <cfoutput>   <table border="0" width="50%" align="center">
            <tr> 
              <td width="23%" align="center"> <cfif PageNum_Recordset3 GT 1>
                  <a href="#CurrentPage#?PageNum_Recordset3=1#QueryString_Recordset3#"><img src="First.gif" border=0 width="18" height="13"></a> 
                </cfif> </td>
              <td width="31%" align="center"> <cfif PageNum_Recordset3 GT 1>
                  <a href="#CurrentPage#?PageNum_Recordset3=#Max(DecrementValue(PageNum_Recordset3),1)##QueryString_Recordset3#"><img src="Previous.gif" border=0 width="14" height="13"></a> 
                </cfif> </td>
              <td width="23%" align="center"> <cfif PageNum_Recordset3 LT TotalPages_Recordset3>
                  <a href="#CurrentPage#?PageNum_Recordset3=#Min(IncrementValue(PageNum_Recordset3),TotalPages_Recordset3)##QueryString_Recordset3#"><img src="Next.gif" border=0 width="14" height="13"></a> 
                </cfif> </td>
              <td width="23%" align="center"> <cfif PageNum_Recordset3 LT TotalPages_Recordset3>
                  <a href="#CurrentPage#?PageNum_Recordset3=#TotalPages_Recordset3##QueryString_Recordset3#"><img src="Last.gif" border=0 width="18" height="13"></a> 
                </cfif> </td>
            </tr>
          </table><a href="showmatches.cfm?cat=#url.cat#" target="_self">Show next category items</a></cfoutput>
</div></body>
</html></body>
</html>
