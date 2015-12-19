
			    	<cfset session.currency = '$' />
							<cfset session.country = '' />
							<!--- cannot put the country  name except india  because it is being used to form file names--->
						    <cfif cgi.server_name contains 'india' or cgi.server_name contains ".in">
							    <!--- needs to be out of session start code and surely before session start code to cater for visitor moving to .in site during an ongoing session. Being before session start code ensures that in an ongoing session if  a person goes to .com he does not switch to country = '' but vice versa is not true --->
							    	<cfset session.country = 'india' />
							    	<cfset session.currency = 'Rs' />
							</cfif>

							<cfinclude template="/includes/udf#session.country#.cfm" />
			
	 				<cfscript>
							 session.address.phone = '' ;
							 session.address.address1 = '' ;
							 session.address.address2 = '' ; 
							 session.address.state = '' ;
							 session.address.country = '' ;
							 session.address.zip = '' ;
							 session.address.city = '' ;
							 session.address.country_code = 'USA';
			session.start = dateformat(now(),'d|m|')& timeformat(now(),'HH:mm') ;
			session.quick_add = 0 ;

		 if (cgi.SERVER_NAME contains 'wholesale' ){
	//keep away those who searched for semiprecious.com and found this sw.com link
 			if (isdefined("cgi.HTTP_REFERER") and not isdefined("url.discount_code_applied") ){
			if ( find("=",CGI.http_referer	)  ){
				if (findNoCase("semiprecious.com",CGI.http_referer,find("=",CGI.http_referer)	)){
					cflocation('http://www.semiprecious.com#CGI.SCRIPT_NAME#?sw2sp=#find("manvijay",CGI.http_referer)#&#CGI.Query_string#&discount_code_applied&kw=');
			/*
			interesting to note that we are relocating the person before defining the session.mail .hence the session will be set up afresh there.
			*/
			}
			    
		   }
  		}
	
			 session.bulkbuyer.id = application.wholesale_guest;
			 session.quick_add = 1 ;
			if (isdefined("cgi.HTTP_REFERER")){
	 			
						 session.comingfrom =   session.start & ':' & replacenocase(replacenocase(replacenocase(replacenocase(cgi.HTTP_REFERER ,'search','') ,'.com',''),'http://',''),'www.','')  ;
					}
					else { 

					 session.comingfom = session.start & "?"; }

	 } else {
	 session.bulkbuyer.id="" ;
		if (isdefined("cgi.HTTP_REFERER")){
		if (  not isdefined("url.discount_code_applied") ){
		 bulk_keywords = 'lots,manufacturing,manufacturer,distributor,wholesale, wholesaler, wholeseller,business,bulk' ;
		 j = 1 ;
		ref = replaceNoCase(cgi.http_referer,'semipreciouswholesale',"x");
            do {
			if (findNoCase(listgetat(bulk_keywords,j),ref)){
			cflocation('http://www.semipreciouswholesale.com#CGI.SCRIPT_NAME#?manvijay=v1.01&#CGI.Query_string#&discount_code_applied&kw='& listgetat(bulk_keywords,j));
			/*
			interesting to note that we are relocating the person before defining the session.mail .hence the session will be set up afresh there.
			*/
			break;}
			    
			j=j+1 ;} while (j <= listlen(bulk_keywords))   ;}
						 session.comingfrom =   session.start & ':' & replacenocase(replacenocase(replacenocase(replacenocase(cgi.HTTP_REFERER ,'search','') ,'.com',''),'http://',''),'www.','')  ;
						}
						else { 
						 session.comingfom = session.start & "?"; }
  				 }
		
	   	session.agentfolder = 'jamesbond';
	   	session.agentid = '78741';
	   	session.agentname = 'james bond';
	   	session.agentnumber = '5123867676';
       	session.filter="" ;
		session.gallery="/gemstone_jewelry_gallery.cfm" ;
		session.edit="" ;
		session.priceless="" ;
		session.screenwidth="1024";  
		  session.affilt="-" ; 
		  session.affil="-" ; 
		if (cgi.SERVER_NAME contains 'laptop') { 
			session.cart = 'bagcart.cfm'; }
		else {
			session.cart = '#session.country#cart.cfm';
			}
		 session.bulkbuyer.thousanddiscount=     application.bulkbuyer.thousanddiscount; 
    	 session.bulkbuyer.fivehundreddiscount=application.bulkbuyer.fivehundreddiscount ;
    	 session.bulkbuyer.twothousanddiscount=     application.bulkbuyer.twothousanddiscount; 
    	 
	 	session.bulkbuyer.minamt = application.bulkbuyer.minamt ;
		session.bulkbuyer.arb_minamt  = application.bulkbuyer.arb_minamt;	
	 	 session.grandtotal = 0 ;
		 session.ajaxcheck = -1 ;
		 session.totalqty = 0 ;
		
	 session.desc_flag = 1 ;
	 
	session.mail = session.bulkbuyer.id ;/* this is useful because we get to store guest mail id for non-members in db. this can be the flag when using cookie that it is a wholesale cart */

 if (isdefined("cgi.query_string")) {
			 session.thispage = mid(getbasetemplatepath(),25,25) &  "?" & urldecode(CGI.QUERY_STRING) & urldecode(CGI.pathinfo);
		} else {
			 session.thispage = mid(getbasetemplatepath(),25,25) &  "?"  & urldecode(CGI.pathinfo);
		}
			
	</cfscript>	 
  <cfif not isdefined("session.cartitem")>
			<CFSET session.cartitem=ArrayNew(2)>
			<Cfset session.cartitem[1][1] = 0 />
			<cfset session.checke = 2 />
		             	
		      </cfif>
              <cfif not isdefined("session.cartid") or session.cartid is "">
              <CFSET SESSION.CARTID = 0 />
              </cfif>
				<!--- called after session.mail is defined, otherwise a recursive loop of session_start is set up by application.cfm that is called before cfc method . get a new cartid into session and into cartstatus table --->
				<cfif  isdefined("cookie.jandjcartinfile")><!--- the cart recovery code depends on session.mail as well hence keep this later --->
						<cfinclude template="jandjfillcart2.cfm">
					<cfelseif  isdefined("cookie.youngcartinfile")>
						<cfinclude template="youngfillcart2.cfm" />
					<cfelseif isdefined("cookie.diannecartinfile")>
						<cfinclude template="diannefillcart2.cfm" />
					<cfelseif isdefined("cookie.cartid") or isdefined("url.cartid") >
								<cfset session.checke = 4 />	
								<cfset x = GetHttpRequestData()>
						<cfset c = 0 />
                      	<cfset gotcartid = 0 />
                            <cfset b = 0 />
                            <cfset a = 0 />
                  
						<cfset catchid = 0 />
					<cfif isdefined("cookie.cartid")>		<cfloop list="#x.headers.cookie#" delimiters=";= " index="p">
								<cfif p is 'cartid'>
									<cfset catchid = 1 />
								<cfelseif catchid>
								
								
									<cfset catchid = 0 />
									<cfif isNumeric(p)  >
										<cfif p GT c and p LT 99999>
											<cfset c = p>
										</cfif>
									</cfif> 
								</cfif>
							</cfloop></cfif>
                            <!---
                            			 <cfif  isdefined("client.cfcartid")>
									<cfset b = client.cfcookie />
                                   </cfif>
 --->
 					 <cfif isdefined("url.cartid")>
						<cfset a = url.cartid />
                     </cfif>
				      <cfif c GT b>
                       <cfif c gt a>
                      <cfset cookie.cartid = c >
                      	<cfset gotcartid = 1 />
                      <cfelse>
                      <cfset cookie.cartid = a >
                      	<cfset gotcartid = 1 />
                      </cfif>
                      <cfelseif a gt b >
                      <cfset cookie.cartid = a >
                      	<cfset gotcartid = 1 />
                      <cfelse>
                      <cfset cookie.cartid = b />
                      	<cfset gotcartid = 1 />
                      </cfif>
					  <cfif len(trim(cookie.cartid)) and gotcartid and cookie.cartid><!--- we have seen empty cartid cookie being set and on return causing havoc. so ignore them --->
			            <cfset session.check34 = c /> 
						   <cfinclude template="cartfromcookie2.cfm" /> <!--- cartid is allocated inside cookie recovery because setting new cartid before and hence the cookies corrupts usage of incoming cookies. funny but realit --->
							<cfif not session.cartid>
						  <!--- cart from cookie is retrieved and non zero cartid given if there is a non-paid cart from a non-member in user. 
						  For members  for all else we need to go to log in page. 
						  a cookied recvd means he is not to be logged in and rather to be taken to login page
						  2. Case when a non member has a cookie for a paid cart, it will also not be recovered. no harm taking him to log in page. for all you know he might sign up or we might
						  have subscribed him during the relay back --->
								  <cfquery datasource="gemssql" name="notpaidcart">
						               SELECT cartid FROM cartstatus WHERE  cartid = '#cookie.cartid#' AND paymode='null' and paymode is not null
					            </cfquery>		
							  	<cfif notpaidcart.recordcount><!--- for paid member we do not go to log in page if the cookie that he passed in was for a paid cart. he has just completed a txn, why bother him to log in. he might have come after 7 days and just looking --->
					<!--- Members coming back on session start and on manual log out were being routed to 
					the login page so that they make use of ongoing cart and loyalty programmes. however for Anup doesn't '				  <cflocation url="/simpleloginform.cfm?msg=wel&nari=flag" addtoken="false"  />    --->
								</cfif>
						</cfif>
						<cfelse>
							<cfcookie expires="now" name="cartid" domain=".semiprecious.com" />
							<cfcookie expires="now" name="cartid" domain="semipreciouswholesale.com" />
							<cfcookie expires="now" name="cartid" domain="www.semiprecious.com" />
						</cfif> 	
				</cfif>
					<cfif not isdefined("session.cartid") or session.cartid is "">
						<cfset session.cartid = 0 />
						<cfset session.check = 1 />
					</cfif>
<!--- determine country --->	<cftry>

		<cfhttp url="http://api.hostip.info/get_html.php" method="get"  Timeout="1" >
			<cfhttpparam name="ip" value="#cgi.REMOTE_ADDR#" type="url"  />
			<cfhttpparam name="position" value="true" type="url"  />
		</cfhttp>
        <CFSET COU = findNoCase('COUNTRY',CFHTTP.FILECONTENT) />
		<CFSET STAT = findNoCase('STATE',cFHTTP.FILECONTENT) />
		<CFSET INDI = findNoCase('USA',cFHTTP.FILECONTENT) />
		 
		 <cfif INDI gt COU AND (COU gt STAT OR  INDI LT STAT) >
			<!--- <cfset session.country = "india" />
			 ---><cfset session.IP_COUNTRY = 'USA' /><!--- USEFUL for not using ga code for non-US visitors --->
		</cfif>
		
		<cfcatch type="any" ><!-- ...ignore... -->
		</cfcatch>
		</cftry>
		
	  <!--- we cannot set session.country to "row" because a lot of code depends on session.country being blank where it is rest of the world, hence
	  whereever application.exch[session.country] is used we will have to to a switch based on len(session.country). if session.country has a finite lengthg
	  we will have to use appplication.exchangerate or application.exch["row"]. application.exch[] is not allowed syntactaly --->

