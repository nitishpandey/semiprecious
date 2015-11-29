<cfif isdefined("url.id")>
<cfset attributes.id = url.id >
</cfif>
    	  <cfquery datasource="gemssql" name="valid">
		    select * from bulkbuyers where 
		    email = '#attributes.id#' 
		    </cfquery>
		    <cfif valid.recordcount>
			      <cfquery datasource="gemssql" >
			      update bulkbuyers set lastlogin = #now()# , loggedin = '1' where email = '#attributes.id#' 
			      </cfquery>
					    <cfif session.cartid><!--- and he perhaps has  a cart in the making ---->
							     <cfquery datasource="gemssql" name="sf">
					        		UPDATE buyingrecord  SET  email= '#attributes.id#'        WHERE cartid='#session.cartid#'
								</cfquery>
									<cfquery datasource="gemssql" name="ad">
					        	UPDATE cartstatus  SET  buyer= '#attributes.id#'         WHERE cartid='#session.cartid#'
								</cfquery>
						</cfif>
						 	
				
				 	       <cfset session.mail = '#valid.email#' />
							<cfinclude template="sessioncustomerid.cfm" /><!--- to get the customer id in crm db --->
							<cfset session.name = valid.name />
					        <cfset session.bulkbuyer.id = valid.email/>
							<cfset session.address.country = valid.country />
							<cfset session.address.zip = valid.zip />
							<cfset session.address.city = valid.city />
							<cfset session.address.address1 = valid.address />
							<cfset session.address.address2 = valid.address2 /> 
							<cfset session.address.state = valid.state />
							<cfset session.address.country_code = '' />
							<cfset session.address.phone = valid.phoneno />
			
					<cfset k =  listfindnocase(('australia, new zealand,united states of america,united kingdom,canada'),valid.country) />
					<cfswitch expression="#k#">
					<cfcase value="3">
					<cfset session.address.country_code = 'usa' />
					</cfcase>
					<cfcase value="4">
					<cfset session.address.country_code = 'gb' />
					</cfcase>
					<cfcase value="1">
					<cfset session.address.country_code = 'au' />
					</cfcase>
					<cfcase value="2">
					<cfset session.address.country_code = 'nz' />
					</cfcase>
					<cfcase value="5">
					<cfset session.address.country_code = 'CA' />
					</cfcase>
				<cfdefaultcase>
					<cfset session.address.country_code = valid.country />
					</cfdefaultcase>
					</cfswitch>
			
							
					  <cfif  valid.status >
					         <cfset session.salemode = 'maroon' />
					        <cfset session.bulkbuyer.minamt = valid.minamt />
						<cfelse>
					        <cfset session.salemode = 'yellow' />
					        
				        </cfif>
			</cfif>
			
	