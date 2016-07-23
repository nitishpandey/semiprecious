<html>
<head>
<title>The precious semiprecious site !
</title>
<link href="npstyles1.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="white">
<CENTER>
  <H2><img name="logo" src="images/logo.jpg" width="132" height="42" alt="" ><img name="logo2" src="images/Semiprecious.gif" width="232" height="42" alt=""></H2>
  <H2 class="banner">Thank You!</H2>
</CENTER>
<cfif mid(form.url,len(form.url),1) EQ "/">
<cfset form.url = mid(form.url,1,len(form.url) - 1)>
</cfif>
<cfif findnocase("http://",form.url)>
<cfset form.url = mid(form.url,8,len(form.url) - 7)>
</cfif>
<CFQUERY name="checkinteg1" datasource='semiprecious'>
select * from othersites where url = 'www.#form.url#' 
</cfquery>

<CFQUERY name="checkinteg" datasource='semiprecious'>
select * from othersites where url = '#form.url#' 
</cfquery><cfif #checkinteg.recordcount# NEQ 0 or #checkinteg1.recordcount# NEQ 0>
<H3>This url already exists in our collection. Thankyou for the visit anyway.</H3>
<cfelse>
<cfhttp url="http://#form.url#" method="get" throwonerror="no">
<cfif cfhttp.statuscode NEQ "200 Success">
<cfoutput>#cfhttp.statuscode#</cfoutput>
<div class="error1">The site with the provided URL does not seem to be up at the moment or it does not exist. Please check the entry that you have done.</div>
<cfelse>
<CFQUERY NAME="se" DATASOURCE="semiprecious">
INSERT INTO othersites (URL, price_range, description, referrers_role_in_the_site, 
refrence_added_by,site_inception_date,accepted ) VALUES ('#Form.url#', '#Form.price_range#', 
'#Form.description#', '#Form.referrer#','#Form.role#','#Form.site_date#','1') 
</CFQUERY>
<HR>
<P>Thank you for entering your data into our database - please visit our site 
  often!</P>
  </cfif></cfif>
<H3>If you wish to remove an entry of your website from our listing please send 
  a mail to service@semiprecious.com. 
  <!--- <CFINSERT DATASOURCE="semiprecious" TABLENAME="main"> --->
  &nbsp; </H3>
<p><i><font color=brown>-----Semiprecious.com----the online store for semiprecious 
  jewelry from India------the best price, quality and service-----since 1997---------</font></i></p>
<P align=center> <span class="title"><A href="http://www.semiprecious.com">Home</A>&nbsp; 
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A href="OtherJewelrySites.cfm">Show listing 
  of Jewelry Web Sites</A> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<A href="addlinksform.cfm">Add 
  More URLs</A></span></p>
</body>
</html>