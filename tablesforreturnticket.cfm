<!--- 
<cfquery datasource="sptm" username="nitish" password="rangeela">
create table returnticket ( name varchar(50),
                                                    email varchar(50),
													 ticketid  integer ,
													 date datetime,
													 creditdetail varchar(100),
													 status enum('new','balance','complete')
													)
													 </cfquery>  --->
		<cfquery datasource="sptm" username="nitish" password="rangeela">
		alter table returnticketitems add column (cat varchar(12));
		</cfquery>											 
<cfquery datasource="sptm" username="nitish" password="rangeela">
create table returnticketitems ( 
													 ticketid  integer ,
 													 itemid integer,
													 qty   integer,
													 qtyrcvd integer,
													 price real,cat varchar(12)
												)
													 </cfquery>
</body>
</html>
