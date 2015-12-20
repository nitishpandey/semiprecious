<cfif cgi.HTTP_USER_AGENT contains 'translate'>
<cfabort />
</cfif>
			    	    <cfset session.currency = '$' />
							<cfset session.country = '' />
		 				    <cfset  session.sale_factor = 1 />

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
							 			  <cflocation url="http://www.semiprecious.com#CGI.Path_info#?#cgi.QUERY_STRING#" addtoken="false" />
							 		</cfif>
			  
									<cfelseif not isdefined("url.acemat")>
								               <!---
                                                                             removing india resolution <cfif cfhttp.FileContent contains "india" > 
  
	                                                                            <cflocation url="http://www.semiprecious.in#CGI.Path_info#?#cgi.QUERY_STRING#" addtoken="false" />
									</cfif>			----> 					
							</cfif>

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
				cflocation('http://www.semiprecious.com#CGI.SCRIPT_NAME#?sw2sp=#find("manvijay",CGI.http_referer)#&#replace(CGI.Query_string,'semip','sp')#&discount_code_applied=2&kw=');
			/*
			interesting to note that we are relocating the person before defining the session.mail .hence the session will be set up afresh there.
			*/
			}
			    
		   }
  		}
	
			 session.bulkbuyer.id = application.wholesale_guest;
			 session.bulkbuyer.thousanddiscount=     application.bulkbuyer.thousanddiscount; 
    	 	session.bulkbuyer.fivehundreddiscount=application.bulkbuyer.fivehundreddiscount ;
	    	 session.bulkbuyer.twothousanddiscount=     application.bulkbuyer.twothousanddiscount; 
    		 session.bulkbuyer.minamt = application.bulkbuyer.minamt ;
			 session.bulkbuyer.arb_minamt  = application.bulkbuyer.arb_minamt;	
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
			cflocation('http://www.semipreciouswholesale.com#CGI.SCRIPT_NAME#?manvijay=v1.01&#replace(CGI.Query_string,'semipre','sp')#&discount_code_applied&kw='& listgetat(bulk_keywords,j));
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
		
	   	/*session.agentfolder = 'jamesbond';
	   	session.agentid = '78741';
	   	session.agentname = 'james bond';
	   	session.agentnumber = '5123867676';
		*/
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
  <cfif len(session.bulkbuyer.id)>
     <cfset session.tld = 'semipreciouswholesale.com' />
     <cfelseif session.country is 'india'>
     <cfset session.tld = 'semiprecious.in' />
          <cfelse>
     <cfset session.tld = 'semiprecious.com' />
     </cfif>

  <cfif not isdefined("session.cartitem")>
			<CFSET session.cartitem=ArrayNew(2)>
			<Cfset session.cartitem[1][1] = 0 />
			<cfset session.checke = 2 />
		             	
		      </cfif>
              <cfif not isdefined("session.cartid")>
              <CFSET SESSION.CARTID = 0 />
              </cfif>
				<!--- called after session.mail is defined, otherwise a recursive loop of session_start is set up by application.cfm that is called before cfc method . get a new cartid into session and into cartstatus table --->
				
				<!--- <cfif isdefined("cookie.cartid") or isdefined("url.cartid") or isdefined("client.cfcartid") >
				--->
				<cfif isdefined("cookie.cartid") or (isdefined("url.cartid") and (not isdefined("url.web_store_id"))) or isdefined("client.cfcartid") >

 						<cfset session.checke = 4 />	
							<cfset x = GetHttpRequestData()>
						<cfset c = 0 />
                      	<cfset gotcartid = 0 />
                            <cfset b = 0 />
                            <cfset a = 0 />
                  
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
										</cfif> 
									</cfif>
							</cfloop>
                            
                            </cfif>
                        	 <cfif  isdefined("client.cfcartid")>
									<cfset b = client.cfcartid />
                               </cfif>
							 <cfif isdefined("url.cartid")>
                                <cfset a = url.cartid />
                             </cfif>
						  <cfif c GT b>
                           <cfif c gt a>
                          <cfset _cartid = c >
                            <cfset gotcartid = 1 />
                          <cfelse>
                          <cfset _cartid = a >
                            <cfset gotcartid = 1 />
                          </cfif>
                          <cfelseif a gt b >
                          <cfset _cartid = a >
                            <cfset gotcartid = 1 />
                          <cfelse>
                          <cfset _cartid = b />
                            <cfset gotcartid = 1 />
                          </cfif>
					  <cfif len(trim(_cartid)) and gotcartid and isnumeric(_cartid) and (_cartid neq 0 )><!--- we have seen empty cartid cookie being set and on return causing havoc. so ignore them --->
			            <cfset session.check34 = c /> 
					   <cfset session._cartid = _cartid />
						   <cfinclude template="cartfromcookie2.cfm" />             <!---              cartid is allocated inside cookie recovery because setting new cartid before and hence the cookies corrupts usage of incoming cookies. funny but realit --->
							
					</cfif>
                </cfif>
					<cfif not isdefined("session.cartid")>
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