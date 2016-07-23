<htmL>
<head>
<title>Items Bill: The Jewelry Store</title>
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}
//-->
</script>
</head>
<body bgcolor='white' >

<cfif  url.vendor eq 'young'>
<cfinclude template="youngheader.cfm">
<cfelseif url.vendor eq 'jandj'>
<cfinclude template="jandjheader.cfm">
<cfelse>
  <Table cellpadding='0' cellspacing='0' bgcolor='white' width='750' align=left border=0>
    <tr> 
      <td align='left' bgcolor='white' height=100>&nbsp;</td>

    </tr>
  </Table>
  <br>
  <left> 
  <p>&nbsp;</p>
</cfif>
  <p>&nbsp;</p>
  
  </body>
</html>
