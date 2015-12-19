<cfquery name=updateactivedays datasource=gemssql>
update nitish.itemstats set daysactive= daysactive+1 from items, nitish.itemstats where nitish.itemstats.itemid=items.newitem  and inventory >0

update items set disporder=disporder+1
</cfquery>



 <CFQUERY datasource="gemssql" name="restockeditems">
Select  email,wish.newitem  from wish , (
  select newitem from items where
DATEDIFF ( day ,[restockDate]  , GETDATE() )<1 ) r
where r.newitem = wish.newitem 
		 </cfquery>


		  <cfquery name="uniqueemails" dbtype="query">
						 Select distinct email from restockeditems
			</cfquery>
		 
		 <cfloop query="uniqueemails">

							
							<cfif isvalid("email", uniqueemails.email)>

		 				 <cfquery name="wishitems" dbtype="query">
						 Select newitem from restockeditems where email='#restockeditems.email#'
						  </cfquery>
							
						
									 
<cfmail   to="#uniqueemails.email#"  from = "cs@semiprecious.com"  subject = "Your semiprecious wish-list in stock"   replyto = "cs@semiprecious.com"
   failto = "cs@semiprecious.com" >
	 
Dear visitor/customer,

We are emailing you to inform you that an item or items you had put in your wish list has just been restocked. The item(s) link(s) is/are below:
<cfloop query="wishitems">

http://www.semiprecious.com/detail.cfm?newitem=<cfoutput>#wishitems.newitem#</cfoutput>
</cfloop>					 

Enjoy!
Semiprecious.com

Note: If you do not wish to receive emails when wish list items are restocked, please remove the items from your wishlist.
We will have a better system to turn on/off email reminder in the near future without having to remove items from the wish list. If you have not visited us in a while, we would like you to visit the site and view around 5000 items in stock. You can also now access out of stock items using a link below every gallery page and request expediting of remaking of your favorite items using a link below add to cart button. 
</cfmail>
</cfif> <!--- isValid()--->
</cfloop>