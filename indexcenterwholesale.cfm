<!---

THIS IS NOT USED USE THE FILE IN INCLUDES FOLDER --->
<cfinclude template="../setup.cfm">
<TABLE   border='0'  valign=top align="center" cellpadding="2" cellspacing="2">
      <cfif session.country is "india" >
       <tr> 
        <td   class="price" align="justify" style="margin:1px;padding:1px;"  > 
		<!--- <cfoutput>#session.india#</cfoutput> --->
          <a href="silver.cfm">Silver</a>, <a href="pearl.cfm">Pearl</a> &amp; 
          beaded semiprecious gemstone jewelry. Prices no one can match. Over 
          two thousand designs in over 30 semiprecious stones (<a href="moonstone.cfm">moonstone</a>, 
          <a href="citrine.cfm">citrine</a>, <a href="tourmaline.cfm">tourmaline</a> 
          ...) in a price range of <a href="http://www.semiprecious.com/list.cfm?sortorder=price">Rs 
          50</a> to <a href="necklaces_silver.cfm">Rs 3000</a>. Pick from faceted, 
          cabuchons, shoulder grazing <a href="earring.cfm">earrings</a>, multi 
          strand <a href="necklace.cfm">necklaces</a>, <a href="pendant.cfm">pendants</a>, 
          chunky <a href="bracelet.cfm">bracelets</a> and much more. Visit us 
          every week to see <a href="jewelrynew.cfm">new</a> jewelry.
          <div align="center">
          <img src="images/callusnowindia.gif"  hspace="0" vspace="0" align="absmiddle" start="mouseover"   style="display:block;" width="130" height="158" />&nbsp;<span style="background-color:gray;font-weight:normal">Find
          out more 
          <a href="about.cfm">about us</a>... </span></div><hr /></td>
        <cfelse>
        <TD width="140"   rowspan="6" align="center"   vAlign="top" style="font-size:12px;" > 
   &nbsp;
        </TD>
        <td  colspan="1" class="noticebox"  align="center" valign="middle"  >     <a class="tf_upfront_badge" href="http://www.thefind.com/store/about-semiprecious" title="TheFind Upfront" style="text-decoration:none;"><b>semipreciouswholesale.com</b> is <u>UpFront</u></a>
        </td>
    </tr>
      </cfif>
  

		<cfinclude template="/bulklotsjewelry.htm">
<!---          <cfinclude template="/2process/adjewels/designer-index.htm">--->
	<cfinclude template="/stone-beads.htm">
 <tr> 
 <td align="left" >
<div  style='font-size:10pt;font-family:"Palatino Linotype","serif";color:black'>Welcome to wholesale.semiprecious.com, a wholesale subdomain 
of semiprecious.com, one of the largest online catalogues of wholesale sterling silver jewelry and wholesale beaded jewelry and wholesale beads. With 
over 6000 items to choose from, we are a complete wholesale siver and gemstone jewelry shopping destination for wholesale necklaces, wholesale earrings and studs, wholesale pendants, wholesale bracelets, wholesale rings. We have a very flexible 30 days 
return policy. We ship international from USA and India.</div>
<div align=center style="text-align:left;">
<font size="3" face="Bradley Hand ITC">
  <ul>
    <li>More than 6000 real gemstone silver jewelry designs and beads</li>

    <li>Latest designs added constantly</li>

    <li>Affordable wholesale jewelry lots</li>

    <li>Lowest wholesale prices</li>

    <li>Payment in 3 monthly installments</li>
	
	    <li>Flexible 30 days return policy</li>
  </ul>
</font>
			</div>
<div style="width:730px">			<cfinclude template='../indexhub.cfm'>
			</div>
<div style="background-image:url(backgroundimages/tdbg2.jpg)"><font face="Bell MT" size=4>
	 Customer satisfaction is our guiding business principle and we work hard to procure the latest designs of authentic, premium quality gemstone jewelry and gemstone beads.  Another feature of our handmade jewelry collection, apart from its refreshing originality in design and the premium quality of gemstones, is its unmatched affordable pricing.</font>
	 </div><div >
<a href='http://www.esources.co.uk/wholesale-suppliers/15/'>Jewellery wholesale suppliers, distributors and watch wholesalers list and directory</a>
</div>
  
</cfif>

</cfif> <!--- cgi ---></td></tr>
  </TABLE>
