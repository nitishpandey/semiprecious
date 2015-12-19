<!--- this works in FF, CHrome & IE. But IE does not format properly.
If we need formatting in IE then we must remove reference to DOCTYPE HTML. but then IMG tag 
would not work the way it works in html world because there is no definition in this doc for it. So we
need to define a DTD for img --->
<cfparam name="editing" default="">
<cfif editing is "yes">
<CFQUERY DATASOURCE="gemssql" NAME="groups">
Select displaytitle, category, description, linkto, imageid1,imageid2, imageid3, seq from contenthome where domain='www.semiprecious.com'	and seq is not null order by seq				
</CFQUERY>		
<cfelse>
<cfset ran =  randRange(1,10) />

<CFQUERY DATASOURCE="gemssql" NAME="groups" CachedWithin="#CreateTimeSpan(0,3,0,0)#">
Select displaytitle, category, description, linkto, imageid1,imageid2, imageid3, seq from contenthome where domain='www.semiprecious.com'	and seq is not null order by 							

<cfif ran LT 3>
seq
<cfelseif ran LT 6>
seq desc
<cfelseif ran LT 9>
category
<cfelse>
description
</cfif>
</CFQUERY>

</cfif>		  
  
	<div class="jewelry_hub" >
<cfinclude template="rightmenu.cfm" />
	<cfoutput query="groups">
			<div class=jewelry_box>
	<div class=jewelry>
		<div class=heading>
			<div class=URL> 
				<a href="#linkto#" >
					#displaytitle#
						<cfif imageid1 contains 'http'>	
								<cfset img = #imageid1# />
						<cfelse>
							<cfset img = "http://www.semiprecious.com/images/#category#/thumb/#imageid1#.jpg" />
						</cfif>		
								 <img src="#img#" alt="premium designs" />
			   </a>
			</div> <!-- here i do not know how to get a new line by use of CSS -->
		</div>
		<div class="content">
			<div class="big_image">
			        		<a href="#linkto#">
				       <cfif imageid3 contains 'http'>	
								<cfset img = #imageid3# />
						<cfelse>
							<cfset img = "http://www.semiprecious.com/images/#category#/thumb/#imageid3#.jpg" />
						</cfif>		
								 <img src="#img#" alt="gemstone in silver" /></div>
&nbsp;<cfif imageid2 contains 'http'>	
								<cfset img = #imageid2# />
						<cfelse>
							<cfset img = "http://www.semiprecious.com/images/#category#/thumb/#imageid2#.jpg" />
						</cfif>		
								 <img src="#img#" alt="custom silver jewellery" />
								 </a>
							    		
			<div class="category_description">
			  
 	 #description#
		    </div>
		</div>
	</div>
	</div>
	</cfoutput>	
		</div>

