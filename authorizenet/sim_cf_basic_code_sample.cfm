<!--

###########################################################
#                                                         #
#  D O C U M E N T A T I O N                              #
#                                                         #
#  This code sample has been successfully tested on       #
#  third-party web servers and performed according to     #
#  documented Simple Integration Method (SIM)             #
#  standards.                                             #
#                                                         #
#  Last updated September 2004.                           #
#                                                         #
#  For complete and freely available documentation,       #
#  please visit the Authorize.Net web site at:            #
#                                                         #
#  http://www.authorizenet.com/support/guides.php         #
#                                                         #
###########################################################

###########################################################
#                                                         #
#  D I S C L A I M E R                                    #
#                                                         #
#  WARNING: ANY USE BY YOU OF THE SAMPLE CODE PROVIDED    #
#  IS AT YOUR OWN RISK.                                   #
#                                                         #
#  Authorize.Net provides this code "as is" without       #
#  warranty of any kind, either express or implied,       #
#  including but not limited to the implied warranties    #
#  of merchantability and/or fitness for a particular     #
#  purpose.                                               #
#                                                         #
#                                                         #
###########################################################

###########################################################
#                                                         #
#  C O L D   F U S I O N   D E V E L O P E R S            #
#                                                         #
#  The provided sample code is merely a blue print,       #
#  demonstrating one possible approach to making SIM      #
#  work.                                                  #
#                                                         #
#  1. This sample code is not a tutorial. If you are      #
#  unfamiliar with specific programming functions and     #
#  concepts, please consult the necessary reference       #
#  materials.                                             #
#                                                         #
#  2. This sample code is provided "as is," meaning that  #
#  we will not be able to assist individual e-commerce    #
#  developers with specific programming issues, relating  #
#  to the availability or non-availability of specific    #
#  modules, code libraries or other requirements to make  #
#  this code work on your specific web server             #
#  configuration.                                         #
#                                                         #
#  3. If you cannot get this sample code to work, please  #
#  do not contact Authorize.Net to complain. However, if  #
#  you encounter specific issues and would like to find   #
#  out what you can do to resolve a specific problem, we  #
#  would be happy to help you find a suitable solution    #
#  if time allows and if resources are available. We do   #
#  not promise, however, that we will be able to solve    #
#  your programming problems nor do we make any           #
#  guarantees or promises -- either express or            #
#  implied -- that we will even attempt to address any    #
#  programming issues that anyone encounters using our    #
#  sample code.                                           #
#                                                         #
#  Again, this sample code merely serves as blue print    #
#  for e-commerce developers who either are inexperienced #
#  integrating SIM in ColdFusion or simply want an        #
#  example of how other developers have dealt with this   #
#  challenge in the past.                                 #
#                                                         #
#                                                         #
###########################################################

###########################################################
#                                                         #
#  C O L D   F U S I O N   C U S T O M    T A G S         #
#                                                         #
#  YOU NEED TO ADD THE FOLLOWING CUSTOM TAGS INTO         #
#  YOUR WEB SERVER'S CUSTOM TAG LIBRARY:                  #
#                                                         #
#	  hmac.cfm                                        #
#	  md5.cfm                                         #
#     ripemd_160.cfm                                      #
#	  sha_1.cfm                                       #
#	  sha_256.cfm                                     #
#                                                         #
#  This is a very useful set of custom tags, written      #
#  independently by Tim McCarthy, to create the kind      #
#  of fingerprint (HMAC-MD5) needed for SIM transactions. #
#                                                         #
#  Use at your own risk -- or come up with your own       #
#  HMAC-MD5 conversion routine. The code used was         #
#  downloaded for free at (make sure the URL is on one    #
#  line):                                                 #
#                                                         #
#  http://www.macromedia.com/cfusion/exchange/index.cfm?view=sn130#loc=en_us&view=sn105&viewName=Exchange%20Search&lc_id=28272
#                                                         #
#                                                         #
###########################################################

###########################################################
#                                                         #
#  I I S   C O M P A T I B I L I T Y   I S S U E S        #
#                                                         #
#  This sample code has not been tested on ColdFusion     #
#  installations on IIS.                                  #
#                                                         #
#  We cannot anticipate every potential e-commerce        #
#  developer's platform, server configuration and         #
#  server versions. As a result, we do not provide any    #
#  troubleshooting assistance for any of our code         #
#  samples.                                               #
#                                                         #
#  If you need to get the AIM ColdFusion code sample      #
#  to work on your specific IIS web server, please refer  #
#  to both IIS and ColdFusion reference materials for     #
#  assistance.
#                                                         #
#                                                         #
###########################################################

###########################################################
#                                                         #
#  P R E R E Q U I S I T E S                              #
#                                                         #
#  To submit any kind of transaction (even test           #
#  transactions) to Authorize.Net, you need to provide    #
#  valid Authorize.Net account information (a merchant    #
#  log-in ID and a valid merchant transaction key).       #
#                                                         #
#                                                         #
###########################################################

###########################################################
#                                                         #
#  C O N T A C T    I N F O R M A T I O N                 #
#                                                         #
#  For specific questions,                                #
#  please contact Authorize.Net's Integration Services:   #
#                                                         #
#  integration at authorize dot net                       #
#                                                         #
#  Please remember that we cannot support individual      #
#  e-commerce developers with programming problems and    #
#  other issues that could be solved by referring to      #
#  the available reference materials.                     #
#                                                         #
###########################################################

###########################################################
#                                                         #
#  S I M   I N   A   N U T S H E L L                      #
#                                                         #
###########################################################
#                                                         #
#  1. You gather some basic transaction data on your web  #
#  site.                                                  #
#                                                         #
#  2. Using a standard HTML form, you submit the required #
#  information to Authorize.Net, by posting the form data #
#  to a specific URL on Authorize.Net’s secure server.    #
#                                                         #
#  3. On Authorize.Net’s secure server, you collect all   #
#  the financial information on the SIM Payment Form.     #
#                                                         #
#  4. When the transaction has been completed, you may    #
#  either re-direct the user to another web page on your  #
#  web site or complete the transaction on                #
#  Authorize.Net’s secure server.                         #
#                                                         #
#                                                         #
###########################################################

###########################################################
#                                                         #
#  H A R D   C O D E D   V A L U E S                      #
#                                                         #
#  The purpose of this sample code is to demonstrate how  #
#  a basic SIM transaction works.                         #
#                                                         #
#  For this purpose, we have hard-coded a number of       #
#  values, to expedite your testing and integration       #
#  efforts.                                               #
#                                                         #
#  Please, pay special attention to values, such as       #
#  your log-in ID, transaction key, amount, description,  #
#  etc. that may need to be changed throughout this       #
#  code sample and/or its associated include files.       #
#                                                         #
#                                                         #
###########################################################

-->


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Authorize.Net ColdFusion SIM Example</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<style type="text/css" media="all">
<!--
body {
	background-color : #FFFFFF;
	background-image : url(media/bg/pg_bg2.gif);
	background-repeat : repeat-x;
}

/*Styles for the Main Content Layer */
.maindiv {
	border-left : 1px dotted #CCCCCC;
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size : 12px;
	padding-left : 48px;
	padding-right : 36px
}

.maindiv p { line-height : 180%; margin-top : 6px }

.maindiv h1 {
	font-family : Verdana, Arial, Helvetica, sans-serif;
	font-size : 16px;
	margin-bottom : 12px;
	margin-top : 0px
}

.maindiv h2 {
	font-family : Verdana, Arial, Helvetica, sans-serif;
	font-size : 16px;
	margin-bottom : 12px;
	margin-top : 30px
}

.maindiv a:link { color : #9999CC }

.maindiv a:visited { color : #996633 }

.maindiv a:hover { color : #7D7EBD }

.titleTxt {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size : 12px;
}
/*Styles Applied to Form Elements */
form {
	border : 1px dotted #CCCCCC;
	font-family : Verdana, Arial, Helvetica, sans-serif;
	font-size : 12px;
	margin-right : 36px;
	margin-top : 0px;
	padding : 12px
}

input { background-color : #CDC9D8; border : 1px solid #999999 }

input:focus { background : #FFFFFF }

textarea {
	background-color : #FAE4A5;
	border : 1px solid #999999;
	font-family : Verdana, Arial, Helvetica, sans-serif;
	font-size : 12px
}

.checks { background-color : #FFFFFF; border : 1px none }

.formBut { background-color : #CCCCCC }

/*Style Applied to the Paragraphs for Copyright-Small-Text */
p.copyrights {
	color : #999999;
	font-family : Arial, Helvetica, sans-serif;
	font-size : 11px;
	line-height : normal;
	margin-bottom : 12px;
	margin-top : 10px
}

p.footer {
	color : #999999;
	font-family : Arial, Helvetica, sans-serif;
	font-size : 11px;
	line-height : normal;
	margin-top : 6px
}

p.footerfeat {
	color : #999999;
	font-family : Arial, Helvetica, sans-serif;
	font-size : 11px;
	line-height : normal;
	margin-top : 16px
}


//-->
</style>

</head>

<body>

<div id="LayerTitle" style="position:absolute; left:50px; top:24px; z-index:5" class="titleTxt">
<table width="99%" border="0" cellspacing="0" cellpadding="0">
  <tr valign="top">
    <td class="titleTxt">Authorize.Net Integration Services</td>
    <td class="titleTxt"><img src="media/bg/pixie.gif" width="100" height="1" alt="" border="0" /></td>
    <td class="titleTxt">&nbsp;</td>
  </tr>
  <tr valign="top">
    <td class="titleTxt">ColdFusion Sample Code</td>
    <td class="titleTxt"><img src="media/bg/pixie.gif" width="100" height="1" alt="" border="0" /></td>
    <td class="titleTxt" align="right">&nbsp;</td>
  </tr>
  <tr valign="top">
    <td class="titleTxt">&nbsp;</td>
    <td class="titleTxt"><img src="media/bg/pixie.gif" width="100" height="1" alt="" border="0" /></td>
    <td class="titleTxt">&nbsp;</td>
  </tr>
  <tr valign="top">
    <td class="titleTxt">&nbsp;</td>
    <td class="titleTxt"><img src="media/bg/pixie.gif" width="100" height="1" alt="" border="0" /></td>
    <td class="titleTxt" align="right">Last updated: April 14, 2003</td>
  </tr>
</table>


</div>

<div id="LayerMain" style="position:absolute; left:91px; top:100px; z-index:3" class="maindiv">
<h3>ColdFusion&nbsp;&nbsp;::&nbsp;&nbsp;SIM Transaction (basic)</h3>
<form>
<strong>Important:</strong><br>
To make this ColdFusion code example work, you must do the following before you try to post any test transaction.<br>
<br>

1. Obtain an Authorize.Net account.<br>
<br>
2. Generate a valid merchant transaction key.<br>
<br>
3. Customize your Authorize.Net Merchant Interface and define:<br>
&nbsp;&nbsp;&nbsp;- Payment Form*<br>
&nbsp;&nbsp;&nbsp;- Response/Receipt URLs<br>
&nbsp;&nbsp;&nbsp;- Receipt Page<br>
* Required for this sample code demonstration.<br>
<br>
4. Substitute the login ID used in this code with your own.<br>
<br>
5. Verify all other values that will be passed to Authorize.Net.<br>
<br>
<br>
</form>
<br>


<!--
	Get the current time
-->
<cfset TheTimeDate=Now()>
<!--
	Convert the current time to the Greenwhich Mean Time
	(which is the required time that the Authorize.Net
	transaction server uses to verify xp_fingerprint)
-->
	<cfset UCT=DateConvert('local2UTC', TheTimeDate)>
<!--
	Create the required UNIX timestamp (seconds since midnight, January 1, 1970)
-->
	<cfset FirstDate=Now()>
	<cfset SecondDate='1/1/1970'>
	<cfset UCT2=DateDiff("s",SecondDate,UCT)>
<!--
	Test the timestamp and subsequent output
	(this is not required, but we've included it
	here to demonstrate what this might look like)
-->
	<cfoutput>
	Look inside the code to find out how to generate the required UNIX timestamp in ColdFusion:<br>
	<!-- seconds since 1/1/1970: -->#UCT2#<br><br>
	</cfoutput>
<!--
	We set the fpTime variable for later use in the form that will get submitted to Authorize.Net
-->
	<cfset fpTime=#UCT2#>


<!--
	We set the loginid variable for later use in the form that will get submitted to Authorize.Net

	You could, of course, obtain the log-in ID in a number of other ways.

	Remember, this is only a demonstration to give you an idea of what
	might be involved in performing SIM transactions, using ColdFusion.
-->
	Login ID:<br>
	<cfset loginid="your-log-in-id"><cfoutput>#loginid#</cfoutput><br><br>

<!--
	We set the sequence variable for later use in the form that will get submitted to Authorize.Net

	You could, of course, obtain this number in a number of other ways.
	Ideally, you would obtain this number through the integration of a
	database and correlate the number ot your invoice sequence.

-->
	Randomly generated sequence number:<br>
	<cfset sequence=#RandRange(123, 987)#><cfoutput>#sequence#</cfoutput><br><br>
<!--
	Finally, we have all the information to generate a valid fingerprint.

	Since this requires the HMAC-MD5 algorithm — which is not built into
	ColdFusion yet — we are using the external custom tag:
	hmac.cfm

	If you have this freely available custom tag installed in one of the
	many possible locations for CF custom tags, the following code will
	execute properly.

-->
	Resulting fingerprint: <br>
	<cf_hmac data="your-log-in-id^#sequence#^#fpTime#^19.99^" key="woXaEm7LUnz2OizP">
	<cfset fp=#digest#><cfoutput>#fp#</cfoutput><br><br>



	<FORM ACTION="https://certification.authorize.net/gateway/transact.dll" name="simForm">
	<!--Uncomment the line ABOVE for shopping cart test accounts or BELOW for live merchant accounts-->
	<!--<FORM ACTION="https://secure.authorize.net/gateway/transact.dll" name="simForm"> -->
		<INPUT type="text" NAME="x_description" VALUE="CC AUTH ONLY" style="width:300;">&nbsp;x_description<br>
		<INPUT type="text" NAME="x_fp_sequence" value="<cfoutput>#sequence#</cfoutput>" style="width:300;">&nbsp;x_fp_sequence<br>
		<INPUT type="text" NAME="x_fp_timestamp" value="<cfoutput>#fpTime#</cfoutput>" style="width:300;">&nbsp;x_fp_timestamp<br>
		<INPUT type="text" NAME="x_fp_hash" value="<cfoutput>#fp#</cfoutput>" style="width:300;">&nbsp;x_fp_hash<br>
		<INPUT type="text" NAME="x_login" value="your-log-in-id" style="width:300;">&nbsp;x_login<br>
		<INPUT type="text" NAME="x_amount" VALUE="19.99" style="width:300;">&nbsp;x_amount<br>
		<INPUT type="text" name="x_show_form" value="PAYMENT_FORM" style="width:300;">&nbsp;x_show_form<br><br>

		<INPUT TYPE=SUBMIT VALUE="Submit transaction to Authorize.Net!">
	</FORM>

<hr noshade>


<table>
<tr>
   <td>
   <h4>This is a demonstration, showing how to use ColdFusion to genreate a valid fingerprint for Authorize.Net SIM transactions:</h4>
   Please create a fingerprint string:<br>
	<br>
	We need the following (in the order listed below):<br>
	1. x_login<br>
	2. x_fp_sequence<br>
	3. x_fp_timestamp<br>
	4. x_amount<br>
	5. x_currency_code<br>
	6. x_tran_key<br>
	<br>
	<hr noshade>

	<strong>1. x_login:</strong> We already have that (our merchant ID with Authorize.Net) and simply hard-code this value.<br>
	<br>
	your-log-in-id
	<br><br>

	<strong>2. x_fp_sequence:</strong> This can be a randomly generated number OR a merchant-specific, sequential invoice number. For demonstration purposes, we will simply generate a random 3-digit number.<br>
	<br>

	<strong>3. x_fp_timestamp:</strong>  Since this is a timestamp, based on the current time on the client side, we generate this timestamp in JavaScript and refer consistently to the same timestamp throughout the remainder of this script.<br>
	<br>
	<br>

	<strong>4. x_amount:</strong> For demonstration purposes, we will simply hard-code this value.<br>
	<cfset amount="19.99"><br>
	19.99
	<br><br>

	<strong>5. x_currency_code:</strong> This is an optional value. However, if it is used or needed in a transaction, it must be included in the fingerprint generation process. For this simple test, however, we will omit the currency code.<br>
	<br>
	N/A
	<br><br>

	<strong>6. x_tran_key:</strong> The transaction key is generated through the merchant interface (MINT) which is accessible through the Authorize.net web site. Log in with your merchant id, go to Settings and click the Transaction Key link in the Security section. Remember, you need to know the answer to the secret question (which was created when the account was first set up) before you can generate a transaction key or replace an existing one.<br>
	<br>
	ddIjW2RZVgWeY3rA
	<br><br>
   </td>
</tr>
<tr>
   <td>

	<strong>Generating the actual fingerprint</strong>
	<p class="copyrights">It doesn't matter much how you choose to collect all of the needed information. Whether you have a shopping cart solution, a simple HTML form, a fully ColdFusion-generated form and script -- in the end you simply need to transmit all of the required information to the Authorize.Net transaction server.<br><br>


	The required format (without the currency code) looks like this:<br>
	"SCC_test999^x_fp_sequence^x_fp_timestamp^x_amount^", "x_tran_key"<br><br>

	In this fully functional ColdFusion example, we have used the following syntax:<br>
	cf_hmac data="your-log-in-id^#sequence#^#fpTime#^19.99^" key="ddIjW2RZVgWeY3rA"<br>
	<br>
	<br>
	<br>
	</p>

	For additional information and more in-depth explanations, please refer to the following documentation (in PDF format):<br>
	<a href="http://www.authorizenet.com/support/SIM_guide.pdf">Simple Integration Method (SIM): Implementation Guide</a><br><br>
	<br>

   </td>
</tr>
</table>

<p>&nbsp;</p>

<br>
<br>
</div>

<br>
<br>
<br>
</body></html>