<html>
<head>
<title>whole sale price setter</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<p>&lt;!--- there are two separate queries because the equivalent mathematical 
  ops in SQL are not known ---&gt;<br>
The code that <cfif isdefined("url.goahead")>was<cfelse>will</cfif> run:
<p>&lt;cfquery datasource=&quot;semiprecious&quot; name=&quot;records&quot;&gt;<br>
  select newitem, price from items<br>
  &lt;/cfquery&gt;</p>

  &lt;cfloop query=&quot;records&quot;&gt;<br>
  &lt;cfset saleprice = decimalformat(round(5.1*price)/10)&gt; &lt;!--- instead 
  of multiplying by 0.51, this has the effect of maintain<br>
  accuracy upto first decimal place, which can be important for bulk sales ---&gt;<br>
  &lt;cfquery datasource=&quot;semiprecious&quot;&gt;<br>
  update items set wholesaleprice = #saleprice# where newitem = #newitem#</p>
<p>&lt;/cfquery&gt;</p>
<p>&lt;/cfloop&gt;<br>
</p>
<cfif isdefined("url.goahead")>
<cfquery datasource="semiprecious" name="records">
select newitem, price from items
</cfquery>
<cfloop query="records">
<cfset saleprice = decimalformat(round(5.1*price)/10)> <!--- instead of multiplying by 0.51 , this has the effect of maintain
accuracy upto first decimal place, which can be important for bulk sales --->
<cfquery datasource="semiprecious">
update items set wholesaleprice = #saleprice# where newitem = #newitem#
</cfquery>
</cfloop>
Done .
<cfelse>
Click here to <a href="setwholesaleprice.cfm?goahead=target">goahead</a> !

</cfif>
</body>
</html>
