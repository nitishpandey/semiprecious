<!--- <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"> --->
<!-- contactus.cfm starts -->
<CFPARAM name="form.nospam" default="" />
<CFPARAM name="preselect" default="" />
<cfparam default="" name="form.message">
<cfparam default="" name="form.contact">
<cfparam default="" name="form.name">
<CFPARAM name="newitem" default="">
<cfparam name="category" default="all" />
<cfparam name="url.folder" default="necklaces" />
<cfset title="Talk to us - We Love Customer Feedback and Requests" />
<cfsavecontent variable="inheader">
	<meta name="robots" content="noindex,nofollow">
 <style type="text/css">
<!--
.copyright {
	font: 9px "Times New Roman", Times, serif;
	color: #CCCCCC;
}
-->
</style>

 <script type="text/javascript">
 	function fnExpand(id) {
 		if (document.getElementById('a_' + id).style.display == 'none') {
 			document.getElementById('a_' + id).style.display = 'inline';
 			document.getElementById('p_' + id).style.display = 'none';
 			document.getElementById('m_' + id).style.display = 'inline';
 			document.getElementById('a_' + id).focus();
 		}
 		else {
 			document.getElementById('a_' + id).style.display = 'none';
 			document.getElementById('p_' + id).style.display = 'inline';
 			document.getElementById('m_' + id).style.display = 'none';
 		}
 	}
 </script>
<script type="text/javascript">
	(function() {
		var a = "start";
		function c(b) {
			this.t = {};
			this.tick = function(b, f, d) {
				this.t[b] = [void 0 != d ? d : (new Date).getTime(), f]
			};
			this.tick(a, null, b)
		}
		var e = new c;
		window.jstiming = {
			Timer: c,
			load: e
		};
		try {
			var g = null;
			window.chrome && window.chrome.csi && (g = Math.floor(window.chrome.csi().pageT));
			null == g && window.gtbExternal && (g = window.gtbExternal.pageT());
			null == g && window.external && (g = window.external.pageT);
			g && (window.jstiming.pt = g)
		} catch (h) {};
	})()
</script><script type="text/javascript">
	var KX_timer = new window.jstiming.Timer();
	KX_timer.name = 'published';
</script><title>Semiprecious FAQs</title><style type="text/css">
      body {
        font-family: arial, sans, sans-serif;
        margin: 0;
      }

      iframe {
        border: 0;
        frameborder: 0;
        height: 100%;
        width: 100%;
      }

      #header, #footer {
        background: #f0f0f0;
        padding: 10px 10px;
      }

      #header {
        border-bottom: 1px #ccc solid;
		width:95%;
      }

      #footer {
        border-top: 1px #ccc solid;
        border-bottom: 1px #ccc solid;
        font-size: 13;
      }

      #contents {
	  	width:95%;
        margin: 6px;
      }

      .dash {
        padding: 0 6px;
      }
	  ol{margin:0;padding:0}p{margin:0;text-align:left}.c0{width:468pt;background-color:#ffffff;padding:72pt 72pt 72pt 72pt}.c2{height:11pt;margin-left:36pt}.c6{color:inherit;text-decoration:inherit}.c5{color:#000099;text-decoration:underline}.c7{font-style:italic}.c4{margin-left:36pt}.c3{height:11pt}.c1{direction:ltr}.c8{direction:ltr;font-weight:bold}body{text-align:left;color:#000000;font-size:11pt;font-family:Arial}h1{padding-top:24pt;color:#000000;font-size:24pt;font-family:Arial;font-weight:bold;padding-bottom:6pt}h2{padding-top:18pt;color:#000000;font-size:18pt;font-family:Arial;font-weight:bold;padding-bottom:4pt}h3{padding-top:14pt;color:#000000;font-size:14pt;font-family:Arial;font-weight:bold;padding-bottom:4pt}h4{padding-top:12pt;color:#000000;font-size:12pt;font-family:Arial;font-weight:bold;padding-bottom:2pt}h5{padding-top:11pt;color:#000000;font-size:11pt;font-family:Arial;font-weight:bold;padding-bottom:2pt}h6{padding-top:10pt;color:#000000;font-size:10pt;font-family:Arial;font-weight:bold;padding-bottom:2pt}
    </style>

</cfsavecontent>
<CFINCLUDE TEMPLATE="/header#session.country#.cfm">
<div id="container2">
	<table id="container1" width="80%" cellspacing="0" cellpadding="0" border="0" style="padding:0 2px 0 3px" align="center">
		<tr>
			<!--- <td valign="top"  align="left" ><!--- BEGIN LEFT SIDE STUFF --->
			<CFINCLUDE TEMPLATE="leftmenus.cfm">
			<!--- END LEFT SIDE STUFF --->
			</td> --->
			<td style="BACKGROUND:WHITE;PADDING-TOP:4PX;" valign="top" align="center">
<cfif (len("form.message") ) and form.nospam is "999" and find('@',form.contact)>

					<!--- <cfsilent>
						<cfmodule template="customtags/mailsemipreciouscom.cfm" debug="1" mailto="#Variables.mailto#" ccto="#Variables.ccto#"  subject="#form.name#'s Query" mailcontent="#variables.mailcontent#" />
						--->
					<!--- <cfinclude template="newsletters/mailer.cfm"> --->
					<!--- </cfsilent> --->
					<cfinvoke method="sendmails" component="backing_beans.contactus" returnvariable="mailsuccess" >
						<cfinvokeargument name="formdata" value="#form#" />
						<cfinvokeargument name="tld" value="#session.tld#" />
						<cfinvokeargument name="USEREMAIL" value="#session.mail#" />
					</cfinvoke>

					<cfif !mailsuccess>
						There was an error in recording your message. Sorry for the inconvenience. You can contact us by sending us mail at customer service
						<img src=/images/jewelrymaker.jpg width="200" height="15" />
						or call us any time on our help line.
					<cfelse>
						<table width="760px" border="0">
							<tr>
								<td valign="top">
									<br>
									<br>
									<br>
									<div class="green_band_ticked">
										Your query/message has been forwarded to our customer service team.
									</div>
									<br>
									<cfinclude template="/includes/spam_proof.cfm" />
									<br>
									<cfif findnocase('whole',form.message) or findnocase('bulk',form.message) or findnocase('Catalog',form.message) >
										In case you are interested in bulk or
										<strong>
											wholesale
										</strong>
										catalogue or purchases then
										<a href="wholesale_register.cfm">
											click here
										</a>
										.
										<br>
										<br>
									</cfif>
									<ul class="arrow_ul">
										<li>
											<div style="width:99%;color:white;font-weight:bold;background-color:#728274">
												You can also contact us on our customer service email
												<img src='images/jewelrymaker.jpg' width="200" height="15">
												<br />
											</div>
										</li>
										<cfif session.country is "india">
											<li>
												Our postal address is available on our about us page
											</li>
											<!---
												<li> <cfoutput>Urgent calls/text messages to cell phone: #application.indiaphone#.
												Best is to use email or text.</cfoutput></li> --->
										<cfelse>
											<li>
												Postal Address: SP Returns, 1512 Anise Drive, Austin, TX, 78741.
												<br>
											</li>
										</cfif>
										<li>
											To track your order, use link on top right corner of this page.
										</li>
									</ul>
									<!---                  <div align="center"> <br>
										<div style="border:2px #DADA99 ridge;font-size:12px;"><span style="width:100%;background-color:#666600;color:white;font-weight:bold;"> Easy Search! Search by description, design, bead, silver/non-silver,
										price, color and more! </span><br>
										<form  style="display:inline;" action="list.cfm" method="get" name="srchFrm">
										<input name='advancedsearch' type='text' class="inputtext" onClick="javascript:this.value =''" value="Search  here" size="25" maxlength="40">
										<input name="submit" type="submit" class="greenbutton" onClick="submit(this.form)" value='Go'>
										</form>
										<strong> &nbsp;&nbsp;OR &nbsp;&nbsp;<span style="border:1px ridge #666600;background-color:#FFFFFF;color:white;font-wieght:bold;font-weight:bold;padding:0px 2px;"> <a href="google.cfm">Use Google to Search this site!</a> </span></strong></div>
										</div>
										<br>
										Select Budget  or Color:
										<cfinclude template="searchforms.cfm" />
										<br>
										[You Can Get better results if you use this from the bottom of a product page] </div>--->
								</td>
							</tr>
						</table>
</div>
<!---

	<script language="JavaScript">
	alert("Thankyou for your Query. We  will get in touch with you.");
	</script> ---> </cfif>
 <cfelse>
			<cfif (len(form.message) )>
				<cfif form.nospam NEQ "999" >
					<font size =2 color=red>Your message was not sent, you did not type in 999 into the second box in the form, re-try. This is intended to stop spamming software from using this form to send us junk email.</font>
				</cfif>
				<cfif not find('@',form.contact)>
					 <br /><span class="error1">Please provide your email id to help us reply back.</span>
				 </cfif>
			</cfif> <!--- <table bgcolor=orange><tr><td>
	<form name=txtme action=textme.cfm method=post>
	Your phone <b>without hyphens or spaces</b>:
	<input type="text" name=mynumber value="" size=14>
	<input type=submit value='Call Me Now'></form></td></tr></table>
	---> <b style="font-size:12px;color:#3d4f51">*Please Read Our FAQs Below The Form Before Contacting Us<br><br></b>
	<cfform  method="post" enctype="multipart/form-data" name="a" target="_parent">
		 <DIV  align="center" class="details">
		  <table width="90%" border="1" cellspacing="0" cellpadding="0" style="margin-bottom:20px">
		  <tr height="30px">
			  <td colspan="2" style="background-color:rgb(114, 149, 156);color:#FFFFFF"> <b>Query, Requests or Suggestions Form</b></td>
			</tr>
			   <tr> <td align="center" >
			   <table width="100%" border="0" class="tdcenter">
				   <cfif  not (findnocase("guest",session.mail)) and len(session.mail)>
					    <cfset url.email = session.mail />
					</cfif>
				 <cfif isdefined("url.email")>
					  <cfset contactemail = url.email />
			 </cfif>
			 <tr height="6px"> <td> </td> </tr>
			  <cfif not isdefined("contactemail") >
				  <tr>
					  <td width="35%" >Name</td> <td width="65%" >
						  <cfinput value="#form.name#" name="name" type="text" size="20" required="yes" id="name" class="contactustext" />
						</td>
					</tr>
					<tr>
						<td width="35%" >Email Address:</td>
						<td>
							 <cfinput value="#form.contact#" name="contact"  type="text" validate="email" message="Please provide a valid email id." size="20" required="yes" id="contact" class="contactustext" />
						</td>
					</tr>
				  <cfelse>
				  <input type="hidden" name="contact" value="<cfoutput>#contactemail#</cfoutput>" />
				  <input type="hidden" name="name" value="customer" />
				</cfif>
				 <tr> <td width="35%" >
					  Subject </td> <td> <div class="contactusselect">
					 <select name="subject"> <option value="appointment" <cfif preselect is 'appointment'>selected=true</cfif>>Appointment</option> <option value="feedback">Feedback</option> <option value="Technical">Website Error</option> <option value="Product">Customization</option> <cfif preselect is ""> <option value=" <cfif  isdefined("url.newitem")  >For Item <cfoutput>#url.newitem#</cfoutput> </cfif>" Selected=true> <cfif  isdefined("url.newitem")  >For Item <cfoutput>#url.newitem#</cfoutput> </cfif></option></cfif> <option value="Product">Wholesale/Bulk ordering</option> <option value="Agent">Becoming an Agent</option> <option value="Refunds">Refunds </option> <option value="Shipping">Shipping / Tracking</option> <option value="Other">Other</option> </select> </div>
				</td> </tr>
				<tr> <td>
					Your question or comment<br> </td>
					<td >
						<textarea  name="message" cols="30" rows="6"  id="message" class="contactustextArea"> <cfif len(form.message)><cfoutput>#form.message#</cfoutput> <cfelse> <cfif session.cartid>Current Cartid: <cfoutput>#session.cartid#</cfoutput></cfif> </cfif><cfif preselect is "appointment">Include your phone number if you want a call back to confirm.</cfif> </textarea>
											</td> </tr>
											 <tr>
												 <td> <cfif preselect is "">Please type <img src='/images/number.gif' width="41" height="15" /> </cfif>
												</td>
												<td><input type= <cfif preselect is "">text<cfelse>hidden</cfif> size=4 name=nospam value= <cfif preselect is "">""<cfelse>"999"</cfif>/> <cfif preselect is ""> Type 999 here to prove that you are a human and not a spam robot</cfif>
											    </td>
											</tr>
								<tr>
								 <td align="center" >&nbsp; <cfoutput> <input type="hidden" name="domain" value="#session.tld#" class="contactUsBtn"></cfoutput>
								</td> <td align="center" > <input type="reset" name="Reset" value="Reset" class="contactUsBtn">&nbsp;&nbsp;&nbsp; <input type="submit" name="Submit" value=" Send Message " class="contactUsBtn">
								</td>
							</tr> </table>
				</td> </tr>
		</table>
		<cfif isdefined("url.newitem")>
			<cfoutput>
				 <input type="hidden" name="itemid" value="#url.newitem#" /> <input type="hidden" name="category" value="#url.folder#" />
			</cfoutput>
		</cfif>
		</DIV>
				 </cfform>
				 <cfoutput>
					 <b>PHONE:</b>#application.tollfree# (Cell phone. Customers only!)<p>
				 </cfoutput>
				 <CFQUERY NAME="getFAQsCAT" cachedwithin="#createtimespan(2,0,0,0)#" DATASOURCE="gemssql" >
                   SELECT	Distinct category
                   FROM		FAQ
          		  </CFQUERY>
			<div>
				<br> <b style="font-size:18px;color:#3d4f51">Semiprecious FAQs</b> </div>
			 <div id="contents">
				 <table width="90%">
				<cfoutput>

				  <cfloop query="getFAQsCAT">
				 <CFQUERY NAME="getFAQs" DATASOURCE="gemssql" >
	                 			   SELECT	question,answer,id
								   FROM		FAQ
	                               WHERE	category = '#getFAQsCAT.category#'
	                               ORDER BY ID
	            </CFQUERY>

		<tr>
			<td style="color:##3d4f51;border-bottom:solid ##72959C;font-weight:bold" height="30px" width="80%">
				#getFAQsCAT.category#
			</td>
		</tr>
			<cfloop query="getFAQs">
				 <tr>
					 <td style="color:##3d4f51;font-weight:bold;padding-top:3px" id="#getFAQs.id#">
						 <span style="padding-top:3px;display:inline" id="p_#getFAQs.id#">
							 <img src="/images/add.png" onClick="fnExpand('#getFAQs.id#')">
						</span>
						<span style="padding-top:3px;display:none" id="m_#getFAQs.id#">
							<img src="/images/minus.png" onClick="fnExpand('#getFAQs.id#')" />
						</span>
						<a href="javascript:void(0);" onClick="fnExpand('#getFAQs.id#')" style="color:##3d4f51;">
							#getFAQs.question#</a>
					</td>
				  </tr>
				  <tr>
					  <td style="color:##666;display:none" id="a_#getFAQs.id#"> #getFAQs.answer#</br> </td> </tr>
					   </cfloop> </cfloop>  </cfoutput></table> </div></td>
</tr>

	<tr>
	 <td align="center">
	   <table border="0" width="80%">
		 <tr>
			 <td width="100%" align="center">
			 <span class="contactemail">&nbsp;&nbsp;&nbsp;* You can also contact us via email (customer service) at cs@semiprecious.com&nbsp;&nbsp;&nbsp;</span>
			</td>
		</tr>
		<tr>
			<td  align="center">
				<a href="gemstone_jewelry_gallery.cfm? <cfoutput>#session.filter#</cfoutput>" class="contactusBtn">&nbsp;Continue Shopping&nbsp;</a>&nbsp;
				<a href="marketing/feedback.cfm" class="contactusBtn">&nbsp;Give Feedback&nbsp;</a>&nbsp;
				<a href="marketing/testimonies.cfm" class="contactusBtn">&nbsp;Read Feedbacks&nbsp;</a><p>
			</td>
		</tr>
	  </table>
	</td>
 </tr>

	 <!--- <!-- <cfinclude template="index1.cfm"> --> --->
</cfif>
 </table>
<br>
<br>
</div>
<cfinclude template="mainfooter.cfm" />
<!-- contactus.cfm starts -->