<cfinclude template="udfinclude.cfm" >
<table width=1000>
	<cfif cgi.server_name eq "63.135.126.234">
<tr  align="center"><td><img src='http://www.aiyanainc.com/includes/templates/aiycust/images/aiyana.png' height=100></td><td bgcolor="white">Regular mail: Order today and receive by <font color=green><cfoutput>#dateformat(dateadd('d',3,now()),"dddd")# or #dateformat(dateadd('d',4,now()),"dddd")#</cfoutput></font>
Shipping Worldwide!<br>Except items that say "2 week delivery".</td></td></tr>
<cfelseif cgi.server_name IS "www.wholesale-gemstone-jewelry.com" or cgi.server_name IS "wholesale-gemstone-jewelry.com">
<tr><td bgcolor="#CCCC99" align="center"><h2>Wholesale-Gemstone-Jewelry.com <i><font size="-1">wholesale site for Semiprecious.com</font></i> </h2>
Call me with any questions toll free - 1 866 819 7692 | Can also fax your order toll free: 866 213-0985
</td></tr>
<cfelse>
<cfinclude template=header2.cfm>
</cfif>
  <tr> 
    <td colspan="4" align="center" valign="top" background="/images/bg2.gif"> 
    <p style="margin:0px;font:12px;padding-left:2px;background-image:URL(/images/bg2.gif);padding-bottom:2px;">
                <span class="biggreen">|</span> <a href="/" class="headerfont" id="gemstone-jewelry">Home</a><span class="biggreen">|</span> <a href="/gemstone-jewelry.cfm" class="headerfont" id="gemstone-jewelry">Jewelry</a>
	 <span class="biggreen">|</span>  <a href="##" onMouseDown="MM_showHideLayers('necklacesstones' ,'','show','braceletsstones' ,'','hide','earringsstones' ,'','hide','pendantsstones' ,'','hide','ringsstones' ,'','hide')" class="headerfont" id="necklaces">Necklaces</a> 
        <span class="biggreen">|</span> <a href="##" onMouseDown="MM_showHideLayers('earringsstones' ,'','show','braceletsstones' ,'','hide','necklacesstones' ,'','hide', 'pendantsstones' ,'','hide','ringsstones' ,'','hide')" class="headerfont" id="earrings">Earrings</a> 
        <span class="biggreen">|</span> <a href="##" onMouseDown="MM_showHideLayers('pendantsstones' ,'','show','braceletsstones' ,'','hide','necklacesstones' ,'','hide', 'earringsstones' ,'','hide','ringsstones' ,'','hide')" class="headerfont" id="pendants">Pendants</a> 
        <span class="biggreen">|</span> <a href="##"  onMouseDown="MM_showHideLayers('braceletsstones' ,'','show','earringsstones' ,'','hide','necklacesstones' ,'','hide', 'pendantsstones' ,'','hide','ringsstones' ,'','hide')" class="headerfont" id='bracelets'>Bracelets</a>
        <span class="biggreen">|</span> <a href="##"  onMouseDown="MM_showHideLayers('ringsstones' ,'','show','braceletsstones' ,'','hide','necklacesstones' ,'','hide', 'pendantsstones' ,'','hide','earringsstones' ,'','hide')" class="headerfont" id='rings'>Rings</a>
      <span class="biggreen">|</span> <a href="/designer_jewelry_angela.cfm" class="headerfont" id="designer">Designer</a><span class="biggreen">|</span> 
  <span class="biggreen">|</span> <a href="/brooches.cfm" class="headerfont" id='brooches'>Brooches</a>
	        <span class="biggreen">|</span> <a href="/beads.cfm" class="headerfont" id="beads">Beads</a>
 <span class="biggreen">|</span> 
  <a href="http://www.handmadelaptopcase.com" class="headerfont" id="laptopbags">Bags</a>
 <span class="biggreen">|</span> 
<cfif cgi.server_name neq "63.135.126.234">
	<a href="/pettags.cfm" class="headerfont" id="Pet Jewelry" title="Jewelry for Pets">Pets/Gym</a> <span class="biggreen">|</span>
	</cfif>
	<a href="/healing.cfm" class="headerfont" id="healing" title="healing and decorative items">Healing</a>   
	<cfif cgi.server_name neq "63.135.126.234">     
	<cfif cgi.server_name IS "www.wholesale-gemstone-jewelry.com" or cgi.server_name IS "wholesale-gemstone-jewelry.com">
		<span class="biggreen">|</span> <a href="http://www.semiprecious.com" class="headerfont" id="retail">Retail</a>
		<cfelse>
		<span class="biggreen">|</span> <a href="http://www.semiprecious.com/wholesale_login.cfm" class="headerfont" id="wholesale">Wholesale</a> 
    </cfif>      
			   <span class="biggreen">|</span> <a href="http://www.semiprecious.com/simpleloginform.cfm" class="headerfont"  id="login">login</a> 
  <span class="biggreen">|</span> </span> <a href="/crm/trackorder.cfm" class="headerfont" id="ordertrack">Track Order</a> 
  <span class="biggreen">|</span> </span> <a href="/cart.cfm" class="headerfont" id="cart">Cart</a> 
	</cfif></p></td> 
  
 <td>&nbsp;</td>
  </tr>
 
</table>
<script language="JavaScript" src="/js/macromediafuncs.js" >
</script>
<cfinclude template="listsofstones.cfm" />