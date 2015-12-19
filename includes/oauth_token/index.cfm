<html>
<head>
</head>
<body >
<div align="center" id="container1">
<div style="width:930px;">
<cfinclude template="#session.country#/header.cfm">
<cfset openid = structnew() />
	<cfscript>
  k = "https://open.login.yahooapis.com/openid/op/auth?&openid.assoc_handle=UgNQaVi5Q0LMloDAgBHsf4Is7KNxmC3doAcrJmIVuzAvj.1m8koFbZ4luX9MWmoYeFCzM.sjjMhuQFOX6aAQgIS.RCIGFCdhGRCW8g5ARVNjTNUEk8R08FL4Sr76inA-&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.mode=checkid_setup&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&openid.realm=http%3A%2F%2Fsemiprecious.com%2F&openid.return_to=http%3A%2F%2Fsemiprecious.com%2Fincludes%2Fyahoo_contacts.cfm&openid.ns.oauth=http%3A%2F%2Fspecs.openid.net%2Fextensions%2Foauth%2F1.0&openid.oauth.consumer=dj0yJmk9V0Q4eDY4YUV1SHRBJnM9Y29uc3VtZXJzZWNyZXQmeD03Zg--";
 sharedsecret = '7c7a17150ad6eeb3085f14bd9ae8d90db9f0089a';
 applicationid= 'cmmc347c';
 ck = 'dj0yJmk9VWxuYnZ2Ykt4QmRDJmQ9WVdrOVkyMXRZek0wTjJNbWNHbzlOalV6TkRnM01qWXkmcz1jb25zdW1lcnNlY3JldCZ4PTlk';
 grt = "https://api.login.yahoo.com/oauth/v2/get_request_token?oauth_consumer_key=#ck#&oauth_signature_method=PLAINTEXT&oauth_version=1.0&oauth_timestamp=#gethttptimestring(now())#&oauth_nonce=8B9SpF&oauth_callback=#urlencodedformat('http://www.semiprecious.com/includes/yahoo_contacts.cfm')#&oauth_signature=#sharedsecret#%26"	;
 _gt = "https://api.login.yahoo.com/oauth/v2/get_token?oauth_consumer_key=#ck#&oauth_signature_method=PLAINTEXT&oauth_version=1.0&oauth_timestamp=#gethttptimestring(now())#&oauth_nonce=8B9SpF&oauth_signature=#sharedsecret#%26";
 gua = 'https://api.login.yahoo.com/oauth/v2/request_auth' ;


	</cfscript>
<cfif isdefined("url.oauth_verifier")>
<cfhttp url="#_gt##session.oauth_token_SECRET#&oauth_token=#session.oauth_token#&&oauth_verifier=#url.oauth_verifier#" />
<cfelse>
<cfHTTP url="#grt#"  /><!--- provides oauth_token --->
</cfif>
<cfdump var="#cfhttp.filecontent#">
<cfset session.oauth_token = LISTGETAT(CFHTTP.FILECONTENT,LISTFIND(trim(CFHTTP.FILECONTENT),"oauth_token","=&")+1,"=&") />
	<cfset session.oauth_token_SECRET = urldecode(LISTGETAT(CFHTTP.FILECONTENT,LISTFIND(CFHTTP.FILECONTENT,"oauth_token_secret","=&")+1,"=&"))  />
	<cfset session.xoauth_request_auth_url = urldecode(LISTGETAT(CFHTTP.FILECONTENT,LISTFIND(CFHTTP.FILECONTENT,"xoauth_request_auth_url","=&")+1,"=&"))  />
	
<cflocation url="#urldecode(session.xoauth_request_auth_url)#" addtoken="false" />
 
<!---  <cfhttp url="#k#" method="Get" />
 ---><cfinclude template="/mainfooter.cfm">
</div>
</div>
</body>
</html>