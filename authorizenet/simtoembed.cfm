<script type="text/javascript">
	function fnDisbleButton(){
		document.getElementById('spanIdDisplayButton').style.display = 'none'
		document.getElementById('spanIdDisplayText').style.display = 'inline'
	}
	<cfoutput>
	function fnFillForm(ele){
		if(ele.checked == true){
			document.getElementById('x_first_name').value = '#session.x_ship_to_first_name#'
			document.getElementById('x_last_name').value = '#session.x_ship_to_last_name#'
			document.getElementById('x_address1').value = '#session.x_ship_to_address1#'
			document.getElementById('x_address2').value = '#session.x_ship_to_address2#'
			document.getElementById('x_city').value = '#session.x_ship_to_city#'
			document.getElementById('x_state').value = '#session.x_ship_to_state#'
			document.getElementById('x_zip').value = '#session.x_ship_to_zip#'
			document.getElementById('x_country').options[document.getElementById('x_country').selectedIndex].text = ''
		}
		else{
			document.getElementById('x_first_name').value = ''
			document.getElementById('x_last_name').value = ''
			document.getElementById('x_address1').value = ''
			document.getElementById('x_address2').value = ''
			document.getElementById('x_city').value = ''
			document.getElementById('x_state').value = ''
			document.getElementById('x_zip').value = ''
			document.getElementById('x_country').options[document.getElementById('x_country').selectedIndex].text = ''
		}

	}
	</cfoutput>
</script>
<cftry><!--
	Get the current time
-->
<cfset TheTimeDate=Now()>
<!--
	Convert the current time to the Greenwhich Mean Time
	(which is the required time that the Authorize.Net
	transaction server uses to verify xp_fingerprint)
-->
	<cfset UCT=DateConvert('local2UTC', TheTimeDate)>
<!--
	Create the required UNIX timestamp (seconds since midnight, January 1, 1970)
-->
	<cfset FirstDate= dateadd('m',-1,Now())>
	<cfset SecondDate='1/1/1970'>
	<cfset UCT2=DateDiff("s",SecondDate,UCT)>
<!---
	Test the timestamp and subsequent output
	(this is not required, but we've included it
	here to demonstrate what this might look like)
	<cfoutput>
	Look inside the code to find out how to generate the required UNIX timestamp in ColdFusion:<br>
 seconds since 1/1/1970: #UCT2#<br><br>
	</cfoutput>
	We set the fpTime variable for later use in the form that will get submitted to Authorize.Net
--->
	<cfset fpTime=#UCT2#>


<!---
	We set the loginid variable for later use in the form that will get submitted to Authorize.Net

	You could, of course, obtain the log-in ID in a number of other ways.

	Remember, this is only a demonstration to give you an idea of what
	might be involved in performing SIM transactions, using ColdFusion.
	Login ID:<br>
<cfoutput>#loginid#</cfoutput><br><br>


	We set the sequence variable for later use in the form that will get submitted to Authorize.Net

	You could, of course, obtain this number in a number of other ways.
	Ideally, you would obtain this number through the integration of a
	database and correlate the number ot your invoice sequence.

--->

	<cfset sequence=#RandRange(123, 987)#>
<!---	Randomly generated sequence number:<br>
	<cfoutput>#sequence#</cfoutput><br><br>

	Finally, we have all the information to generate a valid fingerprint.

	Since this requires the HMAC-MD5 algorithm — which is not built into
	ColdFusion yet — we are using the external custom tag:
	hmac.cfm

	If you have this freely available custom tag installed in one of the
	many possible locations for CF custom tags, the following code will
	execute properly.


	Resulting fingerprint: <br>
<cfoutput>#fp#</cfoutput><br><br>

--->
<cfif not isdefined("x_first_name")><!--- we are not seeing a form submit --->
		<cfif len(confirm_mail)>
				   <cfif len(session.bulkbuyer.id)>
							  	<cfquery datasource="sptm" name="login">
							            SELECT *, address as address1 name as firstname FROM bulkbuyers  WHERE email='#confirm_mail#'
							    </cfquery>
					<cfelse>
						<cfquery datasource="gemssql" name="login">
			    	        SELECT firstname, email, address1, address2,state,country, phonenumber as phoneno,city, zip FROM memberinfo
			        	    WHERE email='#confirm_mail#'
			            </cfquery>
				</cfif>
		   <cfelse>
		   <cfset login.recordcount = 0 />
		</cfif>

	<cfif login.recordcount is 0>
		<cfset x_first_name="">
		<cfset x_last_name="">
		<cfset x_address1="">
		<cfset x_address2="">
		<cfset x_city="">
		<cfset x_phoneno="">
		<cfset x_state="">
		<cfset x_zip="">
		<cfset email="#confirm_mail#">
        <!---Changes By Ankur
		<cfset x_ship_to_first_name="">
		<cfset x_ship_to_last_name="">
		<cfset x_ship_to_address1="">
		<cfset x_ship_to_address2="">
		<cfset x_ship_to_city="">
		<cfset x_ship_to_state="">
		<cfset x_ship_to_zip=""> --->
		<cfset x_country ="" />
	<cfelse>
        <cfset x_first_name="#listfirst(trim(login.firstname),' ')#">
	<cftry>
			<cfset x_last_name="#listgetat(trim(login.firstname),2,' ')#">
		<cfcatch type="any">
			<cfset x_last_name="">
		</cfcatch>
		</cftry>
		<!---
		<cfset x_address1="#login.address1#">
		<cfset x_address2="#login.address2#">
		<cfset x_city="#login.city#">
		<cfset x_phoneno ="#login.phoneno#" />
		<cfset x_state="#login.state#">
		<cfset x_zip="#login.zip#">--->

		<cfset x_address1="">
		<cfset x_address2="">
		<cfset x_city="">
		<cfset x_phoneno ="" />
		<cfset x_state="">
		<cfset x_zip="">
		<cfset x_country ="" /><!--- our db country names may not match the names expected by auth.net--->
		<cfset email="#confirm_mail#">
        <!--- Changes By Ankur
        <cfset x_ship_to_first_name="#listfirst(trim(login.firstname),' ')#">
		<cftry>
		<cfset x_ship_to_last_name="#listgetat(trim(login.firstname),2,' ')#">
		<cfcatch type="any">
		<cfset x_ship_to_last_name="">
		</cfcatch>
		</cftry>
		<cfset x_ship_to_address1="">
		<cfset x_ship_to_address2="">
		<cfset x_ship_to_city="">
		<cfset x_ship_to_state="">
		<cfset x_ship_to_zip=""> --->
		<cfset x_country ="#X_COUNTRY#" />

		</cfif>
<cfelse>
		<cfset x_country ="#X_COUNTRY#" />

</cfif>
		<cfif isdefined("form.clientcreditcard")>

			<cfset clientcreditcard=#form.clientcreditcard#>
			<cfset card_type=#form.card_type#>
			<cfset expmonth=#form.expmonth#>
			<cfset expyear=#form.expyear#>
			<cfset ccv2=#form.ccv2#>

		<cfelse>

			<cfset clientcreditcard="">
			<cfset card_type="">
			<cfset expmonth="">
			<cfset expyear="">
			<cfset ccv2="">

		</cfif>
<FORM ACTION="/confirmation.cfm" method="post" name="simForm" id="simForm" style="display:inline;" onsubmit="fnDisbleButton()">

  <div id="err_box" style="z-index:4;position:absolute;top:20px;left:60px;width:350px;border:1px red solid;padding:0px;padding-bottom:4px ;display: none;background:white;">
  <div style="width:100%;background-color:red;color:white;height:22px;">
  <span  style="float:left;font-weight:bold;">Following  Error Occured</span><span id="close_err_box" style="float:right;text-decoration:underline;cursor:pointer;">Close</span>
  </div>
  <ul style="margin:15px;margin-top:30px;"></ul>
  </div>
<table width="100%" cellspacing="2" cellpadding="2" align="center" >
<cfif isdefined("err_mess")>
<tr>
        <td width="100%" colspan="2" align="center"><strong><font color="#FF0000">
		<cfif err_mess eq "Payment Completed" >
			<div class="green_band_ticked">
		<cfelse>
			<div class="pink_band_ticked">
		</cfif>
		<cfoutput>#err_mess#</cfoutput></div></font></strong>
		<cfif isdefined("final_address")>
		<cfoutput>#final_address#</cfoutput></td>
		</cfif>
      </tr>

</cfif>
<cfparam name="err_mess" default="" />
<cfif err_mess neq "Payment Completed" >
<tr><td width="50%" align="center" valign="top">
<table width="98%" cellspacing="2" cellpadding="0" align="center">

<tr>
    	<td width="50%" colspan="2">
        	Billing Address: <br />Click To Copy Shipping Address <input type="checkbox" name="sameas" id="sameas" onclick="fnFillForm(this);">
        </td>
    </tr>
	<tr>
    	<td>
        	Emailid
        </td>
        <td>
        	<input type="text"  style="font-size: 14px;" name="x_email" value="<cfoutput>#confirm_mail#</cfoutput>" maxlength="100" size="30">
        </td>
    </tr>
	<tr>
    	<td>
        	First Name
        </td>
    	<td>
        	<input type="text"  style="font-size: 14px;" name="x_first_name" id="x_first_name" value="<cfoutput>#x_first_name#</cfoutput>" maxlength="50">
        </td>
    </tr>
	<tr>
    	<td>
        	Last Name
        </td>
        <td>
        	<input type="text"  style="font-size: 14px;" name="x_last_name" id="x_last_name" value="<cfoutput>#x_last_name#</cfoutput>" maxlength="50">
      	</td>
    </tr>
	<tr>
    	<td>
        	Phone (optional)
        </td>
    	<td>
    		<input type="text"  style="font-size: 14px;"  name="x_phoneno" id="x_phoneno" value="<cfoutput>#x_phoneno#</cfoutput>" maxlength="200" size="20">
    	</td>
    </tr>
	<tr>
    	<td>
        	Address1
        </td>
        <td>
        	<input type="text"  style="font-size: 14px;"  name="x_address1" id="x_address1" value="<cfoutput>#x_address1#</cfoutput>" maxlength="200" size="30">
        </td>
    </tr>
	<tr>
    	<td>
        	Address2
        </td>
        <td>
        	<input type="text"  style="font-size: 14px;" name="x_address2" id="x_address2" value="<cfoutput>#x_address2#</cfoutput>" maxlength="200" size="30">
        </td>
    </tr>
	<tr>
    	<td>
        	City
        </td>
    	<td>
        	<input type="text"  style="font-size: 14px;" name="x_city" id="x_city" value="<cfoutput>#x_city#</cfoutput>" maxlength="50" size="20">
        </td>
    </tr>
	<tr>
    	<td>
        	State
        </td>
        <td>
        	<input type="text"   style="font-size: 14px;" name="x_state" id="x_state" value="<cfoutput>#x_state#</cfoutput>" maxlength="50" size="20">
        </td>
    </tr>
	<tr>
    	<td>
        	Zipcode
        </td>
        <td>
        	<input type="text" style="font-size: 14px;"  name="x_zip" id="x_zip" value="<cfoutput>#x_zip#</cfoutput>" maxlength="10" size="15">
        </td>
    </tr>
	<tr>
    	<td>
			<input type="hidden" id="check_country" value="<cfoutput>#form.x_ship_to_country#</cfoutput>" />
			<cfif isdefined("err_mess")><span style="color:red"></cfif>
			Country<cfif isdefined("err_mess")></span></cfif>
        </td>
        <td>
			<select  id="x_country"  style="font-size: 14px;"  name="x_country" >
				<option value="US"  selected><CFOUTPUT>--SELECT COUNTRY----</CFOUTPUT></option>
                <option value="AL" >Albania</option>
                <option value="DZ" >Algeria</option>
                <option value="AD" >Andorra</option>
                <option value="AO" >Angola</option>
                <option value="AI" >Anguilla</option>
                <option value="AG" >Antigua
                and Barbuda</option>
                <option value="AR" >Argentina</option>
                <option value="AM" >Armenia</option>
                <option value="AW" >Aruba</option>
                <option value="AU" >Australia</option>
                <option value="AT" >Austria</option>
                <option value="AZ" >Azerbaijan
                Republic</option>
                <option value="BS" >Bahamas</option>
                <option value="BH" >Bahrain</option>
                <option value="BB" >Barbados</option>
                <option value="BE" >Belgium</option>
                <option value="BZ" >Belize</option>
                <option value="BJ" >Benin</option>
                <option value="BM" >Bermuda</option>
                <option value="BT" >Bhutan</option>
                <option value="BO" >Bolivia</option>
                <option value="BA" >Bosnia
                and Herzegovina</option>
                <option value="BW" >Botswana</option>
                <option value="BR" >Brazil</option>
                <option value="VG" >British
                Virgin Islands</option>
                <option value="BN" >Brunei</option>
                <option value="BG" >Bulgaria</option>
                <option value="BF" >Burkina
                Faso</option>
                <option value="BI" >Burundi</option>
                <option value="KH" >Cambodia</option>
                <option value="CA" >Canada</option>
                <option value="CV" >Cape
                Verde</option>
                <option value="KY" >Cayman
                Islands</option>
                <option value="TD" >Chad</option>
                <option value="CL" >Chile</option>
                <option value="C2" >China
                Worldwide</option>
                <option value="CO" >Colombia</option>
                <option value="KM" >Comoros</option>
                <option value="CK" >Cook
                Islands</option>
                <option value="CR" >Costa
                Rica</option>
                <option value="HR" >Croatia</option>
                <option value="CY" >Cyprus</option>
                <option value="CZ" >Czech
                Republic</option>
                <option value="CD" >Democratic
                Republic of the Congo</option>
                <option value="DK" >Denmark</option>
                <option value="DJ" >Djibouti</option>
                <option value="DM" >Dominica</option>
                <option value="DO" >Dominican
                Republic</option>
                <option value="EC" >Ecuador</option>
                <option value="SV" >El
                Salvador</option>
                <option value="ER" >Eritrea</option>
                <option value="EE" >Estonia</option>
                <option value="ET" >Ethiopia</option>
                <option value="FK" >Falkland
                Islands</option>
                <option value="FO" >Faroe
                Islands</option>
                <option value="FM" >Federated
                States of Micronesia</option>
                <option value="FJ" >Fiji</option>
                <option value="FI" >Finland</option>
                <option value="FR" >France</option>
                <option value="GF" >French
                Guiana</option>
                <option value="PF" >French
                Polynesia</option>
                <option value="GA" >Gabon
                Republic</option>
                <option value="GM" >Gambia</option>
                <option value="DE" >Germany</option>
                <option value="GI" >Gibraltar</option>

                <option value="GR" >Greece</option>
                <option value="GL" >Greenland</option>
                <option value="GD" >Grenada</option>
                <option value="GP" >Guadeloupe</option>
                <option value="GT" >Guatemala</option>
                <option value="GN" >Guinea</option>
                <option value="GW" >Guinea
                Bissau</option>
                <option value="GY" >Guyana</option>
                <option value="HN" >Honduras</option>
                <option value="HK" >Hong
                Kong</option>
                <option value="HU" >Hungary</option>
                <option value="IS" >Iceland</option>
                <option value="IN" >India</option>
                <option value="ID" >Indonesia</option>
                <option value="IE" >Ireland</option>
                <option value="IL" >Israel</option>
                <option value="IT" >Italy</option>
                <option value="JM" >Jamaica</option>
                <option value="JP" >Japan</option>
                <option value="JO" >Jordan</option>
                <option value="KZ" >Kazakhstan</option>
                <option value="KE" >Kenya</option>
                <option value="KI" >Kiribati</option>
                <option value="KW" >Kuwait</option>
                <option value="KG" >Kyrgyzstan</option>
                <option value="LA" >Laos</option>
                <option value="LV" >Latvia</option>
								<option value="LB" >Lebanon</option>
                <option value="LS" >Lesotho</option>
                <option value="LI" >Liechtenstein</option>
                <option value="LT" >Lithuania</option>
                <option value="LU" >Luxembourg</option>
                <option value="MG" >Madagascar</option>
                <option value="MW" >Malawi</option>
                <option value="MY" >Malaysia</option>
                <option value="MV" >Maldives</option>
                <option value="ML" >Mali</option>
                <option value="MT" >Malta</option>
                <option value="MH" >Marshall
                Islands</option>
                <option value="MQ" >Martinique</option>
                <option value="MR" >Mauritania</option>
                <option value="MU" >Mauritius</option>
                <option value="YT" >Mayotte</option>
                <option value="MX" >Mexico</option>
                <option value="MN" >Mongolia</option>
                <option value="MS" >Montserrat</option>
                <option value="MA" >Morocco</option>
                <option value="MZ" >Mozambique</option>
                <option value="NA" >Namibia</option>
                <option value="NR" >Nauru</option>
                <option value="NP" >Nepal</option>
                <option value="NL" >Netherlands</option>
                <option value="AN" >Netherlands
                Antilles</option>
                <option value="NC" >New
                Caledonia</option>
                <option value="NZ" >New
                Zealand</option>
                <option value="NI" >Nicaragua</option>
                <option value="NE" >Niger</option>
                <option value="NG" >Nigeria</option>
                <option value="NU" >Niue</option>
                <option value="NF" >Norfolk
                Island</option>
                <option value="NO" >Norway</option>
                <option value="OM" >Oman</option>
                <option value="PW" >Palau</option>
                <option value="PA" >Panama</option>
                <option value="PG" >Papua
                New Guinea</option>
                <option value="PE" >Peru</option>
                <option value="PH" >Philippines</option>
                <option value="PN" >Pitcairn
                Islands</option>
                <option value="PL" >Poland</option>
                <option value="PT" >Portugal</option>
                <option value="QA" >Qatar</option>
                <option value="CG" >Republic
                of the Congo</option>
                <option value="RE" >Reunion</option>
                <option value="RO" >Romania</option>
                <option value="RU" >Russia</option>
                <option value="RW" >Rwanda</option>
                <option value="VC" >Saint
                Vincent and the Grenadines</option>
                <option value="WS" >Samoa</option>
                <option value="SM" >San
                Marino</option>
                <option value="ST" >São
                Tomé and Príncipe</option>
                <option value="SA" >Saudi
                Arabia</option>
                <option value="SN" >Senegal</option>
                <option value="SC" >Seychelles</option>
                <option value="SL" >Sierra
                Leone</option>
                <option value="SG" >Singapore</option>
                <option value="SK" >Slovakia</option>
                <option value="SI" >Slovenia</option>
                <option value="SB" >Solomon
                Islands</option>
                <option value="SO" >Somalia</option>
                <option value="ZA" >South
                Africa</option>
                <option value="KR" >South
                Korea</option>
                <option value="ES" >Spain</option>
                <option value="LK" >Sri
                Lanka</option>
                <option value="SH" >St.
                Helena</option>
                <option value="KN" >St.
                Kitts and Nevis</option>
                <option value="LC" >St.
                Lucia</option>
                <option value="PM" >St.
                Pierre and Miquelon</option>
                <option value="SR" >Suriname</option>
                <option value="SJ" >Svalbard
                and Jan Mayen Islands</option>
                <option value="SZ" >Swaziland</option>
                <option value="SE" >Sweden</option>
                <option value="CH" >Switzerland</option>
                <option value="TW" >Taiwan</option>
                <option value="TJ" >Tajikistan</option>
                <option value="TZ" >Tanzania</option>
                <option value="TH" >Thailand</option>
                <option value="TG" >Togo</option>
                <option value="TO" >Tonga</option>
                <option value="TT" >Trinidad
                and Tobago</option>
                <option value="TN" >Tunisia</option>
                <option value="TR" >Turkey</option>
                <option value="TM" >Turkmenistan</option>
                <option value="TC" >Turks
                and Caicos Islands</option>
                <option value="TV" >Tuvalu</option>
                <option value="UG" >Uganda</option>
                <option value="UA" >Ukraine</option>
                <option value="AE" >United
                Arab Emirates</option>
                <option value="GB" >United
                Kingdom</option>
                <option value="US" >United
                States</option>
                <option value="UY" >Uruguay</option>
                <option value="VU" >Vanuatu</option>
                <option value="VA" >Vatican
                City State</option>
                <option value="VE" >Venezuela</option>
                <option value="VN" >Vietnam</option>
                <option value="WF" >Wallis
                and Futuna Islands</option>
                <option value="YE" >Yemen</option>
                <option value="ZM" >Zambia</option>



</select>
</td></tr>
<!--- <tr>              <td colspan="2"><strong>Shipping Address: (Same As Billing ?<input type="checkbox" name="sameas" id="sameas" >)</strong></td>
             </tr>
<tr><td >
<table id="shipping">
<tr><td>First Name</td><td><input type="text"  style="font-size: 14px;" name="x_ship_to_first_name" id="x_ship_to_first_name" value="<cfoutput>#x_ship_to_first_name#</cfoutput>" maxlength="50"></td></tr>
<tr><td>Last Name</td><td><input type="text"  style="font-size: 14px;" name="x_ship_to_last_name" id="x_ship_to_last_name" value="<cfoutput>#x_ship_to_last_name#</cfoutput>" maxlength="50"></td></tr>
<tr><td>Address1</td><td><input type="text"  style="font-size: 14px;" name="x_ship_to_address1" id="x_ship_to_address1" value="<cfoutput>#x_ship_to_address1#</cfoutput>" maxlength="200" size="30"></td></tr>
<tr><td>Address2</td><td><input type="text"   style="font-size: 14px;" name="x_ship_to_address2" id="x_ship_to_address2" value="<cfoutput>#x_ship_to_address2#</cfoutput>" maxlength="200" size="30"></td></tr>
<tr><td>City</td><td><input type="text"  style="font-size: 14px;" name="x_ship_to_city" id="x_ship_to_city" value="<cfoutput>#x_ship_to_city#</cfoutput>" maxlength="50" size="20"></td></tr>
<tr><td>State</td><td><input type="text"  style="font-size: 14px;" name="x_ship_to_state" id="x_ship_to_state" value="<cfoutput>#x_ship_to_state#</cfoutput>" maxlength="50" size="20"></td></tr>
<tr><td>Zipcode</td><td><input type="text"  style="font-size: 14px;" name="x_ship_to_zip" id="x_ship_to_zip" value="<cfoutput>#x_ship_to_zip#</cfoutput>" maxlength="10" size="15"></td></tr>
<cfoutput>

<tr><td>Country</td><td> <input type="hidden" name="x_ship_to_country"  value="#form.country#" />
<input type="hidden" name="country" id="ship_country" value="#form.country#" />#form.country# [<a href="/#session.cart#?country=#form.country#&amp;checkout=yes&amp;cartid=#session.cartid#&amp;b=ANCOnf22&amp;##checkout" style="color:red;font-size:1.2em;">Change Country</a>]
</cfoutput>
</td></tr>
</table></td>
</tr>--->
</table>

</td>
<td align="center" valign="top">
<table width="100%" align="center">
<tr>
              <td width="50%" colspan="2">Credit Card Details:</td>
              </tr>
<tr><td>Card Type</td><td>
<select name="card_type">
   <option value="Visa" <cfif #card_type# eq "Visa">selected</cfif>>Visa</option>
  <option value="Mastercard" <cfif #card_type# eq "Mastercard">selected</cfif>>Mastercard</option>
  <option value="Amex" <cfif #card_type# eq "Amex">selected</cfif>>American Express</option>
  <option value="Discover" <cfif #card_type# eq "Discover">selected</cfif>>Discover</option>
</select>
</td></tr>
<tr><td>Card Number</td><td><input type="text" id="clientcreditcard"  style="font-size: 14px;" name="clientcreditcard" value="<cfoutput>#clientcreditcard#</cfoutput>"/></td></tr>
<tr><td>Expiration Date (MM/YYYY)</td><td>

<select name="expmonth"  style="font-size: 14px;">
                          <option value=''  selected="selected" >---</option>
                          <option value='01' <cfif #expmonth# eq "01">selected</cfif>>Jan</option>
                          <option value='02' <cfif #expmonth# eq "02">selected</cfif>>Feb</option>
                          <option value='03' <cfif #expmonth# eq "03">selected</cfif>>Mar</option>
                          <option value='04' <cfif #expmonth# eq "04">selected</cfif>>Apr</option>
                          <option value='05' <cfif #expmonth# eq "05">selected</cfif>>May</option>
                          <option value='06' <cfif #expmonth# eq "06">selected</cfif>>Jun</option>
                          <option value='07' <cfif #expmonth# eq "07">selected</cfif>>Jul</option>
                          <option value='08' <cfif #expmonth# eq "08">selected</cfif>>Aug</option>
                          <option value='09' <cfif #expmonth# eq "09">selected</cfif>>Sep</option>
                          <option value='10' <cfif #expmonth# eq "10">selected</cfif>>Oct</option>
                          <option value='11' <cfif #expmonth# eq "11">selected</cfif>>Nov</option>
                          <option value='12' <cfif #expmonth# eq "12">selected</cfif>>Dec</option>
                        </select>
                       &nbsp;/&nbsp;
                        <select name="expyear">
                          <option value=''  selected="selected" >---</option>
                          <option value='2011' <cfif #expyear# eq "11">selected</cfif>>2011</option>
                          <option value='2012' <cfif #expyear# eq "12">selected</cfif>>2012</option>
                          <option value='2013' <cfif #expyear# eq "13">selected</cfif>>2013</option>
                          <option value='2014' <cfif #expyear# eq "14">selected</cfif>>2014</option>
                          <option value='2015' <cfif #expyear# eq "15">selected</cfif>>2015</option>
                          <option value='2016' <cfif #expyear# eq "16">selected</cfif>>2016</option>
                          <option value='2017' <cfif #expyear# eq "17">selected</cfif>>2017</option>
                          <option value='2018' <cfif #expyear# eq "18">selected</cfif>>2018</option>
                          <option value='2019' <cfif #expyear# eq "19">selected</cfif>>2019</option>
                          <option value='2020' <cfif #expyear# eq "20">selected</cfif>>2020</option>
                          <option value='2021' <cfif #expyear# eq "21">selected</cfif>>2021</option>
                          <option value='2022' <cfif #expyear# eq "22">selected</cfif>>2022</option>
                          <option value='2023' <cfif #expyear# eq "23">selected</cfif>>2023</option>
                          <option value='2024' <cfif #expyear# eq "24">selected</cfif>>2024</option>
                          <option value='2025' <cfif #expyear# eq "25">selected</cfif>>2025</option>
                        </select>

</td></tr>


<tr><td>Security Code</td><td><input  style="font-size: 14px;" name="ccv2" type="text" value="<cfoutput>#ccv2#</cfoutput>" size="5" maxlength="4"> </td></tr>




</table>
</td>
</tr>
<tr><td colspan="2" align="center">
	<span id="spanIdDisplayButton">
		<!---TODO: http to be made https when SSL certificatie is placed --->
        <input type="image" src="http://www.semiprecious.com/images/authnet.gif" border="0" id="authbutt"
        name="submit" alt="Make payments with Wells Fargo">
    </span>
<span id="spanIdDisplayText" style="display:none">	<!---TODO: http to be made https when SSL certificatie is placed --->
<img src="http://www.semiprecious.com/images/progress.gif" /><b>Processing your Request...</b></span>
	</td></tr>
</cfif></table>



		<input type="hidden" name="x_amount" value="<cfoutput>#decimalformat(amount)#</cfoutput>">
		<input type="hidden" name="x_invoice_num" value="<cfoutput>#session.cartid#</cfoutput>">




</FORM>

<cfcatch type="any"><cfrethrow /></cfcatch></cftry>