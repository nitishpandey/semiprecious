<cfset categories = "rings,pendants,bracelets,necklaces,cufflinks,earrings,brooches" />

<cfif not find(".cfm",cgi.query_string)>

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
                 <cflocation statuscode="301" addtoken="no" url="/#token#" />
         <cfelse>
				 <cfheader statuscode="404"  />
    		</cfif>

             <cfelse>


<cfheader statuscode="404"  />

     </cfif>