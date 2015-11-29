<?php
session_start();

include 'config_top.php';

include 'retrieve_page.php';
		
include 'process_page.php';		

include 'process_add_to_cart.php';		

		$output = preg_replace('#<div[^>]*id="leftside"[^>]*>.*?</div>#msi', '', $output); // silver-pendats
		$output = str_replace('id="innercontent"', 'id="base"', $output); // silver-earrings
		$regex = preg_replace('#(?:-[0-9]+)?.html#', '(?:-[0-9]+)?.html', basename($stoneURL));
		$output = preg_replace("#(href\s*=\s*['\"])($regex)#msi", '$1'.'http'.($_SERVER['HTTPS'] != 'off' ? 's' : '').'://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'].'?stone='.dirname($_GET['stone']).'/$2', $output); // silver-earrings		
		
		//global $m;
		$output = preg_replace_callback('#Design No. ([\w-]+).*?(?=Design|</table)#msi', function($m0) {
			$out = $m[0];
			//$out = preg_replace('#(class="excu">([^<]+)</td>(?=.*?Ready\s+in\s+[1-9][0-9]*\s+Pcs.\s+Price\s+([0-9.]+)[^<]+))#msi', '$1<form action="" method="POST"><input type="hidden" name="sku" value="'.$m[1].'"><input type="hidden" name="name" value="$2"><input type="hidden" name="price" value="$3"><input style="font-size:small;" height=30px type="submit" name="add" value="Add to cart!"><br/>', $m[0]);
			global $m, $m2, $m3_count;
			$m = $m0;
			if (preg_match_all('#<td[^>]*>([\w\s]+)</td>#msi', $m[0], $m2)) {
				
				$m3_count = 0;
				$out = preg_replace_callback('#Ready\s+in\s+[1-9][0-9]*\s+Pcs.\s+Price\s+([0-9.]+)[^<]+#msi', function($m3, $m2) {
					//global $m, $m2, $m3_count;
					global $m, $m2, $m3_count;
					//print_r($m);print_r($m2);/*print_r($m3);*/echo $m3_count;
					$out = $m3[0].'<form action="" method="POST"><input type="hidden" name="sku" value="'.$m[1].'-'.str_replace(' ', '-', trim($m2[1][$m3_count])).'"><input type="hidden" name="name" value="'.$m2[1][$m3_count].'"><input type="hidden" name="price" value="'.$m3[1].'"><input style="font-size:small;" height=30px type="submit" name="add" value="Add to cart!"></form><br/>';
					$m3_count++;
					return $out;
				}, $m[0]);
			}
			return $out;
		}, $output);
		
		$output = preg_replace('#(Ready\s+in\s+0\s+Pcs.\s+Price[^<]+)#msi', '$1<br /><strong>SOLD OUT!!</strong>', $output);
			
		
		
error_reporting(E_ALL); ini_set("display_errors", 1);

include 'process_add_to_cart_db.php';	
		
		$cartid = isset($cartid) ? $cartid : (isset($_COOKIE['cartid']) ? $_COOKIE['cartid'] : '');
		if (!empty($cartid)) {
			$res = mysqli_query($mysqli, "SELECT total FROM shopping_cart WHERE cartid='$cartid'") or die('Unable to select from the database.');
			$total = mysqli_fetch_array($res);
			$total = $total[0];
			if ( $total > 0 ) {
			
				$category_title = '';
				if (preg_match('#<title[^>]*>([^<,\s]+)\s+#msi', $output, $m)) {//,
					$category_title = $m[1];
					$category_title = preg_replace('#\s*(Pendants|Earrings|Rings)#i', '', $category_title);
				}
			
				$cart = '<div class="cart_block" style="">Your shopping cart total:<br/> <br/><span style="font-size:18px;">\\$'.$total.'</span><br /><br /><a href="http://www.semipreciouswholesale.com/checkout.php?back='.urlencode($_SERVER['REQUEST_URI']).'&stone='.$_GET['stone'].'">View cart / Checkout</a></div>';
				if (!empty($category_title)) {
					$output = preg_replace('#:?: '.$category_title.'(.*?)</td#msi', ':: '.$category_title.'$1<br/><br/><br/>'.$cart.'</td', $output);
				}/* else { 
					$output = preg_replace('#(<td[^>]*>\s*Ready.*?<td[^>]*>)#msi', '$1<br/>'.$cart, $output);// Silver chackra
					
					//$output = preg_replace('#(<td[^>]+class="stone-main"[^>]*>.*?)</td#msi', '$1<br/><br/><br/>'.$cart.'</td', $output);// Moonstone Bracelets
				}*/
			}
		}

		mysqli_close($mysqli);

		/* By webxtor END */
		
    
		
		   echo $output; 
		   
		   
		   
		   require_once ("common_footer.php");

?>
