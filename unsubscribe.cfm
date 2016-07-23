<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFPARAM NAME="session.affil" DEFAULT="-">
<CFPARAM NAME="afid" DEFAULT="-">
<CFPARAM NAME="category" DEFAULT="">
<CFSET session.mail="">
<CFSET session.affil="#afid#">
<cfparam default="" name="url.email" type="string">
<HTML>
<HEAD>
<TITLE>Unsubscribe from this nonsense jewelry website, I like spam better</TITLE>

<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="/js/imageswap.js"></script>
</HEAD>
<BODY style="margin-top:0px;" onLoad="document.forms[0].em.focus();" >
<div align="center">
<CFINCLUDE TEMPLATE="/header#session.country#.cfm">
<table id="container1" width="926px" cellspacing="0" cellpadding="0" border="0" style="padding:0 2px 0 2px">
  <tr  align="center">
    <td valign="top"  align="center" ><!--- BEGIN LEFT SIDE STUFF --->
      <CFINCLUDE TEMPLATE="leftmenus.cfm">
      <!--- END LEFT SIDE STUFF --->
    </td>
    <td align="center" valign="top" style="padding-left:2px">
    <div align="center">
    <br><br><br>
    <cfform action="unsubscribe.cfm" method="post">
        Email Id to Unsusbscribe:
        <cfinput name="em" type="text" size="40" required="yes" message="Provide Your Email id."  value="#url.email#">
        <br /><br />
        <input size="10" type="hidden" required="yes" message="Your Password Please." name="password">
        <input name="" type="Submit" class="greenbutton" value="Unsubscribe">
      </CFFORM>
    <br><br><br>
      </div>
      <cftry>
        <cfif isdefined("form.em")>
          <CFQUERY DATASOURCE="semiprecious" NAME="email">
        SELECT firstname FROM memberinfo WHERE email ='#form.em#'
        </CFQUERY>
          <cfif email.recordcount>
			            <cfquery name="" datasource="gemssql">
			          delete from wish where email = '#form.em#' 
			          </cfquery>
			           <cfquery name="" datasource="sptm">
			          	delete from bulkbuyercoupons where email = '#form.em#' 
			          </cfquery>
			           <cfquery name="" datasource="sptm">
			          	delete from invite_credits where email = '#form.em#' 
			          </cfquery>
			           <cfquery name="" datasource="sptm">
			          	delete from invited where email = '#form.em#' 
			          </cfquery>
			            <cfquery  datasource="gemssql" name="getid">
			          Select customerid from crmkey where email = '#form.em#' 
			          </cfquery>
					    
			            <cfquery  datasource="gemssql">
			          delete from crmkey where email = '#form.em#' 
			          </cfquery>
			           <cfif getid.RecordCount>
					    <cfquery  datasource="gemssql">
			          delete from crmmsg where customerid = #getid.customerid#
			          </cfquery>
					  </cfif>
			            <cfquery name="" datasource="semiprecious">
			          delete from memberinfo where email = '#form.em#' 
			          </cfquery>
			            <cfquery name="" datasource="sptm" username="nitish" password="rangeela">
			          delete from bulkbuyers where email = '#form.em#' 
			          </cfquery>
			            <span class='error2'>Unsubscribe succesful - wishes and record for <cfoutput>#form.em# </cfoutput>erased.</span>
            <cfelse>
		            <cfquery datasource="sptm"  username="nitish" password="rangeela" name="d">
				  select id from bulkbuyers where email = '#form.em#'
				  </cfquery>
		            <cfif d.recordcount >
				              <cfquery name="" datasource="sptm" username="nitish" password="rangeela">
				          delete from bulkbuyers where email = '#form.em#' 
				          </cfquery>
						  <cfquery name="" datasource="gemssql">
			          delete from wish where email = '#form.em#' 
			          </cfquery>
			            <cfquery  datasource="gemssql" name="getid">
			          Select customerid from crmkey where email = '#form.em#' 
			          </cfquery>
					    
			           <cfif getid.RecordCount>
					    <cfquery  datasource="gemssql">
			          	delete from crmmsg where customerid = #getid.customerid#
			          </cfquery>
					    <cfquery  datasource="gemssql">
			          	delete from crmkey where email = '#form.em#' 
			          </cfquery>
			          
					  </cfif>
			          
						<span class='error2'>Unsubscribe succesful - wishes and record for <cfoutput>#form.em# </cfoutput>erased.</span>  
		              <cfelse>
				              <script language="JavaScript">
				alert("Email  incorrect!");
				</script>
		            </cfif>
          </cfif>
        </cfif>
        <cfcatch type="Database">
		<cfoutput>#cfcatch.detail#,#cfcatch.message#, <cfif isdefined("cfcatch.sql")>#cfcatch.sql# </cfif></cfoutput>
          Email not found or Some database error.
        </cfcatch>
      </cftry>
      <br>
      <!--- <cfinclude template="jewelry_list.cfm">--->
</td></tr>
<!--- Footer --->
<tr><td colspan="2">
<cfinclude template="/mainfooter.cfm">
<!--- End footer --->
    </td>
  </tr>
</table>
</div></BODY>
</HTML>
