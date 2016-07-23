
<cfparam name="invoiceDate" default="">
<cfparam name="invoicenumber" default="">

<cfif invoicenumber neq "">
    <cfquery name="addPurchase" datasource="gemssql">
    delete from AccountingPurchaseInventory where invoicenumber ='#invoicenumber#'
    </cfquery> 
	</cfif>

<cfif invoicedate neq "">
    
    <cfquery name="addPurchase" datasource="gemssql">
    INSERT INTO AccountingPurchaseInventory ( invoiceDate, Supplier, Amount, InvoiceNumber, Freightetc )
    SELECT #invoiceDate#, '#supplier#', #amount#, '#invoicenumber#', #otheramount#
    </cfquery> 



</cfif>

    <cfquery name="showPurchase" datasource="gemssql">
    Select invoiceDate, Supplier, Amount, InvoiceNumber, Freightetc from AccountingPurchaseInventory  order by invoiceDate desc
    </cfquery> 

	<html>
	<title>Purchases</title>
	<body>
	
	<Font color=Brown><b>ADD PURCHASE INFORMATION:</b></font>:<p>

	     <form name="addPurchase" action="accountingPurchases.cfm">
     Invoice Number: <input name="InvoiceNumber" value="" type=text size=15>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     Invoice Date (mm/dd/yy): <input name="InvoiceDate" value="mm/dd/yy" type=text size=8>&nbsp;&nbsp;&nbsp;&nbsp;
     Amount in Rs: <input name="amount" value="0.00" type=text size=8><br>
     Supplier: <input name="Supplier" value="" type=text size=10>&nbsp;&nbsp;&nbsp;&nbsp;
     Freight/Taxes: <input name="otheramount" value=0.00 type=text size=8>
     <input type=submit name=submit value="submit">
     
     </form> 

	 <Font color=Brown><b>PURCHASE INFORMATION:</b></font>:<p>
	 
	<table border=1 ><tr bgcolor=yellow>
	<td>Invoice Date</td><td>Invoice NUmber</td><td>Supplier</td><td>Amount</td><td>Freight/Tax</td></tr>
	<cfset totalpurchase=0>
	<cfoutput query=showpurchase>
	<tr><td>#Dateformat(InvoiceDate, "mm/dd/yy")#</td><td>#InvoiceNUmber# <a href=accountingpurchases.cfm?invoicenumber=#InvoiceNUmber#>delete</a></td><td>#Supplier#</td><td>#Amount#</td><td>#Freightetc#</td></tr>
	<cfset totalpurchase=totalpurchase+showpurchase.amount>
	</cfoutput></table>
	<br>Total: Rs.<cfoutput>#totalpurchase#</cfoutput>
	</body>
