<html>
<head>
<title>Add Reference Design</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<p>There are four ways of providing a reference image:</p>
<p>1. You may have an image on your computer. <a href="uploadreferencephoto.cfm">Click 
  Here</a></p>
<p> 2. You have a scanned image of free hand sketch or a photograph on your PC. 
  <a href="uploadreferencephoto.cfm">Click Here</a>   </p>
  <cfform action="addreferencephoto.cfm" method="post" >
<p>3. The image is of an item shown on our site. Then Fill in the item id here:</p>
<cfinput type="text" required="yes" name="id" message="Please provide a correct item id/number." validate="integer" range="1,1500">
<input type="submit" value="Add">   <input type="hidden" value="sp" name="type">
		</cfform>
<cfform action="addreferencephoto.cfm" method="post" enablecab="yes">
<p>4. You have seen the image on some other web site. Then Fill in the URL here:</p>
<cfinput type="text" name="url" required="yes" message="Please provide the item URL." >
<input type="hidden" value="url" name="type">
<input type="submit" value="Add"></cfform>
<!--- <a href="#" onClick="javascript:popUpWindow('howtofindurl.htm',100,200,200,60)" target="small">(How to find out the URL?)</a> 
 --->
<p><span style="color:#888888">How to Find URL: To find and fill the URL of an 
  image on a web page first open the page that contains the image. Now point your 
  mouse above the image and do a right click (MAC users pse use ALT key). A menu 
  will pop up. From this menu select 'Properties' at the bottom. A property dialog 
  will now open up giving you the URL. Now you can either write down the URL (location) 
  or highlight with your mouse and do a copy (CTRL + C) operation. Now fill the 
  URL in the above box.</span> </p>
  <script language="JavaScript1.1" >
  window.focus();
  </script>
</body>
</html>
