<cftry>
<cfinclude template="/header#session.country#.cfm" />
<div id="container2" style="padding-top:20px">

<cffunction name="isregistered" returntype="boolean" >
    <cfargument name="person" required="true" />
   
   <cfquery datasource="sptm" name="d"> 
                                   select email from memberinfo where email = '#trim(form.byemail)#' 
   </cfquery>
              <cfif d.recordcount>
              <cfset exists = true />
              <cfelse>
              <cfset exists = false />
              </cfif>
              ....///...
     <cfreturn exists />
</cffunction>
<cfform action="editcredit.cfm" method="post">

Email:<cfinput type="text" name="byemail" required="yes" ><br />
Increase Credit by amount (dollars):<cfinput type="text" name="newcredit" required="yes" validate="float" ><br />
<input type="submit">
</cfform>
            <cfif isdefined("form.byemail")>
            <!--- first check if the person exists or not --->
                <cfquery datasource="sptm" name="exists">
                    select totalcredit  from invite_credits   where email = '#trim(form.byemail)#' 
                    </cfquery>
                    <cfif exists.recordcount>
                           <cfinvoke component="invitationandcredit" method="add_to_credit" returnvariable="f" >
                    		<cfinvokeargument name="email" value="#form.byemail#"  />
                    		<cfinvokeargument name="new_credit" value="#form.newcredit#"  />
                        </cfinvoke>
                            Updated!
                                <cfquery datasource="sptm" name="d"> 
                                   select balancecredit, totalcredit from invite_credits  where email = '#trim(form.byemail)#' 
                                    </cfquery>
                            New balance :	<cfoutput>#d.balancecredit#.Total so far: #d.totalcredit#</cfoutput>
            <cfelse>
                        <cfif isregistered(person:"#trim(form.byemail)#")>
                        	  <cfinvoke component="invitationandcredit" method="newmember" returnvariable="f" >
                        		<cfinvokeargument name="email" value="#form.byemail#"  />
                        		<cfinvokeargument name="initialcredit" value="#form.newcredit#"   />
                                </cfinvoke>
                             
                            		Updated!
                                            <cfquery datasource="sptm" name="d"> 
                                               select balancecredit, totalcredit from invite_credits  where email = '#trim(form.byemail)#' 
                                                </cfquery>
                                        New balance :		<cfoutput>#d.balancecredit#.Total so far: #d.totalcredit#</cfoutput>
                        <cfelse>
                        
                            The user is not registered! Please register him first. Not doing it here because not sure where all his entries are required.
                        
                        </cfif>
            </cfif>
    </cfif>
</div>
<br />
<cfinclude template="/mainfooter.cfm" />
</div>
</body>
</html>
<cfcatch type="any">
<cfdump var="#cfcatch#" />
</cfcatch>
</cftry>