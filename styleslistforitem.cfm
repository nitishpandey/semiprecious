<cfquery datasource="gemssql" name="styleids">
select * from styles where itemid = #Attributes.itemid# 
</cfquery>
<cfdump var="#styleids#" />
<cfoutput query="styleids">
<br />#styleid#,#matchtype#
<cfquery name="Recordset1" datasource="gemssql">
SELECT ITEMid,cat FROM styles WHERE styleid = #styleid# order by itemid 
</cfquery>
#recordset1.recordcount# found: #recordset1.itemid#
</cfoutput>
<cfloop from="128" to="128" index="idx" >

<cfloop list="set,look" index="mtype" >
<cfquery datasource="gemssql" name="inner">
select styleid , cat from styles where itemid = #idx# and matchtype = '#mtype#'
</cfquery>
<cfif  inner.recordcount gt 1>
<cfquery datasource="gemssql" >
delete from styles where  itemid = #idx# and matchtype = '#mtype#'
</cfquery>
<cfquery datasource="gemssql" >
insert into  styles (styleid,cat,matchtype,itemid) values (#inner.styleid#,'#inner.cat#','#mtype#',#idx#)
</cfquery>
</cfif>
</cfloop>
</cfloop>