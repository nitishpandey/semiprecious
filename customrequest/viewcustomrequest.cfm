<html>
<head>
<title>Custom Design Jewellry</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../styles/npstyles1.css" rel="stylesheet" type="text/css">
</head>

<body>
<cfinclude template="../header.cfm">
<cfset absolutepath = getdirectoryfrompath(gettemplatepath())>

 <script language="JavaScript1.1">
var popUpWin=0;
function popUpWindow(URLStr, left, top, width, height)
{
  if(popUpWin)
  {
    if(!popUpWin.closed) popUpWin.close();
  }
  popUpWin = open(URLStr, 'popUpWin', 'toolbar=no,location=no,directories=no,status=no,menub ar=no,scrollbar=no,resizable=no,copyhistory=yes,width='+width+',height='+height+',left='+left+', top='+top+',screenX='+left+',screenY='+top+'');
}
</script>
<cftry>
<cfset session.customrequestid = url.reqid>

  <cfquery datasource="sptm" username="nitish" password="rangeela" name="q">
  select * from customrequest where 1 = 1 <cfif reqid neq 'all'> and  reqid = '#url.reqid#'</cfif>
  </cfquery>
  <cfcatch type="any">
<cfoutput>  Error:#cfcatch.Message#
</cfoutput>  .
  Provide request id here: <form method="get" action="viewcustomrequest.cfm"><input type="text" name="reqid" value="sp"></form>  <cfabort  /></cfcatch>

  </cftry>
      <cfform action="addcustomrequest.cfm" method="post">
       <div align="center">
      <table width="591" border="0" cellspacing="0" cellpadding="0" >
        <tr>
          <td width="30"><img src="../images/Untitled-1.gif" width="30" height="30"></td>
          <td width="531" bgcolor="#CCCC99">&nbsp;</td>
          <td width="30"><img src="../images/Untitled-3.gif" width="30" height="30" align="absmiddle"></td>
        </tr>
        <tr>
          <td bgcolor="#CCCC99">&nbsp;</td>
          <td align="center" background="../images/bottom_bg.gif" bgcolor="#CCCC99"> 
     <cfoutput query="q">       <table width="460" bordercolor="##000033" background="../images/bottom_bg.gif" bgcolor="##CCCC99">
              <td> Name</td>
              <td>: 
                #name# 
              </td>
              <tr> 
                <td>Country</td>
                <td>: 
#country#</td>
              </tr>
              <tr> 
                <td>Email</td>
                <td>: 
               #email#</td>
              </tr>
              <td>Phone no.</td>
              <td>: 
               #phone#</td>
              <tr> 
                <td>Fax</td>
                <td>: 
                  #fax#</td>
              </tr>
              <tr> 
                <td>Explaination:</td>
                <td><textarea cols="44" rows="6" name="description" wrap="soft">#toString(description)#</textarea></td>
              </tr>
              </table></cfoutput>
          </td>
          <td bgcolor="#CCCC99">&nbsp;</td>
        </tr>
        <tr>
          <td><img src="../images/Untitled-4.gif" width="30" height="30"></td>
          <td bgcolor="#CCCC99">&nbsp;</td>
          <td><img src="../images/Untitled-2.gif" width="30" height="30"></td>
        </tr>
      </table>
  	</div>
      </cfform>
Reference	  Images (If any):
    
	<cfquery datasource="sptm" name="getimg" username="nitish" password="rangeela">
	select * from customrequestimages where reqid = '#session.customrequestid#'
	 </cfquery>
	 <div style="width:410">	 <cfif getimg.recordcount>
<cfoutput query="getimg">T#currentrow#.<img src="#url#" width="200"></cfoutput>
	 </cfif></div>
<cfdirectory action="list" directory="#absolutepath#/#session.customrequestid#" name="listimg">

	 <div style="width:410;">	 <cfif listimg.recordcount>
<cfoutput query="listimg">L#currentrow#.<img src="/customrequest/#session.customrequestid#/#name#" width="200"></cfoutput>
	 </cfif>
	 </div>
	 <hr />
Different request:	 <form method="get" action="viewcustomrequest.cfm"><input type="text" name="reqid" value="sp"></form>  


<cfinclude template="../footer.htm">
</body>
</html>
