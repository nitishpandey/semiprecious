<html><head><title>Rate Jewelry Designs</title>
<script type="text/javascript" src="/javascript/zoom.js" ></script>
</head>
<body>

<table width="400px" cellspacing="0" cellpadding="1" border="0" align="right">
<tbody><tr><!-- TD align="left" width=8>&nbsp;</TD -->
<td width="68%" align="left" style="padding-top: 3px; padding-bottom: 3px;" class="tablerowwhite" id="poll_items_130765">Great</td>
<td nowrap="" width="25%" valign="top" align="right" class="tablerowwhite">
<input type="hidden" value="2" id="rank-menu-130765" />
<cfset newitem= 11020 />
<cfoutput>
<img onclick="rate_item( 1,#newitem#)" onmouseover="this.style.cursor='pointer'" src="/images/star_off.gif" id="star_1" title="Extremely Poor" />
<img onclick="rate_item( 2,#newitem#)" onmouseover="this.style.cursor='pointer'" src="/images/star_off.gif" id="star_2" title="Poor" />
<img onclick="rate_item( 3,#newitem#)" onmouseover="this.style.cursor='pointer'" src="/images/star_off.gif" id="star_3" title="OK" />
<img onclick="rate_item( 4,#newitem#)" onmouseover="this.style.cursor='pointer'" src="/images/star_off.gif" id="star_4" title="Good" />
<img onclick="rate_item( 5,#newitem#)" onmouseover="this.style.cursor='pointer'" src="/images/star_off.gif" id="star_5" title="Excellent" />
</cfoutput>
</td>
<td width="22%" style="padding-left: 20px;" id="show-process-img-130765"></td></tr>
<tr>
<td align="left" style="padding-left: 60px; padding-top: 8px;" colspan="3">
<div class="generalTextSmallBrownSmall" style="float: left;">To remove rating, click the same star again</div><div style="float: right;"><a onclick="blindDown('showhide_results_id');" class="generalTextLinkColor5" href="javascript:;" id="pollresults_link_id" style="display: none;">Show Results</a></div></td></tr></tbody></table>
<!---
<cfquery datasource="sptm" password="rangeela" username="nitish" name="q1">
			create table item_rating (itemid int not null, excellent mediumint unsigned  default '0', 
			  very_good mediumint unsigned  default '0', good mediumint unsigned  default '0', ok mediumint unsigned  default '0',
			   poor mediumint unsigned  default '0', very_poor mediumint unsigned  default '0', 
			   rating tinyint default '0',   vote_count mediumint unsigned  default '0', constraint unq 
			   primary key (itemid))
			   </cfquery>
	--->		   
create a table that has itemid, vote count, voting total, average (derived value)
develop a CFC item_handler. add to it it's first method 'vote
second method get_rating - returns average value (0 to 5). 0 is not voted yet.
create a div with the rating UI.
create a div "rating". On click bring in the rating UI.
call goprocess based on star no, item id
use go process to develop the URL for voting and turn on stars on for 1 to the position of current vote. 
call URL, show working gif, turn stars Off then ON, replace working with done gif. 
Show current rating
</body>
</html>