<cfcomponent>
	<cffunction access="remote" name="contactretail" returntype="string" output="true">
		<cfargument name="from" type="string" required="false"  default="service@semiprecious.com">
		<cfargument name="emailid" type="string" required="true">
		<cfargument name="msg" type="string" required="true">
		<cfargument name="customername" type="string" required="false" default="" />
		<cfargument name="subject" type="string" required="false" default="Your Semiprecious Jewelry Store" />

	<cfmail from="#Arguments.from#"  bcc="scorpionitish@yahoo.com" to="#arguments.emailid#" subject="#Arguments.subject#" type="html"  >
		Hi #Arguments.customername#,<br />
		#Arguments.msg#
		<br />
		Regards,<br>
		Team Semiprecious.com
		<hr />
		To reply to this mail or to communicate with us please use the message form at our website. 
		That will help track of our communications with you better. Please click <a href="http://www.semiprecious.com/contactus.cfm?email=#Arguments.emailid#">here</a> to write a message to us.
		
		</cfmail>
		
	<cfinvoke component="crm.crm" method="addmsg" returnvariable="result1" >
<cfinvokeargument name="msg" value="#Arguments.msg#" />
<cfinvokeargument name="email" value="#Arguments.emailid#" />
<cfinvokeargument name="direction" value="out" />
</cfinvoke> 

	<cfset myResult="Now use browser back button to go back to the showuser detail page.">
	<cflocation url="/crm/viewmessages.cfm?email=#Arguments.emailid#&msg=mail%20sent" addtoken="no"  />
				<cfreturn myResult>
		</cffunction>
<cffunction access="remote" name="contactbulk" returntype="string" output="true">
		<cfargument name="emailid" type="string" required="true">
		<cfargument name="from" type="string" required="false"  default="service@semiprecious.com">
		<cfargument name="msg" type="string" required="true">
		<cfargument name="customerid" type="numeric" required="false" default="0" />
		<cfargument name="comingfrom" type="string" required="false" default="showuserdetails.cfm" />
		<cfargument name="customername" type="string" required="false" default="" />
		<cfargument name="subject" type="string" required="false" default="Your Semiprecious Jewelry Store" />
<cftry>
	
		<cfmail from="#Arguments.from#" bcc="scorpionitish@yahoo.com" to="#arguments.emailid#" subject="#Arguments.subject#" type="html" >
		Hi #Arguments.customername#,<br />
			<div align="justify" style="width:600px;boder:0px black solid;">	#Arguments.msg#
		
		<br />
		
		<span style="font-size:1.1em;color:orange;">To  reply please click <a href="http://www.semiprecious.com/contactus.cfm?email=#arguments.emailid#">here</a> or <br>
		<br />	visit http://www.semiprecious.com/contactus.cfm?email=#arguments.emailid#</span>  <br />
		Regards,<br>
		From Semiprecious.com</div>
		</cfmail>
		<cfinvoke component="crm.crm" method="addmsg" returnvariable="result1" >
			<cfinvokeargument name="msg" value="#Arguments.msg#" />
			<cfinvokeargument name="email" value="#Arguments.emailid#" />
			<cfinvokeargument name="direction" value="out" />
		</cfinvoke> 

		<cfset myResult="Now use browser back button to go back to the showuser detail page.">
<cfswitch expression="#arguments.comingfrom#">
	<cfcase value="viewmessages">
		<cflocation url="/crm/viewmessages.cfm?customerid=#arguments.customerid#&email=#arguments.emailid#" addtoken="no" />
	</cfcase>
</cfswitch>
		<cflocation url="/admintools/showuserdetails.cfm?email=#Arguments.emailid#&msg=mail%20sent" addtoken="no"  />
			<cfreturn myResult>
				<cfcatch type="any">Error:<Cfoutput>#cfcatch.detail#</Cfoutput></cfcatch>
			</cftry>
		</cffunction>
<cffunction access="remote" name="contactus" returntype="string" output="true">
		<cfargument name="emailid" type="string" required="true">
		<cfargument name="from" type="string" required="false"  default="anonymous@semiprecious.com">
		<cfargument name="msg" type="string" required="true">
		<cfargument name="customerid" type="numeric" required="false" default="0" />
		<cfargument name="comingfrom" type="string" required="false" default="showuserdetails.cfm" />
		<cfargument name="customername" type="string" required="false" default="" />
		<cfargument name="subject" type="string" required="false" default="Customer Jewelry Query" />
<cftry>
		<cfmail from="#Arguments.from#" to="#arguments.emailid#" subject="#Arguments.subject#" type="html" >
	<div align="justify" style="width:600px;boder:0px black solid;">	#Arguments.msg#
		
		<br />
		From #arguments.from#</div>
		</cfmail>
		<cfinvoke component="crm.crm" method="addmsg" returnvariable="result1" >
				<cfinvokeargument name="msg" value="#Arguments.msg#" />
				<cfinvokeargument name="email" value="#Arguments.from#" />
				<cfinvokeargument name="direction" value="in" />
		</cfinvoke> 
	
		<cfset myResult="Now use browser back button to go back to the showuser detail page.">
<cfswitch expression="#arguments.comingfrom#">
<cfcase value="viewmessages">
<cflocation url="/crm/viewmessages.cfm?customerid=#arguments.customerid#&email=#arguments.from#" addtoken="no" />
</cfcase>
</cfswitch>
		<cflocation url="showuserdetails.cfm?email=#Arguments.emailid#&msg=mail%20sent" addtoken="no"  />
				<cfreturn myResult>

				<cfcatch type="any">Error:<Cfoutput>#cfcatch.detail#</Cfoutput></cfcatch></cftry>
		</cffunction>

</cfcomponent>