<cfparam name="itemnumber" default="">


<cfif itemnumber neq "">

<cfquery name="del" datasource="gemssql">
Delete from options where itemid =#itemnumber#

INSERT INTO options ( itemID, optionID, description, inventory, valueadd )
			SELECT #itemnumber#, 0, 'Size', 1,0
</cfquery> 

<cfset sequence =0>

		<cfloop list="5 - 6,6 - 7,7 - 8, 8 - 9, 9 - 10" index="sizenumber">
<cfset sequence =sequence+1>
		
			<cfquery name="insertoptions" datasource="gemssql">
			INSERT INTO options ( itemID, optionID, description, inventory, valueadd )
			SELECT #itemnumber#, #sequence#, '#sizenumber# inches', 10, 0
		
			UPDATE items SET items.ItemNumber = 10
			WHERE items.ItemNumber=0 AND items.newitem=#itemnumber#
			</cfquery>

		</cfloop>
</cfif>

<cflocation addtoken="no" url="/detail.cfm?newitem=#itemnumber#">
