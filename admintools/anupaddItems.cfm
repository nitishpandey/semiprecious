<CFINCLUDE TEMPLATE="setup.cfm">
<HTML>
<HEAD>
<TITLE>Add new Item</TITLE>
</HEAD>
<BODY BGCOLOR="CREAM" TEXT="#000000" LINK="#0000FF" VLINK="#800080">
<h2>New Item Added</h2>
<cfparam  default="0" name="form.totalqtysold">

<cfloop from="1" to="#form.noofitems#" index="idx">
<CFINSERT datasource="semiprecious" tablename="items" formfields="newitem,color,cat,price,basecost,wholesaleprice,inventory,description,shipping,status,subcat,disporder,g2i,totalqtysold,size,clustercount">
<cfset form.newitem = form.newitem + 1>
</cfloop>

<a href='addnewitemmultiple.cfm'>back</a>
</BODY>
</HTML>
