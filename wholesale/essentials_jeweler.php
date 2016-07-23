
<?php
        // create curl resource
        $ch = curl_init();

        // set url
        curl_setopt($ch, CURLOPT_URL, "www.essentialsjewelry.com/stock/tanzanite-cut/tanzanite-cut-rings/tanzanite-cut-rings.html");

        //return the transfer as a string
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        // $output contains the output string
        $output = curl_exec($ch);
        $output = str_replace("www.semiprecious/", "www.essentialsjewelry.com/", $output);
		$output = str_replace("../../../css/stylesheet.css", "http://www.essentialsjewelry.com/css/stylesheet.css", $output);
		$output = str_replace("../../../right-click-off.js", "http://www.essentialsjewelry.com/right-click-off.js", $output);
		$output = str_replace("../../../", "http://www.essentialsjewelry.com/", $output);
//		$output = str_replace("http://www.essentialsjewelry.com/images/", "http://www.semiprecious.com/images/", $output);
//		$output = str_replace('<div id="top">', '<div id="top" style=display:none;>', $output);
		$output = str_replace('<div id="bannertop">', '<div id="bannertop" style=display:none;>', $output);
		$output = str_replace('id="bannerleft"', 'id="bannerleft" style=display:none;', $output);
		$output = str_replace('id="bannerright"', 'id="bannerright" style=display:none;', $output);
		$output = str_replace('id="basenav"', 'id="basenav" style=display:none;', $output);		
		$output = str_replace('2006 Essential Jewelery', '2006 SemipreciousWholesale.com', $output);		
		
		
		
		
		
        // close curl resource to free up system resources
        curl_close($ch);     
		
		   echo $output;
?>
 