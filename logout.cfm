<cfparam name="session.mail" default="">
<cftry>
	<html>
<head>
<title>Authentic Silver Semiprecious Stone Jewelry</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

    <script src="headhunting/js/jquery-1.5.min.js"></script>
	<script>
	 $(document).ready(function(){
	 $('#cc').show("slow");
	 }
	 );
	 </script>

</head>

<body>
<div align="center">

<div style="width:440px;border:0px solid black;">

<cfif session.mail is application.admin_email>
<cfquery datasource="gemssql">
	update buyingrecord set email=null where cartid=#session.cartid#
</cfquery>
<cfelse>
<!--- TODO: Nitish Nov 14. Moved from sptm to gemssql, also in apply3.cfm, cart.cfm and invitationandcredit.cfc ---->
<cfquery datasource="gemssql"  name="q1">
	update bulkbuyers set loggedin = '0' where email = '#session.mail#'
</cfquery>
<cfquery datasource="gemssql" name="valid">
		       update memberinfo  set loggedin = 0 where email='#session.mail#'
	</cfquery>

</cfif>
<cftry>
	<cfif session.cartid>
	<cfquery datasource="gemssql" >
		    update cartstatus set	shippingdetails = left('#timeformat(now())#|'+ shippingdetails,20) where cartid = #session.cartid#
	</cfquery>
</cfif>

<cfset itemsincart = session.totalqty />
<cfcatch type="any">
	<cfoutput>#cfcatch.detail#</cfoutput>
</cfcatch>
</cftry>
<cfset k = structdelete(session, 'role', "false") />
<cfset k = structdelete(session, 'mail', "false") />
<cfset session.mail = '' />

<cfset k = structdelete(session, 'cffloid', "false") />

<cfset k = structdelete(session, 'urltoken', "false") />

<cfset k = structdelete(session, 'bulkbuyer', "false") />
<cfset k = structdelete(session, 'address', "false") />

<center>
<!---<cfdump var="#session#" />--->


<!---<cflocation url="/index.cfm" />--->
<h2>You have been Logged out from your shopping session</h2>
<div style="height:150px;width:400px;font-size:1.1em;font-family:tahoma;border:4px solid purple;padding:2px;color:#C454EA">
<span class="form_heading">Thank you for visiting our jewelry store</span> <br />


<ul style="text-align:left;color:gray;"><li> Remember to log in on your return to start shopping right from where you left.</li>
<li> We look forward to your future visits, feedbacks and invitation to your friends. </li>

</div>

</center>

<!---
<cfinclude template="mainfooter.cfm" />
 --->
</div>
<div align="center" id="cc" style="display:none;position:relative;margin-top:23px;width:310px;height:180px;background-image:url('/images/logout.jpg');">
<div>
<span style="height:30px;background:darkgreen;color:white;padding:4px;"><a href=/index.cfm style="color:white">Back to website</a></span>&nbsp;
<span style="height:30px;background:orange;color:white;padding:4px;"><a href=/marketing/feedback.cfm style="color:white">Feedback</a></span>
<cfif session.country is "india">
<div style="position:absolute;top:99px;left:43px;background:white;padding:2px;margin-right:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;India&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfoutput>#application["indiaphone"]#</cfoutput></div>
<cfelse>
<div style="position:absolute;top:99px;left:160px;background:white;"><cfoutput>#application["tollfree"]#</cfoutput></div>
</cfif>
</div>
</div>
</div>

</div>     <cfset k = structdelete(session,"cart_xml","false") />
<cfset k = structclear(session) />
			<CFSET session.cartitem=ArrayNew(2)>
					<Cfset session.cartitem[1][1] = 0 />
		<cfif cgi.server_name contains "semiprecious.in">

              <script type="text/javascript">

                var _gaq = _gaq || [];
                _gaq.push(['_setAccount', 'UA-18020608-1']);
                _gaq.push(['_trackPageview']);

                (function() {
                  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
                })();

              </script>
         <cfelse>

              <script type="text/javascript">
              var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
              document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
              </script>

              <script type="text/javascript">
              try {
              var pageTracker = _gat._getTracker(
              <cfif cgi.server_name contains "wholesale">"UA-12470915-1"<cfelse>
              "UA-294143-2"</cfif>);
              pageTracker._trackPageview();
              } catch(err) {}
              </script>

</cfif>
<cflocation url="/login.cfm?msg=You+have+been+logged+out" addtoken="no" />

</body>
</html>
<cfcatch type="any">
	<cfoutput>#cfcatch.detail#, #cfcatch.message#</cfoutput>
	<cfdump var="#cfcatch#">
</cfcatch>
</cftry>
