<cfset form_top_msg = 'Please Select the Check box for the  friends you wish to invite from this List'>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Share and win discounts - Fantastic Jewelry in semiprecious and silver</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
</head>

<body lang="en-US" >
<div  align="center">
<div id="container1"  >

<CFINCLUDE TEMPLATE="/header#session.country#.cfm" />
 	 <!---Google OAuth consumer key : www.semiprecious.com
     secret key : hToCHxD9KKkvMQo6ggQQri87 
	www.semiprecious.in
OAuth Consumer Secret: 	EbGVbZbFYcXI6N6WDuztpo0m --->  
	<div id="container2">
       <div style="width:930px;">
		<cfswitch expression="#OP#">
			 <cfcase  value="google">
				<cfif not isdefined("url.go") and (not isdefined("url.token"))>
						<cflocation url="../invite.cfm?ydotcom" addtoken="no">
				</cfif>
				<cfif isdefined("url.token")>
						<!--- <cfdump var="#url#">
						 --->
						 <cfset token = 'AuthSub token="#url.token#"'/>
						<cfhttp url="https://www.google.com/accounts/AuthSubSessionToken" port="443" >
						<cfhttpparam type="header" name="Authorization"  value='#token#'   >
						</cfhttp> 
						<cfif cfhttp.ResponseHeader.Status_Code is 200>
								<cfset token = trim(listgetat(cfhttp.FileContent,2,"=")) />
								<!-- <cfoutput>#token#</cfoutput>
								 -->
								<cfhttp url="http://www.google.com/m8/feeds/contacts/default/base?max-results=100" port="80" >
									<cfhttpparam type="header" name="Authorization"  value='AuthSub token="#token#"'   >
								</cfhttp> 
								
								<CFSET KP = #XMLPARSE(trim(replacenocase(cfhttp.filecontent,"<?xml version='1.0' encoding='UTF-8'?>",'','one')),true)# />
								<!--- <cfdump var='#kp#'> --->
								<cftry>
								<CFSET K = XMLSEARCH(KP,'//gd:email')>
								<cfcatch type="any">
									<cfdump var='#kp#'>
								<cfabort>
								</cfcatch>
								</cftry>
								
								<cfset l = "" />
									<cfloop from=1 to="#arraylen(k)#" index=j>
										<cfif find('@',listappend(l,k[j].XmlAttributes['address']))>
												<cfset l = listappend(l,k[j].XmlAttributes['address']) />
										</cfif>
									</cfloop>
						<cfelse>
								<cflocation url="/includes/google_contacts.cfm?msg=badlogin" addtoken="true" />
						</cfif>
				
				<cfelse>
						<cfif isdefined("url.msg")>
							<script language="javascript">
								alert('Error');
							</script>
							<a href="">Please Try Again</a>
							<cfelse>

						<cfscript>
							 if (session.country is 'india')
							   next_param = "http%3A%2F%2Fwww.semiprecious.in%2Fincludes%2Fgoogle_contacts.cfm" ;
							 else
							  next_param = "https%3A%2F%2Fwww.semiprecious.com%2Fincludes%2Fgoogle_contacts.cfm" ;
							  
							  scope_param = "http%3A%2F%2Fwww.google.com%2Fm8%2Ffeeds%2F";
							  secure_param = "0";
							  session_param = "1";
							  root_url = "https://www.google.com/accounts/AuthSubRequest";
							  query_string = "?scope=#scope_param#&session=#session_param#&secure=#secure_param#&next=#next_param#";
							  cflocation(root_url & query_string) ;
					  </cfscript>
					</cfif>
				</cfif>
				<!--- <cfoutput>#token#</cfoutput>
				<cfdump var="#cfhttp#">
				 --->
				<!--- 
				<cfscript>
				  k = "https://open.login.yahooapis.com/openid/op/auth?&openid.assoc_handle=UgNQaVi5Q0LMloDAgBHsf4Is7KNxmC3doAcrJmIVuzAvj.1m8koFbZ4luX9MWmoYeFCzM.sjjMhuQFOX6aAQgIS.RCIGFCdhGRCW8g5ARVNjTNUEk8R08FL4Sr76inA-&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.mode=checkid_setup&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&openid.realm=http%3A%2F%2Fexample.com%2F&openid.return_to=http%3A%2F%2Fsemiprecious.com%2Fyahoo_contacts&openid.ns.oauth=http%3A%2F%2Fspecs.openid.net%2Fextensions%2Foauth%2F1.0&openid.oauth.consumer=dj0yJmk9V0Q4eDY4YUV1SHRBJnM9Y29uc3VtZXJzZWNyZXQmeD03Zg--";
				</cfscript>
				<cfhttp url="#k#" method="Get" />
				 --->
				 </cfcase>
	<cfcase value="yahoo">
			<cfscript>
				  k = "https://open.login.yahooapis.com/openid/op/auth?&openid.assoc_handle=UgNQaVi5Q0LMloDAgBHsf4Is7KNxmC3doAcrJmIVuzAvj.1m8koFbZ4luX9MWmoYeFCzM.sjjMhuQFOX6aAQgIS.RCIGFCdhGRCW8g5ARVNjTNUEk8R08FL4Sr76inA-&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.mode=checkid_setup&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&openid.realm=http%3A%2F%2Fsemiprecious.com%2F&openid.return_to=http%3A%2F%2Fsemiprecious.com%2Fincludes%2Fyahoo_contacts.cfm&openid.ns.oauth=http%3A%2F%2Fspecs.openid.net%2Fextensions%2Foauth%2F1.0&openid.oauth.consumer=dj0yJmk9V0Q4eDY4YUV1SHRBJnM9Y29uc3VtZXJzZWNyZXQmeD03Zg--";
				 sharedsecret = '7c7a17150ad6eeb3085f14bd9ae8d90db9f0089a';
				 applicationid= 'cmmc347c';
				 ck = 'dj0yJmk9VWxuYnZ2Ykt4QmRDJmQ9WVdrOVkyMXRZek0wTjJNbWNHbzlOalV6TkRnM01qWXkmcz1jb25zdW1lcnNlY3JldCZ4PTlk';
				 grt = "https://api.login.yahoo.com/oauth/v2/get_request_token?oauth_consumer_key=#ck#&oauth_signature_method=PLAINTEXT&oauth_version=1.0&oauth_timestamp=#gethttptimestring(now())#&oauth_nonce=8asdfB9SpF&oauth_callback=#urlencodedformat('http://www.semiprecious.com/includes/yahoo_contacts.cfm')#&oauth_signature=#sharedsecret#%26"	;
				 _gt = "https://api.login.yahoo.com/oauth/v2/get_token?oauth_consumer_key=#ck#&oauth_signature_method=PLAINTEXT&oauth_version=1.0&oauth_timestamp=#gethttptimestring(now())#&oauth_nonce=8B9SpF&oauth_signature=#sharedsecret#%26";
				 gua = 'https://api.login.yahoo.com/oauth/v2/request_auth' ;
			</cfscript>
			<cfif isdefined("url.oauth_verifier") and isdefined("session.OAUTH_TOKEN_SECRET")>
					<cfhttp url="#_gt##session.oauth_token_SECRET#&oauth_token=#session.oauth_token#&&oauth_verifier=#url.oauth_verifier#" />
				<cfelse>
					<cfset k = structdelete(session,'xoauth_request_auth_url',false) />
					<cfset k = structdelete(session,'xoauth_token_secret',false) />
					<cfset k = structdelete(session,'xoauth_token',false) />
					<cfHTTP url="#grt#"  /><!--- provides oauth_token --->
			</cfif>

			<cfif not isdefined("session.xoauth_request_auth_url")>
			<!--- jsj
			<cfdump var="#cfhttp.filecontent#">
			 --->
						 	<cfset session.oauth_token = LISTGETAT(CFHTTP.FILECONTENT,LISTFIND(trim(CFHTTP.FILECONTENT),"oauth_token","=&")+1,"=&") />
							<cfset session.oauth_token_SECRET = urldecode(LISTGETAT(CFHTTP.FILECONTENT,LISTFIND(CFHTTP.FILECONTENT,"oauth_token_secret","=&")+1,"=&"))  />
							<cfset session.xoauth_request_auth_url = urldecode(LISTGETAT(CFHTTP.FILECONTENT,LISTFIND(CFHTTP.FILECONTENT,"xoauth_request_auth_url","=&")+1,"=&"))  />
							<cflocation url="#urldecode(session.xoauth_request_auth_url)#" />
			</cfif>
				
			<!--- <cfdump var="#cfhttp.filecontent#">
			 --->	<cfset session.xoauth_yahoo_guid = trim(LISTGETAT(CFHTTP.FILECONTENT,LISTFIND(CFHTTP.FILECONTENT,"xoauth_yahoo_guid","=&")+1,"=&"))  />
				<cfset session.oauth_token_secret = trim(LISTGETAT(CFHTTP.FILECONTENT,LISTFIND(CFHTTP.FILECONTENT,"oauth_token_secret","=&")+1,"=&"))  />
				<cfset session.oauth_token = trim(LISTGETAT(CFHTTP.FILECONTENT,LISTFIND(CFHTTP.FILECONTENT,"oauth_token","=&")+1,"=&"))  />
				<cfset session.oauth_session_handle = trim(LISTGETAT(CFHTTP.FILECONTENT,LISTFIND(CFHTTP.FILECONTENT,"oauth_session_handle","=&")+1,"=&"))  />
				
				<cfset c = 50 />
			<!--- <cfoutput>http://www.semiprecious.com/includes/callcontact.php?guid=#session.xoauth_yahoo_guid#&access_token=#session.oauth_token#&access_token_secret=#session.oauth_token_secret#</cfoutput>
			 --->  <cfif session.country is 'india'>
			 		<cfhttp url="http://www.semiprecious.in/includes/callcontact.php?count=#c#&guid=#session.xoauth_yahoo_guid#&access_token=#session.oauth_token#&access_token_secret=#session.oauth_token_secret#" />
			 		<cfelse>
			 		<cfhttp url="http://www.semiprecious.com/includes/callcontact.php?count=#c#&guid=#session.xoauth_yahoo_guid#&access_token=#session.oauth_token#&access_token_secret=#session.oauth_token_secret#" />

			 		</cfif>
			<!--- <br />go here<cfdump var="#cfhttp.filecontent#"><br />
			 ---><cfset sig  ="#trim(cfhttp.filecontent)#">
			<!--- <cfdump var="#cfhttp.filecontent#"> --->
				<cfset b = listgetat(sig,1) />
				<cfset ts = listgetat(sig,2) />
				<cfset sig  =listgetat(sig,3) />
			<!--- <cfoutput>http://social.yahooapis.com/v1/user/#session.xoauth_yahoo_guid#/contacts?format=xml&view=compact&oauth_version=1.0&oauth_nonce=#b#&oauth_timestamp=#ts#&oauth_consumer_key=#ck#&oauth_token=#session.oauth_token#&oauth_signature_method=HMAC-SHA1&oauth_signature=#sig#&' />
			</cfoutput>
			 ---><cfhttp url = 'http://social.yahooapis.com/v1/user/#session.xoauth_yahoo_guid#/contacts?count=#c#&format=xml&view=compact&oauth_version=1.0&oauth_nonce=#b#&oauth_timestamp=#ts#&oauth_consumer_key=#ck#&oauth_token=#session.oauth_token#&oauth_signature_method=HMAC-SHA1&oauth_signature=#sig#' />
			<!--- 		<cfoutput>sig:#sig#</cfoutput>
			 --->	
			<CFSET k = trim(replacenocase(cfhttp.filecontent,"<?xml version='1.0' encoding='UTF-8'?>",'','one')) />
			<!--- <cfdump var="#k#">
			 --->
						<cfset p = xmlparse(k) />
						<cfset p2 = xmlsearch(p,"contact")>
			<!--- not able to do xmlsearch on this xml --->
			<!---<cffile action="write" output="#k#" file="#application.rootfolder#includes\yahoo.xml"  />
			<cffile action="read" file="#application.rootfolder#includes\yahoo.xml" variable="f" />
			<cfset k1 = xmlparse(trim(f)) />
			 <cfdump var="#k#">
			 <cfdump var="#k1.contacts[1].contact[1]#">
			 --->      
			<!--- <cfdump var="#p.contacts[1].contact[1]#">
			<cftry>
			<cfdump var="#xmlsearch(k,'contact')#"><cfcatch type="any"><cfoutput>#cfcatch.message#</cfoutput></cfcatch>
			</cftry>
			 --->
			<cfif isdefined("p.contacts")>
					<cfset l = "">
					<cfloop index="j" from=1 to="#arraylen(p.contacts[1].contact)#">
							<cfif find('@',p.contacts[1].contact[j].XmlChildren[3].XmlChildren[3].XmlText)>
										<cfset l = listappend(l,p.contacts[1].contact[j].XmlChildren[3].XmlChildren[3].XmlText) />
							</cfif>
					</cfloop>
			<cfelse>
					<!--- <cfdump var="#p2#">
					<cfdump var="#p#" /> --->
					<span class="error1" >
					Looks like you reloaded the page.</span><br /> This is not allowed to ensure privacy & confidentiality of your contacts  . <br />Please
					<!--- Read XSLT file into string variable called MyXsltCode --->
					<a href="yahoo_contacts.cfm">try again</a> to invite your friends from Yahoo contacts. To go back to invitation form click  <a href="/invite.cfm">here</a>.
			</cfif>
		</cfcase>
		</cfswitch>
		<cfif isdefined("l")>
		<br />
							<div class="heading a"><cfoutput>#form_top_msg#</cfoutput></div>
							<cfset friends.list = l />
							<cfmodule template="oauth_form.cfm" attributecollection="#friends#" />
		</cfif>
	</div>
	</div>
</div>
<cfinclude template="/mainfooter.cfm">
</div>
</div>
</body>
</html>