<html>
<head>
<title>Sales Calc</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body>
<cfset sf = 0.014> <!--- shipping factor 1.4% --->
<cfset paypal = 0>
<cfset secure2 = 0>
<cfset auth = 0>
<cfset refyear= 2004 >
<cfset refmonth = 9>
<cfset ysales = 0>
<cfset yprft = 0>
<cfset netyprft = 0>
<cfset salesarray = structnew()>
<cfquery datasource="gemssql" name="cartstatus">
select inrcost,outdate,cost, paymode,indate from cartstatus where status = 'done' order by indate asc
</cfquery>
<cfset sales = 0>
<cfset cp = 1>
<cfset noofsales = 0>
<cfset yearexpenses = 0>
<cfloop query="cartstatus">
  <cfset loopyear = datepart('yyyy',indate)>
  <!--- <cfif refyear = loopyear>
.<cfoutput>'#loopyear#'#outdate#</cfoutput> --->
  <cfset loopmonth = datepart('m',indate)>
 <!---  <cfoutput>'#loopmonth#'#outdate#</cfoutput>
 cf is commission factor --->
 <cfswitch expression="#paymode#">
<cfcase value="secure2">
<cfset secure2 = secure2 + 1>
<cfset cf = 0.945>
</cfcase>
<cfcase value="paypal">
<cfset paypal = paypal + 1>
<cfset cf = 0.97>
</cfcase>
<cfcase value="wellsCC,wellsPhone" delimiters=",">
<cfset auth = auth +1>
<cfset cf = 0.975>
</cfcase>
<cfdefaultcase >
<cfset commissionfactor = 0.99>
</cfdefaultcase>
</cfswitch>
 <cfif refmonth neq loopmonth>
<cfquery datasource="sptm" username="nitish" password="rangeela" name="exp">
select value from expenses where month = #refmonth# and year  = #refyear# 
</cfquery>
<cfset expenses = 0>
<cfloop query="exp">
<cfset expenses = value + expenses>
</cfloop>
<cfset  yearexpenses = yearexpenses + expenses>
   <cfset salesarray["#refyear#"]["#refmonth#"]["noofsales"] = noofsales >
      <cfset salesarray["#refyear#"]["#refmonth#"]["expenses"] = expenses >
       <cfset salesarray["#refyear#"]["#refmonth#"]["sales"] = sales>
	 <cfset salesarray["#refyear#"]["#refmonth#"]["cost"] = cp>
	 <cfset salesarray["#refyear#"]["#refmonth#"]["avgsale"] = round(sales/noofsales)>
	 <cfset prft = cf*sales - sf*sales -cp>
 <cfset netprft = prft - expenses >
	 <cfset salesarray["#refyear#"]["#refmonth#"]["prft"]  = prft > 
	 	 <cfset salesarray["#refyear#"]["#refmonth#"]["netprft"]  = netprft > 
<cfset netyprft = netyprft + netprft>
	  <cfif loopmonth is 1>    
	  <cfset salesarray["#refyear#"]["yprft"] = yprft + prft>
	  <cfset salesarray["#refyear#"]["netyprft"] = netyprft >
	  <cfset netyprft = 0>
	  <cfset salesarray["#refyear#"]["yexp"] = yearexpenses>
	  <cfset yearexpenses = 0>
	  
<cfset netyprft = 0>
       <cfset yprft = 0>
	   <cfset prft = 0>
      <cfset salesarray["#refyear#"]["ysales"] = ysales + sales >
	 <cfset refyear = loopyear>
      <cfset ysales = 0>
	  <cfset sales = 0>
	 
	  <cfset cp = 0>
	  </cfif>
    <cfset ysales = ysales + sales >
	<cfset yprft = yprft + prft>
	<cfset noofsales = 0>
	<cfset sales = 0>
	<cfset cp = 0>

    <cfset refmonth = loopmonth>
   
  
  </cfif>
  <cfset noofsales = noofsales + 1>
  	<cfset sales = sales + cost>
	  <cfif isnumeric(inrcost) and inrcost GT 1>
	<cfset cp = cp + inrcost>
	<cfelse>
	<cfset cp = cp + (round(3.5*cost))/10>
</cfif>
  <!--- </cfif> --->
</cfloop>
<cfset salesarray["secure2"] = secure2>
<cfset salesarray["auth"] = auth>
<cfset salesarray["pp"] = paypal>
<cfoutput>Calculations are from 22/09/04 onwards to #datepart('d',now())#/#datepart('M',now())#/#datepart('yyyy',now())#</cfoutput><br>

YEar _<br>

&nbsp;&nbsp;&nbsp;&nbsp;      |-Month_<br>
&nbsp;&nbsp;&nbsp;&nbsp;			&nbsp;&nbsp;&nbsp;&nbsp;  |-Sales<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	        &nbsp;&nbsp;  |-Cost<br>



&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	  |-Prft<br>
&nbsp;&nbsp;&nbsp;&nbsp;|-Year Sales
<cfif sales> <cfset salesarray["#refyear#"]["#refmonth#"]["noofsales"] = noofsales >
 <cfset salesarray["#refyear#"]["#refmonth#"]["sales"]  = sales>  
  <cfset salesarray["#refyear#"]["#refmonth#"]["avgsale"] = round(sales/noofsales)>
 <cfset ysales = ysales + sales >
 <cfquery datasource="sptm" username="nitish" password="rangeela" name="exp">
select value from expenses where month = #refmonth# and year  = #refyear# 
</cfquery>
<cfset expenses = 0>
<cfloop query="exp">
<cfset expenses = value + expenses>
</cfloop>
<cfset  yearexpenses = yearexpenses + expenses>

      <cfset salesarray["#refyear#"]["#refmonth#"]["expenses"] = expenses >
  
 <cfset salesarray["#refyear#"]["#refmonth#"]["cost"]  = cp>
 <cfset prft = evaluate("0.96*sales-cp")>
 <cfset netprft = prft - expenses >
    	 <cfset salesarray["#refyear#"]["#refmonth#"]["prft"]  = prft > 
	 	 <cfset salesarray["#refyear#"]["#refmonth#"]["netprft"]  = netprft > 
	    <cfset salesarray["#refyear#"]["yexp"] = yearexpenses>
        <cfset salesarray["#refyear#"]["ysales"] = ysales>
        <cfset salesarray["#refyear#"]["yprft"] = yprft + prft>
	    <cfset salesarray["#refyear#"]["netyprft"] = netyprft + netprft>

<cfset yprft = 0>
<cfset netyprft = 0>
		  <cfset ysales = 0>
	
 </cfif>



<cfdump var="#salesarray#" expand="yes" label="Revenue">

<cfchart  showborder="yes" format="flash" databackgroundcolor="##CC9966" chartwidth="700"  labelformat="number" chartheight="50" name="thechart" seriesplacement="default" sortxaxis="yes" >

<cfchartseries type="pie"  >
<cfchartdata value="30" item="sales1" />
<cfloop from="2005" to="2007" index="j">
<cfchartdata value="#salesarray['#j#']['ysales']#" item="sales" />
</cfloop>
</cfchartseries>

</cfchart>
<a href="http://www.semiprecious.com/admin.cfm">Admin page</a>
<a href="viewexpenses.cfm">View Expenses</a> <a href="expenseadder.cfm">Add Expenses</a>
</body>
</html>
