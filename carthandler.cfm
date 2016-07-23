
<cfif session.cartid gt 0>
        <cfif isdefined("form.newitem")>
		       <cfinvoke    component="cart9"    method="addItem"   returnVariable="res">
			       <cfinvokeargument       name="newitem"       value="#newitem#">
			       <cfinvokeargument       name="optionid"       value="#optionid#">
			       <cfinvokeargument       name="price"       value="#price#">
			       <cfinvokeargument       name="quantity"       value="#quantity#">
			       <cfinvokeargument       name="category"       value="#category#">
		       	       	       	
		       </cfinvoke>
		   	   <cfif res neq 1>
			   	   	Could not add item 
				<cfif>     <!--- add item to cart (in session and buying record) --->
	        <!--- generated cart --->
	        <!--- generated cart and use opportunity to set session to email id of the user--->
        	<cfelse>
           	    <!--- generate cart and use opportunity to set session to email id of the user--->
     	</cfif>	

<cfelse>

   	 <cfif isdefined("cookie.semipcartid")>
   	 	   <cfinvoke    component="cart9"    method="cartPaymentPending"   returnVariable="res">
			       <cfinvokeargument       name="cartid"       value="#cookie.semipcartid#">
			 </cfinvoke>
	                 <cfif res is 1>
		    	           <cfset session.cartid = cookie.semipcartid />
				   	 	   <cfinvoke    component="cart9"    method="materialiseCart"   returnVariable="res">
						       <cfinvokeargument       name="cartid"       value="#cookie.semipcartid#">
					  	 </cfinvoke>
						   <cfif not (session.mail contains "@") >
						   	<!--- since session.cartid is not set this is the first visit to this page after a long time so use this opportunity to set emailid
                       if possible with cookie and if not logged in --->
						   	 	   <cfinvoke    component="cart9"    method="getEmailId"   returnVariable="res">
								       <cfinvokeargument       name="cartid"       value="#cookie.semipcartid#">
									 </cfinvoke>
									 <cfif not (res is "0")>
									 	<cfset session.mail = res />
										</cfif>
							</cfif>
						<cfelse>
				   	 	   <cfinvoke    component="cart9"    method="setNewCartId"   returnVariable="res" />
				       	</cfif>
                  <cfif isdefined("form.newitem")>
     	                <cfinvoke    component="cart9"    method="addItem"   returnVariable="res">
					       <cfinvokeargument       name="newitem"       value="#newitem#">
					       <cfinvokeargument       name="optionid"       value="#optionid#">
					       <cfinvokeargument       name="price"       value="#price#">
					       <cfinvokeargument       name="quantity"       value="#quantity#">
					       <cfinvokeargument       name="category"       value="#category#">
					    </cfinvoke>
				   		      <!--- add item to cart (in session and buying record) --->
            	     <!---  set cookie to expire up to 3 months --->
   	             </cfif>	         
	             <!--- generate cart and use opportunity to set session to email id of the user--->
		<cfelse>
		   <cfif session.mail contains "@" >
		   	       <cfinvoke    component="cart9"    method="getCartIdForEmail"   returnVariable="res">
						       <cfinvokeargument       name="emailid"       value="#session.mail#">
					  	 </cfinvoke>
                 <cfif res gt 0  > <!--- earlier cart found for the email id --->
               	      <cfinvoke    component="cart9"    method="cartPaymentPending"   returnVariable="res2">
						       <cfinvokeargument       name="cartid"       value="#res#">
					 </cfinvoke>
        				<cfif res2 is 1 >
					             <cfset session.cartid = res />
				                <cfif isdefined("form.newitem")>
   	            					    <cfinvoke    component="cart9"    method="addItem"   returnVariable="res">
									       <cfinvokeargument       name="newitem"       value="#newitem#">
									       <cfinvokeargument       name="optionid"       value="#optionid#">
									       <cfinvokeargument       name="price"       value="#price#">
									       <cfinvokeargument       name="quantity"       value="#quantity#">
									       <cfinvokeargument       name="category"       value="#category#">
									    </cfinvoke> <!--- add item to cart (in session and buying record) --->
					          	     <!---  set cookie to expire up to 3 months --->
				   	             </cfif>	         
	            					 <!--- generate cart and use opportunity to set session to email id of the user--->
						<cfelse><!--- earlier cart found but already paid for --->
				                <cfif isdefined("form.newitem")>
   	                                 <!--- generate new cart id --->
									  <cfinvoke    component="cart9"    method="setNewCartId"   returnVariable="res" />
									 <!--- add item to cart (in session and buying record) --->
									   <cfinvoke    component="cart9"    method="addItem"   returnVariable="res">
									       <cfinvokeargument       name="newitem"       value="#newitem#">
									       <cfinvokeargument       name="optionid"       value="#optionid#">
									       <cfinvokeargument       name="price"       value="#price#">
									       <cfinvokeargument       name="quantity"       value="#quantity#">
									       <cfinvokeargument       name="category"       value="#category#">
									    </cfinvoke> 
						             <!--- generated cart and use opportunity to set session to email id of the user--->
					          	     <!---  set cartid cookie to expire up to 3 months --->
    			          	     </cfif>	         
				
	        			</cfif>
     				<cfelse><!--- no eralier cart for this email id --->
			               <cfif isdefined("form.newitem")>
   	                                 <!--- generate new cart id --->
									  <cfinvoke    component="cart9"    method="setNewCartId"   returnVariable="res" />
									 <!--- add item to cart (in session and buying record) --->
									   <cfinvoke    component="cart9"    method="addItem"   returnVariable="res">
									       <cfinvokeargument       name="newitem"       value="#newitem#">
									       <cfinvokeargument       name="optionid"       value="#optionid#">
									       <cfinvokeargument       name="price"       value="#price#">
									       <cfinvokeargument       name="quantity"       value="#quantity#">
									       <cfinvokeargument       name="category"       value="#category#">
									    </cfinvoke> 
						             <!--- generated cart and use opportunity to set session to email id of the user--->
					          	     <!---  set cartid cookie to expire up to 3 months --->
    			          	     </cfif>	          
    			 	</cfif>	   
			<cfelse> <!--- no email id , no cookie --->
               <cfif isdefined("form.newitem")>
   	                                 <!--- generate new cart id --->
									  <cfinvoke    component="cart9"    method="setNewCartId"   returnVariable="res" />
									 <!--- add item to cart (in session and buying record) --->
									   <cfinvoke    component="cart9"    method="addItem"   returnVariable="res">
									       <cfinvokeargument       name="newitem"       value="#newitem#">
									       <cfinvokeargument       name="optionid"       value="#optionid#">
									       <cfinvokeargument       name="price"       value="#price#">
									       <cfinvokeargument       name="quantity"       value="#quantity#">
									       <cfinvokeargument       name="category"       value="#category#">
									    </cfinvoke> 
						             <!--- generated cart and use opportunity to set session to email id of the user--->
					          	     <!---  set cartid cookie to expire up to 3 months --->
    			          	     </cfif>	 	       				
			</cfif><!--- email id ? ---->
	 	</cfif><!--- semipcartid cookie --->
</cfif><!--- session.cartid gt 0 --->
