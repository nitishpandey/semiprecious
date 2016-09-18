<!---
  --- NewCFComponent
  --- --------------
  ---
  --- author: nitish
  --- date:   20/02/16
  --->
<cfcomponent accessors="false" output="false" persistent="false">
<cffunction access="remote" description="called by contact us form to send the mails" name="test"  output="true" returntype="boolean" >
<cfinvoke component="crm.crm" method="addmsg" returnvariable="result1" >
							<cfinvokeargument name="msg" value="test" />
							<cfinvokeargument name="email" value="asd" />
							<cfinvokeargument name="direction" value="in" />
						</cfinvoke>
						<cfdump var="#result1#">
					<cfreturn true>
</cffunction>

<cffunction access="public" description="called by contact us form to send the mails" name="sendmails"  output="true" returntype="boolean" >

	<cfargument name="formdata" required="true" />
	<cfargument name="tld" required="true" />
	<cfargument name="useremail" required="true" />


					<cfset mailcontent=arguments.formdata.name & ', '&arguments.formdata.contact &', ' & arguments.formdata.message>
					<cfset sendsave = 0>
					<cfset mailto = "cs@semiprecious.com">
					<cfset ccto = "anup@semiprecious.com">
					<cfset bccto = "">
					<cfif arguments.formdata.subject contains 'shipping' or arguments.formdata.subject contains 'refunds'>
						<cfset mailto = "cs@semiprecious.com">
						<cfset ccto = "anup@semiprecious.com">
					</cfif>
					<cfset subject = arguments.formdata.name & "'s Query">
					<cfset mailerror = 0>
					<!--- 1 = >  error --->
					<cfmail  server="mail.semiprecious.com"
  port="25"
  useSSL="false"
  username="service@semiprecious.com"
  password="Prec1ou5sx@"  from="service@semiprecious.com"  to="#mailto#" subject="#arguments.formdata.subject# from store" cc="#arguments.formdata.contact#"   type="html">
          <cfif isdefined("arguments.formdata.itemid")>
            <a href="http://#arguments.formdata.domain#/jewelry_item.cfm?newitem=#arguments.formdata.itemid#"><img src='http://www.semiprecious.com/images/#category#/thumb/#arguments.formdata.itemid#.jpg'>View Item</a>
          </cfif>
          #arguments.formdata.contact#, #arguments.formdata.name# , #arguments.formdata.domain#<br />

          <span style="border:2px gray inset;padding:10px;display:block;width:400px"> [#arguments.formdata.subject#]#arguments.formdata.message#. </span>
        </cfmail>
					<cfif len(arguments.useremail)  >
						<cfinvoke component="crm.crm" method="addmsg" returnvariable="result1" >
							<cfinvokeargument name="msg" value="[#arguments.formdata.subject#]#arguments.formdata.message#" />
							<cfinvokeargument name="email" value="#arguments.useremail#" />
							<cfinvokeargument name="direction" value="in" />
						</cfinvoke>
					</cfif>
					<cfif find('@',arguments.formdata.contact)>
						<Cftry>
							<cfmail  port="25"
  useSSL="false"
  username="service@semiprecious.com"
  password="Prec1ou5sx@"  from="service@semiprecious.com"  to="#arguments.formdata.contact#" cc="#mailto#" subject="your #arguments.formdata.domain# inquiry"
	type="html">
              Hi,<br>


              Thank you for your visit to our jewelry store and for your interest in our items.
              <cfif isdefined("arguments.formdata.itemid")>
                <a href='http://www.#arguments.tld#/jewelry_item.cfm/#arguments.formdata.itemid#_doesthishaveacluster.htm'>Click To View Item</a>
              </cfif>
              Your message shown below has been recieved. <br />
              "#arguments.formdata.message#."<br />
              A representative from <strong>#arguments.formdata.domain#</strong> will respond to your inquiry within 48 hours.
			  <br>


            To avoid getting blocked as spam our response will be sent from the address #Application.helpemailid#. Please be sure to check your spam or junk mail folder and add this address to your safe list.
<br>

<br>
We appreciate the opportunity to serve your jewelry needs.<br>

-Anup<br>
Semiprecious.com Customer Service<br>
Email:#Application.helpemailid#
<br>




              <a style="font-size:1.1em;font-family:Helvetica" href="http://#arguments.formdata.domain#">At #arguments.formdata.domain# you are assured of excellent quality, price and customer service</a>

            </cfmail>
							<cfcatch type="any">

								<cfreturn false />
							</cfcatch>
						</Cftry>
					</cfif>

<cfreturn true />

</cffunction>
</cfcomponent>