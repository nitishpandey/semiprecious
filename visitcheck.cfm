
There is an idea to keep the mdb database from bloating.
keep saving the interesting table as csv files once in a while and
that done empty it. this can be done anyday. whatever is there 
convert to csv and delete. this can be done every day or once in  a week
the duration need not be fixed.
Anyway, visitrecord is being deleted by itemsell.cfm for carts that are
more than 6 days old but not 'done'
<cfquery datasource="semiprecious" name="s">select  * from visitrecord order by cameon desc
</cfquery>
From,ON,First Page,cartid<cfoutput query="s" maxrows="100"><br>
#comingfrom#, #cameon#, #firstpage#,#cartid#
</cfoutput>

