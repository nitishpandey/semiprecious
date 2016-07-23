<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<cfparam name="url.cartid" default="102065" />
<cfset next_ten = url.cartid  -  400  />
<html>
<head>
	<title>Untitled</title>
</head>

<body>

insert into cartstatus (buyer,totalqty,cartid,shippingdetails,status,inrcost,cost,noofsaleitems,paymode,indate) values ( 'irene_karnavas@hotmail.com',1,105625,'4.99||||', 'new',8.0666,40.0000,0,'null',{ts '2011-03-26 11:22:20'}) 

<cfquery datasource="gemssql" name='br'>
	select cartid, email, sum(rate*quantity) as cart_value, sum(cost*quantity)/45 as cart_cost , sum(quantity) as qty from buyingrecord where  cartid < #url.cartid# and cartid >  #next_ten# group by cartid ,email order by cartid asc
</cfquery>
<cfoutput>select cartid, email, sum(rate*quantity) as cart_value, sum(cost*quantity)/45 as cart_cost , sum(quantity) as qty from buyingrecord where cartid < #url.cartid# and cartid > #next_ten# group by cartid ,email order by cartid desc
</cfoutput>
<cfoutput>#br.recordcount#</cfoutput>
<cfoutput query="br">

<cftry>	<cfquery datasource="gemssql">
		<cfif email is 'na'>
		    insert into cartstatus (buyer,totalqty,cartid,shippingdetails,status,inrcost,cost,noofsaleitems,paymode,indate) 
				    values ( '',#qty#,#cartid#,'4.99||||', 'new',#cart_cost#,#cart_value#,0,'null',#now()#) 
		<cfelseif email is "guest@wholesale.com">
			    insert into cartstatus (couponcode,buyer,totalqty,cartid,shippingdetails,status,inrcost,cost,noofsaleitems,paymode,indate) 
				    values ( 'regwsale','#email#',#qty#,#cartid#,'4.99||||', 'new',#cart_cost#,#cart_value#,0,'null',#now()#) 
		<cfelse>
			    insert into cartstatus (buyer,totalqty,cartid,shippingdetails,status,inrcost,cost,noofsaleitems,paymode,indate) 
				    values ( '#email#',#qty#,#cartid#,'4.99||||', 'new',#cart_cost#,#cart_value#,0,'null',#now()#) 
		
		</cfif>
	</cfquery>
	<cfcatch type="any">
	</cfcatch>
	</cftry>
</cfoutput> 

</body>
</html>
