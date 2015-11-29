<?php
session_start();
	 		 
	 	$stoneURL="http://www.essentialsjewelry.com/stock/sterling-silver-rings.html";
		
        // create curl resource
        $ch = curl_init();

        // set url
        curl_setopt($ch, CURLOPT_URL,$stoneURL);

        //return the transfer as a string
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        // $output contains the output string
        $output = curl_exec($ch);
		
		
	    //customize by mak
		$files=file_get_contents('common_header.php');
		
		$files .='<h2 class="headings"><a href="http://semipreciouswholesale.com/silver_gemstone_ring.php">STERLING AND GEMSTONE RINGS</a> | <a href="http://semipreciouswholesale.com/silver_gemstone_pendant.php">STERLING AND GEMSTONE PENDANTS</a> | <a href="http://semipreciouswholesale.com/silver_gemstone_earring.php">STERLING AND GEMSTONE EARRINGS</a></h2><h2 class="headings" style="text-align:center;"><a href="http://semipreciouswholesale.com/silver-chakra-jewelry/silver-chakra-jewelry.html">CHAKRA JEWELRY</a></h2>
		';
		
		$files .='<div style="text-align:center;"><iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2Fsemipreciouswholesale&amp;width&amp;height=62&amp;colorscheme=light&amp;show_faces=false&amp;header=false&amp;stream=false&amp;show_border=false&amp;appId=514107062009818" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:62px;" allowTransparency="true"></iframe></div>';
		
		$output = str_ireplace("<body>", '<body>' ."$files", $output);
		$output = str_replace('bgcolor="#DDFFFF"', 'bgcolor="#464445" style="color:#fff;padding:5px;" ', $output);
		$output = str_ireplace("<br />", "", $output);
		$output = str_ireplace('width="161" height="56"', "", $output);
		$output = str_ireplace('<h2 style="padding-left:15px;">', '<h2 style="padding-left:15px;height:0;margin:0;padding:0;">', $output);
		
		
$output = str_replace('<p align="justify">Essentials', '<p align="justify" style="display:none;">Essentials', $output);
		$output = str_replace('immedately', 'in 7 to 15 days', $output);
		
		
		
    	$output = str_ireplace("<h1>Silver", "<h2>Real Silver", $output);
		$output = str_ireplace('"http://www.essentialsjewelry.com/images/pendants.jpg"', '"http://www.essentialsjewelry.com/images/pendants.jpg" style=display:none; ', $output);
    	$output = str_ireplace("</h1>", " Handmade</h2>", $output);
		$output = str_ireplace(" cab ", " Cabachone ", $output);
		
		$output = str_ireplace(" assorted ", " variety ", $output);
		$output = str_ireplace(" cab. ", " Cabachone. ", $output);
		$output = str_ireplace(" cab, ", " Cabachone, ", $output);
		$output = str_ireplace(" 925 ", " 92.5% ", $output);
		$output = str_ireplace(" stone ", " gemstone ", $output);
		$output = str_ireplace(" supplier ", " market ", $output);
		$output = str_ireplace(" ready stock ", "", $output);
		$output = str_ireplace(" Jaipur ", " Pink City ", $output);
		$output = str_ireplace(" Ring ", " Gemstone Ring ", $output);
        $output = str_replace("www.semipreciouswholesale.com/", "www.essentialsjewelry.com/", $output);
		$output = str_replace("../../../css/stylesheet.css", "http://www.essentialsjewelry.com/css/stylesheet.css", $output);
		$output = str_replace("../../../right-click-off.js", "http://www.essentialsjewelry.com/right-click-off.js", $output);
		$output = str_replace("../../../", "http://www.essentialsjewelry.com/", $output);
//		$output = str_replace("http://www.essentialsjewelry.com/images/", "http://www.semipreciouswholesale.com/images/", $output);
//		$output = str_replace('<div id="top">', '<div id="top" style=display:none;>', $output);
		$output = str_replace('<p align="justify">Today', '<p align="justify" style="display:none;">Today', $output);

		$output = str_replace('<div id="bannertop">', '<div id="bannertop" style=display:none;>', $output);
		$output = str_replace('id="bannerleft"', 'id="bannerleft" style="display:none;"', $output);
		$output = str_replace('id="bannerright"', 'id="bannerright" style="display:none;"', $output);
//		$output = str_replace('id="innercontent", 'id="innercontent;" style="position:absolute;top:150px;"', $output);
		$output = str_replace('wholesalers', 'wholesale', $output);
		$output = str_replace('Mookaite', 'Mookite', $output);
 		$output = str_replace('manuafcturer', 'manufacturer', $output);
		$output = str_replace('http://www.essentialsjewelry.com/images/rings.jpg', 'http://www.semipreciouswholesale.com/images/rings.jpg', $output);
		$output = str_replace('http://www.essentialsjewelry.com/images/earrings.jpg', 'http://www.semipreciouswholesale.com/images/rings.jpg', $output);
		$output = str_replace('http://www.essentialsjewelry.com/images/pendants.jpg', 'http://www.semipreciouswholesale.com/images/rings.jpg', $output);
		$output = str_replace('http://www.essentialsjewelry.com/images/bracelets.jpg', 'http://www.semipreciouswholesale.com/images/rings.jpg', $output);
		$output = str_replace('images/arrow.jpg', 'images/rings.jpg', $output);
		$output = str_replace('http://www.essentialsjewelry.com/images/15.gif', 'http://www.semipreciouswholesale.com/images/discount.jpg', $output);
		
		
		
		$output = str_replace('Stock Rings', ' ', $output);
		$output = str_replace('id="basenav"', 'id="basenav" style="display:none;"', $output);		
		$output = str_replace('id="base"', 'id="base" style="display:none;"', $output);		
		$output = str_replace('2006 Essential Jewelery', '2006 SemipreciousWholesale.com', $output);
		$output = str_replace('Essentials Jewelery', 'semipreciouswholesale.com', $output);
		$output = str_replace('<a href="../../sterling-silver-pendants.html" class="stone-main">Stock Pendants</a>  ::', 'In Stock Gemstone Silver Pendants:', $output);
		$output = str_ireplace("../images/stock/", "http://www.essentialsjewelry.com/images/stock/", $output);		 
		$output = str_replace('id="silver2"', 'id="silver2" style=display:none;', $output);
		$output = str_replace('id="leftside"', 'id="leftside" style=display:none;', $output);			
		$output = str_replace('Code : :', '<div style="position:relative;top:13px;">SKU:</div><div style="position:relative;left:50px;"><input style="font-size:small;" type="button" height=30px value="Call 512-666-4367"></div>', $output);
		$output = str_replace('le"><span class="imprtant">', 'le" style="visibility:hidden"><span class="imprtant">', $output);
		$output = str_replace('id="toptag">', 'id="toptag" style="display:none;">', $output);
		
		$output = str_replace('$ 8.', '$ 11.', $output);
				$output = str_replace('$ 9.', '$ 12.', $output);
						$output = str_replace('$ 10.', '$ 13.', $output);
								$output = str_replace('$ 11.', '$ 15.', $output);
										$output = str_replace('$ 12.', '$ 16.', $output);
												$output = str_replace('$ 13.', '$ 18.', $output);
														$output = str_replace('$ 14.', '$ 19.', $output);
																$output = str_replace('$ 15.', '$ 20.', $output);
																		$output = str_replace('$ 16.', '$ 22.', $output);
																				$output = str_replace('$ 17.', '$ 24.', $output);
																						$output = str_replace('$ 18.', '$ 25.', $output);
																								$output = str_replace('$ 19.', '$ 27.', $output);
																									
	
		$output = str_replace('essentialsjewelry.com/stock/', 'semipreciouswholesale.com/', $output);
		//add silver keyword
		$output = str_replace('-rings.html', '-silver-rings.html', $output);
		
		
		
		$output = str_replace('</body>', '', $output);
		$output = str_replace('</html>', '', $output);
		
		
        // close curl resource to free up system resources
        curl_close($ch);     
		
		   echo $output;
		  require_once ("common_footer.php");
?>
 