

  <cfquery datasource="gemssql" name="updateinventory">
	update items set items.lastbought=#now()#, items.totalqtysold= 
   	items.totalqtysold + buyingrecord.quantity, items.inventory=items.inventory- buyingrecord.quantity 
   	from items , buyingrecord where buyingrecord.cartid=#cartid# and items.newitem=buyingrecord.itemid*1
   </cfquery>


<cfmail  to="nullyn@gmail.com" from="cs@semiprecious.com" server="mail23.webcontrolcenter.com" subject="Subscription Order no. #invoiceNumber# Sent for Approval" type="html">
hi,
this is to inform you that an ARB subscription order which was successfully sent for approval (subscription no. 

</cfmail>


        
         