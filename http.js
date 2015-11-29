// JavaScript Document
<!--


var req = 0; 
function loadXMLDoc(url)
 {
//alert(url);
 //branch for native XMLHtpRequest ojbect
//alert('i called successfully');

 if (window.XMLHttpRequest) {
//alert('i called successfully');
  
	  req = new XMLHttpRequest();
//  req.onreadystatechange = processReqChange;
// alert(document.getElementById("loadind").attributes[0].name);
//style.visibility = 'hidden';
//document.getElementById("loadind").style.visibility = 'visible';
 
  req.open("GET",url,true);
  req.send(null);
 }
 else if ( window.ActiveXObject) {

  req = new ActiveXObject("Microsoft.XMLHTTP");

if (req) {
 //alert(url);
// req.onreadystatechange = processReqChange;
 req.open("GET",url,true);
 //document.getElementById("loadind").style.visibility = 'visible';

 req.send();

         } 
     }

}
function hide(a)
{
	document.getElementById(a).innerHTML  = '';
	return;
}
  // JavaScript Document
//called from addcrmmessage.cfm
function inoutdone()
{
document.getElementById('submitbutton').innerHTML = '<input type="submit" value="Add Message" />' ;
return;
}
function http(args) {
 var iedcache = Math.random();
 
iedcache = iedcache*1000;
 iedcache = Math.round(iedcache*1000) + 1.00;

var url = 'http://www.semiprecious.com/headhunting/switch.cfc?method=action&'+args ;
var v = "<img src='http://www.forcesofindia.com/headhunting/images/loadingindicator.gif' border='0' align='bottom'     vspace='0'  style='margin:0px'  alt='' />&nbsp;Loading <a href='" + url+ "'>Click Here if Ajax not supported</a>";

//document.getElementById("loadind").innerHTML  = v;

//alert(v);
url = url  + '&iedcache=' + iedcache  ;
//alert(url);
loadXMLDoc(url);

return;
}




function processReqChange() {
if (req.readyState == 4) {
if (req.status == 200 ) {
 
var good = 0;

if (req.responseXML)
{
if (req.responseXML.documentElement)  // for mozilla we need to test for req.response itself and this one is for IE
{
good = 1;
}
}
if (good == 1) {

response = req.responseXML.documentElement;
//req = null ;
//response now has the first span tag and not the topmost conceptual document node
//req.responseXML is that node of type 9 as seen on the Mozilla DOM browser

var method = 0;
for (	i = 0; i < response.childNodes.length;i++)
  {
    method = response.childNodes[i];
	  if (method.nodeType == 1)  // required because of the node position is different in IE & Mozilla
    break;
  }
var destination = 'mainbody';  
var _anchor = "";
 //document.getElementById('mainbody').innerHTML ='';
for (a = 0; a < method.childNodes.length;a++)
   {
	   if (method.childNodes[a].nodeType == 1) // element type
	     {
			  if (method.childNodes[a].textContent =="" ) // this is working because this always happens to be undefined and not ""
			     destination = 'mainbody';
        else
		    	{
					destination = method.childNodes[a].childNodes[0].nodeValue;  //following from above false condition we always depend on destination in <destination tag the first child of second span tag
           //alert(method.childNodes[a].childNodes[0].attributes[0].name);
			  _anchor =  method.childNodes[a].attributes[0].value; 
					}//   alert(method.childNodes[a].childNodes[0].nodeValue);
	      break;
		 }
   }
 
for (a = 0; a < method.childNodes.length;a++)
   {
	   if (method.childNodes[a].nodeType == 4) // cdata type is the sibling of the destination tag
	     {
document.getElementById(destination).innerHTML = '';
try {
document.getElementById(destination).innerHTML =method.childNodes[a].nodeValue;
}
catch(e)
{
alert("Error occured in getting the data!");
}
 //if (_anchor!= "")
 	if ( _anchor =="true")
		         window.location.href = "#"+destination;
	 document.getElementById("loadind").style.visibility = 'hidden'; //works for IE. Have to test for FF also				
break;
		 }
   }
}
}}} 
-->  
  
 