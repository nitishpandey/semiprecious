<cfcomponent displayname="item_handler" hint="individual item related functions" output="true">


	<cffunction name="rate_item" displayname="vote" hint="vote using itemid and rating value. get back current rating" access="remote" output="false" returntype="xml">
		<cfargument name="itemid" type="Numeric" required="true" />
		<cfargument name="rating" type="Numeric" required="true" />
		<!--- TODO: Implement Method --->
		<!---
<cfquery datasource="sptm" password="rangeela" username="nitish" name="q1">
			create table item_rating (itemid int not null, excellent mediumint unsigned  default '0', 
			  very_good mediumint unsigned  default '0', good mediumint unsigned  default '0', ok mediumint unsigned  default '0',
			   poor mediumint unsigned  default '0', very_poor mediumint unsigned  default '0', 
			   rating tinyint default '0',   vote_count mediumint unsigned  default '0', constraint unq 
			   primary key (itemid))
			   </cfquery>
	---->		   
<cfquery datasource="sptm" password="rangeela" username="nitish" name="q1">
select * from item_rating where itemid = #arguments.itemid#
</cfquery>	
<cfif q1.recordcount>
<cfquery datasource="sptm" password="rangeela" username="nitish" name="q1">
update item_rating set excellent = excellent + #arguments.rating#, vote_count = vote_count + 1, rating = excellent/vote_count
</cfquery>
<cfelse>
<cfquery datasource="sptm" password="rangeela" username="nitish" name="q1">
insert into item_rating (itemid, excellent, vote_count,rating)values(#arguments.itemid#,excellent + #arguments.rating#, vote_count + 1, excellent/vote_count)
</cfquery>

</cfif>
<cfquery datasource="sptm" password="rangeela" username="nitish" name="q1">
select rating from item_rating where itemid = #arguments.itemid#
</cfquery> 
		<cfcontent type="text/html" />
			<cfxml variable="jumanjee" >
			<response>
			<localmethod>rate_item</localmethod>
			<rating>#arguments.rating#	</rating>
			</response>
			</cfxml>	
			<cfreturn jumanjee />
	</cffunction>

	<cffunction name="get_rating" displayname="rating" hint="provide item id, 0 IS NOt rated yet" access="remote" output="false" returntype="numeric">
		<cfargument name="itemid" type="Numeric" required="true" />
		<!--- TODO: Implement Method --->
	
<cfquery datasource="sptm" password="rangeela" username="nitish" name="q1">
select rating from item_rating where itemid = #arguments.itemid#
</cfquery> 
<cfcontent type="text/html" />
			<cfxml variable="jumanjee" >
			<response>
			<localmethod>get_rating</localmethod>
			<rating>#q1.rating#	</rating>
			</response>
			</cfxml>
				<cfreturn jumanjee />
		
	</cffunction>
</cfcomponent>