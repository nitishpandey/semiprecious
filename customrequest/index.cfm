<cfparam name="form.passcode" default="">
<cfparam name="session.passcode" default="">
<cfparam name="session.apptt" default="">


<cfif form.passcode eq application.admin_email or session.mail eq application.admin_email>
<cfset session.passcode = application.admin_email>
<Cfset session.mail = application.admin_email>


<!---<cflocation url="cartstatus21.cfm" addtoken="no">--->
</cfif>
<CFIF session.mail neq application.admin_email or session.apptt is "">
</TD></TD></TD></TH></TH></TH></TR></TR></TR></TABLE></TABLE></TABLE></A></ABBREV></ACRONYM></ADDRESS></APPLET></AU></B></BANNER></BIG></BLINK></BLOCKQUOTE></BQ></CAPTION></CENTER></CITE></CODE></COMMENT></DEL></DFN></DIR></DIV></DL></EM></FIG></FN></FONT></FORM></FRAME></FRAMESET></H1></H2></H3></H4></H5></H6></HEAD></I></INS></KBD></LISTING></MAP></MARQUEE></MENU></MULTICOL></NOBR></NOFRAMES></NOSCRIPT></NOTE></OL></P></PARAM></PERSON></PLAINTEXT></PRE></Q></S></SAMP></SCRIPT></SELECT></SMALL></STRIKE></STRONG></SUB></SUP></TABLE></TD></TEXTAREA></TH></TITLE></TR></TT></U></UL></VAR></WBR></XMP><HTML><HEAD><TITLE>Error Occurred While Processing Request</TITLE>
<cfoutput>#session.mail#</cfoutput>
  </HEAD>
  <BODY>
  <HR>
  <H3>Error Occurred While Processing Request</H3>
  <P> 
  <TABLE BORDER>
    <TR> 
      <TD><H4>Error Diagnostic Information</H4>
        <P>An error has occurred. 
        <P> <B> <H3>HTTP/1.0 404 Object Not Found</B></H3>
        <P></TD>
    </TR>
  </TABLE>
  <form action="admin.cfm" method="post">
    Site that you want to go to:
<input name="passcode" type="text">
    <input type="submit" value="BUSH THEM!">
  </form>
  <P> 
<li><a href="../tm-tm/" class="greenbutton">Admin Menu</a></li>
  <hr>
  <p>&nbsp;</p>
  </BODY>
  </HTML>
<CFABORT />
</CFIF>
<html>
<head>
<title>Control Panel</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css">  

</head>

<body style="margin-top:0;text-align:left;">
	<ol> <b>FREQUENTLY USED</B>
<li><a href="http://www.semiprecious.com/customrequest/stone_color_setter_IHS.cfm?image=9560&category=rings#CurrentPage#" class="greenbutton">Fix Stone Colors</a></li>
<li><a href="stone_adder.cfm">Add a stone type</a></li>
<li><a href="coloreduploader.cfm">Add a colored Image</a></li>
<li><a href="customitems.cfm" class="greenbutton">Process items</a></li>
<li><a href="../tm-tm/" class="greenbutton">Admin Menu</a></li>
</ol>
</body>
</html>