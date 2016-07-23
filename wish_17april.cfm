<cftry>
<cfparam name="del" default="no">
<cfparam name="url.id" default="#session.mail#" />

<cfparam name="id" default="#url.id#" />
<head>
<title>Your Jewellery Wish List Managed By Semiprecious.com</title>
<META HTTP-EQUIV="Content-Style-Type" CONTENT="text/css">
	    <link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
	  <script language="JavaScript" src="js/global.js"></script>
</head>
<BODY style="margin-top:0pt;" >
<div align="center">
<CFINCLUDE TEMPLATE="/header#session.country#.cfm" >
	<div id="container2">
	<table style="width:930px" id="container1"><tr><td valign="top" >
	<cfinclude template="leftmenus.cfm" /></td><Td valign="top" >
<cfif findnocase('guest',session.mail) >
	  <cfset id = "">
	  <cfelse>
  <cfset id = session.mail />
</cfif>
<br />
<div  style="float:right;width:860px;position:absolute;right:50px;" align="left"> 
<div  style="positio:absolute;top:10px;right:50px;width:860px;text-align:left;align:center" >
<h3>Helping You Manage Your Favourite Designs</h3>
<br /><br />A few tips to make the most with your wish list:
<ul style="width:600px;margin-left:45px;margin-top:6px;" class="arrow_ul">
<li> Wish list  is like your personal gallery where you can record everything that you liked on semiprecious.com. You can come back after a month and it would still be there. It saves all the
effort put in to get that perfect pendant!</li>
<li>The wish list can be very useful when you need to choose one from two beautiful items. Just add them to your wish list and compare them here side by side.</li>
<cfoutput ><li>To Share your wish list using this link: <br /><span class="paid">http://www.semiprecious.com/wish.cfm?id=#id#</span> </li>
</cfoutput>
<li>You can add items to this list that you liked but cannot make up your mind which one to buy. Then you can show the wish list to your friends to make the final choice!</li> 
<li>As and when our warehouse is stocked up with an item in your wish list an email is sent to you informing of the availability</li>
<li>You can see this listing in two ways.  
<ol>
<li>You can see the items in the order you added to the list. That is the top of the table will show items that you may have added to the wish list today. <a class="login_link" href="http://www.semiprecious.com/wish.cfm?order=xasdfpadf;ladsfas">See latest to oldest</a></li>
<li>Second you can see the wish list such that all necklaces are shown together, then all pendants together and so on.<a class="login_link" href="http://www.semiprecious.com/wish.cfm?oder">See same type together</a> </li>
</ol>
<li>Click on a thumbnail to view availability status and to order and on <font color=red>X</font> to remove.</li>
</ul>


<CFIF id is ""><br />

 <div class="error2">
 To view your wish list please <a href='simpleloginform.cfm' class="error1">sign in</a> with your email address. New visitors can  <a href='apply.cfm' class="row1_">sign up</a>, 
  with merely three form fields to fill. </div> </div>
  <cfelse>
<!--- <CFQUERY DATASOURCE="semiprecious" NAME="name" cachedwithin="#createtimespan(0,0,30,0)#">
SELECT firstname
FROM memberinfo
WHERE email='#id#'
</CFQUERY> --->
<cfif isdefined("newitem") and len(session.mail) >
<CFQUERY NAME="wishinsert" DATASOURCE="gemssql">
delete from wish where email = '#id#' and newitem ='#newitem#'
</CFQUERY>
<br />
<cfif del is "no">
<CFQUERY NAME="wishinsert" DATASOURCE="gemssql">
INSERT INTO wish(email, newitem,subcat,dateadded) VALUES('#id#', '#newitem#','#category#',#Createodbcdate(Now())#)
</CFQUERY>
<br />

</cfif>
<cfoutput>
<div  style="width:760px;" align="center"><span class="lower_banner">Item number #newitem# added/deleted. </span>

<a href="gemstone_jewelry_gallery.cfm?#session.filter#" class="row2">Back  To The Gallery</a> </div></cfoutput>

</cfif>
<cfif isdefined("url.order")>
<CFQUERY DATASOURCE="gemssql" NAME="wishlist">
SELECT   newitem, dateadded,subcat
FROM wish
WHERE email='#id#' order by dateadded desc, subcat asc
</CFQUERY>
<cfset msg = 'Latest Items Added Shown First'/>
<cfelse>
<CFQUERY DATASOURCE="gemssql" NAME="wishlist">
SELECT   newitem, dateadded,subcat
FROM wish
WHERE email='#id#' order by subcat asc,dateadded desc
</CFQUERY>
<cfset msg = 'Same Types  of Items Shown Together'/>
</cfif>
<div style="margin-left:30px">
<table  border="0" cellspacing="2px" style="width:724px;border:1px ridge gray;" >
<tr   class="form_heading"><td colspan=6 align=center>Your Wish List -<cfoutput>#msg#</cfoutput></td></tr>
<cfset count ="0" />
<cfoutput query="wishlist">
<cfif count eq 0><tr></cfif>
<td align="center" >
	<div class="look"><a href='jewelry_item.cfm/#wishlist.newitem#.htm'  >
<img src='images/#subcat#/thumb/#newitem#.jpg' vspace='0' hspace='0' width="80" border='0'></a>

	</div>
	<a href="jewelry_item.cfm?itemnumber=#newitem#" class="action_button" >Buy</a>
<div class="row1">Date Added: #DateFormat(dateadded, "mmm/dd/yyyy")#  <br />Remove: [<a href='wish.cfm?del=yes&amp;newitem=#newitem#'><font color=red>X</font></a>]</div>
</td>
<cfset count = count + 1>
<cfif count eq 6></tr><cfset count = 0></cfif>
</cfoutput>
<cfif count>
<cfloop from="#count#" to="5" index="j">
<td>&nbsp;</td></cfloop>
</tr>
</cfif>


<!--- not required since gemstone_jewelry_gallery.cfm output and this page are on a separate window <a href="gemstone_jewelry_gallery.cfm">Continue</a>
--->

<tr><td colspan="6"><span class="gray_url">Note:</span> Items older than 1 year in your wish list are automatically removed.</td></tr>
</cfif>

<cfoutput>

<!---- add a universally applicable code to clean up wish list here -...remove records older than 1 year --->
<tr><td>&nbsp;</td><td colspan=5><br>

<a href="gemstone_jewelry_gallery.cfm?#session.filter#" class="side_link">Back  To The Gallery</a>&nbsp;&nbsp;<a class="login_link" href="login.cfm">Back to your Account</a>
</td></tr> 
</cfoutput>

</table>
</div>


</td></tr>


</table>
</div>
	</div>
<CFINCLUDE TEMPLATE="mainfooter.cfm" />



</div>
</body>

</html>
<cfcatch type="any">
<cfoutput>#cfcatch.detail#, #cfcatch.message#</cfoutput>
</cfcatch>
</cftry>