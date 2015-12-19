<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
</body>
</html>
<cfcomponent >
	<cffunction name="updatepercart" access="public"   returntype="numeric"  output="true">
		<cfargument name="cartid" type="numeric" required="true"  >
		<cfset myResult = 1>
<cftry>
		<CFQUERY DATASOURCE="gemssql" NAME="updateinvent">
        update items  set items.lastbought=getdate(), items.totalqtysold=  items.totalqtysold + buyingrecord.quantity, 
		items.inventory=items.inventory-quantity  from items , buyingrecord where cartid=#Arguments.cartid#  and  items.newitem=buyingrecord.itemid*1
        </cfquery>
		
		<CFQUERY DATASOURCE="gemssql" NAME="mooitems">
			update buyingrecord set makeondemandnote = 'HAR' where cartid = #arguments.cartid# and inventoryatsale = -1
		</cfquery>
		<CFQUERY DATASOURCE="gemssql" NAME="updateoptioninvent">
        		update options  set options.inventory=options.inventory-1 from options , buyingrecord where cartid=#Arguments.cartid#  and  options.itemid=buyingrecord.itemid*1 and options.optionID = buyingrecord.optionID and buyingrecord.optionID <>0
        </cfquery>
<cfcatch type="any"><cfset myResult = 0><cfreturn myResult><cfoutput>#cfcatch.detail#</cfoutput></cfcatch></cftry>		
		<cfreturn myResult>
	</cffunction>
	<cffunction name="rupdatepercart" access="public"  output="yes"  returntype="numeric" >
		<cfargument name="cartid" type="numeric" required="true"  >
		<cfset myResult = 1>
<cftry>
  <CFQUERY DATASOURCE="gemssql" NAME="revupdateinvent">
  update items set items.totalqtysold= items.totalqtysold - buyingrecord.quantity, 
  items.inventory=items.inventory+quantity from items, buyingrecord where items.newitem=buyingrecord.itemid*1 
  and cartid=#cartid# 
  </cfquery>
<CFQUERY DATASOURCE="gemssql" NAME="updateoptioninvent">
        		update options  set options.inventory=options.inventory+1 from options , buyingrecord where cartid=#Arguments.cartid#  and  options.itemid=buyingrecord.itemid*1 and options.optionID = buyingrecord.optionID and buyingrecord.optionID <>0
        </cfquery>
<cfcatch type="any">
<cfoutput>#cfcatch.Message#</cfoutput>
<cfset myResult = 0>
<cfreturn myResult>


</cfcatch></cftry>		
		<cfreturn myResult>
	</cffunction>

</cfcomponent>