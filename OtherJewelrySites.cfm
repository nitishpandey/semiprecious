<cfset fn = "url asc">

<cfset r = randrange(1,120)>
<cfif r mod 2>
<cfset fn = "url desc">
<cfelseif r mod 3 >
<cfset fn = "description desc">
<cfelse>
<cfset fn = "description asc">
</cfif>
<CFQUERY NAME="se" DATASOURCE="semiprecious">
 Select * from othersites, acceptance where othersites.accepted >= acceptance.acceptance_reqd  order by #fn# 
</CFQUERY>
<html>
<head>
<title>The precious semiprecious site !
</title>
<link href="styles/npstyles1.css" rel="stylesheet" title="styles" type="text/css">
</head>
<body bgcolor="white">
<a href='index.cfm'><img src='http://www.semiprecious.com/images/semiprecious.gif' border=0></a> <a name="listing">
<table border=1 frame=vsides color="gray" align=center width=100%>
  <tr class="greenbutton"> 
    <td align=center> <a href="http://www.semiprecious.com">Home</a></td>
    <td align=center> <A href="contactus.cfm">Add your Web Site to this Listing</A> 
    </td>
    <td align=center> <A href="javascript:alert('Please send an email to service@semiprecious.com . Thankyou');">Remove 
      your Web Site from the listing ?</A> </td>
  </tr>
</table>
<HR>
<!--- <p align="left"><a href="visitjeweldirectory.cfm">Visit a Jewelry Directory.</a>  --->
<table border=0 color="blue">
  
  <span class="details">The Online Jewelery Web </span>
  <tr.title > 
  <tr class="title"> 
    <td align=center> Link to the Web Site </td>
    <td align=center> About the Site</td>
  </tr.title> 
  <!---   <cfset cn = se.columnlist >
  <cfoutput>#cn#</cfoutput> --->
  <CFOUTPUT QUERY="se"> 
    <tr>
      <td><a href="http://#se.url#">#se.url#</a></td>
      <td>#se.description#</td>
    </tr>
  </CFOUTPUT> 
</table>
<!--- <p><a href="visitjeweldirectory.cfm">Visit a Jewelry Directory.</a></p> --->
<HR>
<table width=100% border=1 align=center frame=vsides color="gray">
  <tr class="greenbutton"> 
    <td align=center> <a href="http://www.semiprecious.com">Home</a></td>
    <td align=center> <A href="contactus.cfm">Add your Web Site to this Listing</A> 
    </td>
    <td align=center> <A href="javascript:alert('Please send an email to service@semiprecious.com . Thankyou');" target="_parent">Remove 
      your Web Site from the listing ?</A> </td>
  </tr>
</table>
<a name="delist">  </a> 
<p><i><font color=brown>-----Semiprecious.com----the online store for semiprecious 
  jewelry from India--------the best price, quality and service-----since 1997------------</font></i></p></p> 
</body>
</html>