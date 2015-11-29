
<table align="center"  border="1"  cellspacing="0" bordercolor="#bbbb99" width="792px" style="border:0px black ridge;">
       	      <tr> 
            <!--   <td align="center"><input name="button" type="button" class="greenbutton" onclick="javascript:goProcess('Click here to Buy More Items')" value="Continue Shopping"> 
              </td> -->
            <td  align="right" nowrap> Ship To:</td>
            <td  align="right" nowrap>     
			 <input type="text" size="4" name="shipTo" id="shipTo" value=
			 <cfif  address.recordcount GT 0><cfoutput>#address.firstname#</cfoutput></cfif>>
            </td>
          </tr>
            <tr> 
              <td  align="right" valign="middle"  >Address line 1:</td>
              <td align="left" valign="middle"> 
                <input type="text" size="20" name="address1" id="address1" value=
				<cfif  address.recordcount GT 0><cfoutput>#address.address1#</cfoutput></cfif>></td>
            </tr>
		<tr> 
            <td  align='right'>Address line 2:</td>
            <td align="left"> <input type="text" size="20" name="address2" id="address2" value=
			 <cfif  address.recordcount GT 0><cfoutput>#address.address2#</cfoutput></cfif>>

 </td>
          </tr> 
             
		   			  </td></tr>
 <tr> 
            <td  align='right'>City: </td>
            <td align="left"> 
           <input type="text" size="10" name="city" id="city" value=
			 <cfif  address.recordcount GT 0><cfoutput>#address.city#</cfoutput></cfif>> </td>
          </tr>
		  
		   <tr> 
            <td  align='right'>State: </td>
            <td align="left"> 
           <input type="text" size="10" name="state" id="state" value=
			 <cfif  address.recordcount GT 0><cfoutput>#address.state#</cfoutput></cfif>>, 
			 
			Postal Code (Zip): <input type="text" size="10" name="zip" id="zip" value=
			 <cfif  address.recordcount GT 0><cfoutput>#address.zip#</cfoutput></cfif>>
			 </td>
          </tr>
		  
		   <tr> 
            <td  align='right'>Country: </td>
            <td align="left"> 
           <input type="text" size="10" name="country" id="country" value=
			 <cfif  address.recordcount GT 0><cfoutput>#address.country#</cfoutput></cfif>>
			 </td>
          </tr>

    <tr bgcolor="#FFFFFF"> <td colspan="2" align="center">
 <input name="button" type="button" class="greenbutton"  onClick="javascript:goProcess('Save Cart')" value='Save Cart for Later'> 
</td>
          </tr>
</table>