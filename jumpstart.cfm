<!--- without the class the div body behaves unexpectedly. so class has to be used.
and the id is used to catch the div blck from javascript --->
<div   id="jumpstart">
Pages In This Selection <hr />
<cfscript>
counter = 0;
jumpstart = 1;
while( jumpstart LTE getlist.recordcount) 
{
counter = counter + 1;
writeoutput("<a href='gemstone_jewelry_gallery.cfm?category=#category#&start=#jumpstart#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#' >#counter#</a>&nbsp; ");
jumpstart = jumpstart + 10;
}
</cfscript><br>
[<a href="#"  onMouseDown="javascript:ShowHide('jumpstart')"><font color="#FF0000">Close</font></a>] <br/>
</div>