<cfset rootpath = getdirectoryfrompath(gettemplatepath())>
<!--- every style will be represented by an image and a description for human reading and an id for m/c --->
<cfquery datasource="semiprecious" name="q">
select cat, price,newitem,subcat,inventory,saleprice,color, description from items where inventory>4 and cat = 'earrings' and description not like '%&%'
</cfquery>
<cfxml variable="jewelrycollection">
<jewelrycollection>
<cfoutput query="q" >

<item>
<cat>#cat#</cat>
<madeof>
<cfloop list="#subcat#" index="s">
<element>#s#</element>
</cfloop>
</madeof>

<inventory thevalue="#inventory#" dateupdated="" />
<imageurl >
<large uri="http://www.semiprecious.com/images/#cat#/#newitem#.jpg" />
<thumb uri="http://www.semiprecious.com/images/#cat#/thumb/#newitem#.jpg" />
</imageurl>

<valuation>
<!---
<type name="cost" thevalue="#basecost#" >
<currency thevalue="rupees" />
</type>
--->
<type name="price" thevalue="#price#" >
</type>

</valuation>

<!---<status thevalue="#status#" />--->

<description thevalue="#description#" />

<color>
<cfloop list="#color#" index="c">
<element>#c#</element>
</cfloop>
</color>

</item>

</cfoutput>
</jewelrycollection>
</cfxml>

<!---<cffile action="write" file="#rootpath#earrings.xml" output="#evaluate(jewelrycollection)#" >--->
<cfdump var="#jewelrycollection#"> 
