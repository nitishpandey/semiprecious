<cfcomponent  displayname="application_startup" >

	<cffunction name="init" access="public" hint="to be called from onapplicationstart method of application.cfc only">
		<cfscript>

			set_business_properties();
			setup_cart_id();
			set_collection_properties();
		</cfscript>
		<!--- end of application start up process --->
		<cfset application.active = 1 />
	</cffunction>

	<!--- private functions --->

	<cffunction name="set_business_properties" access="private" hint="used here in application_startup.cfc" description="sets a whole host of string and numeric properties that can come from DB,code or properties file" returntype="void" >
		<cfscript>
			application.paymode_stage1 = 'pp,auth.net,ccavenu,arb1,AUTH.NET,ichck,goog,chck,authphone,ebs';
			application.paymode_shipped = 'paypal,wellscc,ccav,ichk,google,check,wellsphone,eebeess';
			application.friend_credit = 7.5; // this needs to be stored in the db with the user sign on
			application.cat_list = "gems,rings,earrings,pendants,brooches,necklaces,bracelets,anklets,beads,chains,healing,cufflinks";
			application.category_list = application.cat_list;
			application.friend_credit = 7.5;
			application.owncredit = 20;
			application.own_credit = 20;
			application.signup_points = 5;
			application.signup_credit = 5;
			application.indiaphone = '09910815132 (9AM to 5PM Mon to Sat)';
			application.tollfree = '1-888-879-9461';
			application.arb_amount = 100;
 			application.mail_server = 'mail23.webcontrolcenter.com';
			application.exchangerate = 45;
			application.bulkbuyer.fivehundreddiscount = 5;
			application.bulkbuyer.thousanddiscount = 10;
			application.bulkbuyer.twothousanddiscount = 15;
			application.bulkbuyer.minamt = 200;
			application.bulkbuyer.arb_minamt = 300;
			application.tollfree = '<font color="purple">512-666-GEMS(4367)</font>' ;
			  application.wholesale_guest = 'guest@wholesale.com';
			application.retail_free_shipping = 50;
			application.variety_count = 9272;
			application.in_store = 8.12;
			application.india_log0 = "/india/images/semiprecious_logo.jpg";
			application.bg_image = "/images/header_bg.jpg";
			application.live_support = 0;
			application.color_list = "black,blue,brown,green,gray,multi-color,orange,pink,purple,red,white,yellow";
			application.admin_email = "anupstacy@gmail.com";
			application.exch["india"] = 27.5;
			application.exch["row"] = application.exchangerate;
		 Application.nlerrorcount = 5 ;
		 application.silver.ornamentstones = "" ;
		 application.ornamentstones = "" ;
		 application.ringstones = "silver";
		 application.silver.beadstones = "" ;
		 </cfscript>
	</cffunction>

	<cffunction name="setup_cart_id" access="private" description="sets up application scope cart id which is used to discover next cart id for every visitor">
		<cftry>
			<cfquery datasource="gemssql" name="q_cartid">
					select TOP 1 cartid , indate from cartstatus order by cartid desc
				</cfquery>
			<cfset application.cartid =  q_cartid.cartid*1 +5  />
			<cfcatch type="any">
				<!--- Is the database down? Is the DB not configured or are we testing? --->
				<cfif isdefined("url.this_is_testing")>
					<cfset application.cartid = 1 />
				<cfelse>
					From:
					<cfoutput>
						<cfscript>
							writeoutput(getcurrenttemplatepath());
						</cfscript>
					</cfoutput>	If you think that you are actually testing then please include in url "this_is_testing=true"
					<cfabort />
				</cfif>
			</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="set_collection_properties" access="private" hint="used here within application_startup.cfc" description="sets a whole host of string and numeric properties that can come from DB,code or properties file" returntype="void" >
		<CFQUERY datasource="gemssql" NAME="getsubcat">
					Select distinct stone as subcat from CatSubCatInStock
				</cfquery>
		<cfset temp = "" />
		<cfloop query="getsubcat">
			<cfloop list="#subcat#" index="subsubcat">
				<cfif  not listfindnocase(temp,trim(lcase(subsubcat)))>
					<cfset temp = listappend(temp,trim(lcase(subsubcat)))>
				</cfif>
			</cfloop>
		</cfloop>
		<cfset Application.allstones = listsort(temp,"text") />
		<cfset application.alltones = application.allstones />
		<cfset application.alltonesns = application.allstones />
		<CFQUERY datasource="gemssql" NAME="getsubcat">
					Select distinct stone as subcat from CatSubCatInStock where  ( cat = 'necklaces')
				</cfquery>
		<cfset temp = "" />
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
		<cfset temp = "" />
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
		<cfset temp = "" />
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
		<cfset temp = "" />
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
				Select distinct stone as subcat from CatSubCatInStock where ( cat = 'CUFFLINKS')
				</cfquery>
		<cfset temp = "" />
		<cfloop query="getsubcat">
			<cfloop list="#subcat#" index="subsubcat">
				<cfif  not listfindnocase(temp,trim(lcase(subsubcat)))>
					<cfset temp = listappend(temp,trim(lcase(subsubcat)))>
				</cfif>
			</cfloop>
		</cfloop>
		<cfset Application.cufflinkstones = listsort(temp,"text") />
		<cfset Application.cufflinkstonesns = Application.cufflinkstones />
		<CFQUERY datasource="gemssql" NAME="getsubcat">
					Select distinct stone as subcat from CatSubCatInStock where ( cat = 'bracelets')
				</cfquery>
		<cfset temp = "" />
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
		<cfset temp = "" />
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
		<cfset temp = "" />
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
						Select distinct stone as subcat from CatSubCatInStock where (  cat = 'gems')
					</cfquery>
		<cfset temp = "" />
		<cfloop query="getsubcat">
			<cfloop list="#subcat#" index="subsubcat">
				<cfif  not listfindnocase(temp,trim(lcase(subsubcat)))>
					<cfset temp = listappend(temp,trim(lcase(subsubcat)))>
				</cfif>
			</cfloop>
		</cfloop>
		<cfset Application.gemstones  = listsort(temp,"text")>
		<cfset Application.gemstonesns  =  Application.gemstones />
		<CFQUERY datasource="gemssql" NAME="getsubcat">
					Select distinct stone as subcat from CatSubCatInStock where (cat = 'NECKLACES' OR  CAT ='BRACELETS' OR CAT='RINGS' OR CAT ='EARRINGS' OR CAT ='pENDANTS' OR CAT ='cufflinkS' ) and style like '%silver%'
				</cfquery>
		<cfset temp = "" />
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
		<cfset temp = "" />
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
		<cfset temp = "" />
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
		<cfset temp = "" />
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
		<cfset temp = "" />
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
		<cfset temp = "" />
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
		<cfset temp = "" />
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
	</cffunction>

</cfcomponent>
