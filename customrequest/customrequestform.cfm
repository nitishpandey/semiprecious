<html>
<head>
<title>Custom Design Jewellry</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"><meta http-equiv="pragma" content="no-cache">
<link href="../styles/npstyles1.css" rel="stylesheet" type="text/css">
</head>

<body topmargin="1" leftmargin="4th">
<cfinclude template="../headerforlist.cfm">
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
    <cfif isdefined("customrequestid")>
      <cfelse>
      <cfset random = randrange(230,906)>
      <cfparam default="0" name="session.customrequestid">
	  <cfif session.customrequestid eq 0>
	  <cfset session.customrequestid = 'sp'& randrange(220,1990)>
	  </cfif>
	  Custom Request Id:<cfoutput>#session.customrequestid#</cfoutput>
	  
  <div align="center" class="details" style="color:maroon;width:650;text-align:justify;" > 
    To Order a customized or bespoke jewelry design please fill in the form below. 
    In your description of the design you should mention aspects like metal, material 
    ,stones , size, cuts etc. To make explaining of the design easier you can 
    provide us with reference photos as well. The photos can be a scanned hand 
    sketch, a jewelry photo that you might have come across on the web or on our 
    site. For this use the 'Add Design Photo' link at the bottom of the description 
    form. </div>
      <cfform action="addcustomrequest.cfm" method="post">
       <div align="center">
      <table width="591" border="0" cellspacing="0" cellpadding="0" >
        <tr>
          <td width="30"><img src="../images/jewelry_box_1.gif" width="30" height="30"></td>
          <td width="531" bgcolor="#CCCC99">&nbsp;</td>
          <td width="30"><img src="../images/jewelry_box_3.gif" width="30" height="30" align="absmiddle"></td>
        </tr>
        <tr>
          <td bgcolor="#CCCC99">&nbsp;</td>
          <td align="center" background="../images/bottom_bg.gif" bgcolor="#CCCC99"> 
            <table width="466" bordercolor="#000033" background="../images/bottom_bg.gif" bgcolor="#CCCC99">
              <td width="92"> Name</td>
              <td width="362">: 
                <cfinput type="text" name="name" required="yes" maxlength="32" message="Please fill your name."> 
              </td>
              <tr> 
                <td>Country</td>
                <td>: 
                  <cfinput type="text" name="country" required="no" maxlength="32" message="Please fill your name."></td>
              </tr>
              <tr> 
                <td>Email</td>
                <td>: 
                  <cfinput type="text" name="email" required="no" maxlength="38" message="Please fill your name."> 
                  <font color="#800000" size="-1">Please provide</font></td>
              </tr>
              <td>Phone no.</td>
              <td>: 
                <cfinput type="text" name="phone" required="no" maxlength="38" message="Please fill your name."> 
                <font color="#800000" size="-1"> at least one out of</font></td>
              <tr> 
                <td>Fax</td>
                <td>: 
                  <cfinput type="text" name="fax" required="no" maxlength="38" message="Please fill your name."> 
                  <font color="#800000" size="-1">email, phone and fax</font></td>
              </tr>
              <tr> 
                <td>Explain Here</td>
                <td> &nbsp;
                  <textarea cols="44" rows="6" name="description" wrap="soft"></textarea></td>
              </tr>
              <tr> 
                <td colspan="2"> <a href="#" onclick="javascript:popUpWindow('customrequestimageadderform.cfm',70,90,500,400);">Add 
                  Design Photo</a>&nbsp;&nbsp;(<strong>Reload/Refresh this page 
                  after adding a photo!</strong>)&nbsp;&nbsp;&nbsp;&nbsp; </td>
              </tr>
              <tr align="center"> 
                <td colspan="2"> 
                  <input name="submit" class="inputtext" type="submit" value="Submit">
                </td>
              </tr>
            </table>
          </td>
          <td bgcolor="#CCCC99">&nbsp;</td>
        </tr>
        <tr>
          <td><img src="../images/jewelry_box_4.gif" width="30" height="30"></td>
          <td bgcolor="#CCCC99">&nbsp;</td>
          <td><img src="../images/jewelry_box_2.gif" width="30" height="30"></td>
        </tr>
      </table>
  	</div>
      </cfform>
</cfif>
<span class="headerfont"> If you have added images but can't see them then reload 
this page. 
</span>
<cfquery datasource="sptm" name="getimg" username="nitish" password="rangeela">
select * from customrequestimages where reqid = '#session.customrequestid#' 
</cfquery>
	 <div align="center" style="width:410">	 <cfif getimg.recordcount>
<cfoutput query="getimg">T#currentrow#.<img src="#url#" width="150"></cfoutput>
	 </cfif></div>
<cfdirectory action="list" directory="#absolutepath##session.customrequestid#" name="listimg">

	 <div align="center" style="width:410">	 <cfif listimg.recordcount  >
<cfoutput query="listimg">L#currentrow#.<img src="/customrequest/#session.customrequestid#/#name#" width="150"></cfoutput>
	 </cfif>
	 </div>
	 <br>

<div align="center">
<cfinclude template="../adminfooter.cfm">
	</div>
<cfinclude template="../footer.htm">
</body>
</html>
