<cfif category neq 'chains' and category neq 'brooches'>
<cfparam default="" name="category">
<cfparam default="" name="categ">
<cfparam default="" name="subcat">
<cfparam default="" name="style">
<cfif style is 'Silver Setting' or style is 'Silversetting'><cfset style='silver'></cfif>
<cfif style contains 'beaded'><cfset style='beaded'></cfif>

<cfset origcat=category>
<CFIF category eq "">
<CFSET category2='necklaces'>
</CFIF>
<cfif category is "chains">
<cfset category2 ="all" />
</cfif>



<cfoutput>
	
<cfset rcount=1>
	<cfloop index="subcat2" list="moonstone,amethyst,garnet,blue topaz,peridot,bloodstone,lapis lazuli,malachite,onyx,labradorite,citrine,iolite,tanzanite,amber,emerald,chalcedony,lemon quartz,rose quartz" >
		<cfset rcount=rcount+1><CFIF subcat2 neq "">
			<cfset subcat3 = replace(trim(lcase(subcat2)),"_","")>
            <cfset subcat4 = subcat3>
            <cfset subcat3 = replace(trim(subcat3)," ","")>
    		<!--- If we are on the hubs page, display 'stone+category' otherwise, just the stone --->
			<cfif CGI.PATH_INFO contains "gem-stone-">
               <div id="stoneimage" style="position:absolute;left:50px"><img src=/images/stones/gemstone-thumbs/#replace(lcase(subcat3)," ","",'all')#-n.jpg alt="#subcat2# gemstone thumbnail" width=20 height=20></div>
							 <cfif style neq "">
                    <cfif category eq "" or category eq "ALL">
                   <a href='/#subcat3#_#categ#.cfm?style=#style#' id="#subcat2#" >
                    <cfelse>	                 
										<a href="/#lcase(subcat3)#_#categ#.cfm" id="#subcat2#" >
                    </cfif>
                <cfelse>
                   <a href='/#subcat3#_#category#.cfm<cfif style neq "">?style=#style#</cfif>' id="#subcat2#" >
                </cfif>
                #subcat2# </a><br>
                
            <cfelse>
        
           <cfif category eq "" or category eq "ALL" or category eq "jewelry">
                   <div  style="position:absolute;left:0px;top:#evaluate(rcount*35)#px"><img src=/images/stones/gemstone-thumbs/#replace(lcase(subcat3)," ","",'all')#-n.jpg alt="#subcat2# gemstone thumbnail" width=30 height=35></div><div  style="position:absolute;left:35px;top:#evaluate(rcount*35)+5#px;font-face:arial;font-size:14;"> 
									<cfif style neq "">
                        <a  href='/#subcat3#_jewelry.cfm?style=#style#' id="#subcat2#" >
                    <cfelse>	
                        <cfif cgi.server_name contains 'wholesale'>
                            <a href="/#lcase(subcat3)#_jewelry.cfm" id="#subcat2#" >
                        <cfelse>
                            <a href="/#lcase(subcat3)#.cfm" id="#subcat2#" >
                        </cfif>
                    </cfif>
                    #titlecase(subcat2)#<cfif style neq "">-#style#</cfif></a>
        						
                <cfelse>
                
                   <a  href='/#subcat3#_#category#.cfm' id="#subcat2#"  class="side_link"  >
        #titlecase(subcat2)#</a>
        
                </cfif></div>
            </cfif>
        </CFIF>
	</cfloop><div style="position:relative;top:700px;font-face:arial;font-size:14" ><a href=/rare-stones/rare-gems-jewelry.cfm>80 More Gemstones</a></div>
 

		<!---<cfif category eq "" or category eq "ALL">--->


		<!---</cfif>--->
	</cfoutput>

<cfset category=origcat>
</cfif>