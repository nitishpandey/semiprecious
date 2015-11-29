<html>
<style type="text/css">
<!--
.inputform {
	font-family: Georgia, "Times New Roman", Times, serif;
	font-size: 12px;
	font-weight: bold;
	font-color:blue;
	word-spacing: normal;
	display: block;
	position: relative;
	background-color: #EEEEEE;
	color: #000000;
	border: thin dotted #333333;
	visibility: visible;
}
-->
</style>
<script language="javascript" >
function testcontent()
   {
    if (sitedetails.description.value.length == 0)
      {
       alert("Please provide the description");
       return false;
      }
   if (sitedetails.url.value.length == 0)
      {
       alert("Please provide the URL");
       return false;
      }
   if (sitedetails.url.value.indexOf("\\") != -1)
      {
       alert("URL contains a \\\ !?!");
       return false;
      }
	 if (sitedetails.url.value.indexOf(";") != -1)
      {
       alert("URL contains a ; !?!");
       return false;
      }
	 if (sitedetails.url.value.indexOf(":") != -1)
      {
       alert("URL contains a : !?! (http:// prefix not required)");
       return false;
      }
	 if ((sitedetails.url.value.indexOf("/") < 5) && (sitedetails.url.value.indexOf("/") > -1))
      {
       alert("URL not proper !");
       return false;
      }
	  if (sitedetails.url.value.indexOf("<") != -1)
      {
       alert("URL contains a < !?!");
       return false;
      }
	   if (sitedetails.url.value.indexOf(",") != -1)
      {
       alert("URL contains a , !?!");
       return false;
      } 
  if (sitedetails.url.value.indexOf("`") != -1)
      {
       alert("URL contains a ` !?!");
       return false;
      }
	    if (sitedetails.url.value.indexOf("\'") != -1)
      {
       alert("URL contains a \' !?!");
       return false;
      }
	      if (sitedetails.url.value.indexOf(">") != -1)
      {
       alert("URL contains a > !?!");
       return false;
      }
	   if (sitedetails.url.value.indexOf("@") != -1)
      {
       alert("URL contains a @ !?!");
       return false;
      }
	 if (sitedetails.url.value.indexOf("http://") != -1)
      {
       alert("Please enter the URL without http:// prefix.");
       return false;
      }	 
    return true;
   }
function testurl(form)
  {
     <!-- how to do this !! -->
	 return true;
   }
</script>
<style type="text/css">
<!--
.button1 {
	font-family: "Courier New", Courier, mono;
	font-style: italic;
	font-weight: bolder;
	cursor: hand;
	text-transform: capitalize;
	border-top: thin solid #333333;
	border-right: thin solid #000000;
	border-bottom: thin solid #CCCCCC;
	border-left: thin solid #CCCCCC;
	list-style-type: upper-roman;
	padding-right: 0px;
	padding-left: 0px;
	background-color: #666666;
	list-style-position: inside;
	color: #FFFFFF;
}

table.a {
	color: #FFFF00;
	text-decoration: underline;
	font-size: 12px;
}
-->
</style>
<link href="npstyles1.css" rel="stylesheet" type="text/css">
<body >
<cfinclude template="headerpage.cfm">
<p class="inputform" name="qw"><b><i><font face="Georgia, Times New Roman, Times, serif">Fill 
  in the details below and click the 'Include Me' button at the bottom to join 
  the web of online jewelry web sites to give jewelry customers a great shopping 
  experience.</font></i></b></p>
<cfform action=addlinksaction.cfm method="post" name="sitedetails" onsubmit="return testcontent();">
  <table width="100%" class="inputform">
    <tr> 
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td  nowrap>Your WebSite's Name (URL like <a href="http://www.cheap-jewelry.com" target="img">www.cheap-jewelry.com</a>) 
      </td>
      <td  colspan="2"><font size="+1"> 
        <input type=text size="28" name="url" >
        </font></td>
    </tr>
<!--     <tr> 
      <td >Price Range of Your Collection:</td>
      <td  colspan="2"> <select name="price_range" >
          <option value="Less than $30">Less than $30 </option>
          <option value="Between $30 and $100 ">Between $30 and $100 </option>
          <option value="Upto $100">Upto $100 </option>
          <option value="Between $100 and $200">Between $100 and $200 </option>
          <option value="Upto $200">Upto $200 </option>
          <option value="More than $200 ">More than $200 </option>
        </select> </td>
    </tr> -->
	<input type="hidden" value="Upto $100" name="price_range">
 <!--    <tr> 
      <td  >Your Name </td>
      <td  colspan="2"> <cfinput type=text  name="referrer" size="28" > 
      </td>
    </tr>
    <tr> 
      <td >Your role in the site </td>
      <td  colspan="2"> <input type=text name="role"  size="28"> </td>
    </tr> -->
    <tr> 
      <td height="29" >Site inception/creation month & year</td>
      <td height="29"  colspan="2"> <input type=text name="site_date"  size="28"> 
      </td>
    </tr>
    <tr> 
      <td >Description of the site/products</td>
      <td  colspan="2"> <textarea cols="30" rows="4" name=description></textarea> 
      </td>
    </tr>
  </table>
  <table width="100%" border="0">
    <tr> 
      <td align="center"> <input type=submit value="Include Me, I will place a simple link from my site to semiprecious.com !" name="submit2" class="button1"></td>
    </tr>
  </table>
</cfform>
<p><i><font color=brown>-----Semiprecious.com----the online store for semiprecious 
  jewelry from India--------the best price, quality and service-----since 1997------------</font></i></p>
<table width="99%">
  <tr class="inputform"> 
    <td align=center> <a href="http://www.semiprecious.com">Home Page of Semiprecious.com</a> 
    </td>
    <td align=center><a href="OtherJewelrySites.cfm" target="_parent">Show Listing 
      of Online Jewelry Stores</a></td>
    <td align=center><a href="javascript:alert('Please send an email to service@semiprecious.com . Thankyou');">Delist 
      a URL</a></td>
  </tr>
</table>
</body>
 </html>
  
