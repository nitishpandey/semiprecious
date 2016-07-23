<cfset supcode = session.apptt />
<cfoutput>
    <cfquery datasource="gemssql" name="qryDecline" >
        update	buyingrecord 
        set 	moo_decline = 1
        where 	cartid = #url.cartid# and itemid=#url.itemid# and optionid = #url.optionid# and inventoryatsale = -1 and quantity > 0
    </cfquery>
    
   
    
    <cfmail  from="cs@semiprecious.com" to="semiprecioushelp@gmail.com" cc="anup@semiprecious.com" subject="#supcode# declines MOO" type="html">
               Following item has been marked declined:<br><br>
                
                Cart Id : #url.cartid#<br>
                Item Id : #url.itemid#<br>	
                Qty		: #url.qty#<br>
                Weight	: #url.weight#<br>
                Size	: #url.size#<br>
                Date Order : #url.indate#<br>           
   </cfmail>
				
</cfoutput>	