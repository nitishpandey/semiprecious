<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfset sitetogo = 'http://www.semiprecious.com/' />
   <cfquery datasource="sptm" username="nitish" password="rangeela" name="q_invited">
      select email, byemail,creditpart from invited where email <> byemail and byemail <> 'anakshar@rediffmail.com' and byemail <> 'nitishpandey@indiatimes.com' order by email
      </cfquery>
	  <cfoutput>#q_invited.recordcount#
	  This page can send emails. Currently not sending.</cfoutput>
	  <cfdump var="#q_invited#" />
	  <cfabort />
	  <cfloop query="q_invited" >
	  <cfquery datasource="semiprecious" name="mem" >select firstname from memberinfo where email = '#byemail#'
	  </cfquery>
	  <cftry>
	    <cfmail from="service@semiprecious.com" to="#trim(email)#" server="mail23.webcontrolcenter.com"   subject="#mem.firstname#'s jewelry invite "  type="html" failto="nitish@semiprecious.com" >
          <div align="center" style="border:1px ridge blue;">
		  <img src="http://www.semiprecious.com/images/newheader.cfm_r1_c1.jpg" />
            <div align="justify">Hi, <br>
               #mem.firstname# has visited and signed up with semiprecious.com. Semiprecious.com is a pioneer in online jewelry selling, since 1996. 
			   Your friend feels that  you must visit the store and see for yourself the fantastic designs at great prices of  silver, pearl and semiprecious jewelry and healing implements.
               The store has  sections for bracelets,pendants, necklaces, earrings ,ornaments (for christmas), healing (like crystals, buddha, terminators) and rings.  <br>
    <br>
                A simple visit will not be  an effort,  you can visit the site right away,  click <a href="http://www.semiprecious.com">here</a>   or cut paste this address on your browser #sitetogo#. 
              <strong>Don't forget to subscribe/register</strong>  because signing up gets you discounts , wish list feature  and ofcourse members get   discounts every time you shop. Your shopping will also add credit to #mem.firstname#'s shopping account.
			  What are you waiting for?</div>
		 <hr />	 <font color="##999999"> Any Queries or concerns please email at nitish@semiprecious.com.</font>
			           </div>
        </cfmail>
		<cfcatch type="any"><cfoutput>#email#</cfoutput></cfcatch></cftry>
		</cfloop>
      
   
</body>
</html>
