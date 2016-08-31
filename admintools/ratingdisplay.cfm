<cfparam name="rating" default=0>
<cfparam name="itemid" default=0>

<cfquery name="rateitem" datasource="gemssql">
update items set disporder=#rating# where newitem=#itemid#</cfquery>

<h2>WELL DONE, GOOD RATING!</h2>
<h3>USE BROSWER GO BACK BUTTON TO GO BACK TO RATE MORE</h3>
