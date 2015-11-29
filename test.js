// JavaScript Document
//setTimeout("localLoadXMLDoc()",3000);
// JavaScript Document
var acknowledged = 1;
var lastcartid = 0;
//alert('loaded');
function setLastCartid(cartid) { // this function has to be called by dynamically written script 
 alert("last cartid updated");
 lastcartid = cartid;
 return;
}

function processReqChange() 
{
if (req.readyState == 4 ) {
if ( req.status == 200 ) {
if (req.responseXML) 
{
if (req.responseXML.documentElement)  {
response = req.responseXML.documentElement ;
cartid = response.getElementsByTagName('latestpaidcartid')[0].firstChild.data ;
//alert(req.status);
if ( cartid) {
} //eof  if ( cartid ) {

} // end of if (req.responseXML.documentElement)  {
 else
 {
 alert(201);
 }

} // end of  if (req.responseXML) 
 else
 {
 alert(204);
 }

} //ed  if ( req.status = 200 )
 else
 {
 alert(208);
 }

} //eo if (req.state == 4 )

} // end of callback function
