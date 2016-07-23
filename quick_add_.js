// JavaScript Document

function zoom_window(k,cat,rc){
	var j = k+"_in_cart";
	var colcount = 5;
	var rowno = rc -1;
	// 20 is the current paging size. when this changes this code will break
	rowno = Math.ceil((rc % 20) / colcount);
	if (rowno == 0) 
		rowno = 5;

		if (k)
		{ 
			var zwindow = "zw_"+rowno;
			document.getElementById("zw_1").innerHTML ='<span style="display:none;"></span>';
			document.getElementById("zw_2").innerHTML ='<span style="display:none;"></span>';
			document.getElementById("zw_3").innerHTML ='<span style="display:none;"></span>';
			document.getElementById("zw_4").innerHTML ='<span style="display:none;"></span>';
	document.getElementById("zw_5").innerHTML ='<span style="display:none;"></span>';
				
	document.getElementById(zwindow).innerHTML = "<div align='center' class='component_box' style='padding:2px;width:auto;height:auto;background-color:white;'><div class='form_heading' align='center' style=''><a href='javascript:' onClick='zoom_window(0,1,"+rowno+");'>Close Zoom</a></div>"+"<div><a href='/gem_stone_"+cat+".cfm/"+k+"_"+cat+"_silver.htm?silver=yes#jewelry_top' class='side_link'>See More Details</a></div>"+"<br /><img src='/images/"+cat+"/"+k+".jpg' />	<br />" +
					"<div class='component_box' style='background-color:white;width:auto;'>" +
					"<a href='/gem_stone_"+cat+".cfm/"+k+"_"+cat+"_silver.htm?silver=yes#jewelry_top' class='side_link'>See More Details</a></div>" +
					"<div class='form_heading' align='center' style=''><a href='javascript:' onClick='zoom_window(0,1,"+rowno+");'>Close Zoom</a></div></div>";
			
		}
			else
			{
				var zwindow = "zw_"+rc;

				document.getElementById(zwindow).innerHTML ='<span style="display:none;"></span>';
			}
				return;
}

function updateOptionid() {
document.getElementById('optionid').value = document.getElementById('optionidlist').options[document.getElementById('optionidlist').selectedIndex].value;
//alert(document.getElementById('optionid').value);
 } // end of function Optionid

function processReqChange() {
	if (req.readyState == 4) {
		if (req.status == 200 ) {
//alert(req.readyState);
			good = 0;

			if (window.DOMParser) // our CFC is sending in xml disguised as text. this we had to do  because when we try to send in XML content (http header text/xml) then it creates problems for normal cfmx pages since then the browser believes everything else is also xml compliant
			{
			parser=new DOMParser();
			xmlDoc=parser.parseFromString(req.responseText,"text/xml");
			}
			else // Internet Explorer
			{
			xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false";
			xmlDoc.loadXML(req.responseText);
			} 
			if (xmlDoc)	{
				if (xmlDoc.documentElement)  // for mozilla we need to test for req.response itself and this one is for IE
				{
					good = 1;
				}
			}

			if ( good == 0 )
			{
				//document.getElementById("ajaxcheck").value  = 0 ;
				goProcess('add'); // that process basically submits the form for post to web
			}

if (good == 1) {
				var	response = xmlDoc.documentElement;
	//req = null ;
	//alert(req.responseText);
				var method0 = response.getElementsByTagName('localmethod')[0].firstChild.data;
	//alert(method0);
				if (method0 == 'additem') 
				  {
					method = response.getElementsByTagName('qtyadded')[0].firstChild.data;
				
				//	document.getElementById("fast_cart").innerHTML ="";
	
					//alert(method);
					//alert(method + ' of  this added to your cart');
					method1 = response.getElementsByTagName('optionid')[0].firstChild.data;
					method2 = response.getElementsByTagName('qtyinstock')[0].firstChild.data;
					method3 = response.getElementsByTagName('grandtotal')[0].firstChild.data;
					method4 = response.getElementsByTagName('totalqty')[0].firstChild.data;
					var newitem = response.getElementsByTagName('itemnumber')[0].firstChild.data;

					method2 = method2 * 1 + 0; //otherwise firefox javascript engine was not doing numeric GT comparison below
					method = method * 1 + 0;
					method3 = method3 * 1; // same reason
	//alert(2);
	//alert(response.toString());
	
					if (document.getElementById('ajax_context').value == 'gallery')
						{
		//alert(3);
						var k = newitem+"_cart_qty";
						var options_id = newitem+"_options";
						var over_thumb = newitem+"_msg_on_thumb" ;
						var qty_id = newitem + "_opt_qty";
						
							 
						if (method*1 < 0 )
							{
							if (method*1 == -1000)
							{
								 method = 0 ;
							} else {
								 method *= -1 ;
									
							}
							document.getElementById(k).innerHTML = "<img src='/removed.png' height='16px' />";
							document.getElementById(qty_id).selectedIndex = 0;
							document.getElementById(over_thumb).innerHTML = "<DIV style='background-color:white;'>" + method +" removed </DIV> [<a href='/cart.cfm' style='cursor:pointer;background-color:white;text-decoration:underline;'>view  cart</a>]";
							return ;
							try {
								// better leaving it there for user to have an anchor			document.getElementById(options_id).selectedIndex = 0;
							} catch(e){ 
								// do  nothing because all may not have an option  drop down
								}	
							}
						else 
							if (method*1 == 0)
							{
								document.getElementById(over_thumb).innerHTML = "";
								alert("All available quantity for this item already added to your cart");
								document.getElementById(k).innerHTML = "<img src='/images/added.png' height='12px' />";
										
								return;
							}else
							{
							//	alert(method);
							document.getElementById(k).innerHTML ="<img src='/images/added.png' height='12px' />";
							document.getElementById(qty_id).selectedIndex = 0;
							document.getElementById(over_thumb).innerHTML = "<DIV style='border:1px ridge blue;background:rgb(255,255,255);opacity:60;'>" + method +" added to cart </DIV> [<a href='/cart.cfm' style='cursor:pointer;background-color:white;text-decoration:underline;'>view  cart</a>]";
							try {
								// better leaving it there for user to have an anchor			document.getElementById(options_id).selectedIndex = 0;
								} catch(e){ 
									// do  nothing because all may not have an option  drop down
									}
							}
						//	document.getElementById("fast_cart").innerHTML ="<div class='form_heading' style='position:fixed;top:0px;right:10px'><a href='cart.cfm'>Items in Cart:"+method4+", Value:"+method3+"</a></div>";
						document.getElementById("qty_in_cart").innerHTML =method4;
						document.getElementById("cart_value").innerHTML ='$ '+method3;
						// will have to figure out the local to modify the method3 representation
						
						return;
					} 
					else 
					{
						document.getElementById("a2cw").className = 'hidden';
						document.getElementById("a2cb").className = 'greenbutton';
						var k = '';
						document.getElementById("cart_add_msg").innerHTML = '<div style="background-color:white;border:gray solid 2px;width:300px;text-align:center;padding:4px;">Added to Your Cart:' + method + '<br />Your Cart total now: $ ' + method3 + '. <Br />Click "Back to Gallery" above this box, to continue shopping or <a href="cart.cfm">Go to Cart</a> if you would like to wrap up your shopping.</div>';
						return;
					}// if gallery or zoom

	
	
				  }// if add item
			if (method0 == 'Cart_summary') 
			{
				// response - localmethod -cart_summary --items---item----description----itemid----category----quantity----option-----option_id-----option_description-----option_value_add----price-----regular-----sale-----wholesale----status----time_to_delivery
				   try { 
				document.getElementById("cart_summary").innerHTML = (new XMLSerializer()).serializeToString(response);
				   }catch(e)
				   {
					   document.getElementById("cart_summary").innerHTML = response.xml;
				return;
				   }
				return;
				/* 	var itemslist =  response.getElementsByTagName('item');
				var itemscount = itemslist.length;
				for (var j = 0 ; j< itemscount ;j++)
				{
				//	alert(itemslist[j][0].);
					lincoln, ambedkar,
					<div>response.getElementsByTagName('items')[j].childNodes[1].text;</div>
					<div>response.getElementsByTagName('items')[j].childNodes[2].text;</div>
					<div>response.getElementsByTagName('items')[j].childNodes[3].text;</div>
					<div>response.getElementsByTagName('items')[j].childNodes[4].childNodes[0].text;</div>
					 
					
				}*/
			}
			
				
		}// if good is 1
	

else
{
	//alert('Error in adding to cart!');
	document.getElementById("a2cw").className = 'hidden';
	document.getElementById("a2cb").className = 'greenbutton';
	document.getElementById("erroraddingitem").className = 'error';
	document.getElementById("ajaxoutput").className = 'itemdetailsboxred';
	return false;
	}// if good is 1
}// if req status 200
else {
alert("There was an error adding the Item.");
   

//alert(req.responseText);
         }// if req status 200
	} // if read state is 4	    

  
	return false;
} // end of function

 function ajaxCheckClient() {
 var iedcache = Math.random();
iedcache = iedcache*1000;
  iedcache = Math.round(iedcache*1000) + 1.00;
  document.getElementById('ajaxcheck').value = iedcache;
  var url = '/ajaxCheckServer.cfm?var='+iedcache ;
 // alert(url);

  loadXMLDoc(url);
return;
}
function ajaxcheck() {
 if (document.getElementById("ajaxcheck").value  ==  -1)
  { // called only once per session because then it will get set to 0 or 1  

  	ajaxCheckClient();
//	ajaxClient will itself submit the form 
	return false;
 }
 }

var req;
function loadXMLDoc(url)
 {
 //branch for native XMLHtpRequest ojbect
//alert('i called successfully');
 if (window.XMLHttpRequest) {
//alert('i called successfully');
  req = new XMLHttpRequest();
  req.onreadystatechange = processReqChange;
  req.open("GET",url,true);
  req.send(null);
 }
 else if ( window.ActiveXObject) {

  req = new ActiveXObject("Microsoft.XMLHTTP");
if (req) {
 //alert(url);
 req.onreadystatechange = processReqChange;
 req.open("GET",url,true);
 req.send();
         } 
     }
  }

 function add_to_cart(itemid,need_option) {
 	var qty_id = itemid + "_opt_qty";
	var cart_id = itemid + "_cart_qty";
	var q= 	document.getElementById(qty_id).selectedIndex +0 ; // with a hyphen as first member of list , (selected index ) will be equal to qty because 0 is shown at the bottom! ha ha
 	var n = itemid;
	var c = "irrelevant";
	var o = 0;
	var p = 0;
	var optionsid = itemid+"_options";
	var		iedcache = Math.random();
	//alert(q);
	var k = itemid+"_cart_qty";
		if (q == document.getElementById(qty_id).length-1)
			q = 0;
	try {
	if (document.getElementById(optionsid).options)
		{
		    
			o  =	   document.getElementById(optionsid).options[document.getElementById(optionsid).selectedIndex].value;
			
		}
		}
		catch(e)
		{ //do nothing 
	//	o = 0;
		}
		if (need_option > o)
		{ 
			alert("Please select from the options before selecting the quantity.");
			document.getElementById(optionsid).selectedIndex = 0;
			document.getElementById(qty_id).selectedIndex = 0;
			
			 return;
		}
	if (q >= 0){
			document.getElementById(k).innerHTML = "<img src='/working.gif' height='16px' />";
			
		url ='/cartcontrol/cartmonitor.cfc?method=additem&newitem=' + n+ '&quantity=' +q + '&category=' +c+ '&price=' + p + '&optionid='+ o +'&iedcache=' + iedcache+'&endof';
		//alert(url);
		loadXMLDoc(url);
	//alert(1);	
		}
 	return false;
 }
function goProcess(inString)
{
	if(inString=='add')
	{
	//alert(document.getElementById('price').value );
	// put checks for numeric values here
//	 if (window.XMLHttpRequest || window.ActiveXObject    ) 
		if (document.getElementById("ajaxcheck").value  == 1) 
		{ 
		 // first disable submission of form 
			self.document.wishbuy.action="";
	       
			document.getElementById("a2cb").className = 'hidden';
			document.getElementById("a2cw").className = 'greenbutton';
		
			q =  document.getElementById('quantity').value;
			//  	 alert(1);  
			n = document.getElementById('newitem').value  ;
			c = document.getElementById('unclashcategory').value ; // for ie, getElementById treats Name attribute as Id attribute
			p = document.getElementById('price').value; 
		 
			if (document.getElementById('optionid').options)
			{
				o  =	   document.getElementById('optionid').options[document.getElementById('optionid').selectedIndex].value;
			}
			else
			{	
			   o = document.getElementById('optionid').value;  // here first we will have to check if it is a option ilst and the process accordingly
			}
			iedcache = Math.random();
			url ='/cartcontrol/cartmonitor.cfc?method=additem&newitem=' + n+ '&quantity=' +q + '&category=' +c+ '&price=' + p + '&optionid='+ o +'&iedcache=' + iedcache+'&endof';
			//alert(url);
			self.document.wishbuy.action="";
		
			loadXMLDoc(url);
		   return false; // should stop submiting of form in case return button was hit
		 } 
		 else 
		 {
			// for input box use this -> document.getElementById("quantity").value
			 if (document.getElementById("quantity").selectedIndex != 0)
			 {
				 // check that we have the amount they wanted
				 if (vCurrentInventory >= document.getElementById("quantity").selectedIndex-1)
				 {  
					vOptions = document.getElementById("optionidpulldown");
					if (vOptions != null)
					{
						// If the option must be selected, check that they did.
						if ( vOptions.options[vOptions.selectedIndex].text == "Must Select Option")
						  {alert("An option from the pull down menu must be selected.");}
						else
						{
						  self.document.wishbuy.action="/cart.cfm";
						  self.document.wishbuy.submit();
						}
					}
					else
					{
					  self.document.wishbuy.action="/cart.cfm";
					  self.document.wishbuy.submit();
					}
				 }
				 else
					{  	 var msg = "Please select quantity 0 to " + vCurrentInventory+". Selecting 0 will remove the item from your cart.";
					alert(msg);  }
			 }
			 else
			    {  alert("No quantity was entered."); }
		 
			 

		 }
		 return false;
	
	}
	if(inString=='Add to Wish List'){
	self.document.wishbuy.action='/wish.cfm';
	self.document.wishbuy.submit();
	return;
	}
	if(inString=='Show Next'){
	self.document.wishbuy.action='/jewelry_item.cfm/' + self.document.wishbuy.nextitem.value + '.htm';
	//self.document.wishbuy.method = 'get';
	self.document.wishbuy.submit();
	return;
	}
	if(inString=='cart summary'){
		var		iedcache = Math.random();
		var url = '/cartcontrol/cartmonitor.cfc?method=cart_summary&dcache='+iedcache;
		document.getElementById("cart_summary").innerHTML = "<img src='/working.gif' height='16px' />";
		loadXMLDoc(url);
		return;
		}
}



function goProcesstest(inString)
{
	alert("test");
	if(inString=='add')
	{
	//alert(document.getElementById('price').value );
	// put checks for numeric values here
//	 if (window.XMLHttpRequest || window.ActiveXObject    ) 
		if (document.getElementById("ajaxcheck").value  == 1) 
		{ 
		 // first disable submission of form 
			self.document.wishbuy.action="";
	
			document.getElementById("a2cb").className = 'hidden';
			document.getElementById("a2cw").className = 'greenbutton';
		
			q =  document.getElementById('quantity').value;
			//  	 alert(1);  
			n = document.getElementById('newitem').value  ;
			c = document.getElementById('unclashcategory').value ; // for ie, getElementById treats Name attribute as Id attribute
			p = document.getElementById('price').value; 
		 
			if (document.getElementById('optionid').options)
			{
				o  =	   document.getElementById('optionid').options[document.getElementById('optionid').selectedIndex].value;
			}
			else
			{	
			   o = document.getElementById('optionid').value;  // here first we will have to check if it is a option ilst and the process accordingly
			}
			iedcache = Math.random();
			url ='/cartcontrol/cartmonitor.cfc?method=additem&newitem=' + n+ '&quantity=' +q + '&category=' +c+ '&price=' + p + '&optionid='+ o +'&iedcache=' + iedcache+'&endof';
		//	alert(url);
			self.document.wishbuy.action="";
		
			loadXMLDoc(url);
		   return false; // should stop submiting of form in case return button was hit
		 } 
		 else 
		 {
			// for input box use this -> document.getElementById("quantity").value
			 if (document.getElementById("quantity").selectedIndex != 0)
			 {
				 // check that we have the amount they wanted
				 if (vCurrentInventory >= document.getElementById("quantity").selectedIndex-1)
				{  
					vOptions = document.getElementById("optionidpulldown");
					if (vOptions != null)
					{
						// If the option must be selected, check that they did.
						if ( vOptions.options[vOptions.selectedIndex].text == "Must Select Option")
						  {alert("An option from the pull down menu must be selected.");}
						else
						{
						  self.document.wishbuy.action="/carttest2.cfm";
						  self.document.wishbuy.submit();
						}
					}
					else
					{
					  self.document.wishbuy.action="/carttest2.cfm";
					  self.document.wishbuy.submit();
					}
				 }
				 else
					{  alert("The quantity entered exceeds the amount we currently have available."); }
			 }
			 else
			    {  alert("No quantity was entered."); }
		 
			 

		 }
		 return false;
	
	}
	if(inString=='Add to Wish List'){
	self.document.wishbuy.action='/wish.cfm';
	self.document.wishbuy.submit();
	return;
	}
	if(inString=='Show Next'){
	self.document.wishbuy.action='/jewelry_item.cfm/' + self.document.wishbuy.nextitem.value + '.htm';
	//self.document.wishbuy.method = 'get';
	self.document.wishbuy.submit();
	return;
	}
}

//-->
