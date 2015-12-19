<cfparam default="" name="Url.welcome" />
<html>
<head>
<title>Error Encountered</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/semiprecious_stlye.css" rel="stylesheet" type="text/css">
</head>

<body>
<!---
<cfset k = 1 />
<cfset scriptname = replace(cgi.script_Path,'/','') />
<cfset cat = listgetat(scriptname,1,'_') />
<cfset stone = listgetat(scriptname,2,'_') />
<cfif findnocase(cat,'necklacearringbraceletpendantcufflink')>
 <cflocation url="#stone#_#cat#.cfm" />
 </cfif> 
<cfoutput>#k#, #cat#,#stone#,#scriptname#</cfoutput>
<cfoutput>#error.HTTPReferer# 
</CFOUTPUT>--->
<table align="left"  cellpadding="4" border="0" width="770px" style="margin:0px;margin-top:4px;">
         <!--- <tr height=100> 
            <td  align="center" valign="top" background="images/Bracelets/thumb/5064.jpg" ><br><br><a href='http://www.semiprecious.com/bracelets.cfm'><strong>BRACELETS</strong></a> </td>
            <td   align="left" valign="top" background="images/indexcenter/amber.jpg"><a href="amber.cfm"><strong>Amber!</strong></a><td width=140 align="center" valign="middle" background="images/indexcenter/beads.jpg">
	<a href='beads.cfm'><strong>GEMSTONE BEADS</strong></a></td>
          </tr>---> 
		  <!---	<cfinclude template="bags.htm">--->	
	<!---  <tr valign="center" width=600 align=left >
	  <td align="center" width="360" style="width:360px;height:290px;padding:0px;">
		  <div style="position:relative;width:360px;height:290px;padding:0px;">
		  <cfif session.tld is 'semiprecious.in' and 0	>
		 <a href="http://www.semiprecious.com/gem_stone_necklaces.cfm/9202_necklaces_amethyst.htm">
			 <img border="0"  alt="gemstone sterling silver jewelry" style="z-index: 0; display: inline;" 
src="/myproject/centergraphics/christmas2010/christmas4.jpg" id="SlideShow" ide="changing_image_img"
width="360"   />
			</a>
			  <cfelse>
		<a href="/detail.cfm?newitem=13593">
			 <img border="0"  alt="gemstone sterling silver jewelry" style="z-index: 0; display: inline;" 
src="/images/rings/13593.jpg" width="200"   />
			</a>
			</cfif>
	  		 </div> <cfinclude template="/includes/homeslideshow.cfm"/>
</td><td valign="top" align="left" >
	
	 <a href="/detail.cfm?newitem=11971">
			 <img border="0"  alt="gemstone sterling silver jewelry" style="z-index: 0; display: inline;" 
src="/images/pendants/11971.jpg" width="150"   />
			</a>
Over 8000 designs of jewelry made from semiprecious stones and sterling silver

</td>
</tr>--->
  <cfquery  datasource="gemssql" name="accouncementhome" cachedwithin="#createtimespan(0,0,1,0)#">
  select description, linkto from contenthome where domain like '#left(cgi.server_name,5)#%' and category='announcement' and seq is null
  </cfquery>
  <cfif accouncementhome.recordcount gt 0> 
   <tr align="center" valign="top"> 
      <td colspan="2" valign="top" align="left">
	  <font color="brown"><b><cfoutput>#accouncementhome.description#. Click <a href=#accouncementhome.linkto#>here</a>.</cfoutput></b></font>
  </td>
  </tr>
  </cfif>

   <tr align="center" valign="top"> 

			<td valign="top" align="center" width=500 >
		The page you are looking for (<cfoutput>
  #error.template#</cfoutput>) does not exist. Please check the page name you have typed or continue from below.

      <cfinclude template="/includes/indexhubcssasclass.cfm">
	  </td>
		<td>
			 <!---<cfinclude template="/includes/right_menu.cfm" /> ---></td>
		</tr>
	
<!---           <cfinclude template="pippinindex.htm">--->
	<!---<cfinclude template="stone-beads.htm">--->

	
		<!---    <tr align=center valign="top"> 
     <td colspan="6" valign="top" align=left background=images/tdbg2.jpg><font =arial>
<cfinclude template=vacation.inc>
	<a href=valentines-day-jewelry.cfm>Stone Hearts Collection</a> - Even the stone-hearted can not resist the little  hearts carved in stone on this Saint Valentines Day, our love collection of beautiful jewelry just for your beloved.
 
  
      </td>
    </tr>--->


   <tr align="center" valign="top"> 
      <td colspan="2" valign="top" align="left" >

	<cfoutput><a href="#lcase(monthasstring(month(now())))#-birthstone.cfm>#monthasstring(Month(now()))#"></cfoutput>Birthstone Jewelry</a> - Birthstone Earrings, pendants, necklaces, rings for the current month.
 <br>Also, next months -<cfoutput> <a  href="#lcase(monthasstring(dateformat(dateadd("M",1,now()),"m")))#-birthstone.cfm">#monthasstring(dateformat(dateadd("M",1,now()),"m"))#</cfoutput>  Birthstone Jewelry</a><p>
<!----
Remember to bookmark our site for our annual <a href=thanksgivingsale.cfm>Thanksgiving Jewelry Sale</a>
      ---></td>
    </tr>

         </table>

<!--- anup prefers the above output to an attempt to find a close alternative --->
<cfabort />


<cfif error.type is 'coldfusion.runtime.TemplateNotFoundException'>
...
<cfif cgi.query_string contains 'newpage'and 0 >
<!--- send mail directly or from another file --->
<cfelse>  
<cfoutput>
<br />Attempting to take you to the new page . at .. <a href="/find_file.cfm?welcome=#cgi.http_referer#&#CGI.query_string#&file=#error._template#">new URL</a><br />


<script language="JavaScript" type="text/javascript">
<!--
window.location = '/find_file.cfm?welcome=#cgi.http_referer#&#CGI.query_string#&file=#error._template#'; 
//-->
</script>
</cfoutput>
</cfif>
</cfif>

<h2><font color="#808000"> A Request Error occured</font></h2>
<div align="center"><div align="justify" style="border:2px;background-color:white;;color:maroon;width:800px">Oops! There was an error encountered while processing your request. </div>
Possibly you caught us updating/correcting/improving our site? In that case you would find this page working fine
after a few minutes/hours. You may try again or you could shop later.
<p>However, we are sorry for the inconvenience caused to you and would appreciate if you 
  could forward the following information to our administator at anup@semiprecious.com
  <hr />
The error details are: </p> Please forward us the error and help us improve 
our store we will be glad to extend free items worth 10% of your order. Let us 
know about this error and the cartid of your order. <cfoutput> 
  <table>

    <tr> 
      <td bgcolor="##000000"><font color="##FFFFFF">Error Page</font></td>
      <td>#error.template#</td>
    </tr>
    <tr> 
      <td bgcolor="##000000"><font color="##FFFFFF">Source</font></td>
      <td>#url.welcome#</td>
    </tr>
  </table>
</cfoutput>
<p>&nbsp;</p>
<div style="background-color:white;color:black;border:2px black;padding:2px;text-align:left">
<p>
Thankyou for your patience. You can try using the back button and continue your shopping.</p>
</div></div>
</body>
</html>
