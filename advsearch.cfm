<cfparam name="leftgemstonedisplay" default="none" />
<cfparam name="leftcolordisplay" default="none" />
<cfparam name="leftpricedisplay" default="open" />
<cfparam name="leftbirthstonedisplay" default="none" />
<cfparam name="category" default="all">
<cfparam name="categ" default="jewelry">
<cfif category neq "" and category neq "all" and category neq "chains"  >
	<cfset categ = category>
<cfelse>
  <cfset categ = "jewelry">
</cfif>

<cfquery name="stonelistpopular" datasource="gemssql"  cachedwithin="#createtimespan(0,1,0,0)#">
    select cat, stone,  style, count(stone) as inventory,   popular
    from items, ltbstonesmaster
    where inventory>0 and items.subCAT=ltbstonesmaster.stone
    group by cat, stone,style,  popular order by cat,popular desc , stone
</cfquery>

<cfquery name="stonelist" dbtype="query">
	Select distinct stone as subcat2
    from  stonelistpopular
	<cfif category neq 'beads' and category neq  'gems' and category neq  'brooches'  and category neq 'healing'>
        where popular=1
    </cfif>
</cfquery>

<cfoutput>
    <form action="" method="post" name="frmAdvSearch">
        <div id="mySelect" class="styled-select" >
            <select onChange="fnSearchByGemstones(this);" name="selByGem" id="selByGem">
                <option value="-1">Gemstones</option>
                <cfloop query="stonelist" >
                	<cfset subcat3 = replace(trim(lcase(subcat2)),"_","")>
					<cfset subcat4 = subcat3>
                    <cfset subcat3 = replace(trim(subcat3)," ","")>
                    <option value="#lcase(subcat3)#">#subcat2#</option>
                </cfloop>
            </select>
        </div>
        <div id="mySelect1" class="styled-select">
            <select name="selByColor" id="selByColor" onChange="fnSearchByColor(this);">
                <option value="-1">Color</option>
                <cfloop index="Color1" list="#application.color_list#">
                    <cfif category eq "all" or category eq "" >
                        <option value="#Color1#_1">#Color1#</option>
                    <cfelse>
                        <option value="#Color1#_2">#Color1#</option>
                    </cfif>
                </cfloop>
            </select>
        </div>
        <div id="mySelect2" class="styled-select">
            <select name="selByType" id="selByType" onChange="fnSearchByTypes(this);">
                <option value="-1">Types</option>
                <option value="Gems">Gems</option>
                <option value="Pendants">Pendants</option>
                <option value="Rings">Rings</option>
                <option value="Earrings">Earrings</option>
                <option value="Necklaces">Necklaces</option>
                <option value="Bracelets">Bracelets</option>
                <option value="Cuffins">Cuffins</option>
                <option value="Earrings">Earrings</option>
                <option value="Healing">Healing</option>
                <option value="Beads">Beads</option>
            </select>
        </div>
        <div id="mySelect3" class="styled-select">
            <select name="selByPrice" id="selByPrice" onChange="fnSearchByPrice(this);">
                <option value="-1">Price Ranges</option>
                <cfif session.country neq 'india'>
                    <cfif len(session.bulkbuyer.id)>
                        <option value="under10">under #round_format(10)#</option>
                        <option value="11to20">#round_format(11)# to #round_format(20)#</option>
                        <option value="21to30">#round_format(21)# to #round_format(30)#</option>
                    </cfif>
                    <option value="under30">Under #round_format(30)#</option>
                    <option value="30to50">#round_format(30)# to #round_format(50)#</option>
                    <option value="50to100">#round_format(50)# to #round_format(100)#</option>
                    <cfif not len(session.bulkbuyer.id)>
                        <option value="above100">Over #round_format(100)#</option>
                    </cfif>
                <cfelseif session.country is "india">
                    <option value="under500">Upto Rs 500</option>
                    <option value="500to1250">Rs 500 to Rs 1250</option>
                    <option value="1000to2500">Rs 1000 to Rs 2500</option>
                    <option value="2000to5000">Rs 2000 to Rs 5000</option>
                    <option value="above5000">Above Rs 5000</option>
                </cfif>
            </select>
        </div>
    </form>
</cfoutput>
<script type="text/javascript">

	function fnSearchByGemstones(ele){

		if(ele.value != -1){
			document.frmAdvSearch.action = "/"+ele.value+".cfm"
		}
		document.frmAdvSearch.submit();
	}


	function fnSearchByColor(ele){

		var arrColorLink = ele.value.split('_')
		<cfoutput>var categ = '#categ#'</cfoutput>
		if(arrColorLink[1] == 1){
			document.frmAdvSearch.action = '/'+arrColorLink[0]+'-gemstone-jewelry.cfm'
		}
		else{
			document.frmAdvSearch.action = '/color-gem-stone/'+arrColorLink[0]+'-'+categ+'.cfm'
		}
		document.frmAdvSearch.submit();
	}


	function fnSearchByTypes(ele){

		if(ele.value == 'Gems'){
			document.frmAdvSearch.action = "/gems.cfm"
		}
		else if(ele.value == 'Pendants'){
			document.frmAdvSearch.action = "/gem-stone-pendants.cfm"
		}
		else if(ele.value == 'Rings'){
			document.frmAdvSearch.action = "/gem-stone-rings.cfm"
		}
		else if(ele.value == 'Earrings'){
			document.frmAdvSearch.action = "/gem-stone-earrings.cfm"
		}
		else if(ele.value == 'Necklaces'){
			document.frmAdvSearch.action = "/gem-stone-necklaces.cfm"
		}
		else if(ele.value == 'Bracelets'){
			document.frmAdvSearch.action = "/gem-stone-bracelets.cfm"
		}
		else if(ele.value == 'Cuffins'){
			document.frmAdvSearch.action = "/gem-stone-cufflinks.cfm"
		}
		else if(ele.value == 'Brooches'){
			document.frmAdvSearch.action = "/gem-stone-brooches.cfm"
		}
		else if(ele.value == 'Healing'){
			document.frmAdvSearch.action = "/gem-stone-healing.cfm"
		}
		else if(ele.value == 'Beads'){
			document.frmAdvSearch.action = "/gem-stone-beads.cfm"
		}
		document.frmAdvSearch.submit();
	}

	function fnSearchByPrice(ele){

		if(ele.value == 'under10'){
			document.frmAdvSearch.action = "/jewelry-under-$10.cfm?"
		}
		else if(ele.value == '11to20'){
			document.frmAdvSearch.action = "/jewelry-under-$20.cfm?"
		}
		else if(ele.value == '21to30'){
			document.frmAdvSearch.action = "/gemstone_jewelry_gallery.cfm?priceless=30&pricegreater=20"
		}
		else if(ele.value == 'under30'){
			document.frmAdvSearch.action = "/jewelry-under-$30.cfm?priceless=30&pricegreater=0"
		}
		else if(ele.value == '30to50'){
			document.frmAdvSearch.action = "/jewelry-under-$50.cfm?pricegreater=30&priceless=50"
		}
		else if(ele.value == '50to100'){
			document.frmAdvSearch.action = "/jewelry-under-$100.cfm?pricegreater=50&priceless=100"
		}
		else if(ele.value == 'above100'){
			document.frmAdvSearch.action = "/jewelry-under-$150.cfm?pricegreater=100&priceless=2000"
		}
		<cfoutput>
		else if(ele.value == 'under500'){
			document.frmAdvSearch.action = "/gemstone_jewelry_gallery.cfm?pricegreater=#(0/application.exch['india'])#&priceless=#(500/application.exch['india'])#&category=#categ#"
		}
		else if(ele.value == '500to1250'){
			document.frmAdvSearch.action = "/gemstone_jewelry_gallery.cfm?pricegreater=#(500/application.exch['india'])#&priceless=#(1250/application.exch['india'])#&category=#categ#"
		}
		else if(ele.value == '1000to2500'){
			document.frmAdvSearch.action = "/gemstone_jewelry_gallery.cfm?pricegreater=#(1000/application.exch['india'])#&priceless=#(2500/application.exch['india'])#&category=#categ#"
		}
		else if(ele.value == '2000to5000'){
			document.frmAdvSearch.action = "/gemstone_jewelry_gallery.cfm?pricegreater=#(2000/application.exch['india'])#&priceless=#(5000/application.exch['india'])#&category=#categ#"
		}
		else if(ele.value == 'above5000'){
			document.frmAdvSearch.action = "/gemstone_jewelry_gallery.cfm?pricegreater=#(5000/application.exch['india'])#&priceless=#(20000/application.exch['india'])#&category=#categ#"
		}
		</cfoutput>
		document.frmAdvSearch.submit();
	}
</script>