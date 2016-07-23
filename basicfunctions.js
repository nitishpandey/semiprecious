// JavaScript Document

// Example:
// writeCookie("myCookie", "my name", 24);
// Stores the string "my name" in the cookie "myCookie" which expires after 24 hours.

function writeCookie(name, value, hours)
{
//alert(1);
  var expire = "";
  if(hours != null)
  {
    expire = new Date((new Date()).getTime() + hours * 3600000);
    expire = "; expires=" + expire.toGMTString();
  }
  document.cookie = name + "=" + escape(value) + expire;
}
function checkemailvalue(formname, emailfield)
 {
 var val = evaluate("document." + formname + "." + emailfield + ".value.length");
 //alert(val);
 
  if ( val.length < 6)
    {
	alert("Pse provide a valid email id.");
	return false;
	}
	return true;
	}

function ShowHide(str) {
var elt = document.getElementById(str);
if (navigator.userAgent.indexOf("Netscape6") != -1)
  {
if (elt.style.visibility == "hidden")
   elt.style.visibility = 'visible';
else
   elt.style.visibility = 'hidden';
}

else
 {
if (elt.style.display == "none")
   elt.style.display = '';
else
   elt.style.display= 'none';
}
return ;
}
