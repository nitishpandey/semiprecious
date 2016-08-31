<html>
<head>
<title>Subscriber Details</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<cfparam name="email" default="">

<body>
<cfif email neq "" >
<cfquery name="Recordset1" datasource="gemssql">
	SELECT * FROM memberinfo WHERE memberinfo.email = '#email#' 
</cfquery>

  <table border="1" cellpadding="0" cellspacing="2" bgcolor="#CFEFCC">
    <tr> 
      <td>&nbsp;name</td>
     <!---  <td>&nbsp;Password</td> --->
      <td>&nbsp;email</td>
      <td>&nbsp;address</td>
     <td>&nbsp;address2</td> 
      <td>&nbsp;city</td>
<td>Anniv</td>
      <td>&nbsp;state</td>
      <td>&nbsp;country</td>
      <td>&nbsp;zip</td>
      <td>&nbsp;phonenumber</td>
   <!---    <td>&nbsp;newitemletter</td> --->
      <td>&nbsp;dateupdate</td>
      <td>&nbsp;newearned</td>
      <td>&nbsp;nlstatus</td>
	<td>Budday</td>
    </tr>
    <cfoutput query="Recordset1"> 
      <tr> 
        <td>&nbsp;#Recordset1.firstname# #Recordset1.lastname#</td>
        <!--- <td>&nbsp;#Recordset1.lastname#</td> --->
        <td>&nbsp;#Recordset1.email#</td>
        <td>&nbsp;#Recordset1.address1#</td>
      <td>&nbsp;#Recordset1.address2#</td>
        <td>&nbsp;#Recordset1.city#</td>
        	<td>#doa#/#moa#</td><td>&nbsp;#Recordset1.state#</td>
		
        <td>&nbsp;#Recordset1.country#</td>
        <td>&nbsp;#Recordset1.zip#</td> 
        <td>&nbsp;#Recordset1.phonenumber#</td>
      <!---   <td>&nbsp;#Recordset1.newitemletter#</td> --->

        <td>&nbsp;#Recordset1.dateupdate#</td>
        <td>&nbsp;#Recordset1.newearned#</td>
        <td>&nbsp;#Recordset1.nlstatus#</td>
			<td>#dob#/#mob#</td>
      </tr>
	<tr><td colspan="4">  <p><a href="../simpleloginform.cfm?email=#email#">Login</a> as this user (to 
 view items of interest and credit, invited friends etc.)</p></td><td colspan="3"><a href="wholesale_list.cfm">wholesale list</a> <a href="subscribertrail.cfm">Retail list</a></td></tr> 
<tr><td colspan="7">  <cfform action="mailer.cfc" method="get" enctype="application/x-www-form-urlencoded" >
  <input value="#Recordset1.email#" name="emailid"  /> <input name="customername" value="#recordset1.firstname#"  type="hidden"/>
 
From:<select name="from" ><option value="Service@semiprecious.com" >Service</option><option value="anup@semiprecious.com" >Anup</option><option value="shipping@semiprecious.com">Shipping</option>
<option value="service@semiprecious.com">Service</option><option value="stacy@semiprecious.com">Stacy</option></select>    <input type="hidden" name="method" value="contactretail" />
  <cfinput  name="msg" message="Please give message" required="yes" size="150"  value="" />
  <input type="submit" value="Send Above Message To Retail Buyer" /></cfform>
</td></tr>
    </cfoutput> 
  </table>
  In mail above do not write 'dear' etc. or Regards. ALl that is ther ein the sending logic.
<cfset email  = Recordset1.email />
</cfif>
<hr />
<cfquery datasource="sptm" username="nitish" password="rangeela" name="bbs">
select * from bulkbuyers   where email = '#url.email#' order by lastlogin
</cfquery>
email, lastlogin, name , password, minamt, registerd, paymod, phone+address<br />
<cfif bbs.recordcount>
<span style="error1">Wholesale Buyer:</span>
<cfoutput query="bbs" >
<hr>
#bbs.name# [Reg Date: #bbs.registered#,,#bbs.lastlogin#,]<br />
#bbs.totpurchase#,, Min $ #bbs.minamt#,  #bbs.paymode#, #bbs.address#,#bbs.address2#,#bbs.state#,#bbs.city#,#bbs.country#,#bbs.zip#, #bbs.membershipdate#, #bbs.status#
<hr />
<a href="../simpleloginform.cfm?email=#bbs.email#">Login</a> as this user (you can   view items of interest and credit, invited friends etc.) or 
  see his previous carts
  <cfset email = bbs.email> 
  <cfform action="mailer.cfc" method="get" enctype="application/x-www-form-urlencoded" >
 Email Address: <input value="#bbs.email#" name="emailid"  />
 <input name="customername" value="#bbs.name#"  type="hidden"/>
 From: <select name="from" ><option value="Service@semiprecious.com" >Service</option><option value="anup@semiprecious.com" >Anup</option><option value="nitish@semiprecious.com">Nitish</option>
<option value="service@semiprecious.com">Service</option><option value="stacy@semiprecious.com">Stacy</option></select>    <input type="hidden" name="method" value="contactbulk" />
  <cfinput  name="msg" message="Please give message" required="yes" size="150"  value="" />
      <br>
      <input type="submit" value="Send  Message To Email Address (Wholesale)" /></cfform>
</cfoutput>
</cfif>
 <cfinclude template="searchcarts.cfm"><hr />
<p>Show details for user (email id) :
<form name="form1" method="get" action="" >
  <input name="email" type="text" id="email" >
  <input type="submit" name="Submit" value="Submit" >
</form> </p><a href="/myaccount/changeemailid.cfm">Edit Email</a>
<a href="../admin.cfm">Admin Page</a>
<cfinclude template="../footer.htm">
</body>
</html>
