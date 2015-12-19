
<cfif not len(session.bulkbuyer.id)>
<cfparam default="centerpage" name="url.flavour" type="string" />
<cfset selection =  url.flavour />
<cfdirectory action="list" directory="#application.rootfolder#/images/#selection#/" filter="*.jpg" name="pics" type="file"  />
<cfset k = arraynew(1) />
<cfset coll.recordcount = 0 />
<cftry>
  <cfquery timeout="10"  cachedwithin="#createtimespan(0,0,0,0)#" datasource="sptm" name="coll">
	select  status, collection_id, link_to_page from collection_id_map where 1=1 and status = 'active' and start_date <= #now()# and (end_date >=#now()# or end_date is null) order by start_date desc
</cfquery>
  <cfcatch type="ANY">
  </cfcatch>
</cftry>

<cfif coll.recordcount>
  <cfquery datasource="sptm" name="pics">
	select   * from centerpics where collection_id = #coll.collection_id# and status = 'active'
	</cfquery>
  <cfelse>
  <cfset coll.link_to_page = "" />
  <cfquery datasource="sptm" name="pics">
	select   * from centerpics where  status = 'active' and collection_id is null
	</cfquery>
</cfif>
<cfif session.mail is application.admin_email>

</cfif>

<!--- <cfdump var="#pics#" /> --->
<script language=JavaScript1.2 type=text/javascript >
<!--
<cfset i_count = 0 />
<cfoutput>
var i_count = #i_count#;
var pics_array = new Array();
var text_array = new Array();
<cfloop query="pics">
 pics_array[#i_count#] = '#LOCATion#/#pics.name#';
text_array[#i_count#] = '<cfif len(text)>
<cfif len(link_to_page)>
<a style="color:inherit" href="#link_to_page#">
<cfelseif len(coll.link_to_page)><a style="color:inherit" href="#coll.link_to_page#"></cfif>#text#<cfif len(link_to_page) or len(coll.link_to_page) ></a></cfif></cfif>';

<cfset i_count = i_count + 1 />
</cfloop>


function change_image()
{
	document.getElementById("changing_image_img").src = pics_array[i_count];
	i_count++;
    if (i_count > #i_count#)
	i_count = 0 ;
	return;
}
</cfoutput>
/* slideshow working hence not starting change_image function 
 * 
 setInterval(change_image,3000);
*/
// (C) 2000 www.CodeLifter.com
// http://www.codelifter.com
// Free for all users, but leave in this  header
// NS4-6,IE4-6
// Fade effect only in IE; degrades gracefully

// =======================================
// set the following variables
// =======================================

// Set slideShowSpeed (milliseconds)
var slideShowSpeed = 5000

// Duration of crossfade (seconds)
var crossFadeDuration = 3

// Specify the image files
var Pic = new Array(); // don't touch this
// to add more images, just continue
// the pattern, adding to the array below
var Pic_text = new Array();
<cfset i_count = 0 />
<cfoutput query="pics" startrow="1" maxrows="12">
Pic[#i_count#] = '#replace(location,"\","/","All")#/#pics.name#';
<cfset i_count = i_count + 1 />
</cfoutput>
<cfset i_count = 0 />
<cfoutput query="pics" startrow="1" maxrows="12">
Pic_text[#i_count#] = '<div style="text-decoration:#pics.text_decoration#;text-align:center;border:#pics.border#;color:###pics.font_color#;background-color:###pics.bgcolor#;-ms-filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=#pics.opacity#);filter: alpha(opacity=#pics.opacity#);position:relative;opacity:#pics.opacity#"><cfif len(link_to_page)><a href="#link_to_page#"><cfelseif len(coll.link_to_page)><a href="#coll.link_to_page#"></cfif>#text#<cfif len(link_to_page) or len(coll.link_to_page) ></a></cfif></div>';
<cfset i_count = i_count + 1 />
</cfoutput>

// =======================================
// do not edit anything below this line
// =======================================

var t; var j = 0;var p = Pic.length;

var preLoad = new Array()
for (i = 0; i < p; i++){
   preLoad[i] = new Image()
   preLoad[i].src = Pic[i]
//alert(Pic[i]);
}
function runSlideShow(){
 try {
   	  
   if (document.all){
   	  document.getElementById('SlideShow').style.filter="blendTrans(duration=2)"
      document.getElementById('SlideShow').style.filter="blendTrans(duration=crossFadeDuration)"
      document.getElementById('SlideShow').filters.blendTrans.Apply()      
   }
   document.getElementById('SlideShow').src =  preLoad[j].src
   try {
   document.getElementById('center_pic_text').innerHTML =  Pic_text[j];
   }
   catch(e)
   {
  // not reading for some times. have to figure out some time later.
   }
//alert(document.getElementById('center_pic_text').innerHTML);   
   if (document.all){
      document.getElementById('SlideShow').filters.blendTrans.Play()
   }
  // alert(j);
   j = j + 1
   if (j > (p-1)) j=0;
   t = setTimeout('runSlideShow()', slideShowSpeed);
<!--- 
<cfif findnocase('MSIE',CGI.HTTP_USER_AGENT)>

var myElement = document.getElementById("lm");
myElement.style.position = "absolute";
myElement.style.zIndex = "1999";
var dElement = document.getElementById("h");
dElement.style.position = "absolute";
dElement.style.zIndex = "9299";
</cfif>
 --->
}
catch(e)
  {
}
}
-->
</script>

<!----display starts ---->

<cfif session.mail is application.admin_email>
  <a href="admintools/centerpics.cfm">Edit</a>
</cfif>
<cfelse>
<script language=JavaScript1.2 >
<!--
function runSlideShow(){
	return;
} 
-->
</script> 
</cfif>