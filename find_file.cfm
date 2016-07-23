<cfparam name="session.language" default="" />
<cfset scriptname = replace(url.file,'/','') />
<cfset cat = listgetat(scriptname,1,'_') />
<cfset stone = listgetat(scriptname,2,'_.') />
		  <cfmail to="nitish@semiprecious.com" from="cs@semiprecious.com" subject="application.cfm " server="Mail23@webcontrolcenter.com" type="html">
#url.welcome# took to #url.file# and we generated #stone#_#cat#.cfm
</cfmail>
    <cfif findnocase(cat,'necklacearringbraceletpendantcufflink') and not isdefined("url.newpage")>
		 <cflocation url="#stone#_#cat#.cfm?#CGI.query_string#&newpage=202" addtoken="no" />
	<cfelse>
		<cfif findnocase(stone,'necklacearringbraceletpendantcufflink')>
			 <cflocation url="#stone#.cfm?cat=#stone#&#CGI.query_string#&newpage=203" addtoken="no" />
		<cfelseif findnocase(cat,'necklacesearringsbraceletspendantscufflinks')>
			 <cflocation url="#cat#.cfm?cat=#stone#&#CGI.query_string#&newpage=204" addtoken="no" />
		</cfif>
		<cfif isdefined("url.file") and not isdefined("newpage")>
			 <cflocation url="#url.file#?#CGI.query_string#&newpage=205" addtoken="no" />
		</cfif>
 </cfif> 
<html>
<head>
	<script language="JavaScript" src="http.js" ></script>

</head>
<cfoutput>
<body onLoad="javascript:http('cv=sperror&page=#url.file#');" style="background-color:white;">
	<div align="center">
	<div style="text-align:left;border:2px gray solid;width:800px">
</cfoutput>
<!-- ImageReady Slices (box.psd) -->
<div style="position:absolute; left:0px; top:0px; width:1200px; height:500px;">
	<div style="position:absolute; left:0px; top:0px; width:166px; height:800px;">
		<img src="includes/images/Slice_01.jpg" width="166" height="800" alt="">
	</div>
	<div style="position:absolute; left:166px; top:0px; width:1032px; height:152px;">
		<img src="includes/images/Slice_02.jpg" width="1032" height="152" alt="">
	</div>
	<div style="position:absolute; left:1198px; top:0px; width:2px; height:800px;">
		<img src="includes/images/Slice_03.jpg" width="2" height="800" alt="">
	</div>
	<div style="position:absolute; left:166px; top:152px; width:890px; height:502px;">
<cfif session.language is 'french'>
<h2><font color="#008000">Attention! Certains erreur ...</font></h2>
<br />

<div style="margin-left:20px">
<h2>
<span style="color:maroon;"> 
Mais ne vous inquiétez pas, notre logiciel vous assurer que vous recuperer votre panier intact.<br /> 
Il suffit de suivre les étapes suivantes:<br />
S'il vous plaît cliquez ici pour tenter de poursuivre vos achats → <a href="/">tentative 1</a>.<br />
Si vous voyez cette page pour la deuxième fois s'il vous plaît cliquez ici → <a href="/logout.cfm?gohome=1">Redémarrez</a><br />
</span></h2>

</div>
Si vous êtes incapable d'acheter en ligne s'il vous plaît appelez-nous au 1-888-879-9461 afin que nous puissions prendre votre commande par téléphone ou résoudre le problème sotware le cas échéant.<br /> 
--------------------------------------------<br />
Pour les curieux, l'erreur pourrait se produire en raison de:<br />
En raison de mises à jour en cours fonctionnalité à notre boutique en ligne<br />
Votre demande m'a expiré en raison de longs temps d'inactivité<br />
Redémarrage du serveur<br />
Un bogue logiciel que nous sommes encore à fixer<br />
L'erreur suivante s'est produite:<br />
<cfelse>
<h2><font color="#008000"> OOps! The file you are looking for no longer exists...</font></h2>
<br />		

But not to worry, our software will ensure that you get back your shopping cart intact. 
<br />
Just follow the following steps:

<div style="margin-left:20px">
<h2>
<span style="color:maroon;"> Please click here for continuing with your shopping &rarr; <a href="/">
home page</a>.</h2>

</div>
If you are unable to shop please call us on <cfoutput>#application.tollfree#</cfoutput> so that we can take your order over the phone or resolve the sotware issue if any.
<br />
--------------------------------------------<br />				
For those curious, the error could happen due to:

<ul>
<li>Due to on going feature upgrades to our web store </li>
<li> Your request got timed out due to long idle time</li> 
<li> Server restart</li>
<li> A software bug that we are yet to fix </li>
</ul>
</cfif>
	</div>
	<div style="position:absolute; left:1056px; top:152px; width:142px; height:648px;">
		<img src="includes/images/Slice_05.jpg" width="142" height="648" alt="">
	</div>
	<div style="position:absolute; left:166px; top:654px; width:890px; height:144px;">
		<img src="includes/images/Slice_06.jpg" width="890" height="144" alt="">
	</div>
	<div style="position:absolute; left:166px; top:798px; width:890px; height:2px;">
		<img src="includes/images/Slice_07.jpg" width="890" height="2" alt="">
	</div>
</div>
<!-- End ImageReady Slices -->
		
<!---
<div align="center">
<div align="center"  style="border:1px black solid;width:700px;">
<div align="center" style="border:2px;background-color:black;color:white;width:698px;border-color:black;"> 
Semiprecious.com shop has just been moved to faster and more secure server. <br />Some errors may happen due to migration to a new software &amp; hardware.
 </div>
    <p>Our tech team and the hosting team at crystaltech.com are working round the clock to fix the issues.
</p>
This error will not impact your shopping. <span style="color:red">Please reload</span> the page and continue your shopping.<br />
To refresh or reload do any of the following:
<div align="center" width="300px">
 <ul><li><span style="color:red">Ctrl+R</span> or </li><li> <span style="color:red">F5</span> or</li><li> <span style="color:red">Browser Refresh Button</span></li></ul>
</div>
<p>If the error persists please forward the following message to <font color="#000066">cs@semiprecious.com or anuppandey@sbcglobal.net</font> 
    


      <table style="border:1px dashed red;">
<tr><td colspan=2 align=left >
    <font color="#FF0000" >The error details are:</font> <cfoutput> 
</td></tr>  <tr> 
    <td class="darkbox" width="20%">Diagnostic</td>
    <td class="darkbox">#error.Diagnostics#</td>
  </tr>
  <tr> 
    <td class="darkbox">URL</td>
    <td>#error.querystring#</td>
  </tr>
  <tr> 
    <td class="darkbox">Error Page</td>
    <td>#error.template#</td>
  </tr>
  <tr> 
    <td class="darkbox">Browser</td>
    <td>#error.browser#</td>
  </tr>
<!---   <tr>
    <td>Content</td>
    <td>#error.generatedcontent#</td>
  </tr> --->
</table></cfoutput>
<p>&nbsp;</p>
    <p><font color="#003399">Please use  browser refresh or back button to continue 
      your shopping</font>.</p>
</div>
</div> --->
</div>
</div>
</body>
