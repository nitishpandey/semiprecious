<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>CF Charts</title>
</head>

<body>

<h2>CHART FOR ANALYSIS</h2>
<!---<cfif session.mail neq "acemat@vsnl.com">
<CFABORT>
</cfif>--->
<cfquery name="exposes" datasource="gemssql">
Select * from StatsGallerySortOrderChart
</cfquery>

<cfchart format="flash" 
    xaxistitle="Filter/Sorts" 
    yaxistitle="Gallery Exposures"> 

<cfchartseries type="bar" 
    query="exposes" 
    itemcolumn="SortBy" 
    valuecolumn="Exposures">
</cfchartseries>

</cfchart> 

<cfquery name="conversionsbyzoom" datasource="gemssql">
Select * from nitish.StatsConversionByZoom
</cfquery>

<cfchart format="flash" 
    xaxistitle="Carts/Zoom" 
    yaxistitle="Number of Items"> 

<cfchartseries type="bar" 
    query="conversionsbyzoom" 
    itemcolumn="Ratio" 
    valuecolumn="Itemcount">
</cfchartseries>

</cfchart> 

<p><br>
<cfquery name="cartitems" datasource="gemssql">
Select * from nitish.StatsSellByCategory
</cfquery>

<cfchart format="flash" 
    xaxistitle="For 2009" 
    yaxistitle="Total in Cart"
	chartwidth=600> 

<cfchartseries type="bar" 
    query="cartitems" 
    itemcolumn="CAT" 
    valuecolumn="Count">
</cfchartseries>

</cfchart> 
<p><br>

<cfquery name="CategoryCount" datasource="gemssql">
Select * from nitish.StatsCatCount
</cfquery>

<cfchart format="flash" 
    xaxistitle="Category" 
    yaxistitle="Designs in Stock"
	chartwidth=600
	> 

<cfchartseries type="bar" 
    query="CategoryCount" 
    itemcolumn="Cat" 
    valuecolumn="Count">
</cfchartseries>

</cfchart>

<cfquery name="byCategory" datasource="gemssql">
Select * from nitish.StatsCategExposures
</cfquery>

<cfchart format="flash" 
    xaxistitle="Category" 
    yaxistitle="Gallery Exposures"
	chartwidth=700
	> 

<cfchartseries type="bar" 
    query="byCategory" 
    itemcolumn="Category" 
    valuecolumn="Gal-Expos.">
</cfchartseries>

</cfchart> 
<p><br>
</body>
</html>
