
<cfif session.mail is 'acemat@vsnl.com'>

<cfquery name="cancelorder" datasource="gemssql">
update cartstatus set paymode='null' where cartid=#cancelcartid# and outdate is null

update buyingrecord set bought=null, approved=0 where cartid=#cancelcartid#
</cfquery>

<cfmail   to="cs@semiprecious.com"  cc="gnanashipping@gmail.com" from = "service@semiprecious.com"  subject = "semipreicous.com Order #cancelcartid# cancelled"   replyto = "cs@semiprecious.com" server="mail23.webcontrolcenter.com"
   failto = "acemat@vsnl.com" >

For semiprecious.com refund team and other vendors,

We are emailing you to inform you that an order has been cancelled, please DO NOT SHIP your items

The cart link is below:

http://www.semiprecious.com/itemsell.cfm?cartid=<cfoutput>#cancelcartid#</cfoutput>

If you have already shipped the order, please let customer know to put 'return to sender' on the package on arrival and drop it in the mail box, else we can not refund the charges

Thank you,

Semiprecious.com Austin Team
gnanashipping@gmail.com
</cfmail>



<h3>CARTID - <cfoutput>#cancelcartid#</cfoutput> has been cancelled in the system, emails have been sent to vendors and India team to refund the customer.</h3>
</cfif>