<cfset categories = "rings,pendants,bracelets,necklaces,cufflinks,earrings,brooches,anklets" />
<!---
<cfdump var="#cgi#" /> --->


<!--- jewelry/pendants/amethyst  --->
<cfif not find(".cfm",cgi.query_string)>


<!--- Query string that comes to 404 file  	404;http://www.semiprecious.com:80/jewelry/pendants/amethyst  --->
            <cfset url_ = rereplace(cgi.query_string,"404;http://www.semiprecious.com:80/","") />

            <cfset token = "" />

            <cfloop list="#url_#"  delimiters="/"  index="t">
                   <cfif t is "jewelry">
                	    <cfset token  =  "jewelry.cfm?" />
                  <cfelseif  listfind(categories,t)>
                       <cfset token = t & ".cfm" />
                  <cfelseif  t is "by-stone">
                      <cfset token =   "rare-stones/rare-gems-jewelry.cfm" />
                  <cfelseif  t is "gemstone-beads">
                      <cfset token =   "beads" />
                  <cfelseif listfindnocase("january,february,march,april,may,june,july,august,september,october,november,december",t)>
                  <!---works for both march/ and by-birthstone/march ---->
                     <cfset token= t & "-birthstone.cfm" />

                    <cfelse>
                        <cfif not find(".cfm", token)>
                            <!--- hoping that it is a sub-cat ; we should first check in which list does it fall of the colors, stones, categories,shapes and themes--->
                            <cfif token is "beads">
                                <cfset t = replace(t,"_","") />
                                <cfset t = replace(t,"-","") />


                                <cfset token  = t& "_beads.cfm" />
                        <cfelse>
                            <cfset token = t & ".cfm" />
                        </cfif>

                      <cfelse>
                       <!--- here we should create a list of colors, stones, shapes and themes. Then check where does the second token gets found. And then add the URL
                       param accordingly --->
                       <cfset t = replace(t,".html","") />
                        <cfset token =token & "?subcat=" & t />
                    </cfif>
                  </cfif>

            </cfloop>
   		   <cfif token neq "" and token neq 'jewelry.cfm'>
			<cfif token contains ".cfm" >


          <cflocation statuscode="301" addtoken="no" url="/#token#" />
		  </cfif>
      <cfelse>
				 <cfheader statuscode="404"  />
    		</cfif>

             <cfelse>
	   <cfset url_ = rereplace(cgi.query_string,"404;http://www.semiprecious.com:80/","") />
	   <cfset url_ = rereplace(url_,".cfm","") />
<!--- http://www.semiprecious.com/agate_anklets.cfm --->
 <cfif listfind(categories,listgetat(url_,2,"_"))>
	  <cfset subcat =  listgetat(url_,1,"_") />
	      <cfinclude template="/#listgetat(url_,2,"_")#.cfm"/>
          <cfabort />
	</cfif>

<cfheader statuscode="404"  />

<cfoutput>#url_#,#listgetat(url_,2,"_")#</cfoutput>

     </cfif>
