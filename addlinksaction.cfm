<html>
<head>
<title>The precious semiprecious site !
</title>
<link href="npstyles1.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<body bgcolor="white">
<CENTER>
  <H2><img name="logo" src="images/logo.jpg" width="132" height="42" alt="" ><img name="logo2" src="images/Semiprecious.gif" width="232" height="42" alt=""></H2>
  <H2 class="banner"><font color="#400000">Thank You!</font></H2>
</CENTER>
<cfparam default="Not Specified" name="form.role">
<cfparam default="Not Specified" name="form.referrer">
<cfparam default="Not Specified" name="form.site_date">
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
</cfquery>
<cfif #checkinteg.recordcount# NEQ 0 or #checkinteg1.recordcount# NEQ 0>
  <H3>This url already exists in our collection. Thankyou.</H3>
  <cfelse>
  <Cftry><cfhttp url="http://#form.url#" method="get" throwonerror="yes" useragent="Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)"> 
    <cfif not find('200',cfhttp.statuscode)>
      <cfoutput>#cfhttp.statuscode# 
      <div class="error1">The site with the provided URL (#form.url#) does not seem to be up 
        at the moment or it does not exist. Please check the entry that you have 
        done.</div></cfoutput>
      <cfelse>
      <CFQUERY NAME="se" DATASOURCE="semiprecious">
      INSERT INTO othersites (URL, price_range, description, 
      refrence_added_by,accepted ) VALUES ('#Form.url#', '#Form.price_range#', 
      '#Form.description#', '#Form.role#','1') 
      </CFQUERY>
      <HR>
      <P>Thank you for entering your data into our database - please visit our 
        site often!</P>
    </cfif>
    <cfcatch>
      Pse inform us at anup@semiprecious.com. An error occured while processing 
      your request. <br>
      <cfoutput>#cfcatch.Detail#, #cfcatch.Message#.</cfoutput>
    </cfcatch>
  </cftry>
</cfif>
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