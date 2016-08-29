<cfparam name="session.role" default="">
    <cflogin  idletimeout="86400"  applicationtoken="wwwsemiprecious" >
	<cftry>
      <cfquery datasource="gemssql"  name="valid">
        select * from users where apptt = '#cflogin.name#' and password = '#cflogin.password#'
      </cfquery>
	  <cfcatch type="any">
      <cflocation url="login.cfm?status=please+log+in" addtoken="no" />
	  </cfcatch>
	  </cftry>
      <cfif valid.recordcount >
		<cfif valid.usertype is "superadmin" or cflogin.name is 'nitish' or cflogin.name is 'anup'  or cflogin.name is 'leena' >
      <cfquery datasource="gemssql"  >
        update users set lastlogin = #createodbcdatetime(now())# where apptt = '#cflogin.name#'
		</cfquery>
			<cfloginuser name="#lcase(cflogin.name)#" password="#cflogin.password#" roles="superadmin" />
			     <cfset session.role = "superadmin" />
	  		<cfelseif cflogin.name is 'OC' or cflogin.name is 'designer' >
			     <cfset session.role = "guestadmin" />
		        <cfloginuser name="#cflogin.name#" password="#cflogin.password#" roles="guestadmin" />
			<cfelseif  cflogin.name is "prashant">
		        <cfloginuser name="#cflogin.name#" password="#cflogin.password#" roles="Vendor" />
			     <cfset session.role = "supplier" />
	    	<cfelse>
	    	    <cfloginuser name="#cflogin.name#" password="#cflogin.password#" roles="admin" />
			     <cfset session.role = "guestadmin" />
			</cfif>
				  <cfset session.apptt  = lcase(cflogin.name) >
    	        	<cfset session.mail  = application.admin_email>
  		     <cfelse>
           <cflocation url="login.cfm?msg=please+log+in" addtoken="no">
              </cfif>

 	<cfif not len(session.role)>
	  <cflogout />
      <cflocation url="login.cfm?status=loggedout" addtoken="no">
    </cfif>
    </cflogin>

 	<cfif not isUserloggedin()  >
     	 <cflocation url="login.cfm?msg=please+provide+valid+password" addtoken="no">
	<cfelseif not len(session.role)>
	  <cflogout />
      <cflocation url="login.cfm?status=logout" addtoken="no">
    </cfif>
    <html>
      <!-- InstanceBegin template="/Templates/tm1.dwt" codeOutsideHTMLIsLocked="false" -->
      <head>
        <!-- InstanceBeginEditable name="doctitle" -->
        <title>Semiprecious.com Task Manager</title>
        <!-- InstanceEndEditable -->
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
          <!-- InstanceBeginEditable name="head" -->

          <link href="tm.css" rel="stylesheet" type="text/css">
            <!-- InstanceEndEditable -->
            <style type="text/css">
              <!--
.tmbody {
	font-family: Geneva, Arial, Helvetica, sans-serif;
	font-size: 12px;
	background-color: #Dddddd;
	border: medium solid #000066;
}
.table1 {
	font-family: "Times New Roman", Times, serif;
	border: thin solid #333366;
	background-color: #FFFFFF;
}
-->
            </style>
            <link href="../stylebhai/tm.css" rel="stylesheet" type="text/css">
</head>

      <body class="tmbody">
        <cfinclude template="tmheader.cfm">
          <div align="center">
            <table class="table1" width="800">
              <tr>
                <td height="400" class="table1">
                  <!-- InstanceBeginEditable name="EditRegionbody" -->
                  <div align="center">
                    <table width="77%" border="1" align="center" cellpadding="2">
                      <tr align="left" bgcolor="#CCCCCC">
                        <td colspan="2" align="center" class="boldtext1">

	<cfoutput>
																||				Main Menu for #getAuthUser()# (#session.role#) ||
         </cfoutput>               </td>
                      </tr>
              <cfif isUSERinRole("superadmin") or isuserinRole("admin")>
          										                      <tr>
                        <td width="4%">&nbsp;</td>
                        <td width="96%">
 								 <a href="/admin.cfm">Admin Page</a>
                        </td>
                      </tr>

    <tr>
                        <td width="4%">&nbsp;</td>

                        <td width="96%">
                          <a href="/cartstatus21.cfm">List Carts</a>
                        </td>
                      </tr>
	</cfif>
              <cfif isUSERinRole("superadmin")>

                <tr>
                  <td >&nbsp;</td>


                  <td>

                    <a href="/bo/userregistration.aspx">
                      New User?
                    </a>

                  </td>

                </tr>        <tr>
                <td >&nbsp;</td>
                <td>
                  <a href="../customrequest/">Customisation Menu</a>
                </td>
              </tr>
                <tr>
                  <td >&nbsp;</td>
                  <td>
						<a href="/crm/crm.cfm">CRM Menu</a>
                  </td>
                </tr>



              <tr>
                <td >&nbsp;</td>
                <td>

                  <a href="/bo/tasks/">Tasks &amp; Issues Management</a>
                </td>
              </tr></cfif>
                <cfif isUSERinRole("superadmin")>

<tr>
                <td >&nbsp;</td>
                <td>
                  <a href="/bo/properties.aspx">Declare Configuration Parameters</a>
                </td>
              </tr>
<tr>
                <td >&nbsp;</td>
                <td>

                  <a href="/bo/fileupload.aspx">Upload Email HTML &amp; Graphics</a>

                </td>
              </tr>

<tr>
                <td >&nbsp;</td>
                <td>
      				<a href="/bo/Giftcoupon/CouponCertificate.aspx">Create Gift Certificate Code</a>
                </td>
              </tr>
</cfif>			<tr>
                <td >&nbsp;</td>
                <td>
      				<a href="/bo/moo/">MOO Management</a>
                </td>
              </tr>
<tr>
                <td >&nbsp;</td>
                <td>
      				<a href="/admintools/contentadder.cfm">Content Management</a>
                </td>
              </tr>


			 <tr>
                <td >&nbsp;</td>
                <td>
                  <a href="/tm-tm/changepassword.cfm">
                    Change Password/Email ID for <cfoutput>#session.apptt#</cfoutput>
                  </a>
                </td>
              </tr>

              <tr bgcolor="#CCCCCC" >
                <td colspan="2">&nbsp;</td>
              </tr>

            </table>
          </div>
          <!-- InstanceEndEditable -->
          </td>
          </tr>
          </table>
          </div>
          <p class="tmbody">&nbsp;</p>
          <cfinclude template="tmfooter.cfm">
</body>
      <!-- InstanceEnd -->
    </html>
