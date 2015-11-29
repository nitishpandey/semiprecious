<cfparam name="supplier" default="">

<form name=filterby method=get>

Supplier: <input type=text value="" name="supplier" action="ratings.cfm">
<input type=submit name=submit value=submit>
</form>

<cfquery name="getaverage" datasource="gemssql">
Select avg(thumbexposure/(zoom+1)) as catAvg_t2z, avg(zoom/(addtocart+1)) as catAvg_z2c, sum(thumbexposure) as Totalthumb from nitish.itemstats, items where items.newitem=nitish.itemstats.itemid and cat in ('earrings','rings','necklaces','bracelets','pendants')  
</cfquery>


<cfoutput>Overall Average T2Z #getaverage.catAvg_t2z#</cfoutput>
<p>
<cfloop list=earrings,rings,necklaces,bracelets,pendants  index=catt>
<cfquery name="getcatrating" datasource="gemssql">
Select sum(sold) as sold, count(*) as designs, sum(thumbexposure) as sumT, sum(thumbexposure)/count(*) as t2d, avg(thumbexposure/(zoom+1)) as T2Z, avg(zoom/(addtocart+1)) as Z2C,
 avg(thumbexposure) as t2T from nitish.itemstats, items where nitish.itemstats.itemid=items.newitem and cat ='#catt#' <cfif supplier neq ""> and supplier='#supplier#'</cfif> group by cat
</cfquery>

<cfoutput>#ucase(catt)#<p>
Average t2z #getcatrating.T2Z#  &nbsp; &nbsp; &nbsp; &nbsp; Average z2c #getcatrating.z2c#</cfoutput>
<p>
<cfoutput query="getcatrating">

Designs:#designs# || Sale/Design: #evaluate(sold/designs)# ||| sum Thumb: #getcatrating.sumT#&nbsp;&nbsp;&nbsp;&nbsp; exposure/design: #t2d#&nbsp;&nbsp;&nbsp;&nbsp; T/Z: #evaluate(T2Z/getaverage.catAvg_t2z)#  &nbsp; &nbsp; &nbsp; &nbsp;   Z/C: #evaluate(Z2C/getaverage.catAvg_z2c)#
</cfoutput>
<p>
</cfloop>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Analysis for restocking</title>
</head>

<body>


</body>
</html>
