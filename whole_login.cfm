<cfparam name="session.name" default="" />
<cfparam name="category" default="" />
<cfparam name="session.address.country"  default="" />
<cfparam name="url.activationnumber" default="" />

<html>
<head>
<title>Wholesale Gemstone and Silver jewelry Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >

<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css">
			<script language="JavaScript" src="/js/imageswap.js"></script>
			<script language="JavaScript" src="/js/global.js"></script>
</head>

<body style="margin-top:0pt;line-height:1.2em;" >
<div align="center">
    <cfinclude template="/header#session.country#.cfm">
<table width="930px;" id="container1" style="background:white">
<tr><td valign="top">
<!---<cfinclude template="leftmenus.cfm" />--->
</td><td valign="top">

<!---<cfif session.country is "india">
	<cfif cgi.http_referer contains 'com'>
		<cflocation url="http://www.semipreciouswholesale.com/whole_login.cfm?acemat=1" addtoken="no" />
</cfif>
<div style="">
	<div  style="border:2px #666600 dashed;width:700px;padding:6px;margin-top:10px;margin-right:10px;">
	  <span style="background-color:yellow">WHOLESALE BUYING</span>
	   <br />
       <div align="justify">We manufacture some of our items in our own workshops  and some our sourced from other workshops to make a complete collection.         If you find our collection attractive both in quality and price (Please 
        let us know if you can find any other store selling cheaper than this site, we will stop this business). We welcome enterprising shops & individuals who would like to <strong> partner with us 
        as a franchisee</strong>. For more details write in to us at anup@semiprecious.com or call us at <cfoutput>#application.indiaphone#</cfoutput>.  <br>
        Thanks for your interest. 
	  </div>
    </div>
</div>
	</td></tr></table>
	</div>

	</body>
	</html>
<cfmail  from="cs@semiprecious.com" to="nitish@semiprecious.com" subject="#session.mail# at india wholesale query"  type="html">
<cfdump var='#url#' />
</cfmail>
<cfabort />
</cfif>--->

<p>
<!--- check bulkbuyer or not--->
<cfif isdefined("form.id")>
<cfquery name="checkbulk" datasource="gemssql" >
						select email from bulkbuyers where email='#form.id#' 
	</cfquery>
<Cfif checkbulk.recordcount eq 0>
<cfquery name="addtobulk" datasource="gemssql" >
						insert into bulkbuyers (email, id) select '#form.id#', '#form.id#'
	</cfquery>
	</cfif>
	<cfif isdefined("url.email")>
	<cfset session.bulkbuyer.id='#url.email#'>
	<cfelse>
	<cfset session.bulkbuyer.id='#form.id#'>
	</cfif>
	</cfif>
<div align="left" style="width:756px;margin:4px;color:#000000; margin-top:10px;"> 
 <!---  <cfif (session.bulkbuyer.id contains 'guest') and ( isdefined("url.email") or isdefined("form.id")  )> ---> 
  				<cfset start_flag = 0 />	<!--- this page is opened on logging in and while logged in so need to distinguis --->
  <cfif ( isdefined("url.email") or isdefined("form.id")  )> 
			<cfif isdefined("url.email")>
			
					
					<cfif url.activationnumber GT '0' or url.activationnumber is '410102'>
					  	<cfif url.activationnumber is '48290'>
							 <cfif url.email is 'karen.harper5@verizon.net'>
								The provided number is invalid. Please await our activation number for your membership or apply again.
						<br />		  Please register using the short registration form <a href="wholesale_register.cfm">here</a>
								<cfabort />
							</cfif>
					  </cfif>
			  		<cfquery datasource="gemssql" >
						update bulkbuyers set status =1, minamt = #application.bulkbuyer.minamt# where email='#form.id#' or email = '#urldecode(url.email)#'
					</cfquery>
					<cfquery datasource="gemssql" >
							delete from memberinfo where email = '#urldecode(url.email)#'
			    	</cfquery>
					<cfset k = structdelete(session, 'mail', "false") />
					<cfset k = structdelete(session, 'cartid', "false") />
					<cfset k = structdelete(session, 'urltoken', "false") />
					<cfset k = structdelete(session, 'bulkbuyer', "false") />
					<cfset k = structdelete(session, 'cartitem', "false") />
					<cfset k = structclear(session) />
				    	<cflocation url="http://www.semipreciouswholesale.com/whole_login.cfm?email=#url.email#" addtoken="no" />
    		        <cfabort />
	    	   </cfif>
				<cf_wholelogin id="#url.email#" />
				<cfset start_flag = 1 />
			<cfelse>
				<cf_wholelogin id="#trim(form.id)#" />
				<cfset start_flag = 1 />
			</cfif>
			
      <cfif  not (session.bulkbuyer.id contains 'guest') and start_flag>
			<cfif isdefined('url.tacdid')><!--- this funny named variable tacdid comes from whole_login being called by login.cfm as a baton of existing cartid at sp.com . it is used in activate to not to reuse the cartid given.thus the handle to this cart is new on ws site --->
						<cfif not session.cartitem[1][1] >
							<cfquery datasource="gemssql" name="getcarts">
								Select top 1 cartid,paymode from anup.cartstatusall where buyer='#session.mail#' and cartid <> #url.tacdid# and couponcode ='regwsale'
								 <!---
								 paymode <>'activated' and paymode <>'emptied' and cartid <> #session.cartid# and cartid <> 0  
								 --->
								  order by cartid desc
								 </cfquery>
		    				    <cfif getcarts.recordcount>
									  <cfif getcarts.paymode eq 'null'>
											 	<cfset session._cartid = getcarts.cartid />
														 <cfinclude template="/includes/cartfromcookie2.cfm" />
					 						  <cfset k = structdelete(session,'_cartid') />
		                   </cfif>
							</cfif>
					</cfif>
					<cfif url.tacdid neq 0 ><!--- this check is redundant because tacdid is not passed within same domain by login.cfm by doing this very check --->
						<cfset url.cartid = url.tacdid />
						 <cfsilent>
							<cfinclude template="activate_cart.cfm" />
						</cfsilent>
					</cfif>
 
			<cfelse>
						<cfif not session.cartitem[1][1] >
							<cfquery datasource="gemssql" name="getcarts">
								Select top 1 cartid,paymode from cartstatus where buyer='#session.mail#' 
								 <!---
								 paymode <>'activated' and paymode <>'emptied' and cartid <> #session.cartid# and cartid <> 0  
								 --->
								  order by cartid desc
								 </cfquery>

					    				    <cfif getcarts.recordcount>
												  <cfif getcarts.paymode eq 'null'>
												 	<cfset session._cartid = getcarts.cartid />
																 <cfinclude template="/includes/cartfromcookie2.cfm" />
								 						  <cfset k = structdelete(session,'_cartid') />
					                              </cfif>
												</cfif>
							<cfelse>
								<cfquery datasource="gemssql" name="getcarts">
								Select top 1 cartid,paymode from cartstatus where buyer='#session.mail#'   and cartid <> #session.cartid#
								 <!---
								 paymode <>'activated' and paymode <>'emptied' and cartid <> #session.cartid# and cartid <> 0  
								 --->
								  order by cartid desc
								 </cfquery>

					    		    <cfif getcarts.recordcount>
									  				<cfif getcarts.paymode eq 'null'>
							    					 <cfset url.cartid = getcarts.cartid />
							 							  <cfsilent>
															<cfinclude template="activate_cart.cfm" />
															</cfsilent>
															</cfif>
											</cfif>
	              </cfif>
			
			</cfif>	  
	
			  <cfif isdefined("url.next_url")><!--- populated in login.cfm while redirecting to this page --->
				     <cflocation addtoken="no"   url="http://www.semipreciouswholesale.com#url.next_url#?#urldecode(url.qry)#" />
			    <cfelse>
				     <cflocation addtoken="no"   url="http://www.semipreciouswholesale.com/whole_login.cfm" />
			  </cfif>

		<cfelse>
		  Please register using the short registration form <a href="wholesale_register.cfm">here</a>
	 </cfif>

  <cfelseif len(session.name) >
  <cfset session.salemode = 'maroon' />
	
  <cfoutput><span style="width:758px;" >#session.name# logged  in for <cfif len(session.bulkbuyer.id)>Wholesale<cfelse>Retail</cfif> shopping mode. <br /><br />
  
<cfif not len(session.address.country)><span style="height:24px;margin-bottom:4px;" class="error2">You are requested to click here and update your address information <cfelse><span></cfif> <a href="##" onClick="javascript:document.getElementById('parts').innerHTML=document.getElementById('easy_content').innerHTML; return false;">Update Your Address</a></span>
   <br />For any assistance please call #Application.tollfree#.</cfoutput></span>
  <br />As a signed in member you can <a href='/logout.cfm' class="side_link">logout</a> any time and continue shopping later from anywhere.
     <div style="height:100px;overflow-y:scroll;text-align:left;border:1px ridge darkorange;padding:2px;margin:2px 1px;width:756px;">
	<cfinclude template="myaccount/previouscarts.cfm">
</div>
 
      
</div>


<cfoutput>
<div align="left" style="width:700px;padding-left:20px;">
<div class="greenbutton" style="width:100%;font-weight:bold;padding-left:4px;font-weight:1.1em;" onclick="javascript:flipDisplay('bb');" >Wholesale Buyer Benefits </div>    
<ul id="bb" class="arrow_ul" style="display:inline;">
<li    style="width:700px;">Receive up to 40% - 60% off regular retail price!</li>

<!--- <li> For signed up and verified wholesale buyers the minimum amount is  #format(application.bulkbuyer.minamt)#.</li>--->
<li>Orders over $500 receive an additional 5% off total order</li>
<cftry>
<li    style="width:700px;">Discount of #session.bulkbuyer.fivehundreddiscount#%  in addition to wholesale prices over $500 </li>

<li    style="width:700px;">Discount of #session.bulkbuyer.thousanddiscount#% in addition to wholesale prices on purchases over $1000 </li>
<cfcatch type="any">

</cfcatch>
</cftry>
	   <li> We don't insist that you buy 3 or 4 of a design. You can even buy  just one piece  of a  design.</li>

	   <li> We entertain requests for exchange within 45 days with no restocking fee! <b>If you want a refund, please return within 7 days, there is a restocking fee of 10%.</b>
		 
     <!-- To keep non-serious resellers away we deduct 5% handling charges only if returned after 15 days. --></li>

</ul>
<br />

<div class="greenbutton" onclick="javascript:flipDisplay('tnc');"  style="width:100%;font-weight:bold;padding-left:4px;font-weight:1.1em;">Terms &amp; Conditions</div>  
  <ul type="circle" class="arrow_ul" id="tnc" style="display:none;" >
      <li> You are shopping in wholesale mode and the prices listed are our unbeatable wholesale prices.</li>

	   <li> Your purchase must be of #format(session.bulkbuyer.minamt)# at least.</li>
       	<li> To shop less than minimum amount you must must shop in <a href="/switchmode.cfm">'retail'</a> mode. You must login again with your email id to come back to wholesale mode. 
</li>
       <li> The standard shipping and handling charges are a flat #format(9.99)# only for USA &amp; Australia and #format(25)# to #format(55)# for other countries. With flat shipping charges we encourage you to shop in large volume to further minimise the shipping cost impact on you!</li>
	   
      <li> Shipping for wholesale order is <strong>usually within 72 hrs, maximum 5 days (in case of some sizing need or in stock design does not get quality approval)</strong>. If you wish to expedite, email us.
     </li>
	   <li> <b>Exchange is allowed within 45 days, returns cost 10% restocking fee and must be done within 7 days</b> 
     <!-- To keep non-serious resellers away we deduct 5% handling charges only if returned after 15 days. --></li>

    </ul><br />
	<!---- update of particulars --->
	  <cfif isdefined("form.state")>
		  <cfif isdefined("form.country") >
  					<cfif len(form.country)>
								<cfinvoke component="countryresolver" method="get_country_name" returnvariable="country_name" >
		  							<cfinvokeargument name="code" value="#form.country#">
		  						</cfinvoke>
					<cfset session.address.country_code = form.country />
					     <cfelse>
							 <cfset country_name = form.earlier_country />

					</cfif>

			
		<cfelse>
			<cfset country_name = form.earlier_country />
	  </cfif>
	  <cfset membershipdate = createodbcdate(dateformat(dateadd('d',0,Now()),'yyyy-mm-dd'))><!--- using for update date. separate field is there to remember age of customer registration --->
		<cfquery datasource="gemssql" >
		update bulkbuyers set zip = '#form.zip#', phoneno = '#form.phoneno#',address2 = '#form.address2#',
		 address = '#form.address1#', state = '#form.state#', city = '#form.city#',  membershipdate = #membershipdate# <cfif isdefined("form.country")>,
		 country ='#country_name#'</cfif>  where email = '#session.mail#'
		</cfquery>		
		       		    	<cfset session.address.state = form.state />
							<cfset session.address.zip = form.zip />
							<cfset session.address.city = form.city />
							<cfset session.address.address1 = form.address1 />
							<cfset session.address.address2 = form.address2 /> 
							<cfset session.address.country = country_name />
							<cfset session.address.phone = form.phoneno />
									 
		<cfif session.mail neq form.email>
							<cfquery  datasource="gemssql" name="existing2">
									select * from bulkbuyers where  email = '#form.email#'
							</cfquery>
							<cfif not existing2.recordcount>
								<cfquery datasource="gemssql" password="rangeela" username="nitish">
									update bulkbuyers set email = '#form.email#', id='#form.email#'  where email = '#session.mail#'
								</cfquery>		
					 			<cfquery name="" datasource="gemssql">
					          			update wish set email = '#form.email#' where email = '#session.mail#' 
			   			       </cfquery>
					  			<cfquery datasource="gemssql">
										update  purchase set email = '#form.email#' where email like '%/#session.mail#'
								</cfquery>
	
					            <cfquery  datasource="gemssql" name="getid">
						          	update crmkey set email = '#form.email#' where email = '#session.mail#' 
					          </cfquery>
								<cfquery datasource="gemssql">
										update  cartstatus set buyer = '#form.email#' where buyer = '#session.mail#'
								</cfquery>
							<cfquery datasource="gemssql">
								update  buyingrecord set email = '#form.email#' where email = '#session.mail#'
							</cfquery>
			   			<cfset session.bulkbuyer.id = form.email />
						<cfset session.mail = form.email />
				<cfelse>
						<span class="error2">Email id change unsuccessful because an account with the new email id already exists.</span>
				</cfif>
			</cfif>		
	</cfif>
	<!--- end of particulars update --->	
	<cfquery datasource="gemssql"  name="parts">
		select * from bulkbuyers where id = '#session.mail#'
	</cfquery>
		
	<div id="easy_content" style="display:none">
	<table style="z-index:4;background-color:purple;width:390px;border:1px solid orange;position:absolute;top:160px;left:260px;"><tr><td>  <cfform style="background-color:white;" action="" method="post">
									 
				<div  class="form_heading">&nbsp;Your Contact &amp Shipping Details</div>
				 <div class="gray_url" align="left">Contact Details</div><div class="form_label" style="width:360px;margin-bottom:5px;margin-right:10px;"  >	Email Id <cfinput class="form_input" size="30" type="text" name="email" required="yes" value="#parts.email#" /></div>
															<input type="hidden" name="confirmemail" value="#parts.email#"  />
											         <div class="form_label" style="width:360px;margin-bottom:5px;margin-right:10px;"  >Phone <cfinput class="form_input" value="#parts.phoneno#"  name="phoneno" type="text" required="false" /> </div>
											              <div class="gray_url" align="left">Shipping Address</div>
														  <div class="form_label" style="width:360px;margin-bottom:5px;margin-right:10px;" >
											Address Line 1<cfinput class="form_input" size="36" type="text" value="#parts.address#" name="address1" required="yes"></div>
											<div class="form_label" style="width:360px;margin-bottom:5px;margin-right:10px;"  >Address Line 2
												<cfinput value="#parts.address2#" class="form_input" size="36"  type="text" name="address2" required="false" /></div>
											<div class="form_label" style="width:360px;margin-bottom:5px;margin-right:10px;"  >City
											<cfinput class="form_input" size="36"   type="text" name="city" required="yes" value="#parts.city#" /></div>
											
												
											    
												<div class="form_label" style="width:360px;margin-bottom:5px;margin-right:10px;"  >State<cfinput class="form_input" size="36"  value="#parts.state#" type="text" name="state" required="yes" /></div>
											
												<div class="form_label" style="width:360px;margin-bottom:5px;margin-right:10px;"  >Zip/Pin Code <cfinput value="#parts.zip#" title="Please fill in your pin code or zip code" class="form_input" size="36"  type="text" name="zip" required="yes" /></div>
											            <input type="hidden" name="minamt" required="yes" value="<cfoutput>#session.bulkbuyer.minamt#</cfoutput>">
											            <input type="hidden" name="password" value="password" />
											             
											           <div class="form_label" style="width:360px;margin-bottom:5px;margin-right:10px;"  >Country
											              <span class="form_input" > #parts.country#</span>
											             </div> 	<input type="hidden" name="earlier_country" value="#parts.country#" />
														 <div class="form_label" style="width:360px;margin-bottom:5px;margin-right:10px;"  >To Change Country  Select Here  &nbsp;&darr;&nbsp;(<span class="error">only to change</span>)
											              														  <cfinclude template="includes/countries_drop_down.cfm" />
											             </div> 	
											           
											            <input type="hidden" name="paymode" value="na">
											            <!---      <tr> 
											            <td bgcolor="#FFFFFF">Paymode:</td>
											            <td><cfinput class="form_input" type="text" name="paymode" required="no"></td>
											          </tr>
											          <tr>  --->
											<div class="form_buttons">               &nbsp;&nbsp;
											              <input name="submit" class="action_button" type="submit" value="Click Here To Update If Any Changes " style="margin-bottom:10px;"  /> 
											</div>    
											         
									   </cfform></td></tr>
									   <tr  ><td align="right" style="background-color:white;"><span onClick="javascript:document.getElementById('parts').innerHTML='';" style="color:red;cursor:pointer;text-decoration:underline;">Close</span></td>
									   </tr></table>
	</div>									   
	<div class="greenbutton"  style="width:100%;font-weight:bold;">Useful Links    </div>

    <div id="parts" style=""></div><ul  style="position:relative;">
	
<li><a href="##" onClick="javascript:document.getElementById('parts').innerHTML=document.getElementById('easy_content').innerHTML; return false;">Check or Update Your Address</a> </li>
<li>Do you have <a href="returnticket1.cfm" class="side_link">Items to return?</a></li>
<li><a href="wish.cfm" class="side_link">Your Wish List</a></li>
<li><a href="unsubscribe.cfm?email=#session.mail#" class="side_link">Unsubscribe</a></li>
</ul>
</cfoutput> 


<!--- by Anup
<li><a href="wholesale_login.cfm#affiliateprogram">Go To Affiliate Program</a>. If you wish to Administer Your Third Party Discount Coupons click <a href="couponcodeadminstration.cfm">here</a>.</li>
</li>
</ul></div>
	<div  style="margin:4px;padding:2px;border:ridge 2px #666600;text-align:center;align:center;width:750px;">
   		<div style="background-color:#666600;color:white;width:700px;align:center;">Jewelry Bought/Liked By you in past 1 year</div>
<CFQUERY DATASOURCE="gemssql" NAME="buyingrecord">
SELECT distinct buyingrecord.itemid as ii, items.cat as c, datebought 
FROM buyingrecord,items WHERE email='#session.bulkbuyer.id#'  and buyingrecord.itemid*1 = items.newitem
ORDER BY datebought desc
</CFQUERY>  <br>
<cfquery dbtype="query" name="b">
select distinct ii , c from buyingrecord </cfquery>
<CFoutput QUERY="b">
	<Cfif not (currentrow mod 7) ><br /></Cfif> <a href="jewelry_item.cfm/#ii#.htm"><img src="images/#c#/thumb/#ii#.jpg" vspace="0" height="60" hspace="0" border="0"></a>
    </cfoutput>
	</div>
	

<div  style="width:800px;" align="left">	<font color="##804040"><strong><a name="affiliateprogram">Affiliate/Reseller 
  Program</a></strong></font>
<div align="justify">
<div style="width:790px;">
  Are you looking for a way to make some serious cash online? Then you have come 
  to the right place. Does the sound of waking up each morning to check how much 
  money you have made online get you excited? You can wake up a $100 or even $500 
  richer or more each and every day! It's True! The fact is Affiliate Programs 
  are making people rich! If anyone has ever told you affiliate programs don't 
  work, they either don't know what they're talking about, or they don't want 
  to share this incredible money making secret with you. <br>
<font color="##804040"><strong>Affiliate/Reseller 
  Program</strong></font> is completely optional &amp; Free. Every purchase 
  (at wholesale price!) of yours entitles you to 30 days of selling as affiliate 
  through our site.</div></div></div></div>      <cfquery datasource="sptm" name="valid" username="nitish" password="rangeela">
      select * from bulkbuyers where email = '#session.bulkbuyer.id#' 
      </cfquery>
        <div  style="width:800px;" align="left"><a href="as.htm" class="detail"  onClick="MM_changeProp('thirdparty','','style.visibility','visible','DIV'); return false;">This 
        is how the affiliate program works</a><br></div>
       <cfoutput> Your current affiliate license is valid till #dateformat(valid.membershipdate,'dd-mm-yy')# (DD-MM-YY).</cfoutput>
      <cfquery datasource="sptm" name="a" username="nitish" password="rangeela">
      select * from bulkbuyercoupons where id = '#session.bulkbuyer.id#' 
      </cfquery>
      <div align="center"> 
        <cfform action="updatecoupondiscount.cfm" method="post" >
          <table width="589" border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td width="22"><img src="../images/jewelry_box_1.gif" width="22" height="22" /></td>
              <td width="545" bgcolor="#CCCC99">Discount Coupons For Your Customers:</td>
              <td width="22"><img src="../images/jewelry_box_3.gif" width="22" height="22" align="absmiddle" /></td>
            </tr>
            <tr> 
              <td bgcolor="#CCCC99">&nbsp;</td>
              <td align="center" background="images/leftbottomcurve.gif" bgcolor="#FFFFFF"> 
                <table>
                  <tr class="title"> 
                    <td align="center">COUPON NO.</td>
                    <td align="center">CODE</td>
                    <td align="center">DISCOUNT %</td>
                  </tr>
                  <cfoutput  query="a"> 
                    <tr> 
                      <td>COUPON 
                        #currentrow#</td>
                      <td>#code#</td>
                      <td>#discount# % </td>
                    </tr>
                  </cfoutput> </table></td>
              <td bgcolor="#CCCC99">&nbsp;</td>
            </tr>
            <tr> 
              <td><img src="../images/jewelry_box_4.gif" width="22" height="22" /></td>
              <td bgcolor="#CCCC99">If you wish to Administer Your Third Party 
                Discount Coupons click <a href="couponcodeadminstration.cfm">here</a>.</td>
              <td><img src="../images/jewelry_box_2.gif" width="22" height="22" /></td>
            </tr>
          </table>
          <br>
          <span style="margin:20px;"> 
          <table border="1" bordercolor="#666633">
            <tr class="row1"> 
              <td colspan="2" align="center" bgcolor="#FFCC33">Third Party (Affiliate Program) Sales 
                (USD) </td>
            </tr>
            <tr> 
              <td>Total Sales:</td>
              <td>None</td>
            </tr>
            <tr> 
              <td>Credits Total:</td>
              <td>None</td>
            </tr>
            <tr> 
              <td>Pending Credits:</td>
              <td>None</td>
            </tr>
          </table>
          </span> 
        </cfform>
      </div>
      --->
    
    <cfinclude template="footer.htm">
</div></table>	</body></html>
    <cfabort />
	</cfif>

  <cfif isdefined("form.id")>
	   <cf_wholelogin id="#form.id#" /> 
		 LOGGED IN!!!!
	   <cfif 1 is 1> 
		 <cfoutput> 
		  <div style="width:794px;margin:4px;"> 
      You have succesfully logged in. Wholesale shopping 
      mode switched ON  for #session.bulkbuyer.id#.</div>
	  <cflocation addtoken="yes" url="whole_login.cfm?peta_gr" />
	  <div style="position:absolute;top:160px;left:400px;border:2px ##666600 ridge;"><a href="list.cfm?#session.filter#">Continue Shopping</a></div>
	<br />
	We entertain requests for exchange within 45 days with no restocking fee! <b>If you want a refund, please return within 7 days, there is a restocking fee of 10%.</b>

	    <br />
         </cfoutput>
        <br> <span class="topnavigator">To switch to retail mode please click <a href="switchtoretailmode.cfm">here</a></span>. 
    You must login again with your emailid to switch to wholesale mode. <br>
  <strong>Please note:</strong> If you have added items to your cart before logging 
  in, the prices shown may be retail prices. These will be automatically reduced 
  to wholesale prices on checkout. <br>
</div>      </div>
      <strong><font color="#000000"><u>Your Profile on record:</u></font></strong> <br>
      <font color="#004000">Email:</font><cfoutput> #valid.email# <br>
        <font color="##004000">Phone no & Shipping Address:</font> #valid.address#.<br>
        To make any changes to your profile please email us or call us. <br>
        <font color="##004000">Minimum Purchase:</font> #format(valid.minamt)#. <br>

 Standard shipping charges are #format(3.99)# only for USA and #format(12.99)# for non-USA.<br>
 
            <p><a href="wish.cfm" class="category">View Your Wish           List</a> 
			</p>
        <CFQUERY DATASOURCE="gemssql" NAME="wishlist">
        SELECT newitem, dateadded FROM wish WHERE email='#session.bulkbuyer.id#' 
        </CFQUERY>
        <CFQUERY DATASOURCE="gemssql" NAME="buyingrecord">
        SELECT distinct buyingrecord.itemid as ii, items.cat as c, datebought 
        FROM buyingrecord,items WHERE email='#session.bulkbuyer.id#' and buyingrecord.itemid*1 
        = items.newitem ORDER BY datebought desc 
        </CFQUERY>
		<cfif buyingrecord.recordcount>
        <cfquery dbtype="query" name="b">
        select distinct ii , c from buyingrecord 
        </cfquery>
			<cflocation url="whole_login.cfm" />
        List of Jewelry Bought/Liked By You in the Last 1 year (Click on an image 
        to view availability): 
        <!--- Total Credit Availible: #DollarFormat(login.earned)# --->
        <div align="center" style="margin:20px;padding:2px;border:ridge 2px ##666600;text-align:justify;"> 
          <CFloop QUERY="b">
            <Cfif not (currentrow mod 6) >
              <br />
            </Cfif>
            <a href="jewelry_item.cfm/#ii#.htm"><img src="images/#c#/thumb/#ii#.jpg" vspace="0" height="60" hspace="0" border="0"></a> 
          </cfloop>
		  </cfif>
          </div>
<div align="justify">
<div style="width:750px;">
  Are you looking for a way to make some serious money online? Then you have come 
  to the right place. Does the sound of waking up each morning to check how much 
  money you have made online get you excited? You can wake up a $100 or even $500 
  richer or more each and every day! It's True! The fact is Affiliate Programs 
  are making people rich! If anyone has ever told you affiliate programs don't 
  work, they either don't know what they're talking about, or they don't want 
  to share this incredible money making secret with you. <br>
<font color="##804040"><strong>Affiliate/Reseller 
  Program</strong></font> is completely optional &amp; Free. Every purchase 
  (at wholesale price!) of yours entitles you to 30 days of selling as affiliate 
  through our site.</div></div>
        <a href="as.htm" class="detail"  onClick="MM_changeProp('thirdparty','','style.visibility','visible','DIV'); return false;">This 
        is how the affiliate program works</a><br>
        Your current affiliate license is valid till #dateformat(valid.membershipdate,'dd-mm-yy')# (DD-MM-YY). </cfoutput> 
    <cfquery datasource="gemssql" name="a">
      select * from bulkbuyercoupons where id = '#session.bulkbuyer.id#' 
      </cfquery>
      <div align="center"> 
        <cfform action="updatecoupondiscount.cfm" method="post" >
          <table width="589" border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td width="22"><img src="../images/jewelry_box_1.gif" width="22" height="22" /></td>
              <td width="545" bgcolor="#CCCC99">Discount Coupons For Your Customers:</td>
              <td width="22"><img src="../images/jewelry_box_3.gif" width="22" height="22" align="absmiddle" /></td>
            </tr>
            <tr> 
              <td bgcolor="#CCCC99">&nbsp;</td>
              <td align="center" background="images/leftbottomcurve.gif" bgcolor="#FFFFFF"> 
                <table>
                  <tr class="title"> 
                    <td align="center">COUPON NO.</td>
                    <td align="center">CODE</td>
                    <td align="center">DISCOUNT %</td>
                  </tr>
                  <cfoutput  query="a"> 
                    <tr> 
                      <td>COUPON 
                        #currentrow#</td>
                      <td>#code#</td>
                      <td>#discount# % </td>
                    </tr>
                  </cfoutput> </table></td>
              <td bgcolor="#CCCC99">&nbsp;</td>
            </tr>
            <tr> 
              <td><img src="../images/jewelry_box_4.gif" width="22" height="22" /></td>
              <td bgcolor="#CCCC99">To Administer Your Third Party 
                Discount Coupons Click <a href="couponcodeadminstration.cfm">here</a>.</td>
              <td><img src="../images/jewelry_box_2.gif" width="22" height="22" /></td>
            </tr>
          </table>
          <br>
          <span style="margin:20px;"> 
          <table border="1" bordercolor="#666633">
            <tr class="row1"> 
              <td colspan="2" align="center" bgcolor="#FFCC33">Third Party (Affiliate Program) Sales 
                (USD) </td>
            </tr>
            <tr> 
              <td>Total Sales:</td>
              <td>None</td>
            </tr>
            <tr> 
              <td>Credits Total:</td>
              <td>None</td>
            </tr>
            <tr> 
              <td>Pending Credits:</td>
              <td>None</td>
            </tr>
          </table>
          </span> 
        </cfform>
      </div>
      <br>
      <cfset formflag = 2030>
      <cfelse>
		
      <div class="error1">Account with provided email <cfoutput>#form.id#</cfoutput> not yet activated</div>.<div> If you have registered you should have recieved a confirmation email from our office. Please use the activation number given in the mail to activate your account here
	  <form action="http://www.semiprecious.com/whole_login.cfm"  method="get">
												<table align="center" width="400px;" border="0" class="component_box">
													<tr><td class="form_heading" >Wholesale Purchase Activation Form</td>
													<tr><td align="center">Activation Number (Check Your Mail Box):<input type="text" name="activationnumber" value="" size="8" /></td></tr>
													<tr><td align="center"><input type="hidden" name="email" value="<cfoutput>#form.id#</cfoutput>" />
													<input type="submit" style="background-color:#ACB;display:inline;cursor:pointer;padding:2px;border:2px ridge #9BA" value="Activate Wholesale Account" /></td></tr>
												</table>
										    </form>
											
	   
	   <br />If you have not yet registered for wholesale buying please click <a href="wholesale_register.cfm" class="login_link">here</a> to register first.<br>
</div> 
   </div></td></tr>
<tr><td colspan="2"> <cfinclude template="mainfooter.cfm" />
	</td></tr>
</table>
	</body>
	</html>
	<cfabort  />
	</cfif>
  </cfif>
  <cfif not isdefined("form.id") >
   <h2>Wholesale And Resellers Login Page</h2> &nbsp;&nbsp;&nbsp; <br /><br /><b>
	</b>
	<br />
          
	  <div id="activation">
	 	  <cftry> 
		  <cfif len(url.activationnumber)>
	  
	  <cfif url.activationnumber is '48290' or url.activationnumber is '410102'>
	  		<cfquery datasource="gemssql">
				update bulkbuyers set status =1, minamt = #application.bulkbuyer.minamt# where email = '#urldecode(url.email)#'
			</cfquery>
			<cfquery datasource="gemssql" >
					delete from memberinfo where email = '#urldecode(url.email)#'
	    	</cfquery>
	<cfset session.bulkbuyer.minamt = application.bulkbuyer.minamt />
	  <span class="error1">Congratulations. Your account approved &amp; activated.</span>
	  <br /> Your minimum purchase amount is now <cfoutput>#format(application.bulkbuyer.minamt)#</cfoutput> and above  can now avail instalment payment for invoices greater than 
	  <cfoutput>#format(application.bulkbuyer.arb_minamt)#</cfoutput>. Please login using the form below to start shopping.
	</div>  <cfelse>
	 <div style="margin-left:100px;">Your Account not activated yet or you have not registered.
	 	  <form action="http://www.semiprecious.com/whole_login.cfm"  method="get">
												<table align="center" width="400px;" border="0" class="component_box">
													<tr><td class="form_heading" >Wholesale Purchase Activation Form</td>
													<tr><td align="center">Activation Number (Check Your Mail Box):<input type="text" name="activationnumber" value="" size="8" /></td></tr>
													<tr><td align="center"><input type="hidden" name="email" value="<cfoutput>#urldecode(url.email)#</cfoutput>" />
													<input type="submit" style="background-color:#ACB;display:inline;cursor:pointer;padding:2px;border:2px ridge #9BA" value="Activate Wholesale Account" /></td></tr>
												</table>
										    </form>
</div>

	  </div>
	  <cfinclude template="adminfooter.cfm" />
	  </div></td></tr></table></body></html><cfabort />
	  
	  </cfif>
	  </cfif>
          <cfcatch type="any">
	  <div align="center">
	<span class="error1"> Incorrect Email Id</span><br />
	</div>
	  </cfcatch>
	  </cftry>        
<cfif isdefined("session.bulkbuyer.id") and session.bulkbuyer.id neq 'guest@wholesale.com'>

<h1><cfoutput>#session.bulkbuyer.id#</cfoutput> IS  LOGGED IN, PLEASE USE TOP MENU TO SHOP FROM VARIOUS GALLERIES</h1><p>&nbsp;</p>
<Cfelse> 
    <div align="center">
  <cfFORM ACTION="whole_login.cfm" METHOD="POST">

              <table  style="width:328px;border:1px gray solid" border="0" cellpadding="1">
                <tr bgcolor=""> 
                  <td colspan="2" nowrap class="form_heading" >Wholesale 
                    Buyers &amp; Affiliates Login</td>
          </tr>
          <tr> 
                  <td width="87" nowrap bgcolor="#FFFFFF"><font color="#FFFFFF"> 
                    <font color="#004000">Email Id:</font></font></td>
                  <td width="217" align="left" nowrap bgcolor="#FFFFFF"> 
                    <cfif isdefined("url.email")>
               <cfoutput>    
			   		 <cfinput class="inputtext" size="40" value="#url.email#" required="yes" type="text" name="id"></cfoutput>
				  <cfelse>
                    <cfinput class="inputtext" size="40" required="yes" type="text" name="id">
                    </cfif>
		  <input type="hidden" value="password" name="password">
                  </td>
          </tr>
          <!--- <tr> 
            <td bgcolor="#CCCC99"><font color="#800000">Password</font></td>
                  <td align="center" bgcolor="#FFFFFF"> : 
                    <cfinput name="password" type="password" required="yes" class="inputtext">
                  </td>
          </tr> --->
                <tr align="center" bgcolor="#FFFFFF"> 
                  <td colspan="2" class="">&nbsp;&nbsp;&nbsp; <input name="submit" type="submit" value=" Login "  class="action_button"> 
                  </td>
          </tr>
        </table>
         
  <br />
    <span style="color:red"><strong>To shop at wholesale prices, you must login or <a href="wholesale_register.cfm">sign up now</a></strong></span>.    <br />
        If you have forgotten/misplaced the exact email that you used on a previous 
        occasion simply <a href="contactus.cfm">write</a> in to us.<br>
	<br />	<b>
			
				<div style="border-top:1px red solid;border-bottom:1px red solid;background:white;padding:1px;width:400px;"><span style="width:100%;margin:1px;background:red;">
					<a href="wholesale_register.cfm" style="color:white;text-decoration:none;" > Sign Up As A Bulk Buyer Now </a>
				</span>
				</div>
		
			</b>
		<br />
    </cfform> </div></cfif>
		<cfif NOT isdefined("session.bulkbuyer.id") OR  session.bulkbuyer.id eq 'guest@wholesale.com'>
	<div align="justify" style="margin-left:45px;width:670px;font-weight:normal;" class="details">
	 If you are not registered yet sign up now. With semipreciouswholesale.com you get a stable, dependable source of silver, pearl and beaded jewelry. 
 	As a wholesale partner you get our complete range of designs at amazing prices!  Semiprecious.com is already  a trusted supplier for  dealers in USA, England, Canada, Germany
            and Australia. We can ship to any part of the globe that you are in. Our software will automatically show the wholesale prices once you sign in as a wholesale buyer.
            If you are not yet registered,  you can <a href="wholesale_register.cfm">register</a> in less than a minute.<br><br></div>
    	    </div>
					</CFIF>
	  </cfif>
</div></td></tr><tr><td colspan="2">

<div align="center">
<cfinclude template="mainfooter.cfm" /></div>
  
     <div id="thirdparty" style="visibility:hidden;width:600;border:solid thin black;position:absolute;top:190px;left:40px;color:black;font-size:12pt;font-color:black;bg-color:white;background-color:white;padding:10px;" > 
        The Semiprecious reseller  Program has changed lives of so many ... because it makes the entire Semiprecious.com 
        collection available to you - for increasing your business revenue. Once         you are registered with us we will provide you with 3 discount coupons, 
        which will be linked to your individual reseller ID: coupon1, coupon2         and coupon3. Each coupon carries a discount value. You can control and 
        change this discount value for each coupon from time to time. When your         customer purchases from semiprecious.com, he/she will be asked to enter 
        the coupon code to avail the discount. The customer gets the discount,         and you - the whole seller - gets the profit! The profit to be credited 
        to you will be calculated as the difference between the price paid by         your customer and the wholesale cost, reduced by 5% (for shipping & handling 
        charges). <br>
Example: Item ## 988 is costing $100 on the site. Our whole sale price for 
        the item is $60.00. If your customers uses a coupon with discount of 10% 
        he/she will be billed $ (100 - 10) = $90.00. Thus the profit you earn 
        is $90 - $60 = $30.00. Subtract 5% for shipping & handling, and $27 will 
        be credited to your account. <br>
       You make no investment….only profit.It's that easy!  You do not need to ship any products or handle any customers inquires.  Our company will take care of all that for you.  Your main job is to advertise the website and collect your checks which are sent once every two weeks. For 
        further clarification please write in or call us. We'll be happy to help 
        you out!<br>
        <a href="as.htm"  onClick="MM_changeProp('thirdparty','','style.visibility','hidden','DIV'); return false;">CLOSE</a>.</div>
		</td></tr>
		</table>
</div>
	
<a href="http://www.linksmanagement.com">Contextual Links</a>
	
</body>
</html>
