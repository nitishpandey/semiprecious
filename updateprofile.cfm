<html><!-- InstanceBegin template="/Templates/sp.dwt.cfm" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" --> 
<title>Update Your Profile</title>
<!-- InstanceEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!-- InstanceBeginEditable name="head" --> <!-- InstanceEndEditable -->

<link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css">
<script language="javascript1.1" >
function check_country () {
return true;
if  (document.getElementById('country_dropdown').selectedIndex == 0 )
	{
	
					alert("Please select country");
					return false;
		
	}
	return true;
	}
</script>
</head>

<body >
<div align="center">
<div style="width:930px;" id="container1">

<!-- InstanceBeginEditable name="EditRegion1" -->
<cfparam name="url.email" default="#session.mail#">

<cftry>
  <cfif IsDefined("FORM.MM_UpdateRecord") AND FORM.MM_UpdateRecord EQ "form1">
  			 <cfset country_name= form.earlier_country />
				<cfif isdefined("form.country") >
				<cfif len(form.country) >
				  			<cfinvoke component="countryresolver" method="get_country_name" returnvariable="country_name" >
  								<cfinvokeargument name="code" value="#form.country#">
  						</cfinvoke>
					 <cfset session.address.country_code = form.country />
					</cfif>
					 <Cfif country_name neq 'none'>
							<cfset form.country = country_name />
						<cfelse>
							<cfset form.country= "#form.earlier_country#" />
						</cfif>  
				   <cfelse>
						<cfset form.country= "#form.earlier_country#" />
				  </cfif>
		<cfset session.address.country = form.country />
			

				  
				  <cfquery datasource="semiprecious">
    UPDATE memberinfo SET firstname= '#form.firstname#', address1= 
    <cfif IsDefined("FORM.address1") >
		<cfset session.address.address1 = form.address1 />

      '#FORM.address1#' 
      <cfelse>
      NULL 
    </cfif>
    , address2= 
    <cfif IsDefined("FORM.address2") >
		<cfset session.address.address2 = form.address2 />

      '#FORM.address2#' 
      <cfelse>
      NULL 
    </cfif>
    , city= 
    <cfif IsDefined("FORM.city") >
	<cfset session.address.city = form.city />
      '#FORM.city#' 
      <cfelse>
      NULL 
    </cfif>
    , "state"= 
    <cfif IsDefined("FORM.state") >
	<cfset session.address.state = form.state />

      '#FORM.state#' 
      <cfelse>
      NULL 
    </cfif>
    , country= 
      '#FORM.country#' 
    , zip= 
    <cfif IsDefined("FORM.zip") >
		<cfset session.address.zip = form.zip />

      '#FORM.zip#' 
      <cfelse>
      NULL 
    </cfif>
    , phonenumber= 
    <cfif IsDefined("FORM.phonenumber") >
      '#FORM.phonenumber#' 
      <cfelse>
      NULL 
    </cfif>
    WHERE email='#FORM.email#' 
    </cfquery>
    <!--- <cflocation url="simpleloginform.cfm?#CGI.QUERY_STRING#"> --->
  </cfif>
  <cfcatch type="any">
    Error Occured while updating your profile. You can nevertheless continue shopping. 
    Please do inform us of this error and our technical team will resolve it at 
    the earliest. Sorry for the inconvenience. 
  </cfcatch>
</cftry>
<cfquery name="Recordset1" datasource="semiprecious">
SELECT memberinfo.firstname, memberinfo.email, memberinfo.address1, memberinfo.address2, 
memberinfo.city, memberinfo."state", memberinfo.country, memberinfo.zip, memberinfo.phonenumber 
FROM memberinfo WHERE memberinfo.email = '#url.email#' 
</cfquery>
<cftry>
<cfinclude template="/#session.country#/header.cfm">
<cfcatch type="any">Error in Header</cfcatch></cftry>

 
<br>
<cfif isdefined("form.zip")><span class="Reg_price">    Your Profile Updated!</span></cfif>
</br>
<font color="#000000">You can update the details in the form below :</font> <cfoutput>
<cfform method="post" name="form1" action="">
     
    <table width="345" border="1" align="center" bordercolor="##CCCCCC">
      <tr valign="baseline"> 
      <td width="108" align="right" nowrap class="details">Name</td>
      <td width="221">:<cfinput required="true" type="text" name="firstname" value="#Recordset1.firstname#" size="32"></td>
    </tr>
    <tr valign="baseline"> 
      <td align="right" nowrap class="details">Email</td>
      <td>:#Recordset1.email#</td>
    </tr>
    <tr valign="baseline"> 
      <td align="right" nowrap class="details">Address1</td>
      <td> :
<cfinput required="yes" message="Please provide address" type="text" name="address1" value="#Recordset1.address1#" size="32"></td>
    </tr>
    <tr valign="baseline"> 
      <td align="right" nowrap class="details">Address2</td>
      <td>:
<input type="text" name="address2" value="#Recordset1.address2#" size="32"></td>
    </tr>
    <tr valign="baseline"> 
      <td align="right" nowrap class="details">City</td>
      <td>:
<input type="text" name="city" value="#Recordset1.city#" size="32"></td>
    </tr>
    <tr valign="baseline"> 
      <td align="right" nowrap class="details">State</td>
      <td>:
<input type="text" name="state" value="#Recordset1.state#" size="32"></td>
    </tr>
    <tr valign="baseline"> 
      <td align="right" nowrap class="details">Country</td>
      <td>:
		<cfoutput>#Recordset1.country#</cfoutput>
		<input type="hidden" name="earlier_country" value="<cfoutput>#Recordset1.country#</cfoutput>" />
		</td>
    </tr>
    <tr valign="baseline"> 
      <td align="center" nowrap class="details" colspan= 2>To Change Country Select Below</td>
    </tr>
    <tr valign="baseline"> 
      <td align="center" colspan=2>
		<cfinclude template="/includes/countries_drop_down.cfm" /></td>
    </tr>   
		
    <tr valign="baseline"> 
      <td align="right" nowrap class="details">Zip</td>
      <td>:
<input type="text" name="zip" value="#Recordset1.zip#" size="32"></td>
    </tr>
    <tr valign="baseline"> 
      <td align="right" nowrap class="details">Phone Number</td>
      <td>:
<cfinput  required="false" message="Please Provide Phone No. " type="text" name="phonenumber" value="#Recordset1.phonenumber#" size="32"></td>
    </tr>
      <tr valign="baseline" bgcolor="##666600" background-color="##666600"> 
        <td align="center" nowrap> 
          <input type="reset" name="Reset" value="Reset" class="greenbutton" ></td>
        <td align="center"> 
          <input type="submit" value="Update Details" class="greenbutton" onClick="javascript:return check_country();" ></td>
    </tr>
  </table>
  <cfparam default="subcat=silver&sortorder=datetaken%20desc" name="session.filter" type="string">
<input type="hidden" name="email" value="#Recordset1.email#">
  <input type="hidden" name="MM_UpdateRecord" value="form1">

<p><a href="list.cfm?#session.filter#">Continue 
  Shopping</a></p></cfform></cfoutput>
<!-- InstanceEndEditable --> 
<cfinclude template="/mainfooter.cfm">
</div>
</div>
</body>
<!-- InstanceEnd --></html>
