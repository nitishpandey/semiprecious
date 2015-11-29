<CFPARAM name="firstname" default="">
<CFPARAM name="newsletter1" default="no">
<CFPARAM name="newsletter2" default="no">
<CFPARAM name="newsletter3" default="no">
<cfparam name="form.address2" default="">

<cfparam name="form.doa" default="0" />
<cfparam name="form.dob" default="0" />
<cfparam name="form.moa" default="0" />
<cfparam name="form.mob" default="0" />

<cfparam name="form.address1" default="">
<cfparam name="form.phonenumber" default="000">
<cfparam name="form.state" default="NS">
<CFPARAM name="saleletter" default="yes">
<CFPARAM name="newitemletter" default="no">
<cfparam default=0 name="nlstatus">
<cfparam name="form.city" default="NA" type="string">
<cfparam name="form.zip" default="0" type="string">
<cfparam name="form.country" default="na" type="string">
<cfparam name="form.state" default="NA">
<cfquery datasource="gemssql" name="q">
        select pvalue as nl from properties where pname = 'nltosend'
</cfquery>
<cfset nlstatus = q.nl - 1>

<cfset title= "Semiprecious Jewelry Store by Dynamic Web" />


<BODY BGCOLOR="white" onLoad="document.getElementById('form1').submit();" topmargin='0'   >

<CFINCLUDE TEMPLATE="/header#session.country#.cfm">

    <td align="left" valign="top" style="padding:10px;"><h3>Confirmation</h3>
	<div align="center">
       
	   <!--- here check that emailid is looking valid type. if not relocate to previous page --->
        <cfoutput>
                <table  align="center" border="0" cellpadding="2" >
                <tr><td colspan=2 class="form_heading">Please confirm the details provided</td></tr>
				  <tr>
                    <td width="25%" align="right" valign="top"><strong><span class="tdcenter">Name:</span></strong></td>
                    <td align="left">#form.firstname#</td>
                  </tr>
                  <tr>
                    <td align="right" valign="top"><strong><span class="tdcenter"> Address:</span></strong></td>
                    <td align="left">#form.address1# <br>
                      #form.address2#</td>
                  </tr>
                  <tr>
                    <td align="right" valign="top"><strong><span class="tdcenter">City:</span></strong></td>
                    <td align="left">#form.city#</td>
                  </tr>
                  <tr>
                    <td align="right" valign="top"><strong><span class="tdcenter">State:</span></strong></td>
                    <td align="left">#form.state#</td>
                  </tr>
                  <tr>
                    <td align="right" valign="top"><strong><span class="tdcenter">Zip:</span></strong></td>
                    <td align="left">#form.zip#</td>
                  </tr>
                  <tr>
				  <cfif not isdefined('form.country')>
				  <cflocation url='apply.cfm' />
				  </cfif>
                    <td align="right" valign="top"><strong><span class="tdcenter">Country;</span></strong></td>
                    <td align="left">#form.country#</td>
                  </tr>
                  <tr>
                    <td align="right" valign="top"><strong><span class="tdcenter">Email 
                      Address:</span></strong></td>
                    <td align="left">#form.email# </td>
                  </tr>
                  <tr>
                    <td align="right" valign="top"><strong><span class="tdcenter">Phone 
                      Number:</span></strong></td>
                    <td align="left">#form.phonenumber# </td>
                  </tr>
                  <cfset credit = 5>
                  <cfif find('@',form.friend1)>
                    <Cfset credit = credit + 5 />
                    <tr>
                      <td align="right" valign="top"><strong><span class="tdcenter">Friend To Invite: </span></strong></td>
                      <td align="left">#form.friend1# </td>
                    </tr>
                  </cfif>
                  <cfif find('@',form.friend2)>
                    <Cfset credit = credit + 5 />
                    <tr>
                      <td align="right" valign="top"><strong><span class="tdcenter">Friend To Invite: </span></strong></td>
                      <td align="left">#form.friend2# </td>
                    </tr>
                  </cfif>
           
				
           
            <tr>
           
             <td colspan=2 align="center" valign="bottom" nowrap="nowrap">
             	   <FORM id="form1" ACTION="apply3.cfm" METHOD="POST"><input type="button" onClick="javascript:history.back()"  class="gray_url"  value="Click Here to Change Form Data">
                  &nbsp;
                  <input type="hidden" name="firstname" value="#trim(firstname)#">
                  <input type="hidden" name="lastname" value="">
                  <input type="hidden" name="address1" value="#address1#">
                  <input type="hidden" name="address2" value="#address2#">
                  <input type="hidden" name="city" value="#city#">
                  <input type="hidden" name="state" value="#state#">
                  <input type="hidden" name="credit" value="#credit#" />
                  <input type="hidden" name="zip" value= "#zip#">
                  <input type="hidden" name="country" value="#country#">
                  <input type="hidden" name="phonenumber" value="#phonenumber#">
                  <input type="hidden" name="email" value="#trim(email)#">
                  <input type="hidden" name="newsletter1" value="#newsletter1#">
                  <input type="hidden" name="newsletter2" value="#newsletter2#">
                  <input type="hidden" name="totpurchase" value="0.00">
                  <input type="hidden" name="saleletter" value="#saleletter#">
                  <input type="hidden" name="friend1" value="#form.friend1#" />
                  <input type="hidden" name="friend2" value="#form.friend2#" />
                  <input type="hidden" name="doa" value="#form.doa#" />
                  <input type="hidden" name="dob" value="#form.dob#" />
                  <input type="hidden" name="moa" value="#form.moa#" />
                  <input type="hidden" name="mob" value="#form.mob#" />
                  <input type="hidden" name="newitemletter" value="#newitemletter#">
                  <input type="hidden" name="nlstatus" value="#nlstatus#">
                  <input type="submit" class="gray_url" value="Click Here to Go Ahead with Subscription" class="ContactUsBtn" />
                  &nbsp;  </form></td>
            
            </tr>
          </table>
        </cfoutput>
	  </div></td>
  </tr>
</table>
</div>
    <div id="mainfooter">
    <cfinclude template="mainfooter.cfm">
    </div>
</div>
</body>
</html>
