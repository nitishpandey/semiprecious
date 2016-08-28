<!--- only for retail buyers who buy without signing up --->
<cftry>
<cfparam default="0" name="phone">
<cfparam default="NA" name="email">
<cfparam default="" name="buyer_street_address2">
<cfparam default="" name="buyer_last_name">
<cfparam default="" name="buyer_first_name">

<cfquery datasource="gemssql" name="nl">
	select pvalue from properties where pname = 'nltosend'
</cfquery>
<!--- saleletter 1 indicates that this is a forced subscriber

<cfmail  to="stacy@semiprecious.com" from="service@semiprecious.com" server="mail23" subject="buyer  subscribed" >
insert into memberinfo (email,firstname, address1,saleletter, city, state, zip,country,nlstatus,noofvisits,totpurchase,
phonenumber)
 values ('#email#', '#ship_name#','#ship_street_address#', 1,'#ship_city#',  '#Ship_state#' , '#ship_zip#', '#ship_country#',#nl.pvalue#,1,0,'#phone#')
</cfmail> --->
<cfif email neq 'NA'>
	<cfparam default="0" name="payment">
	<cfparam default="buyer_name" name="buyer_name">
	<cfparam default="city" name="buyer_city">
	<cfparam default="0" name="phonenumber" >
	<cfquery datasource="sptm" password="rangeela" username="nitish" name="testbulk">
		select email from bulkbuyers where email = '#email#'
	</cfquery>
<cfif testbulk.recordcount is 0>
<cfif not len(phonenumber)>
 <Cfset phonenumber = 'NA'>
 </cfif>
	<cfif not isdefined("subscribe_type")>
		<cfset subscribe_type = 'retail' />
	    <cfif isdefined("cartid")>
			<cfquery datasource="gemssql" name="buyer_type">
   				select couponcode  from cartstatus  where cartid = #cartid#
  			</cfquery>
			<cfif buyer_type.couponcode is 'regwsale'>
				<cfset subscribe_type = 'wholesale' />
			</cfif>
		</cfif>
	</cfif>
		<cfswitch expression="#subscribe_type#">
		<cfcase value="wholesale">
			<cfset membershipdate = createodbcdate(dateformat(dateadd('d',30,Now()),'yyyy-mm-dd'))>

					<cfquery datasource="sptm" >
							insert into bulkbuyers (zip, phoneno,address, address2, city,state, country,name,email,registered,id,minamt,status ,membershipdate)
							values ('#buyer_zip#','#phonenumber#','#buyer_street_address#','#buyer_street_address2#','#buyer_city#','#buyer_state#','#buyer_country#','#buyer_name#','#buyer_email#',#now()#,'#email#', #Application.bulkbuyer.minamt#, 2,#membershipdate# )
						</cfquery>

		</cfcase>
		<cfcase value="retail">
		<CFQUERY DATASOURCE="gemssql" >
		insert into memberinfo (email,firstname,lastname, address1,address2, city, state, zip,country,nlstatus,noofvisits,totpurchase,
		phonenumber)
		 values ('#email#', '#buyer_first_name#','#buyer_last_name#','#buyer_street_address#','#buyer_street_address2#', '#buyer_city#',  '#buyer_state#' , '#buyer_zip#', '#buyer_country#',#nl.pvalue#,1,0,'#phonenumber#')
		</cfquery>
			<cfinvoke component="invitationandcredit" method="newmember" >
  				<cfinvokeargument name="email" value="#email#">
  			</cfinvoke>
		</cfcase>
		</cfswitch>
<cfquery datasource="gemssql">
	insert into crmkey (email,customertype,newmsg,tele) values ('#email#','#subscribe_type#',0,'#phonenumber#')
</cfquery>

  </cfif>
</cfif>
<cfcatch type="any">
 <cfmail  to="nitishpandey@gmail.com" from="service@semiprecious.com"  subject="buyer not subscribed" >
#cfcatch.Detail#, #cfcatch.Message#,
<!---'#email#', '#ship_name#','#ship_street_address#', 1,'#ship_city#',  '#Ship_state#' , '#ship_zip#', '#ship_country#',#nl.pvalue#,1,0,'#phone#' --->
</cfmail>
</cfcatch>
</cftry>

