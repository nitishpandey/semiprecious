<cftry>
<CFAPPLICATION name="semiprecious" clientmanagement="no" sessionManagement="yes" setclientcookies="yes"  sessionTimeOut="#CreateTimeSpan(0,6,0,0)#"   />
<cferror exception="any"  type="exception" template="exceptionerrorhandler.cfm">
<cferror  type="request" template="requesterrorhandler.cfm">
<cfparam default="0911125919043" name="application.indiaphone" type="numeric" />
<cfscript>
application.friend_credit = 7.5 ;
Application.jandjcontact = '512 355 1095 (USA)';
Application.jngcontact = '512 355 1095 (USA)';
 application.tollfree = '1866-8197692'  ;
</cfscript>
<cfparam name="application.silver.beadstones" default="">
<cfif not  isdefined("Application.active") or isdefined("url.resettheapplication")>
<!--- uniq cartid --->
<cfset application.silver.ornamentstones = "">
<cfset application.ornamentstones = "">
<cfset application.ringstones = "silver">
<cfquery datasource="gemssql" name="q_cartid">
select TOP 1 cartid , indate from cartstatus order by indate desc
</cfquery>
<cfset application.cartid =  q_cartid.cartid*1 +5  >
<cfset Application.nlerrorcount = 5>
<CFQUERY datasource="gemssql" NAME="getsubcat">
Select distinct stone as subcat from CatSubCatInStock
</cfquery>
<cfset temp = "">
<cfloop query="getsubcat">
<cfloop list="#subcat#" index="subsubcat">
<cfif  not listfindnocase(temp,trim(lcase(subsubcat)))>
<cfset temp = listappend(temp,trim(lcase(subsubcat)))>
</cfif>
</cfloop>
</cfloop>
<cfset Application.allstones = listsort(temp,"text")>
<cfset application.alltones = application.allstones >
<cfset application.alltonesns = application.allstones >

<CFQUERY datasource="gemssql" NAME="getsubcat">
Select distinct stone as subcat from CatSubCatInStock where  ( cat = 'necklaces')
</cfquery>
<cfset temp = "">
<cfloop query="getsubcat">
<cfloop list="#subcat#" index="subsubcat">
<cfif  not listfindnocase(temp,trim(lcase(subsubcat)))>
<cfset temp = listappend(temp,trim(lcase(subsubcat)))>
</cfif>
</cfloop>
</cfloop>
<Cfset Application.necklacestones = listsort(temp,"text")>
<Cfset Application.necklacestonesns = Application.necklacestones >

<CFQUERY datasource="gemssql" NAME="getsubcat">
Select distinct stone as subcat from CatSubCatInStock where  ( cat = 'healing')
</cfquery>
<cfset temp = "">
<cfloop query="getsubcat">
<cfloop list="#subcat#" index="subsubcat">
<cfif  not listfindnocase(temp,trim(lcase(subsubcat)))>
<cfset temp = listappend(temp,trim(lcase(subsubcat)))>
</cfif>
</cfloop>
</cfloop>
<Cfset Application.healingtones = listsort(temp,"text")>
<Cfset Application.healingtonesns = Application.healingtones >

<CFQUERY datasource="gemssql" NAME="getsubcat">
Select distinct stone as subcat from CatSubCatInStock where ( cat = 'EARRINGS')
</cfquery>
<cfset temp = "">
<cfloop query="getsubcat">
<cfloop list="#subcat#" index="subsubcat">
<cfif  not listfindnocase(temp,trim(lcase(subsubcat)))>
<cfset temp = listappend(temp,trim(lcase(subsubcat)))>
</cfif>
</cfloop>
</cfloop>
<cfset Application.earringstones = listsort(temp,"text") />
<cfset Application.earringstonesns = Application.earringstones />

<CFQUERY datasource="gemssql" NAME="getsubcat">
Select distinct stone as subcat from CatSubCatInStock where ( cat = 'RINGS')
</cfquery>
<cfset temp = "">
<cfloop query="getsubcat">
<cfloop list="#subcat#" index="subsubcat">
<cfif  not listfindnocase(temp,trim(lcase(subsubcat)))>
<cfset temp = listappend(temp,trim(lcase(subsubcat)))>
</cfif>
</cfloop>
</cfloop>
<cfset Application.ringstones = listsort(temp,"text") />
<cfset Application.ringstonesns = Application.ringstones />

<CFQUERY datasource="gemssql" NAME="getsubcat">
Select distinct stone as subcat from CatSubCatInStock where ( cat = 'bracelets')
</cfquery>
<cfset temp = "">
<cfloop query="getsubcat">
<cfloop list="#subcat#" index="subsubcat">
<cfif  not listfindnocase(temp,trim(lcase(subsubcat)))>
<cfset temp = listappend(temp,trim(lcase(subsubcat)))>
</cfif>
</cfloop>
</cfloop>
<cfset Application.braceletstones = listsort(temp,"text") />
<cfset Application.braceletstonesns = Application.braceletstones />

<CFQUERY datasource="gemssql" NAME="getsubcat">
Select distinct stone as subcat from CatSubCatInStock where (  cat = 'PENDANTS')
</cfquery>

<cfset temp = "">
<cfloop query="getsubcat">
<cfloop list="#subcat#" index="subsubcat">
<cfif  not listfindnocase(temp,trim(lcase(subsubcat)))>
<cfset temp = listappend(temp,trim(lcase(subsubcat)))>
</cfif>
</cfloop>
</cfloop>
<cfset Application.pendantstones  = listsort(temp,"text")>
<cfset Application.pendantstonesns  =  Application.pendantstones />

<CFQUERY datasource="gemssql" NAME="getsubcat">
Select distinct stone as subcat from CatSubCatInStock where (  cat = 'beads')
</cfquery>

<cfset temp = "">
<cfloop query="getsubcat">
<cfloop list="#subcat#" index="subsubcat">
<cfif  not listfindnocase(temp,trim(lcase(subsubcat)))>
<cfset temp = listappend(temp,trim(lcase(subsubcat)))>
</cfif>
</cfloop>
</cfloop>
<cfset Application.beadstones  = listsort(temp,"text")>
<cfset Application.beadstonesns  =  Application.pendantstones />

<CFQUERY datasource="gemssql" NAME="getsubcat">
Select distinct stone as subcat from CatSubCatInStock where (cat = 'NECKLACES' OR  CAT ='BRACELETS' OR CAT='RINGS' OR CAT ='EARRINGS' OR CAT ='pENDANTS' ) and style like '%silver%'
</cfquery>
<cfset temp = "">
<cfloop query="getsubcat">
<cfloop list="#subcat#" index="subsubcat">
<cfif  not listfindnocase(temp,trim(lcase(subsubcat)))>
<cfset temp = listappend(temp,trim(lcase(subsubcat)))>
</cfif>
</cfloop>
</cfloop>
<cfset Application.silver.alltones = listsort(temp,"text")>
<cfset application.silver.tones = application.silver.alltones >

<CFQUERY datasource="gemssql" NAME="getsubcat">
Select distinct stone as subcat from CatSubCatInStock where  ( cat = 'NECKLACES') and style like '%silver%'
</cfquery>
<cfset temp = "">
<cfloop query="getsubcat">
<cfloop list="#subcat#" index="subsubcat">
<cfif  not listfindnocase(temp,trim(lcase(subsubcat)))>
<cfset temp = listappend(temp,trim(lcase(subsubcat)))>
</cfif>
</cfloop>
</cfloop>
<Cfset Application.silver.necklacestones = listsort(temp,"text")>
<CFQUERY datasource="gemssql" NAME="getsubcat">
Select distinct stone as subcat from CatSubCatInStock where  ( cat = 'healing') and style like '%silver%'
</cfquery>
<cfset temp = "">
<cfloop query="getsubcat">
<cfloop list="#subcat#" index="subsubcat">
<cfif  not listfindnocase(temp,trim(lcase(subsubcat)))>
<cfset temp = listappend(temp,trim(lcase(subsubcat)))>
</cfif>
</cfloop>
</cfloop>
<Cfset Application.silver.healingtones = listsort(temp,"text")>

<CFQUERY datasource="gemssql" NAME="getsubcat">
Select distinct stone as  subcat from CatSubCatInStock where ( cat = 'EARRINGS') and style like '%silve%'
</cfquery>
<cfset temp = "">
<cfloop query="getsubcat">
<cfloop list="#subcat#" index="subsubcat">
<cfif  not listfindnocase(temp,trim(lcase(subsubcat)))>
<cfset temp = listappend(temp,trim(lcase(subsubcat)))>
</cfif>
</cfloop>
</cfloop>
<cfset Application.silver.earringstones = listsort(temp,"text")>

<CFQUERY datasource="gemssql" NAME="getsubcat">
Select distinct stone as  subcat from CatSubCatInStock where ( cat = 'bracelets') and style like '%silve%'
</cfquery>
<cfset temp = "">
<cfloop query="getsubcat">
<cfloop list="#subcat#" index="subsubcat">
<cfif  not listfindnocase(temp,trim(lcase(subsubcat)))>
<cfset temp = listappend(temp,trim(lcase(subsubcat)))>
</cfif>
</cfloop>
</cfloop>
<cfset Application.silver.braceletstones = listsort(temp,"text")>

<CFQUERY datasource="gemssql" NAME="getsubcat">
Select distinct stone as  subcat from CatSubCatInStock where ( cat = 'RINGS') and style like '%silve%'
</cfquery>
<cfset temp = "">
<cfloop query="getsubcat">
<cfloop list="#subcat#" index="subsubcat">
<cfif  not listfindnocase(temp,trim(lcase(subsubcat)))>
<cfset temp = listappend(temp,trim(lcase(subsubcat)))>
</cfif>
</cfloop>
</cfloop>
<cfset Application.silver.ringstones = listsort(temp,"text")>


<CFQUERY datasource="gemssql" NAME="getsubcat">
Select distinct stone as  subcat from CatSubCatInStock where ( cat = 'Pendants') and style like '%silve%'
</cfquery>
<cfset temp = "">
<cfloop query="getsubcat">
<cfloop list="#subcat#" index="subsubcat">
<cfif  not listfindnocase(temp,trim(lcase(subsubcat)))>
<cfset temp = listappend(temp,trim(lcase(subsubcat)))>
</cfif>
</cfloop>
</cfloop>
<cfset Application.silver.pendantstones  = listsort(temp,"text")>

<CFQUERY datasource="gemssql" NAME="getsubcat">
Select distinct stone as  subcat from CatSubCatInStock where ( cat = 'Anklets') and style like '%silve%'
</cfquery>
<cfset temp = "">
<cfloop query="getsubcat">
<cfloop list="#subcat#" index="subsubcat">
<cfif  not listfindnocase(temp,trim(lcase(subsubcat)))>
<cfset temp = listappend(temp,trim(lcase(subsubcat)))>
</cfif>
</cfloop>
</cfloop>
<cfset Application.silver.ankletstones  = listsort(temp,"text")>


<!--- the list of silverstones is hardcoded, hence may need revsion from time to time. run getsilverstones.cfm for seeing the list --->
<cfset application.silverstones ="amethyst,garnet,goldstone,peridot,bead,smokey topaz,aventurine,jade,blue topaz,moonstone,carnelian,chain-,chalcedony,citrine,mixed stones,iolite,sandstone,zirconia,labrodite,lapis lazuli,malachite,aquamarine,onyx,moss agate,pearl,rose quartz,amber,tiger eye,turquoise,tourmaline">
<cfset application.active = 1>
</cfif>

<!--- nirup. i have just shuffled the cfif stmts to get any other indications --->
<CFIF not isDefined("session.cartitems")>
	<CFSET session.cartitems="">

</CFIF>

	<CFparam default="0" name="session.cartid">
<CFIF not isDefined("session.mail")>
<cfif isdefined("cookie.india")>
<cfset session.india = 1>
</cfif>

	<CFSET session.mail="">
	<cfset session.start = Now()>
<cfif isdefined("cgi.HTTP_REFERER") >
	<cfset session.comingfrom =   'h' & replacenocase(replacenocase(cgi.HTTP_REFERER ,'.com',''),'http://','')  >
<cfelse>
<cfset session.comingfom = "Notknown" >
		</CFIF>
<cfif isdefined("cgi.QUERY_STRING")>

		<cfset session.thispage = mid(getbasetemplatepath(),25,25) &  "?" & urldecode(CGI.QUERY_STRING) & urldecode(CGI.pathinfo)>
		<cfelse>
				<cfset session.thispage = mid(getbasetemplatepath(),25,25) &  "?"  & urldecode(CGI.pathinfo)>
	</cfif>
</cfif>

<CFIF not isDefined("session.edit")>
	<CFSET session.edit="">

</CFIF>


<CFIF not isDefined("session.affil")>
	<CFSET session.affil="-">
</CFIF>


<CFIF not isDefined("session.priceless")>
	<CFSET session.priceless="">

</CFIF>



<cfparam name="session.filter" default="subcat=silver">
<cfparam name="url.from" default="#session.filter#">
<cfparam name="session.screenwidth" default="833"> <!--- dont change this value or elses
screenwidth.cfm will not log screen width --->
<CFIF not isDefined("session.cartitem")>
<cfset session.grandtotal = 0>
	<CFSET session.cartitem=ArrayNew(2)>
<Cfset session.cartitem[1][1] = 0>
<cfset session.ajaxcheck = -1>
<cfset session.totalqty = 0>
<Cfset session.cartitem[1][4] = 0>
<cfif isdefined("cookie.cartinfile")>
<cfif  not isdefined("url.noredirect")>
<cfinclude template="fillcart2.cfm">
</cfif>
</cfif>
<cfif  isdefined("cookie.jandjcartinfile")>
<cfinclude template="jandjfillcart2.cfm">
</cfif>
<cfif  isdefined("cookie.youngcartinfile")>
<cfinclude template="youngfillcart2.cfm">
</cfif>
<cfif isdefined("cookie.diannecartinfile")>
<cfinclude template="diannefillcart2.cfm">
</cfif>
<cfif isdefined("cookie.jngcartinfile")>
<cfinclude template="jngfillcart2.cfm">
</cfif>
</CFIF>
 <cfcatch type="any">
<CFAPPLICATION name="semiprecious"  sessionTimeOut="#CreateTimeSpan(0,0,0,0)#" sessionManagement="yes" />
There was an internal error or your browser cookies were corrupted or the server just crashed on you. Click <a href="http://www.semiprecious.com/">here</a> to continue.
<cfoutput>#cfcatch.Detail# #cfcatch.Message# #cfcatch.Type#</cfoutput>
<!---
<cfmail cc="nitish@semiprecious.com" to="anup@semiprecious.com"  subject="session invalid" server="Mail23" from="service@semiprecious.com" >
Hmmm #cfcatch.Detail# #cfcatch.Message# #cfcatch.Type#
</cfmail>
--->
<cflocation addtoken="no" url="sitedown.htm">
<cfabort />

<!---- <CFAPPLICATION name="semiprecious" sessionTimeOut="#CreateTimeSpan(0,6,0,0)#" sessionManagement="yes" />
<cfoutput>#session.URLToken#, #session.CFID#, </cfoutput> --->

</cfcatch>
</cftry>

