<?php
session_start();

include 'config_top.php';

include 'retrieve_page_semiprecious.php';
		
include 'process_page.php';		


include 'process_add_to_cart.php';		

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
			
				$cart = '<div class="cart_block" style="">Your shopping cart total:<br/> <br/><span style="font-size:18px;">\\$'.$total.'</span><br /><br /><a href="/checkout.php?back='.urlencode($_SERVER['REQUEST_URI']).'&stone='.$_GET['stone'].'">View cart / Checkout</a></div>';
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
