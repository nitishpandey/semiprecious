<!--- this file is  included in update method of cartmonitor.cfc and cartsothers.cfm --->
<cfparam name="shipper" default="AC">
																<cfquery datasource="gemssql" name="s">
																		update cartforothers set shipdate=getDate() where cartid=#cc# and (supplier like '#shipper#%' <CFIF SHIPPER CONTAINS 'ac'> OR supplier in ('harish', 'vijay', 'arpit', 'GR', 'anup', 'kashish', 'royal','pawan','preety') </cfif>)
																</cfquery>

																<cftry><cfif isdefined("shippedby")>
																<cfquery datasource="gemssql" >
																				 		 update cartstatus set tracking = '#shippedby#' where cartid=#cc# 
																</cfquery>
																</cfif>
																<cfcatch type="any">
																	<cfoutput>#shippedby#,#cc#, 																				 		 update cartstatus set tracking = "#shippedby#" where cartid=#cc# </cfoutput>
																<cfdump var="#cfcatch.tagContext#">
																</cfcatch>
                               
</cftry>                               