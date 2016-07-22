<cftry>
<html>
<head>
<title>Order Issues</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<div align="left" style="border:1px ridge orange;width:906px;padding:4px">
<cfparam name="issueupdated" default="">
<cfparam name="cartid" default="">
<cfparam name="updateit" default="">
<cfparam name="Tracking1" default="">
<cfparam name="session.apptt" default="">

<cfif session.mail neq application.admin_email and session.mail neq  'info@silverscorpio1.com' and session.mail neq  'designer@semiprecious.com'>
Please log in http://www.semiprecious.com/tm-tm/
<cfabort />
</cfif>
<cfinvoke  component="tm.cfc.task" method="getcartissues" returnvariable="newcartissues">
            <cfinvokeargument name="cartid" value="#cartid#"/>
          </cfinvoke>
	  <div style="width:900px;border:1px red ridge;padding:2px;">
	  <cfif newcartissues.recordcount>
		  
		  <ol style="margin-left:2px;text-align:left;">
		  <cfoutput query="newcartissues" group="status">
		  <li style="margin-left:2px;">#Status#</li>
		  <ul style="margin-left:-10px;text-align:left;">
		  <cfoutput>
		  <li style="margin-left:4px;text-align:left;">
		  For: <a href="http://www.semiprecious.com/tm-tm/taskdetails.cfm?by=#tby#&doi=#urlencodedformat(tdtoi)#">#action# &rarr;
		    '#detail#' EDC: #dateformat(pdc,'short')#</a>
		  </li>
		  </cfoutput></ul>
		  </cfoutput>
		  </ol>
		 
		  <cfelse>
		 </cfif>
    <cfoutput><a href=http://www.semiprecious.com/tm-tm/newtask.cfm?cartid=#cartid#>Add New Cart Issue</a></cfoutput></div>
		
	<cfquery name="IndiaUSStatus" datasource="gemssql">
	Select top 20  tracking1 as tracker from (select distinct tracking1 from cartissues where tracking1 <> '' and cartid> (select max(cartid)-2000 from cartissues)) x order by tracking1 
	</cfquery>
<br>Check Cart status for items shipped by India to US Tracking number:	<br><b>Tracking num</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | <b>Shipped on</b><br><cfoutput query="IndiaUSStatus"><a href=cartissues.cfm?tracking1=#tracker#>#tracker#</a> <br></cfoutput>

<table width=800><tr><td><cfif tracking1 neq "">
<br>	<b><font color=blue>Shipped Status from the US for all carts from India that arrived with tracking number:</font></<b> <cfoutput>#tracking1#</cfoutput>:
	<cfquery name="checkIndiaUS" datasource="gemssql">
	Select country, cartstatus.cartid as cart, status, outdate, shippingdetails, tracking2 from cartstatus, cartissues, purchase where purchase.cartid=cartstatus.cartid and cartstatus.cartid=cartissues.cartid and tracking1 = '#tracking1#'
	</cfquery>
	<br><cfoutput query="checkindiaus">
	<a href=/itemsell.cfm?cartid=#cart#>#cart#</a>, <cfif tracking2 is ""><font color=red>ALERT!</font>A</cfif>, #status#, #outdate#, <cfif shippingdetails contains "|G|">GIFT</cfif>, <cfif shippingdetails contains "|P|">PRIORITY<cfelseif shippingdetails contains "|O|" or shippingdetails contains "|E|"><font color=blue>EXPRESS</font></cfif>  <cfif country neq 'USA' and country neq 'United States' and country neq 'United States of America'>,#country#</cfif><br>
	</cfoutput>
</td><td valign=top><img src=http://t0.gstatic.com/images?q=tbn:59ucWSP2eL4hyM:http://www.uta.fi/~tiina.perttunen/arg_us_flag.gif>
				<cfquery name="UScarts" datasource="gemssql">
				select distinct cartstatus.cartid as cart from items, cartstatus, cartissues , buyingrecord where cartissues.cartid=cartstatus.cartid and
				items.newitem=buyingrecord.itemid and buyingrecord.cartid=cartstatus.cartid and tracking1='#tracking1#' and storage not like 'IN-%' and storage not like 'Angela%' and supplier <>'oc'
				</cfquery>
				<cfoutput query="uscarts">
				<a href=/itemsell.cfm?cartid=#cart#>#cart#</a><br>
				</cfoutput>
				</td>
	</tr></table>
	</cfif>
<form action="/admintools/cartissues.cfm" method="post">
Open/View Issue For CartID: <input type="text" name="cartid" value="" size=7>
<input type="submit" value='Create/View Issue'>
</form>
<cfif cartid neq "">
	<cfquery name="openissues"  datasource="gemssql">
	Select cartissues.* from cartissues where cartid=#cartid#
	</cfquery>	
	<cfif openissues.recordcount is 0>
		<cfquery datasource="gemssql">
		insert into cartissues (cartid) select #cartid#
		</cfquery>
	</cfif>
	<cfif updateit is "sure">
	<cfquery name="updaterecord" datasource="gemssql">
	update cartissues set   feedback='#feedback#' ,  issue='#issue#' , feedbackscore=#feedbackscore# , openDate='#dateformat(openDate,'mm/dd/yy')#' , <cfif closedate neq "">closedate='#dateformat(closedate,'mm/dd/yy')#'<cfelse>CloseDate=null</cfif>, IssueClosedBy='#IssueClosedBy#' ,  Tracking1='#Tracking1#' , tracking2='#Tracking2#' , tracking3='#Tracking3#' , IssueFor='#issueFor#' , shippedBy='#shippedBy#' where cartid=#cartID#
	</cfquery>
	<cfif (openissues.recordcount is 0 or openissues.tracking1 is "") and tracking1 neq "">
	<cfquery name="custemail" datasource="gemssql">
		Select RIGHT(dbo.purchase.email, CASE LEN(EMAIL) 
                      WHEN 0 THEN 0 WHEN 1 THEN 0 WHEN 2 THEN 0 WHEN 3 THEN 0 WHEN 4 THEN 0 WHEN 5 THEN 0 WHEN 6 THEN 0 ELSE len(email) 
                      - LEN([PURCHASE].[CARTID]) - 1 END) AS EMAIL from purchase where cartid ='#cartid#'
	</cfquery>
	
          	<cfmail   to="#custemail.email#"  from = "cs@semiprecious.com"  subject = "Your jewelry order is packed"   replyto = "cs@semiprecious.com" server="mail23.webcontrolcenter.com" type="html"
             failto = "#application.admin_email#" >
          <pre>
Dear customer,
          
This email is to inform you that your order has been packed in India and is on its way to our shipping center in Austin, TX. Arrival to Austin takes 4 to 6 business days depending on UPS delivery and customs. When the order is packed and shipped in Austin, you will get another email with your tracking number.
          
To view and track your cart, use the link below. At the top of the page, click the Locate/Track link to track your package. 


You can access your order/cart using the follwing link:

http://www.semiprecious.com/itemsell.cfm?cartid=<cfoutput>#cartid#</cfoutput>
Alternately, you may visit the semiprecious.com home page and on the top right, click the Track Orders link. Then enter one of the requested fields to find your cart and order information.
		  
If you have any questions, please email cs@semiprecious.com with your Cart ID number, <cfoutput>#cartid#</cfoutput> and your name.

Thank you,
          
Customer Service Team
</pre>          
          </cfmail>

	Email sent to <cfoutput>#custemail.email#</cfoutput> <br>
	</cfif>
	
	<table bgcolor="#CCCCCC"><tr><td> ISSUE UPDATED! IF NEED TO REVIEW CLICK <a href="/admintools/cartissues.cfm?cartid=<cfoutput>#cartid#</cfoutput>" >HERE</a></td></tr></table>
	<cfelse>
		<cfquery name="selectissue"  datasource="gemssql">
		Select cartissues.* from cartissues where cartid=#cartid#
		</cfquery>
	<cfoutput query="selectissue">
			<form action="cartissues.cfm" method="post" name="issueupdate">
		<input type="hidden" name="cartid" value='#cartid#'>
		<table bgcolor="##FFCC99"><tr><td>	<b>Tracking number for: #cartID#</b><br>
			Tracking number(s): from india: <input type="text" name="Tracking1" value="#Tracking1#">&nbsp;&nbsp;&nbsp;US tracking:<input type="text" name="Tracking2" value="#Tracking2#">
              &nbsp;&nbsp;&nbsp;&nbsp;Extra tracking if needed: 
              <input type="text" name="Tracking3" value="#Tracking3#">&nbsp;&nbsp;&nbsp;&nbsp;
			Shipped by: <input type="text" name="shippedby" value="#shippedby#"> 
		</td></tr></table><p>&nbsp;</p>
			<b>Issue For CartID: #cartID#</b><br>
			To be resolved by:<input type="text" name="IssueFor" value="#IssueFor#"><br>	
			Issue Details: <input type="text" size=120  name="issue" value="#issue#"><br>
			
			<strong>Issue Open Date (mm/dd/yy):<input type="text" name="openDate" size=8 value="<cfif opendate is "">#Dateformat(now(),'mm/dd/yy')#</cfif>#DateFormat(opendate,'mmm-dd-yy')#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Issue CloseDate (mm/dd/yy): <input type="text" name="closeDate" size=8 value="<cfif closedate neq  "">#dateformat(closeDate,'mmm-dd-yy')#</cfif>">&nbsp;&nbsp;&nbsp;&nbsp;Closed by:<input type="text" name="IssueClosedBy" size=8 value="#IssueClosedBy#">&nbsp;&nbsp;&nbsp;&nbsp;</strong>
		<p>
		<table bgcolor="##6699CC"><tr><td>
			Feedback:<input type="text" size=80 name="feedback" value="#feedback#"><br>
			Feedback Score:1 to 10 (1 is terrible, 10 is best): <input type="text" size=2 name="feedbackscore" value="<cfif feedbackscore eq "">0</cfif>#feedbackscore#"><br>
			</td></tr></table>
			<input type="hidden" name="updateit" value="sure">
			<p>
			<input type="submit" value="Update">
			</form>
			<form name="IndiaUScarts" action="cartissues.cfm">
			<input type="text" name="Tracking1" value="#Tracking1#">
			<input type="submit" value="check All Carts arrived in this package from India">
 			</form>
	</cfoutput>
	</cfif>
</cfif>



<cfquery name="openissues"  datasource="gemssql">
Select cartissues.* from cartissues where issuefor <> '' and closedate is null
</cfquery>

<h2><font color="#993300">Open Issues</font></h2>

<table border="1" bordercolor="#CC3333"><tr><td>CartID</td><td>open Date</td><td width=500>Issue</td><td>Issue For</td></tr>
<cfoutput query="openissues">
<tr><td><a href=/cartview.cfm?cartid=#cartid#>#CartID#</a><br>
<a href=cartissues.cfm?cartid=#cartid#>Edit</a></td><td>#dateformat(openDate,"mmm-dd-yy")#</td><td width=300>#Issue#</td><td>#IssueFor#</td></tr>
</cfoutput>
</table>

<cfquery name="closedissues"  datasource="gemssql">
Select top 20 * from cartissues where closedate is not null order by closedate
</cfquery>

<h2>Last 20 Closed Issues</h2>

<table border="1"><tr><td>CartID</td><td>open Date</td><td>Type</td><td width="500">Issue</td><td>Issue For</td><td>ClosedDate</td><td>Closed By</td></tr>
<cfoutput query="closedissues">
<tr><td> <a href=/cartview.cfm?cartid=#cartid#>#CartID#</a><br>
<a href=cartissues.cfm?cartid=#cartid#>Edit</a></td><td>#Dateformat(openDate,"mmm-dd-yy")#</td><td>#IssueType#</td><td>#Issue#</td><td>#IssueFor#</td><td>#Dateformat(CloseDate,"mmm-dd-yy")#</td><td>#IssueClosedBy#</td>
</tr>

</cfoutput>
</table>
</div>
</body>
</html>
<cfcatch type="any">
<cfoutput>#cfcatch.detail#, #cfcatch.message#</cfoutput>
<cfdump var="#cfcatch#" />
</cfcatch>
</cftry>
