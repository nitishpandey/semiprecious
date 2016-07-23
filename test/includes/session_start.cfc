<cfcomponent  displayname="session_start" >
<cffunction name="init" access="public" hint="to be called from onsessionstart method of application.cfc only">
	<cfscript>
			setup_country_configurations();
			setup_address_defaults();
           if (not protect_or_setup_wholesale())
                 {
                   promote_wholesale();
                   session.bulkbuyer.id = "";
           		  }
	     	 setup_session();
	      	setup_cart();
	</cfscript>
</cffunction>
<cffunction name="setup_session" access="private" description="if user searched for sp.com, send him there else setup bulk buying session">

	<cfif len(session.bulkbuyer.id)>
			<cfset session.tld = 'semipreciouswholesale.com' />
		<cfelseif session.country is 'india'>
			<cfset session.tld = 'semiprecious.in' />
		<cfelse>
			<cfset session.tld = 'semiprecious.com' />
	</cfif>
<cfscript>

		if (isdefined("cgi.HTTP_REFERER")) {

					session.comingfrom = session.start & ':' & replacenocase(replacenocase(replacenocase(replacenocase(cgi.HTTP_REFERER, 'search', ''), '.com', ''), 'http://', ''), 'www.', '');
				}
				else {
					session.comingfom = session.start & "?";
				}


			/*session.agentfolder = 'jamesbond';
			 session.agentid = '78741';
			 session.agentname = 'james bond';
			 session.agentnumber = '5123867676';
			 */
			session.filter = "";
			session.gallery = "/gemstone_jewelry_gallery.cfm";
			session.edit = "";
			session.priceless = "";
			session.screenwidth = "1024";
			session.affilt = "-";
			session.affil = "-";
			if (cgi.SERVER_NAME contains 'laptop') {
				session.cart = 'bagcart.cfm';
			}
			else {
				session.cart = '#session.country#cart.cfm';
			}
			session.grandtotal = 0;
			session.ajaxcheck = -1;
			session.totalqty = 0;
			session.desc_flag = 1;
			session.mail = session.bulkbuyer.id; /* this is useful because we get to store guest mail id for non-members in db. this can be the flag when using cookie that it is a wholesale cart */
			if (isdefined("cgi.query_string")) {
				session.thispage = mid(getbasetemplatepath(), 25, 25) & "?" & urldecode(CGI.QUERY_STRING) & urldecode(CGI.pathinfo);
			} else {
				session.thispage = mid(getbasetemplatepath(), 25, 25) & "?" & urldecode(CGI.pathinfo);
			}
</cfscript>

</cffunction>

<cffunction returntype="boolean" name="protect_or_setup_wholesale" access="private" description="if user searched for sp.com, send him there else setup bulk buying session">
<cfscript>
if (cgi.SERVER_NAME contains 'wholesale') {
				//keep away those who searched for semiprecious.com and found this sw.com link
				 if (isdefined("cgi.HTTP_REFERER") and not isdefined("url.discount_code_applied")) {
					if (find("=", CGI.http_referer)) {
						if (findNoCase("semiprecious.com", CGI.http_referer, find("=", CGI.http_referer))) {
							cflocation('http://www.semiprecious.com#CGI.SCRIPT_NAME#?sw2sp=#find("manvijay",CGI.http_referer)#&#replace(CGI.Query_string,' semip ',' sp ')#&discount_code_applied=2&kw='); /* interesting to note that we are relocating the person before defining the session.mail .hence the session will be set up afresh there. */ }
					}
				}
				//defining bulkbuyer structure in session is an indication that we are in wholesale domain
				session.bulkbuyer.id = application.wholesale_guest;
				session.bulkbuyer.thousanddiscount = application.bulkbuyer.thousanddiscount;
				session.bulkbuyer.fivehundreddiscount = application.bulkbuyer.fivehundreddiscount;
				session.bulkbuyer.twothousanddiscount = application.bulkbuyer.twothousanddiscount;
				session.bulkbuyer.minamt = application.bulkbuyer.minamt;
				session.bulkbuyer.arb_minamt = application.bulkbuyer.arb_minamt;
				session.quick_add = 1;

			return true;
		} else {
		return false;
	}
</cfscript>
</cffunction>
<cffunction name="initialize_cart" description="sets up empty array;should actually use cart.cfc or cart monitor">
	<cfif not isdefined("session.cartitem")>
			<CFSET session.cartitem=ArrayNew(2) />
			<Cfset session.cartitem[1][1] = 0 />
	</cfif>

<cfreturn />
</cffunction>


<cffunction  name="setup_cart" access="private" description="setups cart or recovers from cookie ensuring possibly paid cart is not overrwritten">
	<!--- called after session.mail is defined, otherwise a recursive loop of session_start is set up by application.cfm that is called before cfc method . get a new cartid into session and into cartstatus table --->
		<!--- <cfif isdefined("cookie.cartid") or isdefined("url.cartid") or isdefined("client.cfcartid") >
			--->
			<cfscript>
			initialize_cart();
			var cfc = cartid_from_cookie();
			</cfscript>
			<cfif len(cfc) >
				<!--- we have seen empty cartid cookie being set and on return causing havoc. so ignore them --->
				<cfobject name="cart_from_cookie" component="cart_from_cookie" />
				<cfset var k = cart_from_cookie.init(cfc) />
				<!---              cartid is allocated inside cookie recovery because setting new cartid before and hence the cookies corrupts usage of incoming cookies. funny but realit --->
			</cfif>

<!--- if all failed --->
	<cfif not isdefined("session.cartid")>
			<cfset session.cartid = 0 />
	</cfif>
</cffunction>


<cffunction returntype="String" name="cartid_from_cookie" access="private" description="tries to recover cartid from cookie or client.cookie or url">

<cfset _cartid = '' />

<cftry>
		<cfif isdefined("cookie.cartid") or (isdefined("url.cartid") and (not isdefined("url.web_store_id"))) or isdefined("client.cfcartid") >
			<cfset session.checke = 4 />
			<cfset x = GetHttpRequestData() />
			<cfset a = 0 />

			<cfset b = 0 />
			<cfset c = 0 />
			<cfset catchid = 0 />

			<cfif isdefined("x.headers.cookie")>
				<cfloop list="#x.headers.cookie#" delimiters=";= " index="p">
					<cfif p is 'cartid'>
						<cfset catchid = 1 />
					<cfelseif catchid>
						<cfset catchid = 0 />
						<cfif isNumeric(p)  >
							<cfif p GT c and p LT 99999>
								<cfset c = p>
							</cfif>
							<cfelse>
								<cfset c = trim(p) />

						</cfif>
					</cfif>
				</cfloop>
			</cfif>
			<cfif  isdefined("client.cfcartid")>
				<cfset b = trim(client.cfcartid) />
			</cfif>
			<cfif isdefined("url.cartid")>
				<cfset a = trim(urldecode(url.cartid)) />
			</cfif>
			<cfif c GT b>
				<cfif c gt a>
					<cfset _cartid = c >
				<cfelse>
					<cfset _cartid = a >
				</cfif>
			<cfelseif a gt b >
				<cfset _cartid = a >
			<cfelse>
				<cfset _cartid = b />
			</cfif>
			</cfif>

			<cfcatch type="any">
<!--- ignore --->
			</cfcatch>

</cftry>

	<cfreturn _cartid />
</cffunction>

<cffunction access="private" name="determine_country" description="depends on CGI scope. updates into IP_COUNTRY">
		<!--- determine country --->
		<cftry>
			<cfhttp url="http://api.hostip.info/get_html.php" method="get"  Timeout="4" >
				<cfhttpparam name="ip" value="#cgi.REMOTE_ADDR#" type="url"  />
				<cfhttpparam name="position" value="true" type="url"  />
			</cfhttp>
			<CFSET COU = findNoCase('COUNTRY',CFHTTP.FILECONTENT) />
			<CFSET STAT = findNoCase('STATE',cFHTTP.FILECONTENT) />
			<CFSET INDI = findNoCase('USA',cFHTTP.FILECONTENT) />
			<cfif INDI gt COU AND (COU gt STAT OR  INDI LT STAT) >
				<!--- <cfset session.country = "india" />
					--->
				<cfset session.IP_COUNTRY = 'USA' />
				<!--- USEFUL for not using ga code for non-US visitors --->
			</cfif>
			<cfcatch type="any" >
				<!-- ...ignore... -->
			</cfcatch>
		</cftry>
		<!--- we cannot set session.country to "row" because a lot of code depends on session.country being blank where it is rest of the world, hence
			whereever application.exch[session.country] is used we will have to to a switch based on len(session.country). if session.country has a finite lengthg
			we will have to use appplication.exchangerate or application.exch["row"]. application.exch[] is not allowed syntactaly --->
	</cffunction>

<cffunction name="setup_country_configurations" access="private" returntype="void">
        <cfscript>
		determine_country();
		</cfscript>

		<cfset session.currency = '$'>
		<cfset session.country=''>
		<cfset session.mail='' />
		<cfset session.sale_factor = 1 />
		<cfset session.getCountry = 'US' />
		<cfset session.quick_add = 0 />
		<!--- cannot put the country  name except india  because it is being used to form file names--->
		<cfif  not(cgi.server_name contains 'handmade') and not(cgi.server_name contains 'forcesofindia') >
			<!---  <cfhttp url="http://www.semiprecious.com/myproject/countryIP.aspx?ipaddress=#cgi.REMOTE_ADDR#"  />--->
		<cfif cgi.server_name contains 'india' or cgi.server_name contains ".in">
				<!--- needs to be out of session start code and surely before session start code to cater for visitor moving to .in site during an ongoing session. Being before session start code ensures that in an ongoing session if  a person goes to .com he does not switch to country = '' but vice versa is not true --->
				<!--- <cfif cfhttp.FileContent contains "india" or isdefined("url.eddie") or isdefined("url.web") or isdefined("url.acematrix")>--->
				<cfif 1 eq 2>
					<cfset session.country = 'india' />
					<cfset session.currency = 'Rs' />
					<cfset  session.sale_factor = 1.1 />
				<cfelse>
					<cflocation url="http://www.semiprecious.com#cgi.script_name#?#cgi.QUERY_STRING#" addtoken="false" />
				</cfif>

			</cfif>
		</cfif>
	</cffunction>

<cffunction name="setup_address_defaults" access="private">
		<cfscript>
			session.address.address1 = '';
			session.address.phone = '';
			session.address.address2 = '';
			session.address.state = '';
			session.address.country = '';
			session.address.zip = '';
			session.address.city = '';
			session.address.country_code = 'USA';
			session.start = dateformat(now(), 'd|m|') & timeformat(now(), 'HH:mm');
		</cfscript>
	</cffunction>

<cffunction name="promote_wholesale" access="private" description="if user was searching for bulk buying keywords and has landed on retail site send him to wholesale site" >
	<cfscript>
	if (not isdefined("url.discount_code_applied")) {
		bulk_keywords = 'exporter,export,lots,manufacturing,manufacturer,distributor,wholesale, wholesaler, wholeseller,business,bulk, jaipur';
			j = 1;
	    	ref = replaceNoCase(cgi.http_referer, 'semipreciouswholesale', "x");
			do {
				if (findNoCase(listgetat(bulk_keywords, j), ref)) {
					cflocation('http://www.semipreciouswholesale.com#CGI.SCRIPT_NAME#?manvijay=v1.01&#replace(CGI.Query_string,'semipre',' sp ','all')#&discount_code_applied=true&keyword=' & listgetat(bulk_keywords, j)); /* interesting to note that we are relocating the person before defining the session.mail .hence the session will be set up afresh there. */
					break;
					}
					j = j + 1;
				} while (j <= listlen(bulk_keywords));
			}
		</cfscript>
</cffunction>

</cfcomponent>
