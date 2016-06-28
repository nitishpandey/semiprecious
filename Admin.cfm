<try>
<cfparam name="form.passcode" default="">
<cfparam name="session.passcode" default="">
<cfparam name="session.apptt" default="">

<cfif form.passcode eq application.admin_email or session.mail eq application.admin_email or form.passcode eq "29">
<cfset session.passcode = application.admin_email>
<Cfset session.mail = application.admin_email>


<!---<cflocation url="cartstatus21.cfm" addtoken="no">--->
</cfif>

<CFIF session.mail neq application.admin_email >
</TD></TD></TD></TH></TH></TH></TR></TR></TR></TABLE></TABLE></TABLE></A></ABBREV></ACRONYM></ADDRESS></APPLET></AU></B></BANNER></BIG></BLINK></BLOCKQUOTE></BQ></CAPTION></CENTER></CITE></CODE></COMMENT></DEL></DFN></DIR></DIV></DL></EM></FIG></FN></FONT></FORM></FRAME></FRAMESET></H1></H2></H3></H4></H5></H6></HEAD></I></INS></KBD></LISTING></MAP></MARQUEE></MENU></MULTICOL></NOBR></NOFRAMES></NOSCRIPT></NOTE></OL></P></PARAM></PERSON></PLAINTEXT></PRE></Q></S></SAMP></SCRIPT></SELECT></SMALL></STRIKE></STRONG></SUB></SUP></TABLE></TD></TEXTAREA></TH></TITLE></TR></TT></U></UL></VAR></WBR></XMP><HTML><HEAD><TITLE>Error Occurred While Processing Request</TITLE>
<cfoutput>#session.mail#</cfoutput>
  </HEAD>
  <BODY>
  <HR>
  <H3>Error Occurred While Processing Request</H3>
  <P> 
  <TABLE BORDER>
    <TR> 
      <TD><H4>Error Diagnostic Information</H4>
        <P>An error has occurred. 
        <P> <B> <H3>HTTP/1.0 404 Object Not Found</B></H3>
        <P></TD>
    </TR>
  </TABLE>
  <form action="admin.cfm" method="post">
    Site that you want to go to:
<input name="passcode" type="text">
    <input type="submit" value="BUSH THEM!">
  </form>
  <P> 
  <hr>
  <p>&nbsp;</p>
  </BODY>
  </HTML>
<CFABORT />
</CFIF>
<html>
<head>
<title>Control Panel</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css">  

</head>

<body style="margin-top:0;text-align:left;">
<cfif IsUserInRole("superadmin") or IsUserInRole("admin")>

<cfinclude template="/crm/crmmenu.cfm" />
<CENTER><b><font color=green><cfoutput>#session.apptt#</cfoutput> Logged In</font></b></CENTER>
<br>

<br><ol> <b>FREQUENTLY USED</B>
<li><cfif isdefined("url.live_support")><cfset application.live_support = url.live_support /></cfif>
<cfif application.live_support><img src="/images/error_16x16.png" >Are you on Zoho? &nbsp; <a href="admin.cfm?live_support=0">Switch OFF</a><cfelse><a href="admin.cfm?live_support=1">Swith ON</a> </cfif></li>
<li><a href="searchcart.cfm">Locate A  Cart by customer email or name in full or part</a></li>
<li><a href="/admintools/edititem.cfm">Edit an Item</a></li>
<li><a href="cartstatus21.cfm" class="greenbutton">Process carts</a></li>
<li><a href="/admintools/cartissues.cfm">Track Shipped Status of Carts Sent from India</a></li>
<li><a href="/admintools/indiacarts.cfm">India Carts and Invoice</a></li>
</ol>

<p class="title"><b>Vendors Links</b></p>
<ol>
  <li class="title"><a href="admintools/vendors.htm">Re-Stock</a></li>
</ol>
Gallery By Supplier:<br>
<ol>
  <li><a href=http://www.semiprecious.com/sterling-silver-jewelry.cfm?occasion=supplier&supcode=prashant>Prashant</a></li>
  <li><a href=http://www.semiprecious.com/sterling-silver-jewelry.cfm?occasion=supplier&supcode=mmasilver>MMA</a></li>
  <li><a href=http://www.semiprecious.com/sterling-silver-jewelry.cfm?occasion=supplier&supcode=harish>harish</a></li>
  <li><a href=http://www.semiprecious.com/sterling-silver-jewelry.cfm?occasion=supplier&supcode=GR>GR(Rahul)</a></li>
 <li><a href=http://www.semiprecious.com/sterling-silver-jewelry.cfm?occasion=supplier&supcode=royal>Royal Agate</a></li>
  <li><a href=http://www.semiprecious.com/sterling-silver-jewelry.cfm?occasion=supplier&supcode=unknown>Unknown</a></li>
</ol>

<p class="title"><b>Link Building</b></p>
<ol>
  <li class="title"><a href="delOtherJewelrySites.cfm">Remove Linked Site</a></li>
    <li class="title"><a href="cartcleaner.cfm">Remove Cached Carts (files)</a></li>
  <li class="title"><a href="addlinksform.cfm">Add a Link to other site</a></li>
</ol>

<br><ol> Item processing
<li><a href="setwholesaleprice.cfm">Set wholesale price</a> (1 time activity) (first you will first be shown the sql code that would run on confirmation)</li>
<li><a href="saleitemsnp.cfm">Show items on sale</a></li>
<li><a onClick="javascript:document.forms[0].submit();" href="javascript:document.forms[0].submit();">Candidate Items for Sale Status</a><cfform name="saleform" action="notselling.cfm" method="post">
<cfinput type="text" required="yes" maxlength="2" validate="integer" value="3" name="age" style="display:inline" > (Months)</cfform></li>
  <li>List Current Discount code Details</li>
<li><a href="updateinvpercart.cfm" class="inputtext">Process inventory as per cartid</a></li>
<li>   <a href="itemsell.cfm">Process a Cart that does not have 2co, auth.net or pp as payment mode</a></li>
<li><a onClick="javascript:document.forms[1].submit();" href="javascript:document.forms[1].submit();">View Cart Number</a><cfform name="saleform" action="cartview.cfm"><cfinput type="text" required="yes" message="Please Give Cart Number" size="3" maxlength="8" name="cartid" ></cfform>

<li><a href="updatecartvalue.cfm">Modify cart value</a> (requires url cartid and cartvalue)</li>
<li><a href="expenseadder.cfm">Add expenses (or accruals as -ve expenditure)</a></li>
<li><a href="fillcart.cfm">Copy an existing cart</a></li>
<li><a href="fillcart2.cfm">Create cart</a></li>

<li><a href="fillharishcart.cfm">Create cart for harish</a></li>
<li><a  href="cartstatuscorrect.cfm" class="detailpricerow">Modify Cart Value, paymode or email of buyer</a></li>
<li><a href="fillcartfromlist.cfm">Create cart from comma list</a></li>

  <li>Edit Discount code and Details</li><li><a href="salescalculator.cfm">View Monthly sales</a></li>
  <li><a onClick="javascript:document.forms[2].submit();" href="javascript:document.forms[2].submit();">Expire Carts</a>  older than <cfform name="cartexpireform" action="expirecarts.cfm" method="post">
<cfinput type="text" required="yes" maxlength="2" validate="integer" value="32" name="age"> </cfform>days (in cartstatus table only (not flush) ; is it required to flush from other tables ?)</li>
<cfset session.passcode = 'shaurya'>
</ol>
<a href="/india/index.cfm?india=112">Get in Dolloar</a>
<span class="title"> Retail Subscription  </span> 
<ol>  <li class="title"><a href="subscribertrail.cfm">View  Subscriber's Visit stamp</a><li>
<a href="failedemailadd.cfm">Add Subsbcriber on Follow up list</a></li>
<li ><a href="failednls.cfm">View List of subscribers</a> in follow up list</li>

<li ><a href="/myproject/fileupload.aspx">Upload Email HTML</a></li>



<li ><a href="http://www.semiprecious.com/myproject/UploadImages.aspx">Upload Images for center graphics and emails </a></li>

  <li class="title"><a href="unsubscribe.cfm">Unsubscribe Mail subscriber </a> with Password(Preferred 
    mechanism is to place a link to this page in an email to the person)</li>
  <li class="title"><a href="downgradenlstatus.cfm">Unsubscribe or downgrade his nlstatus</a></li>
  <li class="title"><a href="/admintools/showuserdetails.cfm">Show user details</a></li>
  <li><a href="crm">CRM</a></li>
  <li> 
    <form name="form1" method="get" action="newsletters/nlviewerwithurlid.cfm">
      <span class="title"><a onClick="javascript:document.forms[3].submit();" href="javascript:document.forms[3].submit();">View 
      News Letter NO.</a> 
      <input type="hidden" name="customer" value="somecustomer">
      <input name="id" type="text" id="id" value="2" size="2" maxlength="2">
      (Save newsletters as nl3.htm etc.) </span> 
    </form>
  <li><a href="contactthem.cfm">Contact Them</a></li>
		<li> <a href="/admintools/editcredit.cfm" class="banner">Edit Credit for a member</a></li>

  <li><a href="/myaccount/changeemailid.cfm">change user email</a></li>
  <li><a href="customrequest/customadmin.cfm">Custom Admin</a></li>
  <li><a href="customrequest/viewcustomrequest.cfm">View Custom requests</a></li>
<li><a href="admintools/accounting.cfm">View Summary</a></li>

  </li>
    </ol>
  <ol><span class="title">  Newsletters </span> 
	<li><a href="newsletters/nlstatus.cfm?action=incr">Increment number of the newsletter to be sent</a></li>
	<li> <a href="newsletters/cfmailnewsletters.cfm?mailto=anup@semiprecious.com">CHeck newsletter (sends to nitish at indiatimes)</a></li>
		<li> <a href="newsletters/cfmailnewsletters.cfm">Send newsletter (sends to next 20)</a></li>

		<li><a href="newsletters/nlstatus.cfm?action=decr">decrement number of the newsletter to be sent</a></li>
  <li class="title"><a href="newsletters/startstop.cfm">Start/Stop News Letters</a></li>
  <li class="title"><a href="subscribertrail.cfm">View news Letter status (nlstatus) and Subscriber's details</a></li>
  <li class="title"><a href="newsletters/downgradenlstatusforall.cfm">Downgrade nlstatus for All </a></li>
	<li class="title"><a href="newsletters/upgradenlstatusforall.cfm">Upgrade nlstatus for All </a></li>
	<li class="title"><a href="newsletters/howto.htm" target="_blank">Instructions </a> (improved format)</li>
</ol>
WHole Sale Members
<ol>
<li ><a href="letterhead.cfm?vendor=jandj">Jewels and Jewels Letter Head</a></li>
<li ><a href="letterhead.cfm?vendor=young">Young Letter Head</a></li>
<li><a href="affiliate/afsalesdetails.cfm?vid=shau">afsalesdetails.cfm</a></li>
  <li><a href="admintools/contactbulk.cfm">Contact Bulk Buyers</a></li>
  <li><A href="wholesale_register.cfm">Bulk Buyer Registration</A></li> 
   <li><A href="admintools/wholesale_list.cfm" class="softbluebg">List details Bulk Buyer </A></li>
   <li><A href="admintools/wholesale_delete.cfm">Bulk Buyer remove</A></li> 
  
   <li><a href="admintools/wholesalebuyerminamt.cfm" target="_parent">Reduce WS Buyer's Minimum amount</a></li>
  <li><a href="contactus.cfm?newitem=0">Generate whole sale coupon</a></li>
  </ol>
   update the content of earringsstonebox.cfm, listsofstones.cfm, necklacesstoneleftcolumn.htm etc. using listofstones.cfm once a month  last updated on 22 May 05
<p class="title"> Items (Set and Style)</p>
<ol>

<li class="details"><a href="returnticketview.cfm" class="error1">View & Process Return Ticket</a></li>
<li class=title><a href=admintools/returns.cfm>RETURNS</a></li>
  <li class="title"><a href="np/match/itemsmatcher.cfm" class="details">Match Items by numbers</a></li>
  <li class="title"><a href="np/match/matchmaker.cfm">Create Matches</a></li>
<li class="title"><a href="options/optionsoptions.cfm">Item Options</a></li>
<li class="title"><a href="admintools/filegenerator.cfm">Make sure that files are there for all cat-subcat combination</a></li>

</ol>
<p>Editing</p>
<ol>
  <li class="detail"><a href="admintools/contentadder.cfm" class="details">Add Meta Tags to non Group Pages</a></li>
  <li class="detail"><a href="np/editingloginform.html" class="details">Multiple Edit Items </a></li>
	  <li class="title"><a href="addnewitemmultiple.cfm?cat=Necklaces">Add New Item(s)</a></li>
  <li class="title"><a href="addnewimage.cfm?cat=Necklaces" class="greenbutton">Add semiprecious Item Using Given Image</a></li>
  <li class="title"><a href="addnewbag.cfm">ADD BAGS Using Given Image</a></li>
  <li class="title"><a href="admintools/filegen.cfm?">New Stone?</a></li>
  <li class="title"><a href="ooslist.cfm">View OOS Items  sorted by number asc.</a></li>

	<li><a href="edititem.cfm">Edit a single item</a></li>
</ol>
<p class="title">Database</p>
<ol>
  <li class="title"><a href="dsnadminnew.cfm">Manipulate Semiprecious Database</a></li>
    <li class="title"><a href="index.cfm?resettheapplication=1">Reset Application Variables </a></li>
	<li class="title"><a href="http://www.semiprecious.com/sitegenerator/makemissingfile.cfm?filepathandname=dalmatianjasper_pendants.cfm">Make Missing Page</a></li>
	
</ol>
<p class="title">Data Feeds</p>
<ol>
  <li class="title"><a href="admintools/admin.htm">Google Base</a></li>
</ol>

<p class="title">Vendor Bags</p>
<ol>
  <li class="title"><a href="laptopbags/resellers/ebags">eBags</a></li>
</ol>

<p>Expenditures</p>
<ol><li>ISP</li><li>Advertising & Search Engines</li>
<li>How gifts <a href="howgiftworks.cfm">works</a>works</li>
<li><a href="giftid.cfm">Gift Administration</a></li>

</ol>
Miscellaneous<ol>
<li><a href="resolution.cfm">No of today and yesterday Visits and cartid</a></li> 
<li><A href="propertyinitiator.cfm">New Property</A></li>
<li>Manually Set Value of property</li>
<li><a href=http://www.semiprecious.com/admintools/charts/gallerySorts.cfm>Charts</a></li>
</ol>

<p>&nbsp;</p>
<p>&nbsp;</p>
<ol>Pages Under Testing
<li><a href="visitcheck.cfm">Visit Check</a></li> Note: Visit adder in application.cfm disabled
<li><A href="np/editingfilter.html">Editing New Filter</A></li>
<li><A href="list2.cfm">For Multi Buying at same time</A></li>
  <li class="title"><a href="np/match/showmatches.cfm">Exhaustive Matcher</a> 
    (Also List Matches From There)</li>

<li><A href="np/match/showmatches2.cfm">New Matching interface</A></li>
<li><a href="http://www.semiprecious.com/g2i/list.cfm">http://www.semiprecious.com/g2i/list.cfm</a></li>
<li><a href="http://67.199.2.49">SITE ON TEST SERVER</a></li>
</ol>
Error messagE:


To order please call 512 589 9009 or email anup@semiprecious.com as there
seems to be a problem with the system
We will take order over the phone<br>
<a href="haldirammembers.cfm" >Haldiram Members</a>
</cfif>
<a href="http://www.semiprecious.com" class="title">Home</a>

<table ><tr><th>Heading</th></tr><tr><td class="tdcenter">A test table for style sake</td></tr></table>
</body>
</html>
<cfcatch type="any">
<cfdump var='#cfcatch#' />
</cfcatch>
</cftry>
