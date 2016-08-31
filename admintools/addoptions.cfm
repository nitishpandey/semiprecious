<cftry>
<cfparam name="itemnumber" default="">
<cfparam name="clearall" default="">


<cfif itemnumber neq "">

<cfquery name="getinventory" datasource="gemssql">
select inventory from items where newitem=#itemnumber#
</cfquery>
<cfif clearall is "yes">

<cfquery name="del" datasource="gemssql">
Delete from options where itemid =#itemnumber#

UPDATE items SET items.ItemNumber = 0 WHERE items.newitem=#itemnumber#
</cfquery>

<cfelse>

<cfquery name="del" datasource="gemssql">
<cfif getinventory.inventory GT 0>
Delete from options where itemid =#itemnumber# and  description like '%custom%'
Delete from options where itemid =#itemnumber# and  optionid=0

INSERT INTO options ( itemID, optionID, description, inventory, valueadd )
			SELECT #itemnumber#, 0, 'Size', 1,0
			
	
<cfelse>
Delete from options where itemid =#itemnumber# 

INSERT INTO options ( itemID, optionID, description, inventory, valueadd )
			SELECT #itemnumber#, 0, 'Size', 1,0
</cfif>
</cfquery> 

<cfset sequence = 0>

		<cfloop list="4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,10.5,11,11.5,12,12.5,13,13.5,14" index="sizenumber">
<cfset sequence =sequence+1>
		
		
			<cfquery name="insertoptions" datasource="gemssql">
						<cfif getinventory.inventory GT 0>
						INSERT INTO options ( itemID, optionID, description, inventory, valueadd )
						SELECT #itemnumber#, #sequence#+15, 'Custom Size #sizenumber#', 10, 20
						<cfelse>
						INSERT INTO options ( itemID, optionID, description, inventory, valueadd )
						SELECT #itemnumber#, #sequence#, 'Size #sizenumber#', 10, 0
						</cfif>
			
			</cfquery>
		</cfloop>
			<cfquery name="insertoptions" datasource="gemssql">
			
			UPDATE items SET items.ItemNumber = 10
			WHERE items.ItemNumber=0 AND items.newitem=#itemnumber#
</cfquery>

</cfif>
</cfif>
<cfcatch type=any>
<cfoutput>#cfcatch.message#</cfoutput>
</cfcatch>
</cftry>


<cflocation addtoken="no" url="/admintools/edititem.cfm?newitem=#url.itemnumber#">
