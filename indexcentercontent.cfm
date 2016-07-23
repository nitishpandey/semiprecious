<table align="center"  cellpadding="1" border="0" width="570px" style="margin:0px;margin-top:2px;position:relative;top:-200px;">
         <!--- <tr height=100> 
            <td  align="center" valign="top" background="images/Bracelets/thumb/5064.jpg" ><br><br><a href='http://www.semiprecious.com/bracelets.cfm'><strong>BRACELETS</strong></a> </td>
            <td   align="left" valign="top" background="images/indexcenter/amber.jpg"><a href="amber.cfm"><strong>Amber!</strong></a><td width=140 align="center" valign="middle" background="images/indexcenter/beads.jpg">
	<a href='beads.cfm'><strong>GEMSTONE BEADS</strong></a></td>
          </tr>---> 
		  <!---	<cfinclude template="bags.htm">--->	
	<!---  <tr valign="center" width=600 align=left >
	  <td align="center" width="360" style="width:360px;height:290px;padding:0px;">
		  <div style="position:relative;width:360px;height:290px;padding:0px;">
		  <cfif session.tld is 'semiprecious.in' and 0	>
		 <a href="http://www.semiprecious.com/gem_stone_necklaces.cfm/9202_necklaces_amethyst.htm">
			 <img border="0"  alt="gemstone sterling silver jewelry" style="z-index: 0; display: inline;" 
src="/myproject/centergraphics/christmas2010/christmas4.jpg" id="SlideShow" ide="changing_image_img"
width="360"   />
			</a>
			  <cfelse>
		<a href="/detail.cfm?newitem=13593">
			 <img border="0"  alt="gemstone sterling silver jewelry" style="z-index: 0; display: inline;" 
src="/images/rings/13593.jpg" width="200"   />
			</a>
			</cfif>
	  		 </div> <cfinclude template="/includes/homeslideshow.cfm"/>
</td><td valign="top" align="left" >
	
	 <a href="/detail.cfm?newitem=11971">
			 <img border="0"  alt="gemstone sterling silver jewelry" style="z-index: 0; display: inline;" 
src="/images/pendants/11971.jpg" width="150"   />
			</a>
Over 8000 designs of jewelry made from semiprecious stones and sterling silver

</td>
</tr>--->
  <cfquery  datasource="gemssql" name="accouncementhome" cachedwithin="#createtimespan(0,0,1,0)#">
  select description, linkto from contenthome where domain like '#left(cgi.server_name,5)#%' and category='announcement' and seq is null
  </cfquery>
  <cfif accouncementhome.recordcount gt 0> 
   <tr align="center" valign="top"> 
      <td colspan="2" valign="top" align="left">
	  <font color="brown"><b><cfoutput>#accouncementhome.description#. Click <a href=#accouncementhome.linkto#>here</a>.</cfoutput></b></font>
  </td>
  </tr>
  </cfif>

   <tr align="center" valign="top"> 

			<td valign="top" align="center"  colspan=2>
			
<table id="container1" cellspacing="0" cellpadding="0" border="0">
  
    
    
    
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/abalone-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/abalone.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	ABALONE
			COLLECTION
        </a>
        (11)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/agate-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/agate.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	AGATE
			COLLECTION
        </a>
        (91)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/alexandrite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/alexandrite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	ALEXANDRITE
			COLLECTION
        </a>
        (11)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/amazonite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/amazonite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	AMAZONITE
			COLLECTION
        </a>
        (17)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/amber-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/amber.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	AMBER
			COLLECTION
        </a>
        (125)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/amethyst-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/amethyst.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	AMETHYST
			COLLECTION
        </a>
        (799)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/apatite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/apatite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	APATITE
			COLLECTION
        </a>
        (14)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/aquamarine-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/aquamarine.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	AQUAMARINE
			COLLECTION
        </a>
        (105)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/aventurine-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/aventurine.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	AVENTURINE
			COLLECTION
        </a>
        (175)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/blackspinel-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/blackspinel.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	BLACK SPINEL
			COLLECTION
        </a>
        (15)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/bloodstone-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/bloodstone.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	BLOODSTONE
			COLLECTION
        </a>
        (180)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/bluelaceagate-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/bluelaceagate.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	BLUE LACE AGATE
			COLLECTION
        </a>
        (20)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/bluetopaz-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/bluetopaz.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	BLUE TOPAZ
			COLLECTION
        </a>
        (265)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/bone-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/bone.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	BONE
			COLLECTION
        </a>
        (37)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/bronzite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/bronzite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	BRONZITE
			COLLECTION
        </a>
        (24)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/carnelian-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/carnelian.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	CARNELIAN
			COLLECTION
        </a>
        (356)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/chalcedony-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/chalcedony.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	CHALCEDONY
			COLLECTION
        </a>
        (134)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/chrysocolla-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/chrysocolla.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	CHRYSOCOLLA
			COLLECTION
        </a>
        (32)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/chrysoprase-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/chrysoprase.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	CHRYSOPRASE
			COLLECTION
        </a>
        (41)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/citrine-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/citrine.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	CITRINE
			COLLECTION
        </a>
        (490)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/coral-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/coral.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	CORAL
			COLLECTION
        </a>
        (19)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/crystal-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/crystal.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	CRYSTAL
			COLLECTION
        </a>
        (139)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/cubiczirconia-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/cubiczirconia.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	CUBIC ZIRCONIA
			COLLECTION
        </a>
        (83)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/dalmatianjasper-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/dalmatianjasper.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	DALMATIAN JASPER
			COLLECTION
        </a>
        (18)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/dendriteopal-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/dendriteopal.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	DENDRITE OPAL
			COLLECTION
        </a>
        (52)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/drusy-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/drusy.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	DRUSY
			COLLECTION
        </a>
        (31)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/emerald-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/emerald.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	EMERALD
			COLLECTION
        </a>
        (86)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/fluorite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/fluorite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	FLUORITE
			COLLECTION
        </a>
        (89)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/garnet-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/garnet.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	GARNET
			COLLECTION
        </a>
        (523)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/goldenrutile-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/goldenrutile.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	GOLDEN RUTILE
			COLLECTION
        </a>
        (18)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/goldstone-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/goldstone.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	GOLDSTONE
			COLLECTION
        </a>
        (65)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/greenamethyst-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/greenamethyst.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	GREEN AMETHYST
			COLLECTION
        </a>
        (130)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/hematite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/hematite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	HEMATITE
			COLLECTION
        </a>
        (74)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/hessonite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/hessonite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	HESSONITE
			COLLECTION
        </a>
        (15)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/howlite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/howlite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	HOWLITE
			COLLECTION
        </a>
        (17)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/indianjade-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/indianjade.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	INDIAN JADE
			COLLECTION
        </a>
        (20)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/iolite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/iolite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	IOLITE
			COLLECTION
        </a>
        (217)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/jade-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/jade.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	JADE
			COLLECTION
        </a>
        (11)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/jasper-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/jasper.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	JASPER
			COLLECTION
        </a>
        (290)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/kyanite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/kyanite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	KYANITE
			COLLECTION
        </a>
        (13)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/labradorite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/labradorite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	LABRADORITE
			COLLECTION
        </a>
        (354)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/lapislazuli-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/lapislazuli.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	LAPIS LAZULI
			COLLECTION
        </a>
        (410)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/larimar-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/larimar.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	LARIMAR
			COLLECTION
        </a>
        (29)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/lemonquartz-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/lemonquartz.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	LEMON QUARTZ
			COLLECTION
        </a>
        (147)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/magnesite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/magnesite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	MAGNESITE
			COLLECTION
        </a>
        (16)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/malachite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/malachite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	MALACHITE
			COLLECTION
        </a>
        (169)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/mohave-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/mohave.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	MOHAVE
			COLLECTION
        </a>
        (45)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/mookite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/mookite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	MOOKITE
			COLLECTION
        </a>
        (20)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/moonstone-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/moonstone.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	MOONSTONE
			COLLECTION
        </a>
        (673)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/mossagate-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/mossagate.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	MOSS AGATE
			COLLECTION
        </a>
        (86)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/mother-of-pearl-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/mother-of-pearl.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	MOTHER-OF-PEARL
			COLLECTION
        </a>
        (17)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/multi-stone-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/multi-stone.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	MULTI-STONE
			COLLECTION
        </a>
        (375)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/mysticquartz-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/mysticquartz.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	MYSTIC QUARTZ
			COLLECTION
        </a>
        (44)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/obsidian-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/obsidian.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	OBSIDIAN
			COLLECTION
        </a>
        (50)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/onyx-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/onyx.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	ONYX
			COLLECTION
        </a>
        (404)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/opal-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/opal.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	OPAL
			COLLECTION
        </a>
        (103)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/opalite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/opalite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	OPALITE
			COLLECTION
        </a>
        (25)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/pearl-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/pearl.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	PEARL
			COLLECTION
        </a>
        (392)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/peridot-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/peridot.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	PERIDOT
			COLLECTION
        </a>
        (400)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/pinkopal-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/pinkopal.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	PINK OPAL
			COLLECTION
        </a>
        (47)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/pinktopaz-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/pinktopaz.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	PINK TOPAZ
			COLLECTION
        </a>
        (14)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/prehnite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/prehnite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	PREHNITE
			COLLECTION
        </a>
        (82)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/quartz-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/quartz.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	QUARTZ
			COLLECTION
        </a>
        (43)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/rhodocrosite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/rhodocrosite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	RHODOCROSITE
			COLLECTION
        </a>
        (19)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/rhodolite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/rhodolite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	RHODOLITE
			COLLECTION
        </a>
        (25)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/rhodonite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/rhodonite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	RHODONITE
			COLLECTION
        </a>
        (26)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/rosequartz-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/rosequartz.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	ROSE QUARTZ
			COLLECTION
        </a>
        (234)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/rotile-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/rotile.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	ROTILE
			COLLECTION
        </a>
        (66)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/ruby-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/ruby.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	RUBY
			COLLECTION
        </a>
        (88)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/rutilated-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/rutilated.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	RUTILATED
			COLLECTION
        </a>
        (15)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/rutilatedquartz-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/rutilatedquartz.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	RUTILATED QUARTZ
			COLLECTION
        </a>
        (51)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/sapphire-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/sapphire.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	SAPPHIRE
			COLLECTION
        </a>
        (46)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/sardonyx-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/sardonyx.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	SARDONYX
			COLLECTION
        </a>
        (17)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/shell-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/shell.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	SHELL
			COLLECTION
        </a>
        (32)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/silver-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/silver.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	SILVER
			COLLECTION
        </a>
        (22)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/smokyquartz-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/smokyquartz.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	SMOKY QUARTZ
			COLLECTION
        </a>
        (295)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/snowquartz-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/snowquartz.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	SNOW QUARTZ
			COLLECTION
        </a>
        (33)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/sodalite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/sodalite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	SODALITE
			COLLECTION
        </a>
        (23)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/sugilite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/sugilite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	SUGILITE
			COLLECTION
        </a>
        (12)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/sunstone-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/sunstone.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	SUNSTONE
			COLLECTION
        </a>
        (37)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/swarovski-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/swarovski.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	SWAROVSKI
			COLLECTION
        </a>
        (33)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/tanzanite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/tanzanite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	TANZANITE
			COLLECTION
        </a>
        (30)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/tiffanystone-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/tiffanystone.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	TIFFANY STONE
			COLLECTION
        </a>
        (29)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/tigereye-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/tigereye.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	TIGER EYE
			COLLECTION
        </a>
        (222)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/tigeriron-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/tigeriron.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	TIGER IRON
			COLLECTION
        </a>
        (14)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/tourmaline-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/tourmaline.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	TOURMALINE
			COLLECTION
        </a>
        (58)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/turquoise-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/turquoise.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	TURQUOISE
			COLLECTION
        </a>
        (436)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/unakite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/unakite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	UNAKITE
			COLLECTION
        </a>
        (51)  
    </td>
    
    
    
      
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
       
      
  
    
    
      <tr >
      
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/vasonite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/vasonite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	VASONITE
			COLLECTION
        </a>
        (12)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/whitetopaz-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/whitetopaz.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	WHITE TOPAZ
			COLLECTION
        </a>
        (63)  
    </td>
    
    
    
      
    
  
    
    

    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/zosite-n.jpg width=20 height=20>
    </td>
    
    <td width="20%">
    	<a href='/zosite.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:#333333">
        	ZOSITE
			COLLECTION
        </a>
        (29)  
    </td>
    
    
    
      
    
  
   
      
	<td coslpan="1">&nbsp;</td></tr>
  

    
  
	
<tr>
<td colspan="4">
  	<table><tr><td bgcolor='lightyellow' align=center>

		
		
	
	
</td></tr></table>

<!---      <cfinclude template="/includes/indexhubcssasclass.cfm">--->
	  </td>

		</tr>
	
<!---           <cfinclude template="pippinindex.htm">
<cfinclude template="stone-beads.htm">--->

	
		<!---    <tr align=center valign="top"> 
     <td colspan="6" valign="top" align=left background=images/tdbg2.jpg><font =arial>
<cfinclude template=vacation.inc>
	<a href=valentines-day-jewelry.cfm>Stone Hearts Collection</a> - Even the stone-hearted can not resist the little  hearts carved in stone on this Saint Valentines Day, our love collection of beautiful jewelry just for your beloved.
 
  
      </td>
    </tr>--->
<!----

   <tr align="center" valign="top"> 
      <td colspan="4" valign="top" align="center" >

	<cfoutput><a href="#lcase(monthasstring(month(now())))#-birthstone.cfm">#monthasstring(dateformat(now(),"m"))#</cfoutput> Birthstone Jewelry</a> - Birthstone Earrings, pendants, necklaces, rings for the current month.
 <br>Prepare for next months gifts now -<cfoutput> <a  href="#lcase(monthasstring(dateformat(dateadd("M",1,now()),"m")))#-birthstone.cfm">#monthasstring(dateformat(dateadd("M",1,now()),"m"))#</cfoutput>  Birthstone Jewelry</a><p>

Remember to bookmark our site for our annual <a href=thanksgivingsale.cfm>Thanksgiving Jewelry Sale</a>
      </td>
    </tr>---->

         </table>
