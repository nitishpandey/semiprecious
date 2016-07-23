<?php

		//customize by mak
		$files=file_get_contents('common_header.php');
				
						
		$files .='<div style="text-align:center;"><iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2Fsemipreciouswholesale&amp;width&amp;height=62&amp;colorscheme=light&amp;show_faces=false&amp;header=false&amp;stream=false&amp;show_border=false&amp;appId=514107062009818" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:62px;" allowTransparency="true"></iframe></div>';
			
		$output = str_ireplace("<body>", '<body>' ."$files", $output);
		$output = str_ireplace("<br />", "", $output);
        $output = str_replace('Essentials Jewelry', 'Semiprecious Wholesale', $output);

    	$output = str_ireplace("<h1>Silver", "<h2>92.5 Silver", $output);
		
		
		$output = str_ireplace('"http://www.essentialsjewelry.com/images/pendants.jpg"', '"http://www.essentialsjewelry.com/images/pendants.jpg" style=display:none; ', $output);
    	$output = str_ireplace("</h1>", "Handmade</h2>", $output);
		$output = str_replace('immedately', 'in 7 to 15 days', $output);
		
		$output = str_ireplace('Handmade</h2>', 'Handmade</h2><br>
		<div style="clear:both;width:80%;margin-left:auto;margin-right:auto;font-size:18px;text-align:center;color:brown;">
		<b>EXCELLENT QUALITY! YES GENUINE 92.5% STERLING SILVER!</b></div><p><div style="clear:both;width:80%;margin-left:auto;margin-right:auto;font-size:14px;text-align:left;">'.$contentforpage.'</div>', $output);
		
		
		

		$output = str_ireplace('"http://www.essentialsjewelry.com/images/pendants.jpg"', '"http://www.essentialsjewelry.com/images/pendants.jpg" style=display:none; ', $output);
    	$output = str_ireplace("</h1>", "Handmade</h2>", $output);
		$output = str_ireplace(" cab ", " Cabachone ", $output);
		$output = str_ireplace(" cab. ", " Cabachone. ", $output);
		$output = str_ireplace(" cab, ", " Cabachone, ", $output);
		$output = str_ireplace(" 925 ", " 92.5% ", $output);
		$output = str_ireplace(" stone ", " gemstone ", $output);
		$output = str_ireplace(" supplier ", " market ", $output);
		
		$output = str_replace('<div id="toptag">
    <div id="topline">K2 Blue (Azurite in Quartz), K2 Blue (Azurite in Quartz) Earrings, Silver K2 Blue (Azurite in Quartz) Earrings, Wholesale K2 Blue (Azurite in Quartz) Earrings, Manufacturer K2 Blue (Azurite in Quartz) Earrings, online market of K2 Blue (Azurite in Quartz) Earrings, manufacturer Pink City (india) K2 Blue (Azurite in Quartz), K2 Blue (Azurite in Quartz) set in stelring silver wholesale </div>
  </div>', '', $output);
  
  
  $output = str_ireplace('<span class="stock_name">Size : :</span>', '<br/><span class="stock_name">Size : :</span>', $output);
   $output = str_ireplace('<span class="stock_name">Length : :</span>', '<br/><span class="stock_name">Length : :</span>', $output);
  $output = str_ireplace('width="10" height="10" hspace="5"', '', $output);
  
		
		$output = str_ireplace(" Jaipur ", " Pink City ", $output);
		$output = str_ireplace(" Ring ", " Gemstone Ring ", $output);
        $output = str_replace("www.semipreciouswholesale.com/", "www.essentialsjewelry.com/", $output);
		$output = str_replace("../../../css/stylesheet.css", "http://www.essentialsjewelry.com/css/stylesheet.css", $output);
		$output = str_replace("../../../right-click-off.js", "http://www.essentialsjewelry.com/right-click-off.js", $output);
		$output = str_replace("../../../", "http://www.essentialsjewelry.com/", $output);
		$output = str_replace("../../", "http://www.essentialsjewelry.com/", $output); // Silver chackra
//		$output = str_replace("http://www.essentialsjewelry.com/images/", "http://www.semipreciouswholesale.com/images/", $output);
//		$output = str_replace('<div id="top">', '<div id="top" style=display:none;>', $output);
		$output = str_replace('<div id="bannertop">', '<div id="bannertop" style=display:none;>', $output);
		$output = str_replace('id="bannerleft"', 'id="bannerleft" style="display:none;"', $output);
		$output = str_replace('id="bannerright"', 'id="bannerright" style="display:none;"', $output);
		$output = str_replace('wholesalers', 'wholesale', $output);
		$output = str_replace('Mookaite', 'Mookite', $output);
 		$output = str_replace('manuafcturer', 'manufacturer', $output);
		$output = str_replace('http://www.essentialsjewelry.com/images/rings.jpg', 'http://www.semipreciouswholesale.com/images/rings.jpg', $output);
		$output = str_replace('http://www.essentialsjewelry.com/images/earrings.jpg', 'http://www.semipreciouswholesale.com/images/rings.jpg', $output);
		$output = str_replace('http://www.essentialsjewelry.com/images/pendants.jpg', 'http://www.semipreciouswholesale.com/images/rings.jpg', $output);
		$output = str_replace('http://www.essentialsjewelry.com/images/bracelets.jpg', 'http://www.semipreciouswholesale.com/images/rings.jpg', $output);
		$output = str_replace('http://www.essentialsjewelry.com/images/arrow.jpg', 'http://www.semipreciouswholesale.com/images/rings.jpg', $output);
		$output = str_replace('http://www.essentialsjewelry.com/images/15.gif', 'http://www.semipreciouswholesale.com/images/discount.jpg', $output);
		//$output = str_replace('http://www.semipreciouswholesale.com/images/rings.jpg', '', $output);
		$output = str_replace('<img src="http://www.semipreciouswholesale.com/images/rings.jpg"  border="0" class="email" />', ' ', $output);
		
		
		
		
		
		$output = str_replace('Stock Rings', ' ', $output);
		$output = str_replace('Stock ', ' ', $output);
		$output = str_replace('Earrings In', 'Gemstone Earrings', $output);
		$output = str_replace('id="basenav"', 'id="basenav" style="display:none;"', $output);		
//!!		$output = str_replace('id="base"', 'id="base" style="display:none;"', $output); // Silver chackra		
		$output = str_replace('2006 Essential Jewelery', '2006 SemipreciousWholesale.com', $output);
		$output = str_replace('Essentials Jewelery', 'semipreciouswholesale.com', $output);
		$output = str_replace('<a href="../../sterling-silver-pendants.html" class="stone-main">Stock Pendants</a>  ::', 'In Stock Gemstone Silver Pendants:', $output);
				 
		$output = str_replace('id="silver2"', 'id="silver2" style=display:none;', $output);		
		$output = str_replace('Code : :', '<div style="position:relative;top:13px;">SKU:</div><div style="position:relative;left:50px;"><input style="font-size:small;" type="button" height=30px value="Call 512 779 8863"></div>', $output);
		$output = str_replace('<td><span class="imprtant">', '<td style="visibility:hidden"><span class="imprtant">', $output);
		
		$output = preg_replace('#<div[^>]*>\s*(?:<[^>]*>\s*)+[^<]*copyright.*?</div>#msi', '', $output); // Silver chackra

//		$factor = 1.25;
		for ($i = 1; $i <=30; $i++) {
			$output = str_replace('$ '.$i.'.', '$ ---'.round($i*$cfg['factor']).'.', $output);
		}
		$output = str_replace('$ ---', '$ ', $output);
		/*$output = str_replace('$ 8.', '$ 11.', $output);
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
																									$output = str_replace('$ 19.', '$ 24.', $output);
																								  $output = str_replace('$ 20.', '$ 25.', $output);
																								    $output = str_replace('$ 22.', '$ 26.', $output);
																									  $output = str_replace('$ 23.', '$ 28.', $output);
																									    $output = str_replace('$ 24.', '$ 29.', $output);
																										 $output = str_replace('$ 25.', '$ 30.', $output);*/
	
		//$output = str_replace('essentialsjewelry.com/stock/', 'semipreciouswholesale.com/silver_gemstone_rings.php?stone=', $output);
		$output = str_replace('essentialsjewelry.com/stock/', 'semipreciouswholesale.com/', $output);
		
		//add silver keyword
		$output = str_replace('-rings.html"', '-silver-rings.html"', $output);
		$output = str_replace('-earrings.html"', '-silver-earrings.html"', $output);
		$output = str_replace('-pendants.html"', '-silver-pendants.html"', $output);		
