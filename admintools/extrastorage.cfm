<cfparam name=storage default="">
<cfparam name=inventory default="0">
<cfparam name=itemid default="0">
<cfparam name=submit default="">

<cfquery name="getstorage" datasource="gemssql">
Select Storage, inventory from itemsStorage where itemid=#itemid#
</cfquery>

<cfif #getstorage.recordcount# is 0>
<cfquery name="copystorage" datasource="gemssql">
Select storage from items where newitem=#itemid#
</cfquery>

</cfif>
<cfif submit neq "">

<cfif #getstorage.recordcount# is 0>
<cfquery name="addstorage" datasource="gemssql">
insert into itemsStorage (itemid, storage, inventory) select #itemid#, '#storage#', #inventory# 
</cfquery>
<cflocation URL='http://www.semiprecious.com/edititem.cfm?newitem=#itemid#' addtoken=yes>
<cfelseif storage neq "">
<cfquery name="updatestorage" datasource="gemssql">
update itemsStorage set Storage='#storage#', inventory=#inventory# from itemsStorage where itemid=#itemid#
</cfquery>
<cflocation URL='http://www.semiprecious.com/edititem.cfm?newitem=#itemid#' addtoken=yes>
</cfif>
</cfif>

Add/Edit Extra Location for ItemID: <cfoutput>#itemid#</cfoutput><p>

<form name=getstoreage action="extrastorage.cfm" method=post >
<input type="hidden" value=<cfoutput>"#itemid#"</cfoutput> name="itemid">
Extra Storage Location:<input type="text" size="12" name="storage" value="<cfif getstorage.recordcount gt 0><cfoutput>#getstorage.storage#</cfoutput><cfelse><cfoutput>#copystorage.storage#</cfoutput></cfif>">

Inventory in extra location:<INPUT TYPE="text" SIZE="5" NAME="inventory" VALUE="<cfoutput>#getstorage.inventory#</cfoutput>">

<input type=submit name="submit" value=update/add>

</form>

 
<font color=red>Note on Extra Storage:</font> In the main edit form, inventory is total inventory - USA plus India. When main inventory field becomes equal or less than inventory in India, the storage field is replaced by storage location in the extra storage field and the record is deleted from extra storage at the same time.

