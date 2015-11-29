<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head><script language="JavaScript1.2">

// Distributed by http://www.hypergurl.com

// Scrollers width here (in pixels)
var scrollerwidth="450px"

// Scrollers height here
var scrollerheight="100px"

// Scrollers speed here (larger is faster 1-10)
var scrollerspeed=1



// Scrollers content goes here! Keep all of the message on the same line!


var scrollercontent='<center><font face="Arial" color="green" size="5"><b>Place your content here.<br> Script distributed by <a href="http://www.hypergurl.com">Hypergurl.com.</a> The scrolling message will now pause on mouseover.<br>Thanks David for the update!</b></font><center>'

var pauseit=1


// Change nothing below!

scrollerspeed=(document.all)? scrollerspeed : Math.max(1, scrollerspeed-1) //slow speed down by 1 for NS
var copyspeed=scrollerspeed
var iedom=document.all||document.getElementById
var actualheight=''
var cross_scroller, ns_scroller
var pausespeed=(pauseit==0)? copyspeed: 0

function populate(){
if (iedom){
cross_scroller=document.getElementById? document.getElementById("iescroller") : document.all.iescroller
cross_scroller.style.top=parseInt(scrollerheight)+8+"px"
cross_scroller.innerHTML=scrollercontent
actualheight=cross_scroller.offsetHeight
}
else if (document.layers){
ns_scroller=document.ns_scroller.document.ns_scroller2
ns_scroller.top=parseInt(scrollerheight)+8
ns_scroller.document.write(scrollercontent)
ns_scroller.document.close()
actualheight=ns_scroller.document.height
}
lefttime=setInterval("scrollscroller()",20)
}
window.onload=populate

function scrollscroller(){

if (iedom){
if (parseInt(cross_scroller.style.top)>(actualheight*(-1)+8))
cross_scroller.style.top=parseInt(cross_scroller.style.top)-copyspeed+"px"
else
cross_scroller.style.top=parseInt(scrollerheight)+8+"px"
}
else if (document.layers){
if (ns_scroller.top>(actualheight*(-1)+8))
ns_scroller.top-=copyspeed
else
ns_scroller.top=parseInt(scrollerheight)+8
}
}

if (iedom||document.layers){
with (document){
if (iedom){
write('<div style="position:relative;width:'+scrollerwidth+';height:'+scrollerheight+';overflow:hidden" onMouseover="copyspeed=pausespeed" onMouseout="copyspeed=scrollerspeed">')
write('<div id="iescroller" style="position:absolute;left:0px;top:0px;width:100%;">')
write('</div></div>')
}
else if (document.layers){
write('<ilayer width='+scrollerwidth+' height='+scrollerheight+' name="ns_scroller">')
write('<layer name="ns_scroller2" width='+scrollerwidth+' height='+scrollerheight+' left=0 top=0 onMouseover="copyspeed=pausespeed" onMouseout="copyspeed=scrollerspeed"></layer>')
write('</ilayer>')
}
}
}

</script> <body>

</body>
</html>
