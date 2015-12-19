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
}
