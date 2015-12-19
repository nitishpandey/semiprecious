 <!--- commented out to keep it static content. Content at bottom of dynamic code ---->
 
<!----
<!--- this works in FF, CHrome & IE. But IE does not format properly.
If we need formatting in IE then we must remove reference to DOCTYPE HTML. but then IMG tag 
would not work the way it works in html world because there is no definition in this doc for it. So we
need to define a DTD for img --->
<cfparam name="editing" default="">
<cfif editing is "yes">
<CFQUERY DATASOURCE="gemssql" NAME="groups" CachedWithin="#CreateTimeSpan(0,0,2,0)#">
Select displaytitle, category, description, linkto, imageid1,imageid2, imageid3, seq from contenthome where domain='www.semiprecious.com'	and seq is not null order by seq				
</CFQUERY>		
<cfelse>
<cfset ran =  randRange(0,12) />

<CFQUERY DATASOURCE="gemssql" NAME="groups" CachedWithin="#CreateTimeSpan(0,3,0,0)#">
Select displaytitle, category, description, linkto, imageid1,imageid2, imageid3, seq from contenthome where domain='www.semiprecious.com'	and seq is not null order by 							

<cfif ran LT 5>
seq asc 
<cfelseif ran LT 6>
seq desc
<cfelseif ran LT 11>
description
<cfelse>

category
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
					<cfif len(trim(imageid1))>
						<cfif imageid1 contains 'http' >	
								<cfset img = #imageid1# />
						<cfelse>
							<cfset img = "http://www.semiprecious.com/images/#category#/thumb/#imageid1#.jpg" />
						</cfif>		
								 <img src="#img#" alt="premium designs" /></cfif>
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
								 <img src="#img#" alt="gemstone in silver" /> </a>
						</div>
&nbsp;<cfif imageid2 contains 'http'>	
								<cfset img = #imageid2# />
						<cfelse>
							<cfset img = "http://www.semiprecious.com/images/#category#/thumb/#imageid2#.jpg" />
						</cfif>		
								<a href="#linkto#">	 <img src="#img#" alt="custom silver jewellery" />
								 </a>
							    		
			<div> <font color=	##606060 >#description#</font>
		    		</div>
				</div>
			</div>
		</div>

	</cfoutput>	
	</div>
</div>

--->
<!-- read items of interest from cookie i_o_i -->

			<cftry>

                        	<cfinvoke component="backing_beans.items_of_interest" method="get_i_o_i" returnvariable="itemslist" />
	                    <cfset displaycolumns = 4 />
                            <cfset displayrows = 1 />
                            <cfset quick_add = 0 />
                            <cfinclude template="includes/exhibit_designs.cfm" />
                            <cfcatch type="any">
                                <cfdump var='#cfcatch#'>
                            </cfcatch>
</cftry>

<!--- static content starts here --->
<div class="jewelry_hub">

	<div class="jewelry_box">
    	<div class="jewelry">
	    	<div class="heading">
		    	<div class="URL"> 
				<a href="silver_gemstone_rings.cfm">
					Rings 		
								 <img src="http://www.semiprecious.com/images/rings/thumb/8575.jpg" alt="premium designs">
			   </a>
			</div> <!-- here i do not know how to get a new line by use of CSS -->
		</div>
		<div class="content">
			<div class="big_image">
			        		<a href="silver_gemstone_rings.cfm">
				       		
								 <img src="http://www.semiprecious.com/images/rings/thumb/13696.jpg" alt="gemstone in silver"> </a>
						</div>
&nbsp; 		
								<a href="silver_gemstone_rings.cfm">	 <img src="http://www.semiprecious.com/images/rings/thumb/14250.jpg" alt="custom silver jewellery">
								 </a>
							    		
			<div> <font color="#606060">Enjoy this collection of fine quality sterling silver rings with high quality gemstones. We resize rings free of charge. </font>
		    		</div>
				</div>
			</div>
		</div>

	
	<div class="jewelry_box">
    	<div class="jewelry">
	    	<div class="heading">
		    	<div class="URL"> 
				<a href="silver_gemstone_necklaces.cfm">
					Necklaces 		
								 <img src="http://www.semiprecious.com/images/necklaces/thumb/12769.jpg" alt="premium designs">
			   </a>
			</div> <!-- here i do not know how to get a new line by use of CSS -->
		</div>
		<div class="content">
			<div class="big_image">
			        		<a href="silver_gemstone_necklaces.cfm">
				       		
								 <img src="http://www.semiprecious.com/images/necklaces/thumb/12517.jpg" alt="gemstone in silver"> </a>
						</div>
&nbsp; 		
								<a href="silver_gemstone_necklaces.cfm">	 <img src="http://www.semiprecious.com/images/necklaces/thumb/13513.jpg" alt="custom silver jewellery">
								 </a>
							    		
			<div> <font color="#606060">Select from the most diverse and charming collection of silver necklaces and beaded necklaces in natural gemstone beads and pearls.</font>
		    		</div>
				</div>
			</div>
		</div>

	
	<div class="jewelry_box">
    	<div class="jewelry">
	    	<div class="heading">
		    	<div class="URL"> 
				<a href="silver_gemstone_pendants.cfm">
					Pendants 		
								 <img src="http://www.semiprecious.com/images/pendants/thumb/13447.jpg" alt="premium designs">
			   </a>
			</div> <!-- here i do not know how to get a new line by use of CSS -->
		</div>
		<div class="content">
			<div class="big_image">
			        		<a href="silver_gemstone_pendants.cfm">
				       		
								 <img src="http://www.semiprecious.com/images/pendants/thumb/13682.jpg" alt="gemstone in silver"> </a>
						</div>
&nbsp; 		
								<a href="silver_gemstone_pendants.cfm">	 <img src="http://www.semiprecious.com/images/pendants/thumb/6401.jpg" alt="custom silver jewellery">
								 </a>
							    		
			<div> <font color="#606060">You will love this perfect collection of silver gemstone pendants in many styles and sizes.</font>
		    		</div>
				</div>
			</div>
		</div>

	
	<div class="jewelry_box">
    	<div class="jewelry">
	    	<div class="heading">
		    	<div class="URL"> 
				<a href="silver_gemstone_earrings.cfm">
					Earrings 		
								 <img src="http://www.semiprecious.com/images/earrings/thumb/13110.jpg" alt="premium designs">
			   </a>
			</div> <!-- here i do not know how to get a new line by use of CSS -->
		</div>
		<div class="content">
			<div class="big_image">
			        		<a href="silver_gemstone_earrings.cfm">
				       		
								 <img src="http://www.semiprecious.com/images/earrings/thumb/12776.jpg" alt="gemstone in silver"> </a>
						</div>
&nbsp; 		
								<a href="silver_gemstone_earrings.cfm">	 <img src="http://www.semiprecious.com/images/earrings/thumb/1027.jpg" alt="custom silver jewellery">
								 </a>
							    		
			<div> <font color="#606060">A great collection and great prices, browse this gorgeous collection of silver gemstone earrings and beaded earrings in natural gemstone beads. </font>
		    		</div>
				</div>
			</div>
		</div>

	
	<div class="jewelry_box">
    	<div class="jewelry">
	    	<div class="heading">
		    	<div class="URL"> 
				<a href="silver_gemstone_bracelets.cfm">
					Bracelets 		
								 <img src="http://www.semiprecious.com/images/bracelets/thumb/8139.jpg" alt="premium designs">
			   </a>
			</div> <!-- here i do not know how to get a new line by use of CSS -->
		</div>
		<div class="content">
			<div class="big_image">
			        		<a href="silver_gemstone_bracelets.cfm">
				       		
								 <img src="http://www.semiprecious.com/images/bracelets/thumb/11083.jpg" alt="gemstone in silver"> </a>
						</div>
&nbsp; 		
								<a href="silver_gemstone_bracelets.cfm">	 <img src="http://www.semiprecious.com/images/bracelets/thumb/13327.jpg" alt="custom silver jewellery">
								 </a>
							    		
			<div> <font color="#606060">Sterling silver chain links or simple stretch bracelets with real stones. We size to your wrist.</font>
		    		</div>
				</div>
			</div>
		</div>

	
	<div class="jewelry_box">
    	<div class="jewelry">
	    	<div class="heading">
		    	<div class="URL"> 
				<a href="brooches.cfm">
					Brooches 		
								 <img src="http://www.semiprecious.com/images/Brooches/thumb/7506.jpg" alt="premium designs">
			   </a>
			</div> <!-- here i do not know how to get a new line by use of CSS -->
		</div>
		<div class="content">
			<div class="big_image">
			        		<a href="brooches.cfm">
				       		
								 <img src="http://www.semiprecious.com/images/Brooches/thumb/12452.jpg" alt="gemstone in silver"> </a>
						</div>
&nbsp; 		
								<a href="brooches.cfm">	 <img src="http://www.semiprecious.com/images/Brooches/thumb/13587.jpg" alt="custom silver jewellery">
								 </a>
							    		
			<div> <font color="#606060">The best collection of brooches you will see. Wear one and maintain a beautiful tradition.</font>
		    		</div>
				</div>
			</div>
		</div>

	
	<div class="jewelry_box">
    	<div class="jewelry">
	    	<div class="heading">
		    	<div class="URL"> 
				<a href="beads.cfm">
					Beads 		
								 <img src="http://www.semiprecious.com/images/beads/thumb/13757.jpg" alt="premium designs">
			   </a>
			</div> <!-- here i do not know how to get a new line by use of CSS -->
		</div>
		<div class="content">
			<div class="big_image">
			        		<a href="beads.cfm">
				       		
								 <img src="http://www.semiprecious.com/images/beads/thumb/13606.jpg" alt="gemstone in silver"> </a>
						</div>
&nbsp; 		
								<a href="beads.cfm">	 <img src="http://www.semiprecious.com/images/beads/thumb/13655.jpg" alt="custom silver jewellery">
								 </a>
							    		
			<div> <font color="#606060">Real gemstone beads from affordable to premium, in all shapes and cuts direct from source.</font>
		    		</div>
				</div>
			</div>
		</div>

	
	<div class="jewelry_box">
    	<div class="jewelry">
	    	<div class="heading">
		    	<div class="URL"> 
				<a href="healing.cfm">
					Healing Crystals 		
								 <img src="http://www.semiprecious.com/images/Healing/thumb/9618.jpg" alt="premium designs">
			   </a>
			</div> <!-- here i do not know how to get a new line by use of CSS -->
		</div>
		<div class="content">
			<div class="big_image">
			        		<a href="healing.cfm">
				       		
								 <img src="http://www.semiprecious.com/images/Healing/thumb/10585.jpg" alt="gemstone in silver"> </a>
						</div>
&nbsp; 		
								<a href="healing.cfm">	 <img src="http://www.semiprecious.com/images/Healing/thumb/11682.jpg" alt="custom silver jewellery">
								 </a>
							    		
			<div> <font color="#606060">Soak in the calming effect of natural gemstone healing crystals in different gemstones in different shapes. </font>
		    		</div>
				</div>
			</div>
		</div>

	
	<div class="jewelry_box">
    	<div class="jewelry">
	    	<div class="heading">
		    	<div class="URL"> 
				<a href="sterling-silver-jewelry.cfm">
					All Silver Jewelry 
			   </a>
			</div> <!-- here i do not know how to get a new line by use of CSS -->
		</div>
		<div class="content">
			<div class="big_image">
			        		<a href="sterling-silver-jewelry.cfm">
				       		
								 <img src="http://www.semiprecious.com/images/rings/thumb/13351.jpg" alt="gemstone in silver"> </a>
						</div>
&nbsp; 		
								<a href="sterling-silver-jewelry.cfm">	 <img src="http://www.semiprecious.com/images/pendants/thumb/12159.jpg" alt="custom silver jewellery">
								 </a>
							    		
			<div> <font color="#606060">From simple to elaborate designs set in 92.5 sterling silver. For the casual and the formal, spend some time and enjoy!</font>
		    		</div>
				</div>
			</div>
		</div>

	
	<div class="jewelry_box">
    	<div class="jewelry">
	    	<div class="heading">
		    	<div class="URL"> 
				<a href="beaded_jewelry.cfm">
					All Beaded Jewelry 		
								 <img src="http://www.semiprecious.com/images/necklaces/thumb/12606.jpg" alt="premium designs">
			   </a>
			</div> <!-- here i do not know how to get a new line by use of CSS -->
		</div>
		<div class="content">
			<div class="big_image">
			        		<a href="beaded_jewelry.cfm">
				       		
								 <img src="http://www.semiprecious.com/images/bracelets/thumb/11492.jpg" alt="gemstone in silver"> </a>
						</div>
&nbsp; 		
								<a href="beaded_jewelry.cfm">	 <img src="http://www.semiprecious.com/images/earrings/thumb/13623.jpg" alt="custom silver jewellery">
								 </a>
							    		
			<div> <font color="#606060">Beaded jewelry is as old as the human race. We borrow ideas from the ancient and the modern.</font>
		    		</div>
				</div>
			</div>
		</div>

		
	</div>> </a>
						</div>
&nbsp; 		
								<a href="beaded_jewelry.cfm">	 <img src="http://www.semiprecious.com/images/earrings/thumb/13623.jpg" alt="custom silver jewellery">
								 </a>
							    		
			<div> <font color="#606060">Beaded jewelry is as old as the human race. We borrow ideas from the ancient and the modern.</font>
		    		</div>
				</div>
			</div>
		</div>

		
	</div>