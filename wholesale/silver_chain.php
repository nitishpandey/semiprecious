<?php
session_start();

$cfg['size_change_price'] = 10.00;

        $finalurl=$_GET['stone'];
		$finalurl= str_replace('-silver-earrings.html', '-earrings.html', $finalurl);
		$finalurl= str_replace('-silver-rings.html', '-rings.html', $finalurl);
		$finalurl= str_replace('-silver-pendants.html', '-pendants.html', $finalurl);
		
		
		
		$url=$_SERVER['REQUEST_URI'];
		$tokens = explode('/', $url);
        $getconurl= $tokens[sizeof($tokens)-1];
		$getconurl=str_replace('-silver', '', $getconurl);
		
		
		
	 	$stoneURL="www.essentialsjewelry.com/stock/".$finalurl;
		
		
		include 'db.php';
		$query=mysql_query("select * from page_content where url='$getconurl'", $dbcon);
		$count= mysql_num_rows($query);
		if($count > 0)
		{
			while($row=mysql_fetch_assoc($query))
			{
				$contentforpage=$row['content'];
			}
		}
		else
		{
			$contentforpage="";
		}
		
		
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
		
		$factor = 1.25;
		for ($i = 1; $i <=30; $i++) {
			$output = str_replace('$ '.$i.'.', '$ ---'.round($i*$factor).'.', $output);
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
		
		
		/* By webxtor START */
		$output = preg_replace_callback('#<input[^>]+value\s*=\s*["\']Call[^>]+>((?:\s*<[^>]+>)+([^<]+)(?:<[^>]+>\s*)+Price.*?<[^>]+>[^<]*?\s*([0-9\.,]+))[^<]*(?:<[^>]+>\s*)+(?:(Size|Length-disable)[^<]*(?:<[^>]+>\s*)+([^<]+))?#msi', function($m) {
			global $cfg;
			$size_length_title = $m[4];
			$size_length = (float) $m[5];
			$out = '<form action="" method="POST"><input type="hidden" name="sku" value="'.$m[2].'"><input type="hidden" name="price" value="'.$m[3].'"><input style="font-size:small;" height=30px type="submit" name="add" value="Add to cart!">'.$m[1].'<br/>'.($size_length_title=='Size' ? '<span class="stock_name">'.$m[4].' : :</span> <select class="select_size" name="size" onchange="if (this.value != '.$size_length.') var v=1; else v=0; document.getElementById(\'sizeChng_'.$m[2].'\').value = v;">' : '')/*.$m[4]*/;
			switch ($size_length_title) {
				case 'Size' :
					$steps = 14;
					$start = 11;
					$inc = 0.5;
				break;
				case 'Length' :
					$steps = 11;
					$start = 2;
					$inc = 0.1;
				break;
			}
			for ($i = $steps, $j = $start; $i >= 1; $i--) {
				$out .= '<option value="'.$j.'"'.((string)$j == (string)$size_length ? ' selected' : '').'>'.$j.((string)$j != (string)$size_length ? ' + $'.number_format($cfg['size_change_price'], 2) : '');
				$j -= $inc;
			}
			$out .= '</select><input type="hidden" name="size_changed" id="sizeChng_'.$m[2].'"></form>';
			return $out;
		}, $output);//(?:<[^>]+>\s*)+Size[^<]*(?:<[^>]+>\s*)+([^<]+)     <input type="hidden" name="size" value="$4">
		
		//global $m;
		$output = preg_replace_callback('#<td[^>]*>(?:(?!</?td).)+Code\s+:.*?</td>(.*?)</tr>.*?<td[^>]*>(?:(?!</?td).)+Prices\s+:.*?</td>(.*?)</tr>#msi', function($m0) {//print_r($m0);//exit;
			$out = $m0[0];

			if (preg_match_all('#[\w]+#msi', strip_tags($m0[1]), $m2) && preg_match_all('#<td[^>]*>(.*?)</?td#msi', $m0[2], $m3)) { //print_r($m2); print_r($m3);//exit;
			
				$cart_row = '';
				
				foreach($m2[0] as $n => $sku) {
					$price = false;
					if (preg_match('#[0-9.]+#', $m3[1][$n], $m4)) {
						$price = $m4[0];
					}
					$cart_row .= '<td>'. ($price ? '<form action="" method="POST"><input type="hidden" name="sku" value="'.$sku.'"><input type="hidden" name="price" value="'.$price.'"><input style="font-size:small;" height=30px type="submit" name="add" value="Add to cart!"></form>' : '') . '</td>';
				}
				$out .= "<tr><td>&nbsp;</td>$cart_row</tr>";

			}
			return $out;
		}, $output);
		
error_reporting(E_ALL); ini_set("display_errors", 1);
		// Cart processsing
		//session_start();
		
		//unset($_SESSION['cart']);
		if (isset($_SESSION['cart'])) {
			//echo 'Your shopping cart contents:<br/><br/>';
			foreach ($_SESSION['cart'] as $i) {
				//echo "SKU: {$i['sku']} Price: {$i['price']} Size: {$i['size']}<br/>";
			}
		}

		/* Database part */
		
		

		if (isset($_POST['sku']) && isset($_POST['price'])) { //&& isset($_POST['size'])
			$new['sku'] = mysqli_real_escape_string($mysqli, $_POST['sku']);;
			$new['price'] = (float) str_replace('$', '', $_POST['price']);
			$new['size'] = isset($_POST['size']) ? (float) $_POST['size'] : 0;
			$new['size_changed'] = isset($_POST['size_changed']) ? (int) $_POST['size_changed'] : 0;
			if ($new['size_changed']) $new['price'] += $cfg['size_change_price'];
			//$_SESSION['cart'][] = $new;
			
			if (!isset($_COOKIE['cartid'])) {
				$res = mysqli_query($mysqli, "SELECT MAX(cartid) FROM shopping_cart") or die('Unable to select from the database.');
				$cartid = mysqli_fetch_array($res);
				$cartid = $cartid[0] + 1;
				$res = mysqli_query($mysqli, "INSERT INTO shopping_cart (cartid, customerid, total, discounted_total, paymethod, paid_amount) VALUES ($cartid, '0', '0', '0', '', '0')") or die('Unable to insert into the database: '. mysqli_error($mysqli));
				setcookie("cartid", $cartid, 0, '/');
			} else {
				$cartid = $_COOKIE['cartid'];
			}
			
			
			$res = mysqli_query($mysqli, "SELECT sku FROM shopping_cart_items WHERE sku='{$new['sku']}' AND cartid='$cartid'") or die('Unable to select from the database.');
			$sku = mysqli_fetch_array($res);
			if (empty($sku)) {
				$res = mysqli_query($mysqli, "INSERT INTO shopping_cart_items (cartid, sku, qty, vendor, price, size, size_changed)  VALUES ($cartid, '{$new['sku']}', '1', '0', '{$new['price']}', '{$new['size']}', '{$new['size_changed']}')") or die('Unable to insert into the database: '. mysqli_error($mysqli));
			} else {
				$res = mysqli_query($mysqli, "UPDATE shopping_cart_items SET qty=qty+1 WHERE sku='{$new['sku']}' AND cartid='$cartid'") or die('Unable to insert into the database: '. mysqli_error($mysqli));
			}
			$res = mysqli_query($mysqli, "UPDATE shopping_cart SET total=total+{$new['price']} WHERE cartid='$cartid'") or die('Unable to insert into the database: '. mysqli_error($mysqli));
		}
		
		$cartid = isset($cartid) ? $cartid : (isset($_COOKIE['cartid']) ? $_COOKIE['cartid'] : '');
		if (!empty($cartid)) {
			$res = mysqli_query($mysqli, "SELECT total FROM shopping_cart WHERE cartid='$cartid'") or die('Unable to select from the database.');
			$total = mysqli_fetch_array($res);
			$total = $total[0];
			if ( $total > 0 ) {
			
				$category_title = '';
				if (preg_match('#<title[^>]*>([^<,\s]+)\s+#msi', $output, $m)) {//,
					$category_title = $m[1];
					$category_title = preg_replace('#\s*(Pendants|Earrings|Rings|Silver)#i', '', $category_title);
				}
			
				$cart = '<div class="cart_block" style="">Your shopping cart total:<br/> <br/><span style="font-size:18px;">\\$'.$total.'</span><br /><br /><a href="http://www.semipreciouswholesale.com/checkout.php?back='.urlencode($_SERVER['REQUEST_URI']).'&stone='.$_GET['stone'].'">View cart / Checkout</a></div>';
				if (!empty($category_title)) {
					$output = preg_replace('#(:?:[\w\s]+'.$category_title.'.*?)</td#msi', '$1<br/><br/><br/>'.$cart.'</td', $output);
				}/* else { 
					$output = preg_replace('#(<td[^>]*>\s*Ready.*?<td[^>]*>)#msi', '$1<br/>'.$cart, $output);// Silver chackra
					
					//$output = preg_replace('#(<td[^>]+class="stone-main"[^>]*>.*?)</td#msi', '$1<br/><br/><br/>'.$cart.'</td', $output);// Moonstone Bracelets
				}*/
			}
		}

		mysqli_close($mysqli);

		/* By webxtor END */
		
        // close curl resource to free up system resources
        curl_close($ch);     
		
		   echo $output; 
		   
		   
		   
		   require_once ("common_footer.php");

?>
