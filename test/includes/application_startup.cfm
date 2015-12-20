			<cfscript>
				application.paymode_stage1 = 'pp,auth.net,ccavenu,arb1,AUTH.NET,ichck,goog,chck,authphone,ebs';
				application.paymode_shipped = 'paypal,wellscc,ccav,ichk,google,check,wellsphone,eebeess';
				application.friend_credit = 7.5 ; // this needs to be stored in the db with the user sign on
	            application.cat_list = "gems,rings,earrings,pendants,brooches,necklaces,bracelets,anklets,beads,chains,healing,cufflinks" ;
	            application.category_list = 	            application.cat_list;
			    application.friend_credit = 7.5;
				application.owncredit=20;
				application.own_credit=20;
				application.signup_points = 5 ;
				application.signup_credit = 5;
			 	application.indiaphone='098735-11801 (9AM to 5PM Except SUN)';
			    application.tollfree = '1-888-879-9461'  ;
				application.arb_amount = 100 ;
		 	 	application.retail_free_shipping = 50 ; // only for international orders.
		  	 	application.exchangerate = 45 ;
	        	application.bulkbuyer.fivehundreddiscount= 5 ;
	    	    application.bulkbuyer.thousanddiscount= 10 ;
				application.bulkbuyer.twothousanddiscount= 15 ;
				application.bulkbuyer.minamt = 200 ;
				application.bulkbuyer.arb_minamt=300 ;
			  	application.variety_count = 7091;
              	application.wholesale_guest = 'guest@wholesale.com';
				application.in_store = 8.12 ;
				application.india_log0 = "/india/images/semiprecious_logo.jpg";
			    application.bg_image = "/images/header_bg.jpg" ;
			    application.live_support = 0 ;

			    application.color_list="black,blue,brown,green,gray,multi-color,orange,pink,purple,red,white,yellow" ;
			   	   application.admin_email = "acematnari@vsnl.com";
			 		application.exch["india"] = 27.5 ;
					application.exch["row"] = application.exchangerate;
	   </cfscript>
			<!--- uniq cartid --->

	        	<cfparam name="application.silver.beadstones" default="">

				<cfset application.silver.ornamentstones = "">
				<cfset application.ornamentstones = "">
				<cfset application.ringstones = "silver">
				<cfquery datasource="gemssql" name="q_cartid">
				select TOP 1 cartid , indate from cartstatus order by cartid desc
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
				Select distinct stone as subcat from CatSubCatInStock where ( cat = 'CUFFLINKS')
				</cfquery>
				<cfset temp = "">
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
						Select distinct stone as subcat from CatSubCatInStock where (  cat = 'gems')
					</cfquery>

				<cfset temp = "">
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
				 <!--- end of application start up process --->
